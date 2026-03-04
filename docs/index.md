# Compass Business Plan

**Date:** March 2026
**Status:** Draft
**Author:** Steven Almeroth

---

## Executive Summary

Compass is a desktop application for solo Medicare insurance agents to manage clients, track enrollments, and verify commission payments. Unlike SaaS competitors ($45-900/mo), Compass is a local-first app — data never leaves the agent's machine, it's encrypted at rest, and there's no ongoing server cost to the business.

The product launches for alpha testing in April 2026, with a freemium model planned for monetization starting in 2027. The goal is $5-15K/mo in recurring revenue within the first year of charging, achieved through organic word-of-mouth growth in the Medicare agent community.

---

## Business Model

| | |
|---|---|
| **Product** | Desktop app for Medicare agent client tracking + commission verification |
| **Customer** | Solo Medicare insurance agents (100-500 client books) |
| **Pricing** | Freemium — free tier (50 clients), paid tier at $19-29/mo (unlimited + commissions) |
| **Revenue type** | Monthly recurring subscription (MRR) |
| **Cost structure** | Near-zero marginal cost (desktop app, no servers) — ~99% gross margin |
| **Distribution** | Affiliate program (20% residual commission) + organic word of mouth |
| **Moat** | Local-first privacy, carrier-specific importers, rate table verification — see [Tech Stack](tech-stack.md) |
| **Expansion** | Web app, cloud sync, mobile client, CRM features, AI assistant, agency product (separate app) |

---

## Problem

Solo Medicare agents face two interrelated problems:

1. **Client & enrollment tracking** — Agents manage 100-500+ clients across multiple carriers (Humana, UHC, Aetna, Anthem, Cigna, WellCare). They lose track of who's enrolled in what, when renewals hit, and which plans are active. Most use spreadsheets, paper files, or nothing at all.

2. **Commission verification** — Carriers pay commissions monthly via statements in inconsistent formats (CSV, XLSX, pipe-delimited TXT, PDF). Agents have no easy way to verify they're being paid correctly against published rate tables. Missed or incorrect payments go undetected. See [Commission Ingestion Deep Dive](commission-deep-dive.md) for why no standard exists.

These problems compound: without knowing who's enrolled, you can't verify you're getting paid. Without tracking commissions, you don't know which clients are generating revenue.

---

## Solution

Compass combines both capabilities in a single desktop application:

- **Client management** — Import and track clients, enrollments, carriers, plan types, and effective dates
- **Carrier sync** — Import enrollment data from carrier portals (Humana, UHC, Anthem, etc.)
- **Commission tracking** — Import carrier commission statements with carrier-specific parsers
- **Rate table verification** — Compare actual payments against expected rates to catch discrepancies
- **Reconciliation** — Match commissions to enrollments to find missing payments

### Key Differentiators

| Feature | Compass | SaaS Competitors |
|---|---|---|
| Data location | Local (agent's machine) | Cloud (vendor's servers) |
| Encryption | AES-256 at rest (SQLCipher) — see [Tech Stack](tech-stack.md) | Varies |
| Recurring cost | Free / low-cost paid tier | $45-900/mo |
| Commission parsing | Carrier-specific importers | Generic column mapping |
| Rate table verification | Built-in | Rare |
| Internet required | No (except carrier sync) | Yes |

---

## Target Market

### Primary: Solo Medicare Agents

- **Profile:** Independent agents licensed to sell Medicare Advantage, Medigap, and Part D plans
- **Book size:** 100-500 clients
- **Current tools:** Mix of spreadsheets, basic CRMs, or nothing
- **Pain tolerance:** High — they know they're losing money to missed commissions but lack tools to catch it
- **Estimated US market:** 200,000-400,000 actively selling Medicare agents (subset of ~900,000 total life & health agents)

### Future Expansion

1. **Small agencies (2-10 agents)** — Multi-user support, shared client databases, agency-level reporting
2. **Brokerages** — Admin dashboards, agent performance tracking, bulk statement import
3. **FMOs / uplines** — Downline commission tracking, override verification, white-label potential

---

## Revenue Model

### Freemium

|                   | Free Tier     | Paid Tier     |
| ----------------- | ------------- | ------------- |
| Clients           | Up to 50      | Unlimited     |
| Enrollments       | Full tracking | Full tracking |
| Carrier sync      | Full access   | Full access   |
| Commission import | Up to 200     | Unlimited     |
| Rate tables       | Full access   | Full access   |
| Reconciliation    | Up to 200     | Full access   |
| Reports           | Basic         | Advanced      |

### Pricing Strategy

**Target range: $19-29/mo** (TBD based on alpha/beta feedback)

Rationale:
- Well below AgencyBloc ($65+/mo), Radiusbob ($34/mo), MedicarePRO ($45/mo)
- Low enough that a single recovered missed commission pays for a year of Compass
- A typical initial MA commission is ~$700 — if Compass catches even one missed payment, the agent recovers 2-3 years of subscription cost

### Revenue Projections (Year 1 of Charging — 2027)

| Scenario | Price/mo | Paying users | Monthly revenue |
|---|---|---|---|
| Conservative | $19 | 300 | $5,700 |
| Moderate | $24 | 400 | $9,600 |
| Optimistic | $29 | 500 | $14,500 |

### Unit Economics

- **Cost to serve per user:** ~$0 (no servers, desktop app)
- **Customer acquisition cost:** ~$0 (word of mouth, organic)
- **Development cost:** ~$200/mo (AI-assisted development tooling)
- **Gross margin:** ~99%

---

## Product Roadmap

### Phase 1 — Desktop MVP + Marketing Site (Current)

Local-first desktop app covering client/enrollment tracking and commission reconciliation. Single-user, offline-capable, data encrypted at rest. This is the foundation that establishes trust and proves value.

The desktop download is an initial barrier to entry — agents need to see what they're getting before they'll install anything. A marketing site at compass.broker ships alongside the MVP with:

- Product showcase — screenshots, feature walkthrough, demo videos
- Clear explanation of the privacy/local-first value proposition
- Download page with one-click install for Windows/macOS/Linux
- Comparison table vs. SaaS competitors (price, privacy, features)

### Phase 1.5 — Eligibility Lookups

Built-in Medicare/Medicaid eligibility verification for an agent's clients. Instead of logging into multiple carrier portals or calling 1-800-MEDICARE, the agent checks eligibility directly from Compass against the client record they already have open.

- Medicare Part A/B eligibility, MA plan enrollment status, MBI lookup
- Medicaid/dual-eligible (D-SNP) verification
- Integration targets: MARx (CMS Enterprise Portal), HETS (CMS 270/271), state Medicaid systems (Ohio MITS, etc.), carrier-specific portals (Devoted, Anthem)
- Third-party API options: pVerify, Approved Admissions, Stedi (270/271)
- High value for agents — saves time during enrollment season and client meetings
- See [Eligibility Lookup Research](eligibility-research.md) for full landscape

### Phase 2 — Web App (Free Tier)

A lightweight browser-based version of Compass that lets agents try the product without downloading anything. This directly addresses the desktop distribution barrier — agents who are hesitant to install software can experience the core features in their browser first, then decide whether to download the desktop app (free, with full privacy) or upgrade to a paid cloud tier to keep using the web app.

- Free-tier web app with the same 50-client limit as the desktop free tier
- Core features: client tracking, enrollment management, basic commission import
- Hosted at compass.broker — the marketing site becomes the front door, the web app is the on-ramp
- Two conversion paths: (1) download the desktop app for free (privacy-first, offline, unlimited local use) or (2) upgrade to paid cloud tier for continued web access + sync
- Lowers barrier to entry from "download and install unknown software" to "sign up and try it in your browser"
- Requires cloud infrastructure (see Phase 2.5)

### Phase 2.5 — Cloud Storage

The backend infrastructure that powers both the web app (Phase 2) and optional desktop sync. Once trust is established, desktop users can opt in to sync their local database to the cloud for backup and cross-device access.

- Powers the Phase 2 web app
- Optional sync for desktop users — the local-first, privacy-respecting foundation remains
- Unlocks recurring revenue at a higher tier (cloud infrastructure has real costs)
- Addresses the "what if my laptop dies" concern
- Prerequisite for Phase 3

### Phase 3 — Mobile Client

With cloud storage in place, offer a phone-based client — either a PWA or React Native app. Agents meet clients at kitchen tables, senior centers, and health fairs — having their book of business in their pocket is a natural fit.

- Requires cloud storage (Phase 2.5)
- PWA is lower cost to build/maintain; React Native if native feel is needed
- Read-heavy use case (look up a client, check enrollment status) vs. desktop for heavy data entry

### Phase 4 — CRM Features

Add CRM capabilities to the solo-agent product: lead management, sales pipeline, activity tracking, follow-up reminders, and reporting. This deepens the value of Compass for individual agents beyond book-of-business management.

- Lead capture and pipeline stages
- Activity logging (calls, meetings, follow-ups)
- Task/reminder system
- Reporting and dashboards

### Phase 5 — AI Assistant

Built-in LLM interface that lets agents interact with their own data conversationally. On desktop, it's a chat sidebar. On the mobile client, it comes alive with speech-to-text and text-to-speech — the agent talks to Compass and Compass talks back, hands-free.

Example queries:
- "Who should I call today?"
- "What's coming up next week?"
- "Which clients have I lost recently?"
- "Am I on track to hit my enrollment goal this quarter?"
- "How much commission am I missing from Humana this month?"

Key considerations:
- The LLM has full context of the agent's book, enrollments, commissions, and activity history
- STT/TTS on mobile makes it a true voice assistant for agents on the road between appointments
- Privacy advantage: can run a local LLM on desktop (Ollama) so data never leaves the machine — aligns with the [research on local LLM for commission parsing](commission-deep-dive.md#key-takeaways-for-compass)
- Cloud version can use a hosted model with the agent's encrypted data
- This is a premium feature — strong justification for a higher pricing tier
- Differentiator: no competitor offers a conversational AI layer over an agent's own book of business

### Phase 6 — Compass for Agencies (Separate Application)

A distinct product built for agencies, brokerages, and FMOs. This is not a feature added to the solo app — it's a separate application with fundamentally different architecture: authentication, user roles and permissions, shared databases, agency-level administration, and multi-agent workflows.

- Multi-user with role-based access (owner, admin, agent, staff)
- Shared client/enrollment database across the agency
- Agent performance tracking and dashboards
- Agency-level commission reconciliation and reporting
- Downline management (for FMOs/uplines)
- Per-seat pricing model
- Likely cloud-native from the start (agencies expect shared access)

This is a different buyer (agency owners), a different sales motion (B2B, longer sales cycle), and a different price point (per-seat, potentially $50-100+/seat/mo). The solo Compass app serves as the proving ground and pipeline — agents who love Compass individually become advocates for the agency product.

### Expansion Implications

| Phase | Revenue Impact | Market Expansion |
|---|---|---|
| Desktop MVP + Marketing Site | Freemium conversion | Solo agents |
| Web App (Free Tier) | Lowers barrier to entry, widens funnel | Agents hesitant to download software |
| Cloud Storage | Higher-tier subscription | Agents who want backup/access anywhere |
| Mobile Client | Retention + stickiness | Field agents, AEP season use |
| CRM Features | Higher retention, upsell | Solo agents wanting more than a book tracker |
| AI Assistant | Premium tier, major differentiator | Agents who want a hands-free, voice-driven workflow |
| Compass for Agencies | Per-seat B2B pricing | Small agencies, brokerages, FMOs — separate product and market |

---

## Go-to-Market

### Distribution: Word of Mouth + Referrals

Primary distribution is organic — agents talk to agents. The Medicare agent community is tight-knit, with active Facebook groups, local association meetings, and annual conferences.

### Compass Affiliate Program

The primary distribution engine for Compass, designed to turn every user — and even non-users — into a paid sales channel. Every affiliate gets a unique QR code on their phone to show other agents. When someone signs up through that code, they get a discount and the affiliate earns a residual 20% of that user's subscription for as long as they keep paying. A second tier pays 5% on referrals made by your referrals.

This mirrors how the insurance industry itself works (FMOs earning overrides on downline production), so the model is instantly familiar to agents. It also opens Compass distribution to non-agent salespeople — someone who works insurance events and networking circuits can earn a real living off affiliate commissions alone without ever selling a policy.

At ~99% gross margin, Compass can afford to give away 25% of revenue to affiliates and still be highly profitable. Full details: Affiliate Program

### Additional Distribution Channels

1. **Medicare agent communities** — Active presence in Facebook groups, forums, and online communities where agents discuss tools and frustrations
2. **Content marketing** — Blog posts / YouTube videos on commission tracking, common carrier payment errors, and how to reconcile statements
3. **AEP conference presence** — Annual Enrollment Period conferences and carrier kickoff events are where agents congregate (Sept-Dec)
4. **FMO relationships** — Alpha/beta testers (Brandon Cook, Lincoln LaFayette, Craig Ritter) can become advocates within their FMO networks
5. **Demo videos** — Short screen recordings showing Compass catching a missed commission — concrete proof of value

### Launch Timeline

| Date | Milestone |
|---|---|
| April 2026 | Alpha testing — Brandon Cook |
| June 2026 | Beta testing — Lincoln LaFayette |
| August 2026 | Wider beta — Craig Ritter + network |
| Oct-Dec 2026 | AEP season — gather feedback from active selling season |
| Q1 2027 | Public launch with freemium model |
| Q2-Q4 2027 | Iterate on pricing, grow user base |

---

## Competitive Landscape

### Direct Competitors

| Product | Type | Price | Commission Tracking | Key Weakness |
|---|---|---|---|---|
| AgencyBloc | SaaS CRM | $65+/mo | Yes (CSV mapping) | Expensive, complex, built for agencies not solo agents |
| Radiusbob | SaaS CRM | $34+/mo | Basic | Limited commission features |
| MedicarePRO | SaaS | $45+/mo | Yes | Cloud-only, recurring cost |
| Commission Tracker | Spreadsheet | $199 one-time | Yes (template) | No client management, no automation |
| Spreadsheets | DIY | Free | Manual | Fragile, no reconciliation, error-prone |

### Compass Positioning

**"The commission tracking tool that pays for itself."**

Compass sits in an underserved gap: agents who need more than spreadsheets but don't want (or can't afford) a full SaaS CRM. Desktop-native means no subscription anxiety, no data privacy concerns, and no internet dependency. For the full competitive landscape, see [Commission Tracking Research](commission-tracking.md).

---

## Risks & Mitigations

| Risk | Severity | Mitigation |
|---|---|---|
| **Distribution / awareness** | High | Referral program, community presence, FMO partnerships, AEP conferences |
| **Agents won't pay** | Medium | Free tier hooks them in; commission verification ROI is concrete and measurable |
| **Carrier format changes** | Medium | Carrier-specific importers are modular; updates ship via app updates. See [Commission Ingestion Deep Dive — 5. CSV Import Mapping vs. AI Format Detection](commission-deep-dive.md#5-csv-import-mapping-vs-ai-format-detection) |
| **SaaS competitors add features** | Low | Desktop-native + zero recurring cost is a structural advantage they can't match |
| **Solo founder risk** | Medium | AI-assisted development dramatically increases velocity; low costs = long runway. See AIOS for the AI operating system that mitigates this. |
| **Desktop distribution** | Medium | Marketing site + free-tier web app lower the barrier; agents can try before downloading. Tauri auto-updater for seamless updates |

---

## Key Metrics to Track

- **Free tier signups** — Total users, growth rate
- **Free-to-paid conversion rate** — Target: 10-20% of users who hit the 50-client cap
- **Monthly recurring revenue (MRR)** — Target: $5-15K by end of 2027
- **Churn rate** — Monthly paid cancellations (target: <5%)
- **Commissions reconciled** — Total $ verified through Compass (proof of value)
- **Missed payments caught** — Number and dollar amount of discrepancies found (marketing gold)
- **Net Promoter Score** — Would agents recommend Compass? (drives word-of-mouth)

---

## Open Questions

- [ ] Exact pricing ($19 vs. $24 vs. $29/mo) — validate with alpha/beta testers
- [ ] Annual discount? (e.g., $19/mo or $190/year — 2 months free)
- [ ] Code signing certificate for Windows/macOS distribution
- [ ] Marketing site content and design (compass.broker — Phase 1)
- [ ] Terms of service, privacy policy, HIPAA considerations for paid product
- [ ] Payment processing (Stripe, Paddle, LemonSqueezy?)
- [ ] License key / activation system for paid tier
- [ ] Support channel (email? Discord? Community forum?)
- [ ] Long-term vision: lifestyle business vs. growth company vs. acquisition target

---

## Key People

| Name                  | Role                      | Background                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| --------------------- | ------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Brandon Cook**      | Alpha tester (April 2026) | Solo Medicare agent and owner of Senior Health Benefits Medicare insurance agency who is the up-line for Steven and a couple other agents. Small local agency — ideal representative of the solo-agent target market.                                                                                                                                                                                                                                                                                                                                                                                                                          |
| **Lincoln LaFayette** | Beta tester (June 2026)   | President of Quick Insured Brokerage (QIB), Medina, OH — independent wholesale brokerage specializing in the senior market (MA, D-SNP, Part D, Med Supp, final expense, life, annuities). Offices in Medina, Sandusky, Gainesville GA, and Fort Wayne IN. Previously VP of Government Programs and VP of Sales at Medical Mutual. QIB was acquired by Ritter Insurance Marketing in Jan 2021 ("Quick Insured Brokerage, a Ritter Company"), and Ritter was later acquired by Integrity Marketing Group in 2022. Lincoln stayed on as QIB President post-acquisition. Deep FMO/brokerage connections into the Ritter/Integrity network.         |
| **Craig Ritter**      | Wider beta (August 2026)  | CEO of Ritter Insurance Marketing and Managing Partner at Integrity Marketing Group. Penn State finance grad (1992), CPCU and AFSB designations. Started in insurance in 1992, joined his father Cal Ritter at URL Senior Care Division in 1997, took over Ritter Insurance Marketing in 2005. Grew the company from 6 employees to hundreds, with offices across the country. Ritter's agent network manages 500K+ Medicare clients. Named to Pennsylvania's Best Places to Work six consecutive years. Ritter was acquired by Integrity in May 2022. Active NABIP member, speaks on Medicare, technology, agency management, and compliance. |

---

## Next Steps

1. **April 2026** — Ship alpha to Brandon Cook, gather feedback on core workflows
2. **May 2026** — Iterate based on alpha feedback, add more carrier importers
3. **June 2026** — Expand beta to Lincoln LaFayette, test with a different workflow/book size
4. **July 2026** — Build out compass.broker marketing site, create demo videos, draft pricing page
5. **August 2026** — Wider beta with Craig Ritter's network, start referral pipeline
6. **Sept-Dec 2026** — AEP season — observe how agents use Compass during peak enrollment
7. **Jan 2027** — Finalize pricing, implement payment/licensing, launch publicly
