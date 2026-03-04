# Compass Business Plan

Compass business plan documentation published as a static site with [MkDocs Material](https://squidfunk.github.io/mkdocs-material/).

**Live site:** https://stav.github.io/compass-plan/

## Workflow

The source of truth is `~/Obsidian/Resources/Compass/`. Edit docs there, then sync and deploy:

```bash
./sync.sh          # Convert Obsidian → docs/
mkdocs serve       # Preview at http://127.0.0.1:8000/compass-plan/
mkdocs gh-deploy   # Publish to GitHub Pages
```

### Setup

```bash
pipx install mkdocs-material --include-deps
```

## Pages

- **Business Plan** — Executive summary, business model, roadmap, go-to-market
- **Affiliate Program** — Referral commission structure and earning potential
- **AIOS** — AI Operating System vision for business automation
- **Commission Deep Dive** — Carrier formats, IVANS, FMO partnerships, AI reconciliation
- **Commission Tracking** — CRM and platform landscape research
- **Eligibility Research** — Medicare/Medicaid eligibility lookup integration strategy
- **Tech Stack** — Tauri, React, SQLCipher, local-first architecture
