# Insurance CRM & Commission Tracking Landscape (2025/2026)

## The Fundamental Reality

**No platform has fully automatic commission data ingestion without setup.** Carriers do not offer REST APIs for agents to pull commission data. The industry remains file-based: carriers generate statements (CSV/XLSX/TXT/PDF) in proprietary formats, and agents must download and import them. Every tool requires some form of carrier-specific mapping.

---

## How Commission Data Gets In: The 5 Methods

| Method | Description | Who Uses It |
|---|---|---|
| **CSV/Excel upload with carrier mapping** | Download statement from carrier portal, upload to software, use pre-configured "import maps" per carrier | AgencyBloc, Commission Tracker, Commissionly, NextAgency, QCommission, GreenWave — **most common** |
| **IVANS Download (AL3 format)** | Carrier pushes commission data to agency via IVANS network — automatic, 24/7 | HawkSoft, Applied Epic, EZLynx, NowCerts — **P&C only, health/life carriers rarely participate** |
| **Carrier portal scraping (RPA)** | Bots log into carrier portals overnight, handle MFA, download statements | **BenefitsGuide Carrier Connect** (only one found), Synatic AutoDB, Eleviant vBots |
| **AI-powered format detection** | Upload any statement format; AI parses it without pre-configured maps | Fintary, Eventual Treasury, Mivation Xcelerator, Applied Recon — **the emerging frontier** |
| **FMO/upline pass-through** | FMO receives carrier data, distributes to agents via their portal | IntegrityCONNECT, Ritter Platform |

---

## Platform-by-Platform Breakdown

### Health/Life/Medicare CRMs (Most Relevant to Compass)

| Platform                        | Commission Tracking           | Data Ingestion                                                       | Auto-Scrape? | Pricing                                           |
| ------------------------------- | ----------------------------- | -------------------------------------------------------------------- | ------------ | ------------------------------------------------- |
| **AgencyBloc Commissions+**     | Best-in-class for H&L         | CSV upload with carrier import maps, one-click after setup           | No           | ~$59-79/user/mo + volume-based commission pricing |
| **Radiusbob**                   | Basic                         | CSV/Excel upload with mapping                                        | No           | ~$34/mo (acquired by AgencyBloc 2023)             |
| **Insureio**                    | Basic                         | Rigid CSV format, paid custom upload service                         | No           | $25-75/mo                                         |
| **MedicarePRO**                 | Built-in                      | Manual entry + import                                                | No           | $45-55/user/mo                                    |
| **ProducerMAX**                 | Medicare-specific forecasting | Manual + import, audits underpayments                                | No           | Low cost                                          |
| **IntegrityCONNECT**            | Via FMO portal                | Pass-through from Integrity upline                                   | N/A          | Free (for Integrity agents)                       |
| **Agent CRM**                   | **None**                      | N/A                                                                  | No           | —                                                 |
| **Commissionly.io**             | Strong                        | CSV with carrier templates, flags missing payments                   | No           | $899/mo                                           |
| **NextAgency (NextCommission)** | Strong                        | CSV import + audit, also handles PDFs, outsourced data entry service | No           | $120/mo standalone                                |

### P&C-Focused AMS Platforms

| Platform | Commission Tracking | Data Ingestion | IVANS Auto? | Pricing |
|---|---|---|---|---|
| **Applied Epic** | Best-in-class | IVANS (owns it) + **Applied Recon AI** (99%+ accuracy, launched Apr 2025) | Yes | ~$150/user/mo (enterprise) |
| **HawkSoft** | Yes | IVANS 24/7 auto-download + CSV/XLS import | Yes | Base + ~$94/user/mo |
| **EZLynx** | Yes | IVANS + CSV import with templates | Yes | ~$350/mo |
| **NowCerts** | Yes | IVANS ($35/mo add-on) + CSV import | Yes (add-on) | $99-295/mo |

### Standalone Commission Tracking Software

| Platform | Focus | Data Ingestion | Special Features | Pricing |
|---|---|---|---|---|
| **Commission Tracker** | All insurance | CSV/Excel/PDF (smart mapping per carrier), PDFx AI converter | Longest-running pure tracker, auto-emailed producer statements | $67/mo + $47/mo additional |
| **QCommission** | All insurance | Auto-download carrier files, Excel/CSV/TXT/some PDFs | Broadest accounting integrations (QB, Xero, Sage, NetSuite, Dynamics) | $15/user/mo - $600/mo |
| **GreenWave** | Life/Annuity/LTC | SmartConnect: ACORD XML, CSV, TXT, PDF; direct AMS sync | Only tool supporting ACORD XML | Enterprise (custom) |
| **AgencyComp** | Medicare focus | Minimal data entry, import templates | Budget-friendly, MA/PDP-specific modules | 3 tiers (not public) |
| **Core Commissions** | All insurance | Carrier statement import, AI-powered | Full cycle automation | Custom |
| **BenefitsGuide** | Employee benefits | **Auto-downloads from carrier portals** (handles MFA overnight) | The only platform explicitly scraping carrier portals | Custom (Salesforce-based) |

### AI-Powered New Entrants (2024-2026)

| Platform | Funding | Key Innovation | Pricing |
|---|---|---|---|
| **Fintary** | $12.8M (Series A Nov 2025) | AI extracts from *any* carrier format, no import maps needed. Revenue leak detection. Integrates with Epic, SmartOffice, BenefitPoint, Salesforce FSC | Custom |
| **Eventual Treasury** | Startup | AI retrieves docs from 1,000+ partners automatically. Reconciliation in seconds. Revenue recovery automation. Churn prediction | Custom |
| **Mivation Xcelerator** | PNW InsurTech | AI statement parsing, near real-time HawkSoft integration. SOC 2 Type II | Custom |
| **Ascend** | — | AI Smart Inbox analyzes incoming statements, auto-reconciles, claims 95% less human involvement | Custom |

### Carrier-Side / Enterprise Platforms (not agent-facing)

| Platform | What It Does |
|---|---|
| **Vertafore Sircon Compensation** | Carriers use it to calculate and distribute agent commissions |
| **EvolveNXT (EvolveICM)** | Powered $5B+ in commission payouts in 2024 across 350K agents. Direct CMS integration for MA. Partnered with ConnectureDRX |
| **e123 / Abacus** | Distribution management for health plans and FMOs |
| **SANDIS** | Multi-tier commission handling for MGAs, direct carrier platform integration |
| **Blitz** | Enterprise commission management, SAP/Dynamics 365 integration |

---

## Commission Data Aggregation Middleware

| Tool | How It Works | Integrates With |
|---|---|---|
| **Carrier Connect (carrierconnect.ai)** | RPA scrapes carrier portals overnight, handles MFA, downloads statements, normalizes data | BenefitsGuide, other AMS |
| **Synatic AutoDB Commission** | Pre-built carrier site integrations, auto-login + download, feeds into AMS | AMS systems via CommRecon |
| **Eleviant vBots** | RPA bots for commission reconciliation (Travelers, Berkley, Markel confirmed) | Applied Epic, AMS360 |
| **WinsurTech Junction** | Downloads AL3/IVANS carrier files, converts to JSON/Excel, maps to DB | AMS/CRM systems — **free tier** |
| **IVANS Exchange** | Industry standard carrier-to-agency data network (700+ carriers). Carriers push data | Applied Epic, HawkSoft, NowCerts, EZLynx, most P&C AMS |

---

## Medicare Carrier Commission Formats

| Carrier | Portal | Statement Format |
|---|---|---|
| **Humana** | Humana Agent Portal / Vantage | Pipe-delimited TXT, PDF |
| **UnitedHealthcare** | UHC/UHOne Broker Portal | Electronic statements (format not documented publicly) |
| **Aetna** | Producer World | Electronic statements |
| **Anthem/Elevance** | Anthem Broker Portal | Electronic statements (uses ETIN for agent ID) |
| **Cigna** | Cigna Broker Portal | Commission statements, BOB exports |
| **Centene/WellCare** | Centene Workbench | Commission history/statements |

**No carrier offers a REST API for agents to pull commission data.** CMS sets max rates ($705/yr initial, $353/yr renewal for MA in 2025) but provides no commission data to agents.

---

## Industry Standards

- **IVANS/AL3** — Dominant P&C carrier-to-agency data exchange. Health/life carriers rarely participate.
- **ACORD 1206** — Life/annuity commission statement XML standard (18+ years old, still primary).
- **EDI 820** — Premium payment remittance (employer-to-carrier), **not** used for commission data.
- **No standard exists** for health insurance commission statements — every carrier has a different format.

---

## Key Takeaways for Compass

1. **Compass's approach is the industry standard** — carrier-specific importers (Humana pipe-delimited, generic CSV/XLSX) is exactly how AgencyBloc, Commission Tracker, and most established tools work.

2. **Compass differentiators vs. competitors** (see [Business Plan — Key Differentiators](index.md#key-differentiators)):
   - Desktop-native (no SaaS subscription, data stays local) — see [Tech Stack](tech-stack.md)
   - Carrier-specific parsers (beyond generic column mapping)
   - No recurring cost ($45-900/mo for competitors)
   - Rate tables for expected payment verification

3. **The competitive frontier is AI-powered parsing** (Fintary, Eventual Treasury) — accepting any carrier format and auto-detecting columns via ML/LLM instead of per-carrier import templates. See [Business Plan — Phase 5 — AI Assistant](index.md#phase-5-ai-assistant) for Compass's AI roadmap.

4. **Automatic carrier portal scraping** is rare — only BenefitsGuide/Carrier Connect and Synatic do it explicitly. It's technically fragile (carrier portal redesigns break scrapers).

5. **Potential expansion opportunities** (see [Business Plan — Product Roadmap](index.md#product-roadmap) for phased plan):
   - More carrier-specific importers (Aetna, UHC, Cigna, Anthem, WellCare)
   - FMO statement import (agents through FMOs get FMO-formatted statements)
   - HealthSherpa CSV import for ACA book-of-business reconciliation
   - QuickBooks export/integration (most-requested accounting feature in this space)

---

!!! info "Related"
    - Deep dive into ingestion methods, IVANS/Medicare, FMO partnerships, and AI reconciliation: [Commission Ingestion Deep Dive](commission-deep-dive.md)
    - Business plan and competitive positioning: [Business Plan](index.md)
    - Technical architecture: [Tech Stack](tech-stack.md)
    - AI operating system: AIOS

---

## Sources

- [AgencyBloc Commissions+](https://www.agencybloc.com/commissions-management/)
- [Applied Recon (Apr 2025)](https://www.globenewswire.com/news-release/2025/04/29/3070291/27604/en/Applied-Announces-New-AI-Powered-Accounting-Automation-Solution.html)
- [Carrier Connect](https://carrierconnect.ai/)
- [Synatic AutoDB Commission](https://www.synatic.com/solutions/autodb-commission)
- [Fintary](https://www.fintary.com/) | [$10M Series A](https://siliconangle.com/2025/11/05/fintary-lands-10m-modernize-insurance-commission-management/)
- [Eventual Treasury](https://eventualtreasury.com/)
- [Mivation Xcelerator](https://www.mivation.com/products/xcelerator)
- [Ascend Direct Bill](https://www.useascend.com/solutions/directbill)
- [Commission Tracker](https://commission-tracker.com/)
- [QCommission Insurance](https://www.qcommission.com/industries/industries-two/insurance-overview.html)
- [GreenWave Commissions](https://greenwavecommissions.com/)
- [AgencyComp](https://agencycomp.com/)
- [NextAgency / NextCommission](https://nextagency.com/commission-tracking/)
- [Commissionly.io](https://www.commissionly.io/insurance-commission-tracker/)
- [BenefitsGuide](https://www.benefitsguide.com/blog/fully-automated-commissions-solution-built-into-benefitsguide)
- [HawkSoft Carrier Downloads](https://www.hawksoft.com/agency-management-system/tour/carrier-downloads.html)
- [EZLynx Commission Import](https://www.ezlynx.com/blog/posts/import-commission-statements/)
- [NowCerts Carrier Downloads](https://www.nowcerts.com/features/carrier-downloads)
- [IVANS Download](https://www.ivans.com/for-agents/products/ivans-download/)
- [Eleviant Commission Bot](https://www.eleviant.com/commission-statement-reconciliation-bot/)
- [WinsurTech](https://winsurtech.com/)
- [Vertafore Sircon Compensation](https://www.vertafore.com/products/insurance-commission-tracking-software/sircon-compensation)
- [EvolveNXT + ConnectureDRX](https://www.prnewswire.com/news-releases/new-strategic-partnership-between-connecturedrx-and-evolvenxt-unifies-agent-onboarding-enrollment-and-commissions-302464426.html)
- [e123 Commissions](https://e123insurtech.com/e123-commissions-for-carriers)
- [SANDIS Commission Handling](https://sandis.io/platform/commission-handling)
- [Catalyit Commission Management Guide](https://catalyit.com/guides/commission-management)
- [MedicarePRO](https://www.medicareproapp.com/)
- [ProducerMAX](https://www.producermax.com/)
- [IntegrityCONNECT](https://integrity.com/integrityconnect/)
- [Ritter Commission Software Review](https://ritterim.com/blog/the-best-insurance-commission-tracking-software-for-agents-and-agencies/)
- [HealthSherpa Export Reports](https://blog.healthsherpa.com/agents/top-ways-to-use-healthsherpa-agent-export-report/)
- [CMS Agent Broker Compensation](https://www.cms.gov/medicare/health-drug-plans/managed-care-marketing/medicare-marketing-guidelines/agent-broker-compensation)

---

## Deep Dive: Carrier Portal Scraping & RPA for Commission Data (Feb 2027 Update)

### 1. Carrier Connect (carrierconnect.ai) — Technical Details

**What it is:** The first dedicated automated commission statement download service for employee benefits brokers. Built as a standalone middleware service, not a full CRM/AMS.

**How it works technically:**
- RPA bots log into carrier portals overnight using stored agent credentials
- Statements are downloaded as soon as they post online
- Downloaded files are organized into secure, carrier-labeled folders accessible on the broker's desktop
- PDF statements are handled by human staff who manually enter payment records into Excel format (not fully automated for PDFs)
- Excel files are auto-converted to vendor-required import formats
- Supports multi-agent organizations (handles multiple agent logins within one org)

**MFA handling:** Not explicitly documented publicly. Their infrastructure runs on AWS (EC2 + PEM access control), and they implement 2FA on their own platform. The implication is that they either: (a) negotiate with carriers for service account access, (b) use TOTP shared secret approach (see section 4 below), or (c) require attended handoff for MFA-protected portals.

**Carriers supported:** Not publicly listed. Marketing says "all carrier commission statements" for employee benefits, suggesting broad coverage of health/life/dental/vision carriers.

**Pricing:** Not publicly disclosed. Contact sales only.

**Security:** HIPAA compliant, AWS-hosted, HTTPS/SSL/TLS, database encryption, audit logs, EC2 deployment with PEM access control.

**Integration:** Zapier-based (connects to thousands of apps). Also integrates directly with BenefitsGuide CRM (their parent product).

**BenefitsGuide integration specifics:**
- Carrier Connect downloads and organizes statements
- Data is auto-uploaded into BenefitsGuide Commissions module
- System maps commission line items to correct benefit policies
- Reconciliation: prompts user to verify statement total matches bank deposit
- Once confirmed, data is inserted with a single click

**Source:** [Carrier Connect](https://carrierconnect.ai/) | [BenefitsGuide Blog](https://www.benefitsguide.com/blog/fully-automated-commissions-solution-built-into-benefitsguide)

---

### 2. Synatic AutoDB Commission — Technical Details

**What it is:** Enterprise-grade insurance data middleware from Synatic (a data integration platform company). Part of their broader insurance solution suite that includes CommRecon (reconciliation) and AgencyFuse Match (policy matching).

**How it works technically:**
- Pre-built integrations log into carrier websites using agent credentials
- Automates commission statement access and download from carrier sites
- Automates commission calculations
- Output converted to AMS-compatible format: **AL3** (ACORD standard fixed-width), XLS, XML, JSON, or any other format
- Commission reports accessible through AMS at any time

**Carriers with pre-built integrations:** Not publicly enumerated. Marketing says "leading carriers" with "pre-built and fully customizable integrations." Their partner ecosystem includes: HubSpot, Fenris Digital, Salesforce, **Vertafore** (Orange Partner Program member), Ferro, HawkSoft, Nexus, and ACORD.

**AMS integration:** Strong Vertafore ecosystem integration (AMS360, Sagitta). Also integrates with HawkSoft, and any AMS that accepts AL3 or XLS imports.

**AL3 support:** Key differentiator. Can download AL3 files from carriers and MGA partners and convert to XLS, XML, JSON, or any other format. AL3 is ACORD's fixed-width batch format for P&C policy and commission data download.

**Pricing:** Enterprise/custom. Not publicly disclosed.

**Key limitation:** Primarily P&C-focused. Health/Medicare carriers rarely provide AL3 feeds. More useful for agencies with mixed P&C + benefits books.

**Source:** [Synatic AutoDB Commission](https://www.synatic.com/solutions/autodb-commission) | [Synatic Insurance Solutions](https://insurance.synatic.com/) | [Vertafore Partnership](https://www.globenewswire.com/news-release/2024/01/30/2820284/0/en/Synatic-Joins-Vertafore-s-Orange-Partner-Program.html)

---

### 3. Eleviant vBots (now Coventus) — Technical Details

**What it is:** RPA bots purpose-built for insurance agency workflows. Recently rebranded from Eleviant to Coventus, product line renamed to vBots.ai.

**How the commission reconciliation bot works:**
1. **Statement retrieval:** Bot downloads commission statements from carrier portals, email attachments, and shared folders
2. **Data extraction:** Uses OCR + NLP + ML to parse statements in any format (PDF, Excel, CSV) — handles 150+ carriers
3. **Policy matching:** Validates each policy based on transaction type, term, premium, and commission amount against AMS records
4. **Deposit validation:** Validates transaction amount against deposit/GL entries
5. **Exception handling:** Flags discrepancies for human review
6. **Posting:** Once validated, posts the statement in the AMS

**AMS integrations (confirmed):**
- Applied Epic
- AMS360 (Vertafore)
- HawkSoft
- Veruna
- Zywave
- Marketing says "compatible with any AMS"

**Carriers supported (confirmed names):**
- Progressive, Allstate, Nationwide, Cincinnati (AMS360 bot)
- Travelers, W.R. Berkley, Markel (Applied Epic bot)
- Claims 150+ carriers total

**Implementation:** 4-6 weeks, minimal implementation cost, monthly recurring fee. ROI from month 1.

**Performance:** For agencies processing 50+ statements and 1,000+ policies/month, saves minimum 50 hours/month. Bot completes in 50 seconds what a human does in 10 minutes. Zero error rate vs. 10-15% human error rate.

**Pricing:** Monthly recurring fee (not publicly disclosed). "Very minimal implementation cost."

**Source:** [Eleviant Commission Bot](https://www.eleviant.com/commission-statement-reconciliation-bot/) | [AMS360 Bot](https://www.eleviant.com/ams360-direct-bill-reconciliation-bot/) | [vBots.ai](https://vbots.ai/bots/direct-bill-commission-statement-reconciliation/) | [Catalyit Profile](https://catalyit.com/solution-provider-directory/vbots-by-eleviant)

---

### 4. MFA/Authentication Handling — How RPA Bots Solve It

This is the critical technical challenge. Here are the documented approaches:

**Approach 1: TOTP Shared Secret (most common for unattended bots)**
- When enrolling MFA, most authenticator apps (Google Authenticator, Authy, etc.) provide a QR code containing a **shared secret key** (16-32 character base32 string)
- Instead of scanning this QR with a phone, the secret is stored in a secure vault (e.g., Robocorp Control Room Vault, UiPath Orchestrator Assets)
- The bot uses `pyotp` (Python) or UiPath's Two-Factor Authentication Activity to generate the same TOTP codes the phone app would
- This works for any TOTP-based MFA (Google Authenticator, Microsoft Authenticator, Okta Verify in TOTP mode)
- **Limitation:** Requires intercepting the shared secret during initial MFA enrollment — cannot extract it after the fact from an already-enrolled phone

**Approach 2: Email/SMS OTP Relay**
- Bot monitors a shared email inbox or SMS gateway
- When carrier portal sends OTP via email/SMS, bot reads it and enters it
- Works but adds latency and complexity
- Some carriers use SMS-only MFA which requires a virtual phone number or SMS API

**Approach 3: Attended Handoff (hybrid)**
- Human handles login + MFA challenge
- Once authenticated, hands control to unattended bot for download tasks
- Session cookies/tokens persist for the bot's work session
- Simplest but requires human availability at bot run time

**Approach 4: Service Account / API Token**
- Some carriers offer "service accounts" or persistent API tokens for trusted integrators
- No public evidence that health/Medicare carriers offer this to individual agencies
- More likely available to large aggregators like Carrier Connect or Synatic through business relationships

**Tools/libraries for MFA automation:**
- [RPA Framework MFA library](https://rpaframework.org/libraries/mfa/) (Python, wraps `pyotp`)
- [UiPath Two-Factor Authentication Activities](https://marketplace.uipath.com/listings/two-steps-authentication-component)
- [Robocorp MFA example](https://github.com/robocorp/example-mfa-otp)
- `pyotp` Python library directly (for DIY approaches)

---

### 5. Open-Source / DIY Tools

**No dedicated open-source tool exists for scraping carrier commission portals.** The closest options:

| Tool | What It Does | Limitation |
|---|---|---|
| [AojdevStudio/insurance-web-scraper](https://github.com/AojdevStudio/insurance-web-scraper) | Python scraper for dental insurance guidelines from Aetna, Cigna, MetLife, UHC provider portals. YAML config per carrier. MIT license | Scrapes guidelines/benefits info, not commission statements. But architecture is relevant (YAML config per carrier) |
| [Crawl4AI](https://github.com/unclecode/crawl4ai) | LLM-friendly web crawler/scraper | General purpose, not insurance-specific. Could be adapted |
| [SeleniumBase](https://github.com/seleniumbase/SeleniumBase) | Python framework for web automation with bot-detection bypass | General purpose, has anti-detection features |
| Playwright (Python/Node) | Modern browser automation | Best foundation for DIY carrier portal scraper |

**DIY approach with Playwright (what it would take):**
1. Per-carrier login script (URL, credential fields, submit flow)
2. MFA handler (TOTP shared secret + pyotp, or email OTP relay)
3. Navigation to commission statements section (carrier-specific selectors)
4. Download trigger + file save
5. Statement parser (reuse Compass's existing carrier-specific importers)
6. Scheduling (cron job, running headful or headless)

**Estimated effort per carrier:** 2-4 days for initial development, ongoing maintenance when portals change. This is essentially what Carrier Connect and Synatic have productized.

---

### 6. Legal/Compliance Implications

#### The Core Legal Question: Is Scraping a Carrier Portal Legal?

**Key distinction: public vs. authenticated pages.**

The landmark **hiQ Labs v. LinkedIn** case (9th Circuit, 2022) established that scraping **publicly available** data does not violate the Computer Fraud and Abuse Act (CFAA). However, carrier commission portals are **authenticated** (behind login), which changes the analysis significantly.

**CFAA (Computer Fraud and Abuse Act):**
- Accessing a computer "without authorization" or "exceeding authorized access" is a federal crime
- After **Van Buren v. United States** (Supreme Court, 2021), the CFAA's "exceeds authorized access" provision is narrower — it means accessing areas of a system you're not allowed to access at all, not accessing permitted areas for improper purposes
- An agent logging into their own portal with their own credentials is "authorized" — the question is whether automated access exceeds that authorization
- **Key risk:** If the carrier's Terms of Service explicitly prohibit automated/bot access, scraping could constitute "unauthorized access" under a breach of contract theory, even if it doesn't violate the CFAA

**Terms of Service violations:**
- Most major websites (and likely carrier portals) include TOS language prohibiting "automated access," "scraping," "bots," and "non-human interaction"
- Violating TOS alone does not create CFAA criminal liability (post-Van Buren)
- But it CAN create civil liability: breach of contract, trespass to chattels, or misappropriation claims
- hiQ ultimately settled with LinkedIn for $500K and was permanently enjoined from scraping — showing that even winning the CFAA argument doesn't mean scraping is consequence-free

**HIPAA considerations:**
- Commission statements contain member names, plan types, and policy details — this is PHI or at minimum PII
- Any automated system handling this data must maintain HIPAA compliance
- Data in transit must be encrypted (HTTPS), data at rest must be encrypted
- Credential storage must be secure (not plaintext)
- Audit logging is required

**Practical risk assessment for a small agency:**
- **Low risk:** Using RPA to automate downloading YOUR OWN commission statements from a portal you're authorized to use, with your own credentials, for your own business purposes
- **Medium risk:** Doing so in violation of explicit TOS prohibiting automated access — risk is breach of contract claim
- **High risk:** Accessing another agent's data, scraping at scale beyond normal usage patterns, or reselling data
- **Reality:** No carrier has (publicly) sued an agent for automating their own commission downloads. The business relationship matters more than TOS enforcement.

**Sources:**
- [hiQ v. LinkedIn (9th Circuit)](https://calawyers.org/privacy-law/ninth-circuit-holds-data-scraping-is-legal-in-hiq-v-linkedin/)
- [hiQ v. LinkedIn Wikipedia](https://en.wikipedia.org/wiki/HiQ_Labs_v._LinkedIn)
- [Web Scraping Laws - TermsFeed](https://www.termsfeed.com/blog/web-scraping-laws/)
- [Is Web Scraping Legal 2025 - Browserless](https://www.browserless.io/blog/is-web-scraping-legal)
- [Data Scraping Claims - Finnegan](https://www.finnegan.com/en/insights/blogs/incontestable/data-scraping-claims-cfaa-out-contract-and-copyright-in.html)

---

### 7. Carrier Portal Export Capabilities (Current State)

| Carrier | Portal | What's Available | Automated Download Friendliness |
|---|---|---|---|
| **Humana** | Agent Portal / Vantage | Pipe-delimited TXT, PDF. No API for commissions specifically. Has [Agents API](https://developers.humana.com/apis/agent/agent-api/doc) and [Reporting API](https://developers.humana.com/apis/agent-api/doc) on developer portal (enrollment data, agent data — not commission statements) | Medium — TXT format is machine-parseable but no official automation path |
| **UnitedHealthcare** | UHOne Broker Portal / Jarvis | Commission statements downloadable from any year/month in "a variety of formats." [Jarvis](https://thebrokerageinc.com/how-to-use-uhc-jarvis/) is the newer interface | Medium-High — multiple format options, historical access |
| **Aetna** | Producer World / direct.aetna.com | Commission statements online. [Developer portal](https://developerportal.aetna.com/gettingstarted) exists but focused on member-facing data (Interoperability APIs), not agent commissions | Low — no known API or bulk export for commissions |
| **MetLife** | Broker Portal | Self-service commission tool. Designed to "reduce commission processing time and ensure commissions are paid quicker" | Unknown — limited public documentation |
| **Cigna** | Broker Portal / [Developer Portal](https://developer.cigna.com/docs/service-apis) | Commission statements available. Developer portal has service APIs but focused on member/provider data | Low — developer APIs don't cover commissions |

**The trend:** Carriers are slowly improving self-service portals (UHC Jarvis is a good example), but **no carrier offers a REST API for commission data download**. The best case is downloadable CSV/Excel from the portal. PDFs remain common, especially for older/smaller carriers.

**IVANS/AL3:** Still the only carrier-to-agency automated data pipeline, but almost exclusively P&C. Health/life/Medicare carriers have not adopted it at any meaningful scale.

---

### 8. Fragility of Scraping Approaches

**How often do carrier portals break scrapers?**

| Factor | Impact | Frequency |
|---|---|---|
| **Full portal redesign** | Breaks everything — must rebuild scraper from scratch | Every 2-5 years per carrier |
| **UI framework migration** (e.g., Angular to React) | Breaks all selectors, may change auth flow | Every 3-5 years |
| **Minor UI updates** | May break specific selectors (button IDs, CSS classes) | Multiple times per year |
| **Anti-bot detection** (Cloudflare, reCAPTCHA, etc.) | Can block headless browsers entirely | Increasing trend |
| **MFA changes** (adding MFA, changing MFA provider) | Breaks auth flow, may require re-enrollment | Unpredictable |
| **Session/cookie policy changes** | Can break session persistence | 1-2 times per year |
| **URL structure changes** | Breaks navigation scripts | Occasional |

**Industry consensus from RPA providers:**
- The Lab Consulting: "configured different versions of the same bot to handle each carrier's specific format" — implying per-carrier maintenance burden
- vBots/Eleviant: 4-6 week implementation per AMS + carrier combination
- General RPA wisdom: "A scraper is never truly 'finished.' Plan for ongoing maintenance from the start."
- Aspire Systems: "Legacy software may lack APIs, so bots must mimic human keystrokes, which can be fragile if systems update"
- "Changing payer rules can break RPA scripts unless they're maintained regularly"

**Estimated maintenance burden:**
- ~2-8 hours per carrier per breakage event
- Expect 2-4 breakage events per carrier per year
- For 10 carriers: ~40-320 hours/year of maintenance
- This is why Carrier Connect and Synatic can charge ongoing fees — the maintenance is the product

**Mitigation strategies used by commercial providers:**
1. **Selector resilience:** Use data attributes and ARIA labels instead of CSS classes (less likely to change)
2. **Visual AI/OCR:** Instead of DOM selectors, use screen recognition (what vBots does with OCR + ML)
3. **Monitoring + alerting:** Automated checks that detect when a scraper fails, triggering maintenance
4. **Headful browser mode:** Some anti-bot systems only block headless browsers
5. **Rate limiting:** Mimic human browsing speed to avoid detection

---

### 9. Non-Portal Alternatives to Scraping

Before building a scraper, consider these alternative data acquisition methods:

| Method | How It Works | Pros | Cons |
|---|---|---|---|
| **Email parsing** | Many carriers email commission statements. Set up a shared inbox, parse attachments automatically | No portal login needed, no anti-bot risk | Not all carriers do this; email format varies |
| **SFTP/secure file delivery** | Some carriers/FMOs can push files via SFTP to agency server | Most reliable automated method, industry-standard secure | Requires carrier cooperation, usually only for larger agencies |
| **FMO/upline portal** | If contracted through FMO, download consolidated statements from FMO portal instead | Fewer portals to scrape, FMO may offer better export formats | Adds FMO dependency, may have less detail |
| **IVANS Download** | Carrier pushes data via IVANS network to AMS | Fully automated, industry standard | P&C only; health/Medicare carriers not participating; requires compatible AMS |
| **Carrier developer APIs** | Humana and Cigna have developer portals | Official, stable, no scraping needed | Currently don't cover commission data — enrollment/member data only |
| **Manual download + smart import** | Agent downloads monthly, Compass parses with carrier-specific importers | Zero legal risk, zero maintenance, proven | Manual step remains |

---

### 10. Recommendations for Compass

**Short-term (what you're doing now is correct):**
- Manual download + carrier-specific importers is the lowest-risk, lowest-maintenance approach
- Adding more carrier importers (Aetna, UHC, Cigna, Anthem) increases value significantly
- Consider email attachment parsing as a next step — many agents already have commission statement emails

**Medium-term (if demand warrants it):**
- Playwright-based optional scraper module (opt-in, agent provides their own credentials)
- Per-carrier YAML/TOML config files (login URL, selectors, download path)
- TOTP shared secret storage in OS keyring for MFA
- Run on a schedule (cron/systemd timer) since Compass is desktop-native
- Start with 2-3 most popular carriers (Humana, UHC, Aetna)

**Long-term (the real opportunity):**
- AI-powered statement parsing (LLM-based column detection) to eliminate per-carrier import maps
- This is what Fintary raised $12.8M to build
- Could use local LLM (Ollama) for privacy — no PHI leaves the machine
- Dramatically reduces maintenance vs. scraping

**What NOT to build:**
- Don't build scraping as a core feature — it's a maintenance nightmare
- Don't store carrier credentials in your own backend/database — too much liability
- Don't try to bypass anti-bot protections — it escalates the legal risk

**Sources for this section:**
- [The Lab Consulting - RPA Insurance Commissions](https://thelabconsulting.com/robotic-process-automation-for-insurance-direct-bill-commissions-reconciliations/)
- [UiPath MFA Automation](https://www.uipath.com/community-blog/tutorials/automate-despite-multi-factor-authentication)
- [RPA Framework MFA](https://rpaframework.org/libraries/mfa/)
- [Axiom.ai - Web Scraper Problems](https://axiom.ai/blog/5-problems-webscrapers)
- [Simple Fractal - Payer Portal RPA Case Study](https://simplefractal.com/success-stories/payer-portal-automation/)
- [Nationwide - Agent/Carrier Data Download Collaboration](https://agentblog.nationwide.com/agency-management/technology/ways-agents-and-carriers-can-collaborate-on-insurance-data-downloads/)
