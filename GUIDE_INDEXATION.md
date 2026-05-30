# Guide d'indexation — Le Journal des Investisseurs

> Procédure pas-à-pas pour soumettre le site aux moteurs de recherche.

---

## ✅ Ce qui est DÉJÀ FAIT (au 30 mai 2026)

- **IndexNow configuré** :
  - Clé : `34853aeed5aae6cfaf10efcceae4e47e`
  - Fichier de validation : `http://journal-des-investisseurs.fr/34853aeed5aae6cfaf10efcceae4e47e.txt` (en ligne)
  - **105 URLs déjà pingées** (HTTP 200/202) → Bing + Yandex crawleront sous 24-72h
  - Script réutilisable : `./ping-indexnow.sh [url]` pour les futures publications
- **Emplacements meta verification préparés** dans `<head>` d'`index.html` (en commentaire HTML, à dé-commenter et compléter quand GSC/Bing fournissent leur valeur)
- **robots.txt** déclare le sitemap + bloque templates/404/merci.html
- **Sitemap.xml** : 105 URLs publiques prêtes à être crawlées

## ⏳ Ce qui RESTE À FAIRE (toi, UI navigateur)

1. **Activer HTTPS enforce GitHub Pages** (quand Let's Encrypt vert, cf. §0)
2. **Créer propriété Google Search Console + soumettre sitemap** (§1)
3. **Créer propriété Bing Webmaster** (importable depuis GSC en 1 clic, §2)
4. (Optionnel) Activer IndexNow dans Bing Webmaster pour le voir lister les pings reçus

---

## 0. Pré-requis : confirmer que HTTPS est actif

Avant d'attaquer Search Console, vérifier :

```bash
curl -sI https://journal-des-investisseurs.fr/ | head -3
```

Attendu : `HTTP/2 200`. Si tu obtiens `HTTP/2 301` ou une erreur SSL, attendre encore quelques heures (Let's Encrypt peut prendre jusqu'à 24-48 h après la propagation DNS).

Quand HTTPS fonctionne :
1. GitHub → `sebastien35joumel-rgb/journal-des-investisseurs` → **Settings** → **Pages**
2. Cocher **Enforce HTTPS** (case devenue disponible après émission du certificat)
3. GitHub redirige automatiquement HTTP → HTTPS

---

## 1. Google Search Console

### 1.1 Ajouter la propriété

1. Aller sur [https://search.google.com/search-console](https://search.google.com/search-console)
2. Cliquer **Ajouter une propriété**
3. Choisir **Préfixe d'URL** (et non Domaine — plus simple sans accès DNS)
4. Saisir : `https://journal-des-investisseurs.fr/`
5. Valider

### 1.2 Vérifier la propriété (méthode balise HTML)

Google va proposer plusieurs méthodes. Choisir **Balise HTML** :

```html
<meta name="google-site-verification" content="ABCDEFGHIJKLMNOPQRSTUVWXYZ" />
```

→ **Copier la balise complète** que Google fournit.

Dans `index.html`, **l'emplacement est déjà préparé en commentaire** (lignes 8-9). Il suffit de :
1. Décommenter la ligne `<!-- <meta name="google-site-verification" ... -->`
2. Remplacer `A_REMPLACER_PAR_LA_VALEUR_GSC` par la vraie valeur de Google
3. Commit + push (`git add index.html && git commit -m "feat(seo): meta GSC" && git push`)
4. Attendre 2-3 min que GitHub Pages déploie
5. Retour Search Console → **Valider**

OU plus simple : m'envoyer la valeur, je fais le patch et le push.

### 1.3 Soumettre le sitemap

Une fois la propriété validée :

1. Menu gauche → **Sitemaps**
2. Dans le champ "Ajouter un nouveau sitemap", saisir : `sitemap.xml`
3. **Envoyer**

Google va commencer à crawler les 105 URLs déclarées. Première indexation : 24 h à 7 jours selon les pages.

### 1.4 Demander l'indexation prioritaire (5 URLs max/jour)

Dans Search Console → barre du haut "Inspecter une URL", coller :

```
https://journal-des-investisseurs.fr/
https://journal-des-investisseurs.fr/rubrique-bourse.html
https://journal-des-investisseurs.fr/rubrique-immobilier.html
https://journal-des-investisseurs.fr/devenir-contributeur.html
https://journal-des-investisseurs.fr/article-invite.html
```

→ Pour chaque URL : **Demander l'indexation**. Quota : ~10 URLs / jour.

---

## 2. Bing Webmaster Tools

### 2.1 Avantage : importer depuis Google Search Console

Bing permet d'importer automatiquement la vérification GSC. À faire APRÈS l'étape 1.

1. Aller sur [https://www.bing.com/webmasters](https://www.bing.com/webmasters)
2. Se connecter (compte Microsoft ou Google)
3. Cliquer **Importer depuis Google Search Console**
4. Autoriser → sélectionner la propriété journal-des-investisseurs.fr
5. Bing récupère sitemap + vérification automatiquement

### 2.2 Si import GSC indisponible — méthode manuelle

Idem que Google : balise HTML à ajouter dans `<head>`.

```html
<meta name="msvalidate.01" content="XYZ123" />
```

Même procédure : me transmettre la balise ou l'ajouter dans `index.html`.

### 2.3 IndexNow (✅ DÉJÀ ACTIF — clé `34853aeed5aae6cfaf10efcceae4e47e`)

IndexNow notifie Bing & Yandex en push (pas besoin d'attendre un crawl). Pour le Journal des Investisseurs :

- **Clé** : `34853aeed5aae6cfaf10efcceae4e47e`
- **Fichier de validation** : <http://journal-des-investisseurs.fr/34853aeed5aae6cfaf10efcceae4e47e.txt>
- **Premier batch envoyé le 30 mai 2026** : 105 URLs (sitemap complet) acceptées (HTTP 200/202)

#### Pour notifier une nouvelle URL (workflow futur)

Script bash réutilisable à la racine du repo :
```bash
# Ping une URL unique
./ping-indexnow.sh /article-nouveau.html

# Ping plusieurs URLs
./ping-indexnow.sh /article-A.html /article-B.html

# Re-ping de tout le sitemap
./ping-indexnow.sh
```

#### Visualisation côté Bing (optionnel)

Dans Bing Webmaster Tools → **Configurer mon site** → **IndexNow** :
- Cocher *Use my own key*
- Saisir la clé : `34853aeed5aae6cfaf10efcceae4e47e`
- Bing affichera alors l'historique des pings reçus et le statut de chaque URL

---

## 3. Vérifications post-soumission

### 3.1 Tester le sitemap

```
https://journal-des-investisseurs.fr/sitemap.xml
```

Doit s'ouvrir en XML lisible avec 105 `<url>`.

### 3.2 Tester robots.txt

```
https://journal-des-investisseurs.fr/robots.txt
```

Doit afficher le contenu autorisant le crawl + bloquant les templates.

### 3.3 Site search Google (après 7-14 j)

```
site:journal-des-investisseurs.fr
```

→ Compter les pages indexées. Premier objectif : 50+ pages indexées sous 30 jours.

---

## 4. Calendrier prévisionnel

| J+0  | Soumission sitemap GSC + Bing |
| J+1 à J+7 | Google découvre 80% des URLs (crawl) |
| J+7 à J+30 | Indexation progressive (50-90 pages indexées) |
| J+14 | Premières impressions dans GSC > Performances |
| J+30 | Bilan : impressions/clics, requêtes positionnées |
| J+60 | Premiers backlinks à acquérir pour booster |

---

## 5. À surveiller dans GSC

- **Couverture** : pages exclues (templates noindex ne doivent PAS remonter en erreur)
- **Expérience > Core Web Vitals** : doit être vert (site statique léger = avantage)
- **Performances** : impressions / clics / position moyenne
- **Liens** : backlinks et maillage interne
- **Améliorations > Données structurées** : si on ajoute du Schema.org plus tard

---

## 6. Prochaines étapes SEO (post-indexation)

1. **Ajouter Schema.org NewsArticle** sur les articles éditoriaux (priorité)
2. **Optimiser méta-descriptions** pour les sous-rubriques (actuellement génériques)
3. **Acquisition de backlinks** via la stratégie de vente de liens DA du Journal (raison d'être commerciale du site)
4. **Publication d'un article/semaine** minimum pour signal de fraîcheur
5. **Brèves de marché quotidiennes** (col gauche home) : pour montrer activité réelle

·
