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
| **Expansion** | Web app, cloud sync, mobile client, plan wizard, CRM features, AI assistant, communication campaigns, client portal, voice agent, agency product (separate app) |

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

See [Product Roadmap](product-roadmap.md) for full phase details.

| Phase | Name | Summary |
|---|---|---|
| 1 | Desktop MVP + Marketing Site | Local-first desktop app + compass.broker marketing site (current) |
| 1.5 | Eligibility Lookups | Built-in Medicare/Medicaid eligibility verification |
| 2 | Web App (Free Tier) | Browser-based version to lower barrier to entry |
| 2.5 | Cloud Storage | Backend infrastructure for web app + optional desktop sync |
| 3 | Mobile Client | PWA or React Native app for agents in the field |
| 4 | Plan Wizard | Smart plan comparison with client/agent-aware recommendations |
| 5 | CRM Features | Lead management, pipeline, activity tracking, reminders |
| 6 | AI Assistant | Conversational LLM interface with voice on mobile, Plan Wizard integration |
| 7 | Communication Campaigns | Email newsletters, SMS alerts, voice calls, drip sequences |
| 8 | Client Portal | Client-facing web portal with AI chatbot and agent messaging |
| 9 | Voice Agent | AI-powered inbound call handling, triage, and appointment booking |
| 10 | Compass for Agencies | Separate multi-user product for agencies, brokerages, and FMOs |

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

## Legal & Compliance

| Area | Status | Notes |
|---|---|---|
| **Business entity** | TBD | LLC or S-Corp formation — determines liability protection, tax treatment, and ability to enter contracts |
| **Contracts** | TBD | Beta tester agreements (liability waiver, feedback expectations), affiliate program agreements (commission terms, termination), vendor/partner agreements |
| **Terms of Service** | TBD | Required before public launch and payment processing — covers acceptable use, limitations of liability, dispute resolution |
| **Privacy Policy** | TBD | Required — especially given local-first privacy marketing claims. Must accurately describe what data is collected, stored, and transmitted (carrier sync, telemetry, crash reports) |
| **HIPAA** | TBD | Desktop app stores PHI locally (client names, Medicare IDs, health plan info). Determine if Compass is a Business Associate. If agents use the cloud sync (Phase 2.5), a BAA is almost certainly required. Consult a healthcare privacy attorney. |
| **Trademark** | TBD | "Compass" is generic — research conflicts in insurance/fintech software space. Consider filing for "MedStar Compass" or "Compass by MedStar" if defensible. Domain compass.broker is secured. |
| **Software license / EULA** | TBD | End-user license agreement for desktop app distribution — covers usage rights, restrictions, warranty disclaimers, limitation of liability |
| **Insurance** | TBD | E&O / professional liability insurance for a software product that handles commission data and could surface incorrect reconciliation results. General liability for the business. |
| **Code signing certificates** | TBD | Windows EV code signing certificate (SmartScreen reputation), Apple Developer ID for macOS notarization — required for distribution without security warnings |
| **Data breach obligations** | TBD | If Compass stores PHI or PII and a breach occurs (especially in cloud phases), state breach notification laws apply. Have an incident response plan before launch. |

### Legal Priorities by Phase

| Phase | Legal Requirements |
|---|---|
| Alpha/Beta (2026) | Business entity formation, beta tester agreements, basic EULA, code signing certs |
| Public Launch (Q1 2027) | ToS, privacy policy, HIPAA assessment, affiliate agreements, payment processor terms |
| Cloud / Web App (Phase 2+) | BAA if handling PHI in cloud, data processing agreements, breach notification plan |
| Client Portal (Phase 8) | Client-facing ToS, consent for AI chatbot interactions, data sharing agreements |
| Agency Product (Phase 10) | Enterprise contracts, SLA terms, per-seat licensing agreements |

---

## Financial Plan

### Current Cost Structure

| Expense | Monthly | Annual | Notes |
|---|---|---|---|
| AI development tools | ~$200 | ~$2,400 | Claude, Cursor, etc. |
| Domain (compass.broker) | — | ~$40 | Secured |
| Code signing (Windows) | — | ~$200-400 | EV certificate |
| Apple Developer Program | — | $99 | Required for macOS notarization |
| GitHub (hosting, CI) | $0 | $0 | Free tier sufficient for now |
| **Total pre-launch** | **~$200** | **~$2,900** | Near-zero burn rate |

### Post-Launch Cost Additions (2027+)

| Expense | Monthly | Notes |
|---|---|---|
| Payment processing (Stripe) | ~3% of revenue | Variable — scales with MRR |
| Affiliate payouts | ~20-25% of revenue | Residual commissions to referrers |
| Cloud infrastructure (Phase 2+) | $50-200 | Scales with web app users |
| Legal (ongoing) | ~$100-300 | Retainer or as-needed for contract updates |
| Business insurance | ~$50-100 | E&O / general liability |
| Support tooling | $0-50 | Email/Discord initially, paid tool later |
| **Total post-launch overhead** | **~$200-650** | Before affiliate payouts and payment processing |

### Break-Even Analysis

At ~$200/mo pre-launch costs, the business is already near break-even (development is self-funded labor, not cash outflow). Once charging begins:

| Scenario | MRR | After affiliates (75%) | After costs (~$400) | Net Monthly |
|---|---|---|---|---|
| Conservative (300 users × $19) | $5,700 | $4,275 | $3,875 | $3,875 |
| Moderate (400 users × $24) | $9,600 | $7,200 | $6,800 | $6,800 |
| Optimistic (500 users × $29) | $14,500 | $10,875 | $10,475 | $10,475 |

Break-even point: ~15-20 paying users covers all fixed costs. Affiliate payouts only apply to referred users (not all users), so effective margins are higher than shown above.

### Runway

As a self-funded solo founder with near-zero costs, runway is effectively unlimited at current burn rate. The risk is opportunity cost of time, not cash.

---

## Operations

### Support

| Phase | Channel | Approach |
|---|---|---|
| Alpha/Beta (2026) | Direct (email/phone/text) | Personal relationship with testers — fast feedback loops |
| Public Launch (2027) | Email + Discord community | Dedicated support email, Discord server for peer support and feature requests |
| Growth (2027+) | Help docs + community + email | Self-serve knowledge base, community-driven answers, email for bugs/billing |

### Release Cadence

- **Alpha/Beta:** Ship as needed, direct communication with testers on updates
- **Post-launch:** Biweekly release cycle for bug fixes, monthly for features
- **Carrier importer updates:** Hotfix releases when a carrier changes their statement format — these are time-sensitive (agents can't reconcile until the importer is updated)
- **Tauri auto-updater** handles distribution — no manual re-download needed

### Carrier Importer Maintenance

Carrier statement formats change without notice. Mitigation:
- Modular importer architecture — each carrier is an independent parser
- AI-assisted format detection as a fallback (see [Commission Ingestion Deep Dive](commission-deep-dive.md))
- Community reporting — agents flag when an import fails, triggering a priority fix
- Target: <48hr turnaround on importer fixes during active commission seasons

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
- [ ] Marketing site content and design (compass.broker — Phase 1)
- [ ] Payment processing (Stripe, Paddle, LemonSqueezy?)
- [ ] License key / activation system for paid tier
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
