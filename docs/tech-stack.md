# Compass Tech Stack

> See also: [Business Plan — Key Differentiators](index.md#key-differentiators), [Carrier portal scraping details](commission-deep-dive.md#4-carrier-portal-scraping-technical-deep-dive)

- **Frontend**: React/TypeScript, Tailwind CSS, shadcn/ui, Zustand stores
- **Backend**: Rust (Tauri 2.x), SQLite via rusqlite
- **Local-first**: all data stays on the user's machine — no cloud, no telemetry, no sync
- **Encryption at rest**: SQLCipher encrypts the entire database file (AES-256)
- **Key derivation**: Argon2id (64 MB memory, 3 iterations, 4 parallelism) → 32-byte key from user password + random salt
- **Salt**: 32-byte random salt stored in `compass.salt`, generated on first run
- **Auth flow**: password → Argon2id → SQLCipher PRAGMA key → database unlocked; logout clears connection
- **HIPAA compliance**: no plaintext storage, CSP in Tauri config, all PHI/PII fields encrypted at rest, .gitignore blocks *.db/*.salt/*.key
- **File parsing**: calamine (XLSX), csv (CSV), genpdf (PDF reports)
- **Carrier sync**: reqwest HTTP client, authenticated webview for carrier portals