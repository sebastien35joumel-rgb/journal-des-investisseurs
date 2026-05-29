# Le Journal des Investisseurs

> Quotidien indépendant d'analyse financière et patrimoniale.
> *« Pecunia non olet, sed ratio computandi olet »*

Site statique HTML/CSS hébergé sur **GitHub Pages**, accéléré et sécurisé par **Cloudflare**, accessible sur [journal-des-investisseurs.fr](https://journal-des-investisseurs.fr).

---

## Structure du dépôt

```
journal-investisseurs/
├── assets/
│   └── style.css                # Feuille de style commune (DA vintage N&B)
├── index.html                   # Page d'accueil
├── rubrique-bourse.html         # Pages rubrique × 6
├── rubrique-immobilier.html
├── rubrique-metaux.html
├── rubrique-crypto.html
├── rubrique-patrimoine.html
├── rubrique-strategie.html
├── article-*.html               # Articles maîtres (19 publiés au 2026-05-23)
├── a-propos.html                # La Rédaction
├── annoncer.html                # Page partenaires
├── contact.html                 # Formulaire (FormSubmit) + pigeon voyageur
├── mentions-legales.html        # Identification NEWP SAS
├── 404.html                     # Page d'erreur stylée
├── favicon.svg                  # Sceau JI 32×32
├── apple-touch-icon.svg         # Sceau JI 180×180
├── og-image.svg                 # Image partage social 1200×630
├── sitemap.xml                  # 30 URLs publiques
├── robots.txt
├── CNAME                        # Domaine custom GitHub Pages
├── .nojekyll                    # Force traitement statique pur
├── _templates.html              # Index de navigation (privé, noindex)
├── article.html · rubrique.html · sous-rubrique.html   # Templates de référence (noindex)
└── README.md
```

---

## Stack technique

| Composant | Choix |
|---|---|
| Hébergement | GitHub Pages (gratuit, illimité) |
| CDN / DNS | Cloudflare (gratuit, IP anycast, SSL automatique) |
| Polices | Google Fonts (IM Fell English / Old Standard TT / Special Elite) |
| Formulaire contact | FormSubmit (gratuit, sans inscription) |
| Analytics | Cloudflare Web Analytics (gratuit, anonyme, RGPD-friendly) |
| Build | Aucun. HTML pur, CSS pur, SVG inline. |

---

## Identité éditoriale

**Direction de la publication** : Sébastien Joumel · NEWP SAS
**Rédaction en chef** : Kévin Papot
**Chroniqueur métaux précieux** : Bertrand Mathieu (fondateur de Maison Or et Bijoux)

Voir [a-propos.html](https://journal-des-investisseurs.fr/a-propos.html).

---

## Mise à jour du contenu

Pour ajouter un article :

1. Créer le fichier `article-[slug].html` (modèle : copier un article existant et adapter).
2. Vérifier les meta `<title>` et `<meta description>` spécifiques.
3. Mettre à jour la rubrique correspondante (`rubrique-[rubrique].html`) pour ajouter le nouvel article dans le listing.
4. Ajouter une entrée dans `sitemap.xml`.
5. `git commit -am "Article : [titre]"` puis `git push`.
6. GitHub Pages publie automatiquement en moins de 2 minutes.

---

## Mise à jour des polices et du style

Modifier `assets/style.css`. La DA est centralisée dans ce fichier unique partagé par toutes les pages.

---

## Licence

Tous les contenus rédactionnels et la charte graphique sont propriété de **NEWP SAS**. Tous droits réservés.

© 2026 Le Journal des Investisseurs · NEWP SAS · 4 Route du Sept Un · 16100 Boutiers-Saint-Trojan
