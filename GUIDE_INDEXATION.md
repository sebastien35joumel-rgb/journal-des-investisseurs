# Guide d'indexation — Le Journal des Investisseurs

> Procédure pas-à-pas pour soumettre le site aux moteurs de recherche.
> À faire après que HTTPS soit actif (certificat Let's Encrypt délivré par GitHub Pages).

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

Puis :
1. M'envoyer la balise (je l'ajoute en `<head>` de `index.html`)
2. OU l'ajouter toi-même dans `index.html`, ligne ~12, juste après le `<meta name="theme-color">`
3. Commit + push
4. Attendre 2-3 min que GitHub Pages déploie
5. Retour Search Console → **Valider**

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

### 2.3 IndexNow (bonus — push instantané)

Bing supporte le protocole IndexNow qui notifie les moteurs en push (pas besoin d'attendre un crawl). Très utile pour les futures publications d'articles.

1. Bing Webmaster Tools → **Paramètres** → **IndexNow**
2. Générer une clé API → ex : `7b2c8d4e5f...`
3. Créer un fichier `7b2c8d4e5f.txt` à la racine du repo, contenu = la clé elle-même
4. Commit + push
5. Activer dans Bing

Pour notifier une URL :
```bash
curl "https://api.indexnow.org/indexnow?url=https://journal-des-investisseurs.fr/nouvel-article.html&key=7b2c8d4e5f"
```

Yandex utilise le même protocole. Une seule clé = 2 moteurs notifiés.

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
