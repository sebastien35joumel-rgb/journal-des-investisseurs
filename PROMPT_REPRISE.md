# Prompt de reprise — nouvelle conversation Le Journal des Investisseurs

> Copie-colle l'intégralité du bloc ci-dessous comme premier message dans une nouvelle conversation Claude. Il contient tout le contexte nécessaire pour reprendre le projet sans perte d'information.

---

```
Salut. Reprise du projet "Le Journal des Investisseurs" — quotidien indépendant
d'analyse financière édité par NEWP SAS, signé Sébastien Joumel (Directeur de
publication), Kévin Papot (Rédacteur en chef), Bertrand Mathieu (Chroniqueur
métaux précieux, fondateur de Maison Or et Bijoux).

État au 30 mai 2026 :

SITE EN PROD
- URL : http://journal-des-investisseurs.fr/ (HTTPS en cours de génération
  par Let's Encrypt via GitHub Pages, devrait être actif dans la journée)
- Repo : https://github.com/sebastien35joumel-rgb/journal-des-investisseurs
  (public, branche main)
- Hébergement : GitHub Pages (statique, gratuit, illimité)
- DNS : Hostinger direct (4 A records vers GitHub 185.199.108-111.153 +
  CNAME www → sebastien35joumel-rgb.github.io), nameservers Hostinger par défaut
- Propagation DNS confirmée (Google/Cloudflare/Quad9)
- Compte GitHub : sebastien35joumel-rgb (gh CLI déjà authentifié via keyring)
- Coût annuel : ~10 € (seul le NDD Hostinger)

CONTENU EN PROD (au commit 075781b)
- 35 fichiers HTML : 19 articles maîtres + 6 pages rubrique + 9 templates +
  1 index navigation
- CSS partagé : assets/style.css (DA vintage N&B "vieux journal financier")
- 3 SVG (favicon, apple-touch-icon, og-image 1200×630)
- sitemap.xml (30 URLs publiques) + robots.txt
- Form contact branché sur FormSubmit (gratuit, forward vers contact@newp.fr)
- 19 articles (~40 000 mots cumulés) ventilés :
  * Bertrand Mathieu (4) : lingot or 1kg, Napoléon 20F, argent métal,
    platine/palladium
  * Sébastien Joumel (8) : assurance-vie pièges, SCPI guide, PER vs AV,
    LMNP fin avantage, SCPI européennes, démembrement AV, allocation tiers,
    inflation persistante
  * Kévin Papot (7) : Bitcoin signal, ETH après Pectra, ETF dividendes,
    small caps, PEA 300k, stablecoins MiCA, recension Arte papier monnaie

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

À FAIRE IMMÉDIATEMENT (action de Claude)
1. Vérifier que HTTPS est actif sur https://journal-des-investisseurs.fr/
   (curl -sI ou navigateur). Si oui :
   gh api -X PUT repos/sebastien35joumel-rgb/journal-des-investisseurs/pages \
     -f https_enforced=true
2. Vérifier que le site répond bien sur toutes les pages clés (curl + status)
3. Tester PageSpeed Insights (cible > 90 desktop)

À FAIRE PAR SÉBASTIEN (actions UI)
- Envoyer un message test depuis le formulaire contact.html, ouvrir email
  contact@newp.fr, cliquer le lien d'activation FormSubmit (sans ça, aucun
  message ne sera reçu en production)
- Soumettre le sitemap à Google Search Console
  (https://search.google.com/search-console) et Bing Webmaster Tools

PROCHAINS CHANTIERS POSSIBLES (à demander à Sébastien)
- Sous-rubriques distinctes (12-18 pages pour SEO longue traîne)
- Plus d'articles (objectif 30-40 à 3 mois, alterner Bertrand/Sébastien/Kévin)
- Recensions documentaires (format signature) : sources validées par Sébastien =
  Arte +++, GDIY (Matthieu Stefani), Hasheur (Owen Simonin), Yann Darwin,
  Capital M6. Workflow : Sébastien envoie un lien YouTube → Claude récupère
  source officielle via WebSearch → construit une recension honnête (pas de
  paraphrase inventée du contenu vidéo)
- Glossaire financier + FAQ par rubrique (cible PAA Google)
- Démarchage premiers annonceurs (cabinets gestion, comptoirs aurifères,
  courtiers crédit, plateformes crypto agréées)

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

WORKFLOW DE PUBLICATION
Pour publier un nouvel article :
1. Créer article-[slug].html dans
   C:\Users\sebas\Downloads\Claude\journal-investisseurs\
2. Vérifier meta title/description spécifiques
3. Ajouter dans la rubrique correspondante (rubrique-[rubrique].html)
4. Ajouter ligne dans sitemap.xml
5. cd "C:\Users\sebas\Downloads\Claude\journal-investisseurs" &&
   git add . && git commit -m "Article : [titre]" && git push
6. GitHub Pages publie en < 2 min

MÉMOIRE LONGUE
Lire en mémoire :
- project_journal_investisseurs.md (état complet du projet)
- Workflow validation HTML Verte (ouvrir systématiquement les pages produites
  dans le navigateur via PowerShell Start-Process)

Démarre par : (1) vérifier que HTTPS est actif et activer l'enforce HTTPS
si oui ; (2) curl rapide sur la home, un article, et le sitemap pour
confirmer que tout répond bien ; (3) attendre les instructions de Sébastien.
```

---

## Mode d'emploi

1. Ouvre une nouvelle conversation Claude
2. Copie-colle le bloc en code ci-dessus comme premier message
3. Claude reprendra le projet exactement où on l'a laissé, avec tout le contexte

## Pourquoi un prompt de transition ?

- Une conversation Claude finit par accumuler beaucoup de contexte (cette session a produit ~40 000 mots de contenu + dizaines d'éditions)
- Repartir d'un prompt structuré garantit que le nouveau Claude a accès au strict nécessaire sans surcharge
- La memory `project_journal_investisseurs.md` persiste entre conversations donc le détail complet est disponible si besoin
