# Prompt de reprise — nouvelle conversation Le Journal des Investisseurs

> Copie-colle l'intégralité du bloc ci-dessous comme premier message dans une nouvelle conversation Claude. Il contient tout le contexte nécessaire pour reprendre le projet sans perte d'information.

---

```
Salut. Reprise du projet "Le Journal des Investisseurs" — quotidien indépendant
d'analyse financière édité par NEWP SAS, signé Sébastien Joumel (Directeur de
publication), Kévin Papot (Rédacteur en chef), Bertrand Mathieu (Chroniqueur
métaux précieux, fondateur de Maison Or et Bijoux).

État au 30 mai 2026 — fin de session (commit 6f0737d) :

SITE EN PROD
- URL : http://journal-des-investisseurs.fr/ (HTTPS toujours en attente
  de Let's Encrypt, protected_domain_state=null au moment de la pause)
- Repo : https://github.com/sebastien35joumel-rgb/journal-des-investisseurs
- Hébergement : GitHub Pages (statique, gratuit, illimité)
- DNS : Hostinger direct (4 A records 185.199.108-111.153 + CNAME www)
- gh CLI authentifié sebastien35joumel-rgb (via keyring)
- Coût annuel : ~10 € (NDD Hostinger seul)

CONTENU EN PROD (au commit 6f0737d)
- 111 fichiers HTML (108 publics + 404 + _templates + merci.html noindex)
- sitemap.xml = 105 URLs publiques en HTTP (déclaration adaptée à la
  propriété GSC qui est en http://, à rebasculer en https:// au switch)
- 19 articles maîtres signés Bertrand/Sébastien/Kévin
- 6 rubriques + 72 sous-rubriques distinctes (SEO longue traîne)
- archives.html, index.html (home magazine)
- Pages institutionnelles : a-propos, annoncer, contact, mentions-legales
- Pages rédaction : devenir-contributeur + article-invite (formulaires
  contributeur réguliers/occasionnels, sujets en cases à cocher groupées,
  validation URL stricte avec message custom, droit à l'image, illustrations
  libres de droits/sourcées)
- merci.html (thank-you post-formulaire, noindex, message contextualisé en JS
  selon ?from=contact/contributeur/article-invite/annoncer)
- Form action vers https://formsubmit.co/contact@newp.fr (mode email-clair,
  À MIGRER en mode token cf. tâche #30 + section ci-dessous)

PACK FAVICONS (nouveau cette session)
- favicon.ico multi-taille (16+32+48) — pour GSC + Google Search + Bing
- favicon-16/32/48.png, apple-touch-icon.png (180), android-chrome-192/512.png
- site.webmanifest (PWA + Android)
- favicon.svg conservé (browsers modernes)
- Toutes les 111 pages déclarent le bloc <link rel="icon"> complet

INDEXATION (nouveau cette session)
- Balise meta google-site-verification ACTIVE dans <head> index.html
  (content="QOdSp9fQk9yoh3NzTrlkL5RZDmXepKyCIjRgh9ySV24")
- Propriété GSC validée par Sébastien : http://journal-des-investisseurs.fr/
- Sitemap soumis dans GSC le 30 mai (1ère soumission en erreur car mismatch
  https:// → corrigé en patchant sitemap+robots en http, à RE-SOUMETTRE par
  Sébastien : clic Renvoyer sur la ligne /sitemap.xml dans GSC > Sitemaps)
- IndexNow opérationnel : clé 34853aeed5aae6cfaf10efcceae4e47e
  Fichier .txt déployé à la racine
  105 URLs déjà pingées vers Bing+Yandex (HTTP 200/202)
  Script ./ping-indexnow.sh [url] pour futures publications
- Emplacement meta msvalidate.01 préparé en commentaire (à activer si
  Sébastien crée propriété Bing manuelle ; sinon import 1 clic depuis GSC)

FOOTER UNIVERSEL (cohérent sur les 108 pages publiques)
Accueil · Archives · La Rédaction · Annoncer · Contact ·
Intégrer la rédaction · Mentions légales

STRUCTURE DA (à respecter pour tout nouveau contenu)
- Palette : ivoire #F1E8D0, encre #141414, sépia #5A4A35
- Polices : IM Fell English (SC + italique) titres, Old Standard TT corps,
  Special Elite ticker
- Pastiche : édition numérotée, latin "Pecunia non olet sed ratio computandi
  olet", pigeon voyageur dans contact, sceaux SVG par rédacteur (SJ+plume /
  KP+laurier / BM+soleil radieux)
- Voix éditoriale : 1500-2500 mots, drop cap, H2 surlignés filet noir, 4-6 H2,
  blockquote au milieu, 1-2 encarts partenaires (vente de liens), signature
  pied avec sceau du rédacteur, 4 articles connexes
- Format article HTML autoporteur (header + nav 6 rubriques avec mega-menus
  + breadcrumb + page-header + corps + sceau + related + footer)

DOCUMENTS DE RÉFÉRENCE À LA RACINE DU REPO
- README.md, DEPLOIEMENT.md, GUIDE_INDEXATION.md, PROMPT_REPRISE.md (ce fichier)
- ping-indexnow.sh : wrapper bash pour ping IndexNow

À FAIRE IMMÉDIATEMENT (action de Claude au démarrage de la prochaine session)
1. Vérifier état HTTPS :
   gh api repos/sebastien35joumel-rgb/journal-des-investisseurs/pages \
     | grep -E 'protected_domain_state|https_enforced'
   Si protected_domain_state=verified :
   a) gh api -X PUT .../pages -f https_enforced=true
   b) sed -i 's|http://|https://|g' sitemap.xml robots.txt + commit + push
   c) Demander à Sébastien de créer une nouvelle propriété GSC en https://
      (la balise meta est déjà déployée → validation auto-héritée)
   Sinon : c'est normal, encore en attente Let's Encrypt
2. Demander à Sébastien sur quoi il veut avancer

À FAIRE PAR SÉBASTIEN (actions UI, non automatisables)
1. RE-SOUMETTRE le sitemap dans GSC : Sitemaps > clic Renvoyer sur la ligne
   /sitemap.xml en erreur (le sitemap est maintenant en HTTP, ça devrait
   passer en Réussite avec 105 URLs)
2. MIGRER FORMSUBMIT EN MODE TOKEN (priorité, débloque thank-you page) :
   - Trouver le token dans pied de page d'un mail FormSubmit reçu sur
     contact@newp.fr (ligne https://formsubmit.co/el/xxxxxx ou similaire)
   - Coller le token à Claude → Claude remplace les 3 endpoints
   - Avantages : 1 seule activation pour tous les _subject, _next fonctionne,
     email caché du HTML, _autoresponse débloqué
3. (Optionnel) Bing Webmaster Tools — import 1 clic depuis GSC

PROBLÈME CONNU : THANK-YOU PAGE
La page /merci.html est créée et accessible, le _next est configuré dans les
3 formulaires (?from=contact/contributeur/article-invite), MAIS FormSubmit
en mode email-clair ignore parfois le _next et affiche sa page par défaut.
Solution = migration mode token (cf. ci-dessus).

PROCHAINS CHANTIERS POSSIBLES (à demander à Sébastien)
- Schema.org NewsArticle JSON-LD sur les 19 articles (rich snippets Google +
  éligibilité Google News) — ROI SEO élevé, ~30min de boulot
- Plus d'articles (objectif 30-40 à 3 mois, alterner Bertrand/Sébastien/Kévin)
- Recensions documentaires (format signature) : sources validées =
  Arte +++, GDIY (Matthieu Stefani), Hasheur (Owen Simonin), Yann Darwin,
  Capital M6. Workflow : Sébastien envoie lien YouTube → Claude récupère
  source officielle via WebSearch → recension honnête (PAS de paraphrase
  inventée du contenu vidéo)
- Glossaire financier + FAQ par rubrique (cible PAA Google)
- Démarchage premiers annonceurs (cabinets gestion, comptoirs aurifères,
  courtiers crédit, plateformes crypto agréées)
- Page profile auteur individuel par rédacteur

CONTEXTE INDISPENSABLE
- Voix narrative : "nous" (Sébastien + Kévin), vouvoiement, jamais "chez le
  JDI on..."
- Bertrand signe métaux précieux uniquement
- Sébastien et Kévin alternent sur les autres rubriques
- Ne JAMAIS prétendre paraphraser une vidéo non accessible — recension
  d'invitation, citer la source ouvertement
- Adresse éditeur : NEWP SAS, 4 Route du Sept Un, 16100 Boutiers-Saint-Trojan,
  SIREN 830 852 976
- Téléphone retiré partout (seul contact@newp.fr public)
- Pigeon voyageur dans contact.html à conserver (pastiche signature)
- Formulaires contributeur : 18 sujets cochables (6 rubriques × 3 sous-thèmes)
  + champ libre "Autre sujet", validation JS ≥1 case cochée
- Champs URL facultatifs (portrait, échantillon, site, linkedin) ont
  validation custom : vide=OK, URL valide=OK, texte libre=BLOQUÉ avec
  message clair + bordure rouge sépia

WORKFLOW DE PUBLICATION
1. Créer article-[slug].html dans le dossier
2. Vérifier meta title/description + canonical + OG spécifiques
3. Ajouter dans la rubrique correspondante + section "Toutes nos publications"
   de index.html si majeur
4. Ajouter ligne dans sitemap.xml (URL en HTTP tant qu'on est sur HTTP)
5. git add . && git commit -m "Article : [titre]" && git push
6. GitHub Pages publie en < 2 min
7. ./ping-indexnow.sh /article-[slug].html (ping Bing/Yandex instantané)

WORKFLOW DE VALIDATION VISUELLE
- Pour vérifier le RENDU visuel (CSS, layout, responsive) :
  Start-Process "C:\Users\sebas\Downloads\Claude\journal-investisseurs\[fichier].html"
- Pour tester un FORMULAIRE (soumission, validation, FormSubmit) :
  TOUJOURS ouvrir l'URL en ligne, jamais le fichier local
  (file:// est bloqué par FormSubmit)
  Start-Process "http://journal-des-investisseurs.fr/[fichier].html"

MÉMOIRE LONGUE
Lire en mémoire :
- project_journal_investisseurs.md (état complet du projet)
- Workflow validation HTML Verte (appliqué au JDI aussi)

Démarre par : (1) vérifier état HTTPS et basculer si vert ; (2) curl rapide
home + sitemap pour vérifier que tout répond ; (3) attendre les instructions.
```

---

## Mode d'emploi

1. Ouvre une nouvelle conversation Claude
2. Copie-colle le bloc en code ci-dessus comme premier message
3. Claude reprendra le projet exactement où on l'a laissé, avec tout le contexte

## Pourquoi un prompt de transition ?

- Une conversation Claude finit par accumuler beaucoup de contexte (cette session a produit ~50 000 mots de contenu + 111 fichiers HTML + 8 favicons + scripts)
- Repartir d'un prompt structuré garantit que le nouveau Claude a accès au strict nécessaire sans surcharge
- La memory `project_journal_investisseurs.md` persiste entre conversations donc le détail complet est disponible si besoin

## Historique récent des commits majeurs

| Commit | Message | Date |
|---|---|---|
| `6f0737d` | feat(forms): validation URL stricte + message custom clair | 30 mai |
| `457c393` | ux(forms): clarifier 'laisser vide si pas de lien' | 30 mai |
| `b04a37a` | fix(forms): champs Portrait + Échantillon en type=text | 30 mai |
| `7c1b226` | fix(seo): sitemap + robots.txt en HTTP pour matcher GSC | 30 mai |
| `24e431e` | feat(seo): favicons complets (ICO + PNG + manifest) | 30 mai |
| `09a086a` | feat(seo): balise google-site-verification active | 30 mai |
| `cf7be34` | feat(seo): IndexNow actif (105 URLs pingées) + script | 30 mai |
| `f405fd0` | feat(forms): page merci.html dédiée + redirection _next | 30 mai |
| `bc85a87` | fix(footer): ajout 'Intégrer la rédaction' sur 13 pages | 30 mai |
| `23d3916` | feat(contrib): sujets de prédilection en cases à cocher | 30 mai |

·
