# Prompt de reprise — nouvelle conversation Le Journal des Investisseurs

> Copie-colle l'intégralité du bloc ci-dessous comme premier message dans une nouvelle conversation Claude. Il contient tout le contexte nécessaire pour reprendre le projet sans perte d'information.

---

```
Salut. Reprise du projet "Le Journal des Investisseurs" — quotidien indépendant
d'analyse financière édité par NEWP SAS, signé Sébastien Joumel (Directeur de
publication), Kévin Papot (Rédacteur en chef), Bertrand Mathieu (Chroniqueur
métaux précieux, fondateur de Maison Or et Bijoux).

État au 11 juin 2026 — fin de session (commit 1fec2e6) :

SITE EN PROD — HTTPS ACTIF ✅
- URL : https://journal-des-investisseurs.fr/ (cert Let's Encrypt émis le
  11 juin après Remove/Re-add du custom domain dans GH Pages Settings,
  expire 2026-09-08 renouvellement auto, https_enforced=true,
  redirection 301 http→https active)
- Repo : https://github.com/sebastien35joumel-rgb/journal-des-investisseurs
- Hébergement : GitHub Pages, DNS Hostinger direct (4 A records)
- gh CLI authentifié sebastien35joumel-rgb
- TOUT le code est en https:// (sitemap, robots, schema.org, og, 23 articles)

CONTENU EN PROD (113 fichiers HTML)
- 23 articles signés, dont 3 publiés cette session :
  * SpaceX AI1 / échelle de Kardachev (S. Joumel, 10 juin, édito
    géopolitique, ~3000 mots) — brief fourni par Sébastien, faits
    vérifiés WebSearch (AI1 dévoilé 8 juin : 150 kW, 70 m, 600 km,
    Gigasat Texas, 1 GW fin 2027)
  * Bitcoin sous 60 000 $ (K. Papot, 11 juin, ~2400 mots) — source
    article Invezz/TradingView fourni par Sébastien ; suite directe de
    l'article du 18 mai « signal d'achat ou clairon final ? » avec
    retour honnête sur les scénarios
  * L'or corrige : respiration ou retournement ? (B. Mathieu, 11 juin,
    ~2200 mots) — texte écrit par Bertrand lui-même (post FB CollectOr
    Cannes), transposé au format Journal, lien attribution nofollow
    vers https://www.facebook.com/CollectOrCannes en note de fin
  Les 3 forment un triptyque cohérent sur les flux de capitaux (IA
  aspire → cryptos se vident → l'or respire mais tient sa MM 36 mois)
- 6 rubriques + 72 sous-rubriques + archives + home + pages instit
- Formulaires contributeur avec garde-fous URSSAF stricts
- merci.html (thank-you, noindex, orpheline par design)

MAILLAGE INTERNE 100% COMPLET (fait cette session, commit 1fec2e6)
- 0 page orpheline (hors merci.html voulu)
- 0 lien vers les templates bloqués (72 liens corrigés : 13 cartes
  fictives des rubriques supprimées + 7 vraies injectées, 50 <li>
  'À lire également' fictifs remplacés par de vrais articles, 2
  breadcrumbs réparés, 20 cartes familles recâblées)
- 0 lien mort
- 23/23 articles maillés : rubrique ≥1 + sous-rubrique ≥1 + archives
  + inter-articles ≥2
- Scripts réutilisables dans /tmp/jdi-mesh/ (fix-rubriques.mjs,
  fix-links.mjs) — à recréer au besoin, hors repo

RESPONSIVE + UX (fait cette session)
- Nav rubriques STICKY en desktop (position:sticky top:0 z-100),
  désactivée en mobile <960px (volontaire, la nav y est empilée)
- ⚠️ PIÈGE CSS documenté : ne JAMAIS mettre overflow-x:hidden sur
  html/body/.sheet — ça casse position:sticky. L'anti-débordement
  est assuré au niveau des enfants (max-width:100% global,
  table overflow-x:auto)
- Footer blindé mobile (flex-wrap, safe-area-inset iOS)
- 3 paliers responsive : 380/560/960px

INDEXATION
- GSC : propriété http://journal-des-investisseurs.fr/ VALIDÉE (balise
  meta dans index.html). Sitemap soumis. ⚠️ SÉBASTIEN DOIT : créer la
  propriété https:// (validation auto-héritée) + y soumettre sitemap.xml
- IndexNow opérationnel : clé 34853aeed5aae6cfaf10efcceae4e47e, script
  ./ping-indexnow.sh [url] (sans arg = tout le sitemap). Utilisé après
  chaque publication.
- sitemap.xml : 111 URLs https, robots.txt OK
- Schema.org NewsArticle sur les 23 articles
- Favicons complets (ICO multi-taille + PNG + manifest) sur 113 pages

RÈGLES STRICTES POSÉES PAR SÉBASTIEN (à respecter absolument)
1. AUCUN tool payant (Apify actors, etc.) sans validation explicite
   préalable via question. Même 0,005 $. Pour transcription YouTube :
   demander à Sébastien de copier le panneau 'Afficher la transcription'
   de YouTube, ou yt-dlp local.
2. Liens Maison Or et Bijoux (https://maison-or-bijoux-cannes.com/) :
   DOFOLLOW sur l'ancre de marque, OBLIGATOIRE dans la signature de
   chaque article de Bertrand, pas nécessairement dans le corps.
   target=_blank rel=noopener (PAS de nofollow sur la marque).
3. Derniers articles TOUJOURS mis en avant sur la home (hero +
   grille 'Les dernières publications' antéchronologique + topbar
   date/édition à jour : édition 2368 = 11 juin)
4. Le site doit être responsive+++, menu sticky desktop, footer
   toujours présent
5. Recensions vidéo : JAMAIS paraphraser un contenu non vu. Soit
   transcription réelle fournie, soit recension d'invitation honnête.
6. Pour tester un FORMULAIRE : toujours l'URL live https://, jamais
   le fichier local (file:// bloqué par FormSubmit)

FORMSUBMIT (état)
- Formulaire contact ACTIVÉ (les mails arrivent sur contact@newp.fr)
- Les candidatures contributeur arrivent aussi
- ⚠️ _next (redirect vers merci.html) ne marche PAS encore : il faut
  migrer en mode TOKEN. Sébastien doit récupérer le token dans le
  pied de page d'un mail FormSubmit reçu (ligne formsubmit.co/el/xxx)
  et le donner à Claude qui remplacera les 3 endpoints.
- Champs URL facultatifs (portrait, échantillon) : type=url avec
  validation JS custom, vide=OK

WORKFLOW DE PUBLICATION D'UN ARTICLE
1. Créer article-[slug].html (copier structure d'un article existant
   du même auteur pour le sceau SVG : SJ=plume, KP=laurier, BM=soleil)
2. Schema.org NewsArticle inclus dès création (tout en https://)
3. Ticker custom thématique, topbar à la date du jour, nav avec
   is-active sur la bonne rubrique, breadcrumb vers la sous-rubrique
4. Encart partenaire cohérent (Bertrand=Maison Or et Bijoux dofollow,
   SJ macro=Cabinet Saint-Honoré, KP crypto=Bitstack ou Coffre-Fort
   Numérique)
5. Related-articles : 4 vrais articles, maillage croisé
6. MAILLAGE OBLIGATOIRE : sitemap.xml + sous-rubrique concernée +
   archives (compteur section) + home (hero ou grille + topbar)
7. git add + commit + push (deploy <2 min)
8. bash ping-indexnow.sh /article-[slug].html
9. Start-Process l'URL live https:// pour validation visuelle

À FAIRE PAR SÉBASTIEN (UI)
- GSC : créer propriété https:// + soumettre sitemap (2 min)
- FormSubmit : récupérer le token (cf. supra)
- Bing Webmaster : import 1 clic depuis GSC (optionnel)

PROCHAINS CHANTIERS POSSIBLES
- 3 pages auteur individuelles (E-E-A-T) : a-propos-sebastien/kevin/bertrand
- Glossaire financier (~50 termes) + FAQ par rubrique (PAA Google)
- Rythme 1-2 articles/semaine (objectif 30-40 articles)
- Recensions sources validées : Arte +++, GDIY, Hasheur, Yann Darwin,
  Capital M6 (une recension Hasheur 'dette française et Bitcoin' était
  en attente de transcription — vidéo K06XHF-1Qy8)
- Démarchage annonceurs (la raison d'être commerciale du site)

CONTEXTE INDISPENSABLE
- Voix : "nous" (Sébastien+Kévin), vouvoiement, registre vieux journal
- DA : ivoire #F1E8D0, encre #141414, sépia #5A4A35 UNIQUEMENT ;
  IM Fell English (titres), Old Standard TT (corps), Special Elite
- Éditeur : NEWP SAS, 4 Route du Sept Un, 16100 Boutiers-Saint-Trojan,
  SIREN 830 852 976. Seul contact public : contact@newp.fr
- Bertrand signe métaux uniquement ; SJ et KP alternent le reste
- merci.html orpheline par design — ne pas la "réparer"

MÉMOIRE LONGUE
Lire project_journal_investisseurs.md en mémoire pour le détail.

Démarre par : (1) vérifier que https://journal-des-investisseurs.fr/
répond 200 + sitemap OK ; (2) attendre les instructions de Sébastien.
```

---

## Mode d'emploi

1. Ouvre une nouvelle conversation Claude
2. Copie-colle le bloc en code ci-dessus comme premier message
3. Claude reprendra le projet exactement où on l'a laissé

## Historique des commits majeurs de la session du 10-11 juin

| Commit | Contenu |
|---|---|
| `1fec2e6` | Maillage interne complet : 0 orpheline, 0 lien template, 72 fixes |
| `c1390b6` | Article or correction/respiration (B. Mathieu, 23e) |
| `2d4140f` | Article Bitcoin sous 60 000 $ (K. Papot, 22e) |
| `2db383f` | Bascule HTTPS complète (sitemap+robots+23 HTML) |
| `39af2d1` | Fix sticky nav (retrait overflow-x:hidden des parents) |
| `1617b14` | Nav sticky desktop + anti-overflow + footer blindé |
| `57f9afa` | Article SpaceX AI1 / Kardachev (S. Joumel, 21e) |
| `7fc848c` | 12 liens dofollow Maison Or et Bijoux + home fraîcheur |
| `4036d27` | Enrichissement article Arte inflation (3930 mots, Orléan) |
| `60390e3` | Schema.org NewsArticle sur tous les articles |
| `f316452` | Garde-fous URSSAF devenir-contributeur |

·
