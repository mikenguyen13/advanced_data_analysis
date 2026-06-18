# Deploying the book (Netlify + custom domain)

The book is compute-heavy (R + many packages), so we render locally and deploy the
static output. Do **not** rely on Netlify's CI to run R.

## One-time setup

1. **Register the domain** (e.g. `dataanalysis.guide` or your personal domain) at
   Namecheap or Cloudflare.
2. **Tell the maintainer the final URL** so these get updated (one line each):
   - `_quarto.yml` -> `book: site-url:` (this drives the auto-generated `sitemap.xml`)
   - `robots.txt`  -> add `Sitemap: https://YOURDOMAIN/sitemap.xml`
   - confirm `_ai_metadata.html` Open Graph / canonical URLs use the new domain
3. **Create the Netlify site** and point the domain at it:
   - `quarto publish netlify` (first run creates the site and writes `_publish.yml`)
   - In Netlify: Domain settings -> add custom domain -> follow DNS instructions
     (CNAME to the Netlify site, or use Netlify DNS). HTTPS is automatic.

## Every release

```bash
# 1. render locally (uses freeze cache; keep the machine awake)
quarto render

# 2. publish the rendered _book/ to Netlify
quarto publish netlify
```

## SEO checklist (do once the domain is live)

- [ ] Submit `https://YOURDOMAIN/sitemap.xml` to **Google Search Console** and **Bing Webmaster Tools**.
- [ ] Add the Search Console verification meta tag (give it to the maintainer to drop into `_ai_metadata.html`).
- [ ] Keep `bookdown.org/mike/advanced_data_analysis` as a mirror that links canonically to the new domain (or 301 it if possible).
- [ ] Cross-link from the companion book *A Guide on Data Analysis*.
- [ ] Mint a **Zenodo DOI** from the GitHub repo for citability.
- [ ] Announce on R Weekly, Posit Community, r/statistics, r/MachineLearning, Hacker News, LinkedIn.
