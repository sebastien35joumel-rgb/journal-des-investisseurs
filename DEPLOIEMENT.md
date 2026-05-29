# Guide de mise en ligne — Le Journal des Investisseurs

> Cible : déploiement complet en ~60 minutes (hors propagation DNS).
> Stack : **GitHub Pages** (hébergement) + **Cloudflare** (DNS + CDN + SSL).

---

## Étape 1 — Créer le dépôt GitHub (5 min)

1. Va sur [github.com/new](https://github.com/new)
2. **Owner** : ton compte personnel (ou organisation NEWP si tu en as une)
3. **Repository name** : `journal-des-investisseurs`
4. **Description** : *Quotidien indépendant d'analyse financière*
5. **Public** ✓ *(obligatoire pour GitHub Pages gratuit ; un compte Pro peut aussi le rendre privé)*
6. Ne coche **PAS** « Add a README file » ni « Add .gitignore » (on en a déjà)
7. Clique **Create repository**

GitHub affichera une page avec des commandes. Garde-la sous la main.

---

## Étape 2 — Push initial du contenu (10 min)

Ouvre un terminal dans le dossier `journal-investisseurs` :

```bash
cd "C:\Users\sebas\Downloads\Claude\journal-investisseurs"
git init -b main
git add .
git commit -m "Initial commit — Le Journal des Investisseurs v1"
git remote add origin https://github.com/[TON_COMPTE]/journal-des-investisseurs.git
git push -u origin main
```

> **Remplace `[TON_COMPTE]`** par ton identifiant GitHub.

GitHub te demandera un **personal access token** (et non ton mot de passe). Si tu n'en as pas :
- Va dans **Settings → Developer settings → Personal access tokens → Tokens (classic)**
- **Generate new token (classic)** avec le scope `repo`
- Copie-le et utilise-le comme mot de passe quand `git push` te le demande

---

## Étape 3 — Activer GitHub Pages (3 min)

1. Sur la page du repo : **Settings** (en haut à droite)
2. Menu de gauche : **Pages**
3. Section **Build and deployment** :
   - **Source** : `Deploy from a branch`
   - **Branch** : `main` / `/ (root)`
   - Clique **Save**
4. GitHub affiche : *« Your site is being deployed »*. Patiente 1-2 minutes.
5. Une fois publié, l'URL temporaire sera : `https://[TON_COMPTE].github.io/journal-des-investisseurs/`

Le fichier `CNAME` du dépôt va générer une erreur tant que le domaine n'est pas configuré chez Cloudflare — c'est normal, on s'en occupe à l'étape suivante.

---

## Étape 4 — Créer un compte Cloudflare et ajouter le NDD (5 min)

1. Va sur [dash.cloudflare.com/sign-up](https://dash.cloudflare.com/sign-up)
2. Inscris-toi avec `contact@newp.fr`
3. Une fois connecté : **Add a Site**
4. Entre `journal-des-investisseurs.fr`
5. **Plan** : Free
6. Cloudflare scanne les DNS actuels (parking Hostinger) — clique **Continue**

---

## Étape 5 — Configurer les enregistrements DNS chez Cloudflare (5 min)

Dans le tableau DNS de Cloudflare, **supprime tous les enregistrements existants** (parking Hostinger), puis ajoute :

### A records (apex du domaine, pointent vers GitHub Pages)

| Type | Name | Content | Proxy |
|---|---|---|---|
| A | `@` | `185.199.108.153` | 🟧 Proxied |
| A | `@` | `185.199.109.153` | 🟧 Proxied |
| A | `@` | `185.199.110.153` | 🟧 Proxied |
| A | `@` | `185.199.111.153` | 🟧 Proxied |

### AAAA records (IPv6, optionnels mais recommandés)

| Type | Name | Content | Proxy |
|---|---|---|---|
| AAAA | `@` | `2606:50c0:8000::153` | 🟧 Proxied |
| AAAA | `@` | `2606:50c0:8001::153` | 🟧 Proxied |
| AAAA | `@` | `2606:50c0:8002::153` | 🟧 Proxied |
| AAAA | `@` | `2606:50c0:8003::153` | 🟧 Proxied |

### CNAME (sous-domaine www)

| Type | Name | Content | Proxy |
|---|---|---|---|
| CNAME | `www` | `[TON_COMPTE].github.io` | 🟧 Proxied |

> Le **proxy Cloudflare** (nuage orange 🟧) cache l'IP réelle GitHub et donne au domaine une IP Cloudflare anycast. C'est notre "IP dédiée" perçue.

---

## Étape 6 — Changer les nameservers chez Hostinger (10 min + propagation)

Cloudflare t'a attribué 2 nameservers personnalisés (visibles dans **Overview** de ton domaine), par exemple :
- `aurora.ns.cloudflare.com`
- `noah.ns.cloudflare.com`

### Côté Hostinger :

1. Connecte-toi à [hpanel.hostinger.com](https://hpanel.hostinger.com)
2. **Domains** → `journal-des-investisseurs.fr`
3. Section **DNS / Nameservers** → **Edit**
4. Sélectionne **Use custom nameservers**
5. Remplace `aurora.dns-parking.com` et `nebula.dns-parking.com` par les 2 nameservers Cloudflare
6. **Save**

**Propagation DNS** : 15 minutes à 4 heures (rarement plus). Tu peux vérifier l'état sur [whatsmydns.net](https://whatsmydns.net).

Cloudflare t'enverra un email quand il détectera que les NS sont actifs (généralement < 1 h).

---

## Étape 7 — Vérifier la configuration GitHub Pages avec le domaine custom (3 min)

Une fois les DNS Cloudflare actifs :

1. Retourne sur le repo GitHub → **Settings → Pages**
2. Section **Custom domain** : entre `journal-des-investisseurs.fr` et clique **Save**
3. GitHub effectue un check DNS (peut prendre quelques minutes)
4. Une fois vert, coche **Enforce HTTPS** (redirige tout http vers https)

---

## Étape 8 — Configurer Cloudflare pour SEO et performance (5 min)

Dans le dashboard Cloudflare de ton site :

### SSL/TLS
- **SSL/TLS → Overview** : choisir **Full** (pas « Full strict » au début, ça peut bloquer)
- **SSL/TLS → Edge Certificates** : activer **Always Use HTTPS** ✓ et **Automatic HTTPS Rewrites** ✓

### Speed
- **Speed → Optimization** : activer **Auto Minify** (JS/CSS/HTML) ✓
- **Speed → Optimization** : activer **Brotli** ✓

### Caching
- **Caching → Configuration** : laisser **Standard**

### Page Rules (optionnel)
Aucune nécessaire pour démarrer.

---

## Étape 9 — Activer Cloudflare Web Analytics (2 min)

1. **Analytics & Logs → Web Analytics**
2. Active le toggle
3. Cloudflare propose d'ajouter un script JS, **mais comme le site passe par le proxy CF**, l'analytics fonctionne **automatiquement sans script**. Coche l'option **Automatic Setup**.
4. Données disponibles dans le dashboard sous 24-48 h après la mise en ligne.

> Aucun cookie, aucun tracking utilisateur. RGPD-compatible sans bannière de consentement.

---

## Étape 10 — Activer FormSubmit pour le formulaire de contact (3 min)

À la **première soumission du formulaire** par un visiteur (ou par toi-même en test), FormSubmit enverra un email à `contact@newp.fr` avec un lien d'activation.

1. Va sur `https://journal-des-investisseurs.fr/contact.html`
2. Remplis le formulaire avec un message de test et envoie
3. Ouvre la boîte mail `contact@newp.fr`
4. Tu recevras un email de FormSubmit avec **« Activate »** — clique le lien
5. À partir de là, tous les futurs envois arriveront directement dans la boîte sans étape de confirmation

> Limite gratuite FormSubmit : 50 messages/mois. Largement suffisant pour démarrer.

---

## Étape 11 — Soumettre le sitemap à Google et Bing (3 min)

### Google Search Console
1. Va sur [search.google.com/search-console](https://search.google.com/search-console)
2. **Add property → URL prefix** : `https://journal-des-investisseurs.fr`
3. Méthode de vérification : choisir **HTML tag** → copie le tag → l'ajouter dans `index.html` dans `<head>` → push → revenir vérifier
4. Une fois vérifié : **Sitemaps** → ajouter `sitemap.xml`

### Bing Webmaster Tools
1. Va sur [bing.com/webmasters](https://www.bing.com/webmasters)
2. **Add a Site** → `https://journal-des-investisseurs.fr`
3. **Import from Google Search Console** (raccourci pratique si déjà fait)
4. Soumettre `sitemap.xml`

---

## Étape 12 — Tests post-mise en ligne (10 min)

Vérifier :
- [ ] `https://journal-des-investisseurs.fr` charge l'accueil ✓
- [ ] `https://www.journal-des-investisseurs.fr` redirige vers la version sans www ✓
- [ ] Toutes les rubriques fonctionnent (Bourse, Immo, Métaux, Crypto, Patrimoine, Stratégie)
- [ ] Un article maître charge correctement (essayer `article-lingot-or-kilogramme.html`)
- [ ] Le formulaire de contact envoie un mail
- [ ] Responsive OK sur mobile (Chrome DevTools → Toggle device toolbar)
- [ ] SSL actif (cadenas vert)
- [ ] Vitesse Google PageSpeed Insights : viser > 90/100 desktop, > 80/100 mobile

---

## Étape 13 — Communication / lancement

Une fois les tests passés, tu peux :
- Annoncer sur le LinkedIn personnel de Sébastien + de Kévin
- Mettre un lien depuis newp.fr
- Démarcher les premiers annonceurs (Cabinet Saint-Honoré, Maison Or et Bijoux, etc. — voir `annoncer.html`)

---

## Récapitulatif des coûts

| Poste | Coût |
|---|---|
| Hébergement (GitHub Pages) | 0 €/an |
| CDN + SSL + DNS (Cloudflare Free) | 0 €/an |
| Analytics (Cloudflare Web Analytics) | 0 €/an |
| Formulaire contact (FormSubmit gratuit ≤ 50/mois) | 0 €/an |
| Nom de domaine `.fr` (Hostinger, déjà payé) | ~10 €/an |
| **Total annuel** | **~10 €/an** |

---

## En cas de problème

- **GitHub Pages 404** sur le domaine custom : vérifier que le fichier `CNAME` est bien à la racine du repo et contient `journal-des-investisseurs.fr` sans http:// ni trailing slash.
- **Cloudflare : « Error 522 »** : vérifier que les A records pointent bien sur les 4 IPs GitHub Pages (185.199.108-111.153).
- **SSL : « Error 525 »** : passer Cloudflare en mode **Flexible** au lieu de Full, le temps que GitHub Pages génère son certificat (peut prendre 24 h après la config du custom domain).
- **FormSubmit ne reçoit rien** : vérifier que tu as bien activé en cliquant sur le lien du premier email reçu.

---

*Guide rédigé le 23 mai 2026. Le Journal des Investisseurs — NEWP SAS.*
