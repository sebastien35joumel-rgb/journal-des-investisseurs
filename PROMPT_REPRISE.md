# Prompt de reprise — nouvelle conversation Le Journal des Investisseurs

> Copie-colle l'intégralité du bloc ci-dessous comme premier message dans une nouvelle conversation Claude. Il contient tout le contexte nécessaire pour reprendre le projet sans perte d'information.

---

```
Salut. Reprise du projet "Le Journal des Investisseurs" — quotidien indépendant
d'analyse financière édité par NEWP SAS, signé Sébastien Joumel (Directeur de
publication), Kévin Papot (Rédacteur en chef), Bertrand Mathieu (Chroniqueur
métaux précieux, fondateur de Maison Or et Bijoux).

État au 30 mai 2026 (commit ceab104) :

SITE EN PROD
- URL : http://journal-des-investisseurs.fr/ (HTTPS en cours de génération
  par Let's Encrypt via GitHub Pages, à activer dès cert vert)
- Repo : https://github.com/sebastien35joumel-rgb/journal-des-investisseurs
  (public, branche main)
- Hébergement : GitHub Pages (statique, gratuit, illimité)
- DNS : Hostinger direct (4 A records vers GitHub 185.199.108-111.153 +
  CNAME www → sebastien35joumel-rgb.github.io), nameservers Hostinger par défaut
- Propagation DNS confirmée
- Compte GitHub : sebastien35joumel-rgb (gh CLI déjà authentifié via keyring)
- Coût annuel : ~10 € (seul le NDD Hostinger)

CONTENU EN PROD (au commit ceab104)
- 110 fichiers HTML (108 publics + 404.html + _templates.html bloqués)
- sitemap.xml = 105 URLs publiques
- 19 articles maîtres signés
- 6 pages rubrique (bourse, immobilier, métaux, crypto, patrimoine, stratégie)
- 72 pages sous-rubrique distinctes (12 par rubrique majeure) — SEO longue traîne
- 1 archives.html (classement des 19 articles en 6 sections)
- 1 index.html (home magazine — brèves + hero + cotations + chroniques +
  toutes publications + annonces)
- Pages institutionnelles : a-propos, annoncer, contact, mentions-legales
- Pages rédaction : devenir-contributeur.html (formulaire long avec sujets
  en cases à cocher groupées par rubrique + upload portrait URL + droit à
  l'image + déclaration illustrations libres de droits/sourcées), 
  article-invite.html (formulaire article ponctuel équivalent)
- CSS partagé : assets/style.css (DA vintage N&B "vieux journal financier")
- 3 SVG (favicon, apple-touch-icon, og-image 1200×630)
- robots.txt (disallow templates + 404, allow tout le reste)
- 19 articles (~40 000 mots cumulés) ventilés :
  * Bertrand Mathieu (4) : lingot or 1kg, Napoléon 20F, argent métal,
    platine/palladium
  * Sébastien Joumel (8) : assurance-vie pièges, SCPI guide, PER vs AV,
    LMNP fin avantage, SCPI européennes, démembrement AV, allocation tiers,
    inflation persistante
  * Kévin Papot (7) : Bitcoin signal, ETH après Pectra, ETF dividendes,
    small caps, PEA 300k, stablecoins MiCA, recension Arte papier monnaie
- Form contact + form contributeur + form article invité branchés sur
  FormSubmit (gratuit, forward vers contact@newp.fr)

FOOTER UNIVERSEL (cohérent sur les 108 pages publiques)
Accueil · Archives · La Rédaction · Annoncer · Contact ·
Intégrer la rédaction · Mentions légales

STRUCTURE DA (à respecter pour tout nouveau contenu)
- Palette : ivoire #F1E8D0, encre #141414, sépia #5A4A35 (aucune autre couleur)
- Polices : IM Fell English (SC + italique) pour titres/ornements,
  Old Standard TT pour corps, Special Elite pour ticker
- Pastiche assumé : édition numérotée, latin "Pecunia non olet sed ratio
  computandi olet", section "pigeon voyageur" dans contact.html, sceaux SVG
  pour chaque rédacteur (SJ+plume / KP+laurier / BM+soleil radieux)
- Voix éditoriale : 1500-2500 mots, drop cap, H2 surlignés filet noir, 4-6 H2,
  blockquote au milieu, 1-2 encarts partenaires intégrés (vente de liens),
  signature pied avec sceau du rédacteur, 4 articles connexes
- Format article HTML autoporteur (header complet + nav 6 rubriques avec
  mega-menus + breadcrumb + page-header + corps + sceau + related + footer)

DOCUMENTS DE RÉFÉRENCE À LA RACINE DU REPO
- README.md : présentation projet
- DEPLOIEMENT.md : procédure complète mise en ligne GitHub Pages + DNS
- GUIDE_INDEXATION.md : procédure Google Search Console + Bing Webmaster +
  IndexNow, à exécuter par Sébastien dès HTTPS actif
- PROMPT_REPRISE.md (ce fichier) : transfert de session

À FAIRE IMMÉDIATEMENT (action de Claude au démarrage)
1. Vérifier que HTTPS est actif sur https://journal-des-investisseurs.fr/
   (curl -sI). Si HTTP 200 OK en HTTPS :
   gh api -X PUT repos/sebastien35joumel-rgb/journal-des-investisseurs/pages \
     -f https_enforced=true
   Si pas encore prêt : c'est normal, Let's Encrypt prend jusqu'à 24-48h pour
   un nouveau domaine. Vérifier toutes les 2-3h.
2. Vérifier que le site répond bien sur des pages clés (curl + status)
   - /, /archives.html, /devenir-contributeur.html, /article-invite.html
3. Attendre les instructions de Sébastien

À FAIRE PAR SÉBASTIEN (actions UI, non automatisables)
- Envoyer un message test depuis contact.html, ouvrir email contact@newp.fr,
  cliquer le lien d'activation FormSubmit (sans ça, aucun message ne sera
  reçu en production). À répéter pour devenir-contributeur et article-invite
  si formulaires distincts.
- Suivre GUIDE_INDEXATION.md (GSC + Bing + IndexNow) dès HTTPS vert

PROCHAINS CHANTIERS POSSIBLES (à demander à Sébastien)
- Plus d'articles (objectif 30-40 à 3 mois, alterner Bertrand/Sébastien/Kévin)
- Recensions documentaires (format signature) : sources validées par Sébastien =
  Arte +++, GDIY (Matthieu Stefani), Hasheur (Owen Simonin), Yann Darwin,
  Capital M6. Workflow : Sébastien envoie un lien YouTube → Claude récupère
  source officielle via WebSearch → construit une recension honnête (pas de
  paraphrase inventée du contenu vidéo)
- Glossaire financier + FAQ par rubrique (cible PAA Google)
- Démarchage premiers annonceurs (cabinets gestion, comptoirs aurifères,
  courtiers crédit, plateformes crypto agréées)
- Schema.org NewsArticle sur les 19 articles éditoriaux
- Ajout d'authors profile pages (a-propos individuels par rédacteur)

CONTEXTE INDISPENSABLE
- Voix narrative : "nous" (Sébastien + Kévin), vouvoiement, jamais "chez le
  JDI on..."
- Bertrand signe métaux précieux uniquement
- Sébastien et Kévin alternent sur les autres rubriques
- Ne JAMAIS prétendre paraphraser le contenu d'une vidéo non accessible —
  traiter en recension d'invitation, citer la source ouvertement
- Adresse éditeur : NEWP SAS, 4 Route du Sept Un, 16100 Boutiers-Saint-Trojan,
  SIREN 830 852 976
- Téléphone retiré partout (seul l'email contact@newp.fr est public)
- Section pigeon voyageur dans contact.html à conserver (pastiche signature)
- Formulaires contributeur : 18 sujets cochables (6 rubriques × 3 sous-thèmes)
  + champ libre "Autre sujet", validation JS ≥1 case cochée

WORKFLOW DE PUBLICATION
Pour publier un nouvel article :
1. Créer article-[slug].html dans
   C:\Users\sebas\Downloads\Claude\journal-investisseurs\
2. Vérifier meta title/description + canonical + OG spécifiques
3. Ajouter dans la rubrique correspondante (rubrique-[rubrique].html)
   + section "Toutes nos publications" de index.html si majeur
4. Ajouter ligne dans sitemap.xml
5. cd "C:\Users\sebas\Downloads\Claude\journal-investisseurs" &&
   git add . && git commit -m "Article : [titre]" && git push
6. GitHub Pages publie en < 2 min
7. (Bonus) curl IndexNow pour push instantané vers Bing/Yandex
   (clé à configurer cf. GUIDE_INDEXATION.md §2.3)

WORKFLOW DE VALIDATION VISUELLE
Après chaque édition ou création de page :
1. Ouvrir le fichier local dans le navigateur via
   PowerShell : Start-Process "C:\Users\sebas\Downloads\Claude\journal-investisseurs\[fichier].html"
2. Après push, ouvrir l'URL live pour vérification finale

MÉMOIRE LONGUE
Lire en mémoire :
- project_journal_investisseurs.md (état complet du projet)
- Workflow validation HTML Verte (ouvrir systématiquement les pages produites
  dans le navigateur via PowerShell Start-Process — appliqué au JDI aussi)

Démarre par : (1) vérifier que HTTPS est actif et activer l'enforce HTTPS
si oui ; (2) curl rapide sur la home, un article, le sitemap et
devenir-contributeur pour confirmer que tout répond bien ; (3) attendre
les instructions de Sébastien.
```

---

## Mode d'emploi

1. Ouvre une nouvelle conversation Claude
2. Copie-colle le bloc en code ci-dessus comme premier message
3. Claude reprendra le projet exactement où on l'a laissé, avec tout le contexte

## Pourquoi un prompt de transition ?

- Une conversation Claude finit par accumuler beaucoup de contexte (cette session a produit ~50 000 mots de contenu + dizaines d'éditions + 110 fichiers HTML)
- Repartir d'un prompt structuré garantit que le nouveau Claude a accès au strict nécessaire sans surcharge
- La memory `project_journal_investisseurs.md` persiste entre conversations donc le détail complet est disponible si besoin

## Historique récent des commits majeurs

| Commit | Message | Date |
|---|---|---|
| `ceab104` | docs: guide indexation Search Console + Bing Webmaster + IndexNow | 30 mai |
| `bc85a87` | fix(footer): ajout lien 'Intégrer la rédaction' sur 13 pages | 30 mai |
| `23d3916` | feat(contrib): sujets de prédilection en cases à cocher | 30 mai |
| `7bdf248` | feat: page devenir-contributeur + article-invite + footer link | 30 mai |
| `075781b` | feat: 72 sous-rubriques distinctes + nav globale + home magazine | 29 mai |

·
