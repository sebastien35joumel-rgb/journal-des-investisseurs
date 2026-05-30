#!/usr/bin/env bash
# ping-indexnow.sh — notifier Bing & Yandex d'une publication ou MAJ
#
# Usage :
#   ./ping-indexnow.sh                          → ping toutes les URLs du sitemap
#   ./ping-indexnow.sh /article-xxx.html        → ping une URL unique (chemin relatif ou absolu)
#   ./ping-indexnow.sh url1.html url2.html ...  → ping plusieurs URLs
#
# Prérequis : openssl, curl
# Clé IndexNow : voir keyLocation ci-dessous (fichier .txt à la racine du site)

HOST="journal-des-investisseurs.fr"
KEY="34853aeed5aae6cfaf10efcceae4e47e"
KEY_FILE="http://${HOST}/${KEY}.txt"
ENDPOINT="https://api.indexnow.org/IndexNow"

normalize() {
  local u="$1"
  case "$u" in
    http://*|https://*) echo "$u" ;;
    /*) echo "http://${HOST}${u}" ;;
    *) echo "http://${HOST}/${u}" ;;
  esac
}

# Construire la liste d'URLs
URLS=()
if [ $# -eq 0 ]; then
  echo "→ Aucun argument : ping de toutes les URLs du sitemap.xml"
  while IFS= read -r u; do URLS+=("$u"); done < <(grep -oE '<loc>https?://[^<]+</loc>' sitemap.xml | sed -E 's|</?loc>||g')
else
  for arg in "$@"; do
    URLS+=("$(normalize "$arg")")
  done
fi

echo "Nombre d'URLs à pinger : ${#URLS[@]}"

# JSON payload
{
  echo '{'
  echo "  \"host\": \"${HOST}\","
  echo "  \"key\": \"${KEY}\","
  echo "  \"keyLocation\": \"${KEY_FILE}\","
  echo '  "urlList": ['
  for i in "${!URLS[@]}"; do
    if [ $i -eq $((${#URLS[@]}-1)) ]; then
      echo "    \"${URLS[$i]}\""
    else
      echo "    \"${URLS[$i]}\","
    fi
  done
  echo '  ]'
  echo '}'
} > /tmp/indexnow_payload.json

# Envoi
echo "→ POST $ENDPOINT"
HTTP=$(curl -s -X POST "$ENDPOINT" \
  -H "Content-Type: application/json; charset=utf-8" \
  -d @/tmp/indexnow_payload.json \
  -w "%{http_code}" -o /tmp/indexnow_resp.txt)

echo "Réponse HTTP : $HTTP"
[ -s /tmp/indexnow_resp.txt ] && cat /tmp/indexnow_resp.txt && echo ""

case "$HTTP" in
  200|202) echo "✓ Accepté par IndexNow. Bing & Yandex vont crawler." ;;
  400) echo "✗ Mauvaise requête. Vérifier le JSON." ;;
  403) echo "✗ Clé invalide ou fichier .txt inaccessible." ;;
  422) echo "✗ URLs hors domaine déclaré." ;;
  429) echo "✗ Trop de requêtes (quota)." ;;
  *)   echo "? Code inattendu." ;;
esac
