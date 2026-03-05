# Commission Ingestion Deep Dive: Methods, Carriers, and Cutting Edge

!!! info "Related"
    - Full CRM/platform landscape: [Commission Tracking Research](commission-tracking.md)
    - Business plan and product roadmap: [Business Plan](index.md)
    - Technical architecture: [Tech Stack](tech-stack.md)
    - AI operating system: AIOS

## 1. IVANS / Medicare Push — Will It Ever Happen?

**No. There is no equivalent of IVANS for Medicare commissions, and none is planned.**

IVANS (owned by Applied Systems) remains exclusively a **P&C network**. Supported lines: Commercial Auto, BOP, GL, Property, WC, Personal Auto, Homeowners, Flood, Farm. There is **zero mention** of Medicare Advantage, Medicare Supplement, ACA, or any health insurance line being added.

### Carrier-by-Carrier API Status

| Carrier | Developer Portal | APIs Available | Commission API? |
|---|---|---|---|
| **Humana** | developers.humana.com | Agents API, Reporting API, Medicare Enrollment API, Plan Info API | **No** — Agents API is about agent eligibility, not commission payments |
| **UnitedHealthcare** | Optum Developer Portal | Eligibility, claims inquiry, pre-check (all provider-facing) | **No** |
| **Aetna** | developerportal.aetna.com | CMS-mandated Patient Access, Provider Directory | **No** |
| **Anthem/Elevance** | anthem.com/developers | Clinical interoperability only | **No** |
| **Cigna** | Broker portal only | No public developer APIs | **No** |
| **Centene/WellCare** | No developer portal | None | **No** |

**Pattern**: Every carrier built APIs for **CMS-mandated clinical interoperability**. None extended this to agent commission data. Commission statements remain locked in proprietary portals.

### ACORD 1206 — Exists But Unused for Health

ACORD Transaction 1206 (Commission Statement Transmittal) covers life, annuity, disability, LTC, and technically health insurance. Available in XML and EDI formats. Covers all compensation types: first year, renewal, bonuses, advances, loans.

**Reality**: Only life/annuity carriers use it. No Medicare/ACA carrier has implemented ACORD 1206. The standard is 18+ years old and adoption for health remains zero.

### LIMRA LDEx — Not Commission Data

LDEx standards cover enrollment, eligibility, and coverage management for group benefits. They do **not** cover commission or compensation data exchange. Also focused on group/employer benefits, not individual Medicare/ACA.

### Applied Net 2025 Announcements

Applied Systems' October 2025 conference mentioned "Benefits" as a focus area but announced **no new IVANS health/Medicare carriers**. The strategy is: "use AI (Applied Recon) to compensate for the lack of standardized data feeds" rather than waiting for carriers to adopt standards.

**Bottom line for Compass**: Humana's developer portal is the most interesting lead — they have enrollment and agent APIs. If they ever add commission data to their Reporting API, direct integration would be possible. Worth monitoring `developers.humana.com` periodically.

---

## 2. FMO Commission Data Partnerships

### No Major FMO Offers a Public Commission API

Extensive searching confirms: **Integrity, Ritter, SMA, PSM, Crowe, SMS — none offer a documented API for commission data to agents.** The universal pattern:
- Web portal with manual login
- View statements, maybe download CSV/PDF
- Email-delivered statements (some FMOs)

### FMO-by-FMO Status

**Integrity Marketing Group** (60+ agencies, owns Ritter)
- Launched **IntegrityCONNECT** (Sep 2025) — "all-in-one growth engine" for quoting, CRM, eApps, marketing
- Has AI assistant ("Ask Integrity"), Spanish language support
- **Focused on sales enablement, NOT commission reconciliation**
- Commission visibility through partner portals (Ritter dashboard) but no API
- Acquired AIMCOR (Jan 2026), adding 40+ broker general agencies

**Ritter Insurance Marketing** (Integrity partner)
- Dashboard: view commission statements, client data, contracts, enrollments
- No API for programmatic commission access
- Recommends external tools (AgencyBloc, Commission Tracker) for tracking

**Senior Market Advisors / AmeriLife**
- "We handle commissions for you" back-office model
- No agent-facing commission tech tools

**PSM Brokerage**
- Recommends **AgencyBloc Commissions+** for commission tracking
- No proprietary commission API

### Tech Platforms Serving FMOs

**Kizen Commissions CoPilot**
- Built for NMOs/FMOs — 290+ carrier support, 50-level hierarchy
- Auto-processes raw commission transactions, applies rate rules
- Generates and emails agent/agency statements
- **No named major FMO partnership announced publicly**

**Fintary** ($12.8M total funding)
- Full commission lifecycle for brokerages/FMOs
- **No named major FMO partnership announced publicly**

### The Commission Chain: Carrier → FMO → Agent

**Payment models:**
- **Direct-to-agent** (more common in Medicare): Carrier pays agent directly. FMO receives separate override.
- **Pass-through**: Carrier pays FMO full amount; FMO distributes after taking override.

**Data formats at each step:**
- Carrier → FMO: PDF (~75%), CSV, XLSX, TXT (pipe/tab/fixed-width), paper
- FMO internal: Proprietary DB or SaaS (Kizen, AgencyBloc, custom)
- FMO → Agent: Web portal, PDF/CSV download, email attachments

### CMS Compensation Rule Changes (2025)

CMS proposed reducing FMO override payments to a one-time $31/enrollment (down from $100-300/year). This **massive pressure** on FMO economics may accelerate technology adoption as FMOs look to cut commission processing costs.

---

## 3. Cutting-Edge Commission Reconciliation Technology

### Tier 1: AI-Powered Platforms (The Future)

**Fintary** — $10M Series A (Nov 2025), $12.8M total
- AI extracts from *any* carrier format (PDF, CSV, Excel, proprietary)
- Flexible rules engine: multi-level structures, pooled commissions, splits, overrides, bonuses, advances, chargebacks
- Real-time analytics: profitability by carrier/product/agent, chargeback anticipation, revenue leak tracing
- White-label agent portal
- Integrates: Applied Epic, BenefitPoint, Salesforce FSC, SmartOffice, OneHQ, Agency Integrator
- Likely uses format-specific parsers + AI extraction layer for novel formats
- **No public docs on whether they use LLMs or traditional ML/NLP**

**Applied Recon** — Built into Applied Epic (Apr 2025)
- 99%+ accuracy via multi-signal matching (policy number + term dates + LOB + premium amounts)
- Ingests PDFs, CSVs, XLS, AL3 — from P&C and Benefits carriers (90%+ of certified carriers)
- **Continuous learning loop** — human-in-the-loop corrections feed back into matching algorithm
- Direct GL posting to Applied Epic
- The ONLY AI solution built INTO a major AMS (vs. bolt-on)

**Eventual Treasury** — "Revenue Operations Copilot"
- Auto-retrieves from 1,000+ carrier/partner portals (200+ carriers with AI extraction)
- AI reconciliation "in seconds, not hours"
- **Revenue recovery** — auto-detects commission shortfalls and carrier underpayments, expedites recovery
- Revenue forecasting with churn prediction
- Backed by BrokerTech Ventures, Blank Ventures

**Ascend** — AI Smart Inbox (Apr 2025)
- Unified email intake — forward any document (binders, quotes, invoices, commission statements)
- AI auto-classifies, routes, and processes
- Auto-reconciles commission statements against expected commissions in AMS
- Only platform offering both agency bill + direct bill reconciliation
- Claims 95% reduction in human involvement

### Tier 2: RPA + AI Hybrid

**Synatic AutoDB Commission + CommRecon**
- AutoDB: Pre-built integrations log into carrier portals, download statements
- **AI-powered OCR** for PDF extraction (contextual clue recognition for insurance fields)
- CommRecon: **Three-way matching** — (1) bank statement, (2) carrier statement, (3) AMS policy records
- Vertafore Orange Partner, integrates HawkSoft, Nexus, Salesforce
- Primarily P&C-focused (AL3 format expertise)

**Eleviant vBots (now Coventus)**
- RPA bots using OCR + NLP + ML across 150+ carriers
- Retrieves from portals, email attachments, AND shared folders
- 50 seconds vs. 10 minutes human per statement
- Zero error rate vs. 10-15% human
- Integrates: Applied Epic, AMS360, HawkSoft, Veruna, Zywave
- Implementation: 4-6 weeks, monthly recurring

**The Lab Consulting**
- UiPath-based RPA bots, carrier-specific configurations
- 2 weeks per carrier to configure
- Technology-agnostic (UiPath, Blue Prism, Automation Anywhere)

### Tier 3: Specialized LLMs (Emerging)

**EXL Insurance LLM** — Purpose-built on NVIDIA AI Enterprise
- Claims **30% accuracy improvement over GPT-4/Claude/Gemini** on insurance tasks
- Claims reconciliation, data extraction, anomaly detection, chronology summarization
- Closest thing to a production insurance-specific LLM

**No vendor has deployed raw GPT-4/Claude APIs for production commission parsing.** The accuracy requirements are too high and formats too varied for zero-shot LLM approaches. The practical approach is hybrid: carrier-specific parsers + AI/LLM fallback for unknown formats.

### Blockchain — Still Theoretical

- B3i consortium implemented reinsurance smart contracts encoding commission structures
- No production-grade blockchain solution for agent-carrier commission reconciliation
- Carriers have no incentive to adopt shared ledger for commission payments
- Market projected to reach $82.56B by 2033, but mostly claims/fraud, not commissions

---

## 4. Carrier Portal Scraping — Technical Deep Dive

### How the Scrapers Handle MFA

| Approach | How It Works | Used By |
|---|---|---|
| **TOTP shared secret** | Store authenticator app's secret in vault; bot generates same codes via `pyotp` | Most commercial RPA |
| **Email/SMS OTP relay** | Bot monitors inbox/SMS gateway, reads OTP, enters it | Carrier Connect (likely) |
| **Attended handoff** | Human handles login + MFA, then bot takes over | Budget implementations |
| **Service accounts** | Negotiated API/service access with carrier (rare) | Enterprise only |

### Fragility and Maintenance Costs

| Event | Frequency | Fix Time |
|---|---|---|
| Full portal redesign | Every 2-5 years per carrier | Complete rewrite |
| UI framework migration | Every 3-5 years | Major updates |
| Minor UI changes (broken selectors) | Multiple times per year | 2-8 hours per carrier |
| Anti-bot detection added | Increasing trend | Variable |
| MFA changes | Unpredictable | Hours to days |

**Estimated maintenance for 10 carriers**: 40-320 hours/year. This is why Carrier Connect and Synatic charge ongoing fees — the maintenance IS the product.

### Legal/Compliance

- **CFAA**: Post-Van Buren (2021), using your own credentials for automated access is **unlikely** to violate CFAA
- **TOS**: Most carrier portals prohibit bots/scraping. TOS violations create **civil liability** (breach of contract), not criminal
- **HIPAA**: Commission statements contain PHI/PII — encrypted transit/storage required
- **Practical risk**: Low for personal use. No carrier has publicly sued an agent for automating their own downloads

### Open-Source / DIY Options

No dedicated open-source tool exists. A DIY approach using **Playwright + pyotp** requires:
- Per-carrier login script
- MFA handler (TOTP)
- Navigation to commission section (carrier-specific selectors)
- Download trigger + statement parser (reuse Compass importers)
- Scheduling via cron
- **Estimated: 2-4 days per carrier for initial dev, plus ongoing maintenance**

---

## 5. CSV Import Mapping vs. AI Format Detection

### Traditional Import Maps (AgencyBloc, Commission Tracker)

**How they work:**
1. Create a map once per carrier — tell software which column = which field
2. Save the map; future imports auto-apply
3. "Red edits" flag entries that failed to match for human review
4. Unmatched records carry forward to next import cycle

**AgencyBloc:** Tens of thousands of records process in under 2 minutes once mapped.

**Commission Tracker:** "Smart mapping" remembers settings per carrier. PDFx converter transforms PDFs to Excel using table extraction (not full OCR).

**GreenWave SmartConnect:** Supports ACORD XML, CSV, TXT, PDF. The ACORD XML support is rare and notable.

### AI Format Detection (Fintary, Eventual Treasury)

Claims to auto-detect carrier formats without manual map creation. Likely approach:
- Document layout analysis (table structures, headers, column positions)
- Named entity recognition for insurance fields (policy numbers, agent codes, amounts)
- Pattern matching with learned templates (learns after first exposure)
- Anomaly detection for chargebacks and discrepancies

**Key unknown:** Whether these do true zero-shot detection or require a few labeled examples per new carrier format.

### Hardest Formats to Parse (hardest → easiest)

1. **PDF** — Multi-page tables, merged cells, embedded images, scanned docs. "Errors when converting PDF to CSV are common — blank cells, misaligned numbers, jumbled text."
2. **Multi-page Excel with merged cells** — Merged headers break detection, summary rows interspersed with detail
3. **Fixed-width / positional text** — Require exact column positions, shift when carriers change formats
4. **Pipe-delimited TXT** — Less common delimiter, many generic parsers don't handle it (Humana is real-world example)
5. **CSV/TSV** — Generally well-structured but column names/ordering vary wildly. Encoding issues.

### When Carrier Formats Change

- Carriers change formats **without notice** — "leaving administrators to figure out an entirely new statement from square one"
- Traditional import maps **break completely** and must be rebuilt manually
- Core Commissions: Managed Services team handles conversions as a service
- Fintary: Claims changes are "handled in real-time and remembered for future use"
- **Practical reality**: Most agencies spend hours rebuilding maps, multiple times per year per carrier

### Universal Parsing Feasibility

Core fields shared across all carriers:

| Field | Common Variations |
|---|---|
| Policy/Contract Number | PolicyNum, Policy_No, Contract#, PolicyID |
| Insured/Member Name | Insured, MemberName, GrpName, ClientName |
| Agent/Writing Number | AgentCode, WritingNum, ProducerCode |
| Premium Amount | Premium, PremiumAmt, Prem, GrossPremium |
| Commission Amount | Commission, CommAmt, CommissionPaid, NetComm |
| Commission Type | New/Renewal, FrstYr/Rnwl, Initial/Renewal |
| Effective/Paid Date | EffDate, PaidDate, PaymentDate, TransDate |
| Product/Plan Type | Product, PlanType, ProdCode, Coverage, LOB |

**Column header fuzzy matching** (matching column names to known field names) can handle 70-80% of CSV/Excel formats — a potential Compass enhancement that avoids full ML infrastructure.

### Error Rates

| Method | Accuracy |
|---|---|
| Manual data entry | ~95-97% |
| Template-based import (import maps) | ~99%+ for known formats |
| AI/OCR extraction | 95-99.5% depending on tool |
| Managed services (human + software) | ~99.5%+ |

### Handling Edge Cases

- **Chargebacks**: Negative commission amounts. EvolveICM uses "retroactive adjustment logic" with earned/unearned tracking and configurable chargeback processing
- **Advances**: Upfront payments earned over time; unearned portion becomes chargeback on lapse
- **Bonuses**: Separate line items with "Bonus" type code, may not have policy numbers
- **Overrides**: Upline payments, usually separate section or line items

---

## Key Takeaways for Compass

1. **No IVANS/API equivalent is coming for Medicare** — IVANS has zero interest in health insurance. Carrier APIs are clinical-only. Compass's carrier-specific importer approach mirrors the entire industry. See [Business Plan — Solution](index.md#solution) for how this is positioned as a differentiator.

2. **FMOs don't expose APIs** — best case is portal CSV download. CMS override payment cuts may push FMOs to adopt tech (Kizen, Fintary) but no FMO-to-agent API exists today.

3. **The cutting edge is AI parsing** — Fintary ($12.8M), Applied Recon (99%+ accuracy), Eventual Treasury (auto-retrieval from 1,000+ partners). The trend: throw AI at messy carrier statements rather than wait for standardization.

4. **Portal scraping is expensive to maintain** — 40-320 hrs/year for 10 carriers. Legal ambiguity. Compass's manual-download + carrier-specific-importer approach is the most defensible and lowest-maintenance path.

5. **Biggest opportunity**: Column header fuzzy matching (auto-detect common field names in CSV/Excel) as a stepping stone toward AI format detection. Could reduce per-carrier setup time significantly without requiring full ML infrastructure.

6. **LLM-powered parsing is nascent** — EXL built an insurance-specific LLM claiming 30% improvement over GPT-4/Claude. No vendor deploys raw LLM APIs for production commission parsing yet. The gap = opportunity for Compass to differentiate with local LLM for privacy. This feeds into the [Product Roadmap — Phase 6 — AI Assistant](product-roadmap.md#phase-6-ai-assistant) roadmap and the broader AIOS vision.

---

## Sources

### IVANS / Carrier APIs
- [IVANS Download for Carriers](https://www.ivans.com/for-carriers/products/ivans-download/)
- [IVANS DBCS Data Sheet (PDF)](https://www.ivans.com/globalassets/all-documents/resources/brochures-data-sheets/ivans-dbcs-data-sheet_en-us.pdf)
- [Applied Net 2025 Press Release](https://www1.appliedsystems.com/en-us/news/press-releases/2025/innovation-powering-the-intelligent-insurance-era-takes-center-stage-at-applied-net-2025/)
- [Humana Data Exchange APIs](https://developers.humana.com/apis)
- [Optum Developer Portal](https://developer.optum.com/)
- [Aetna Developer Portal](https://developerportal.aetna.com/gettingstarted)
- [ACORD 1206 Fact Sheet (PDF)](https://www.acord.org/docs/default-source/standards-la-factsheets/acord_la_reporting1206commissionstatementtransmittal_factsheet_v02.pdf)
- [LIMRA LDEx Overview](https://www.limra.com/en/solutions-and-services/data-exchange-standards/ldex-overview/)
- [Ideon-LIMRA: Only 8% of Carriers Use APIs](https://www.businesswire.com/news/home/20230915868237/en/)

### FMO Technology
- [Integrity Announces IntegrityCONNECT](https://www.prnewswire.com/news-releases/integrity-announces-integrityconnect-an-all-in-one-technology-growth-engine-for-agents-and-agencies-302559285.html)
- [Ritter Agent Tools](https://www.ritterim.com/agent-tools/)
- [Kizen Commissions CoPilot](https://kizen.com/platform/insurance-commissions)
- [CMS Agent Compensation Changes (Milliman)](https://www.milliman.com/en/insight/cms-proposed-change-agent-compensation-medicare-advantage-landscape)

### Cutting-Edge AI Reconciliation
- [Fintary $10M Series A](https://siliconangle.com/2025/11/05/fintary-lands-10m-modernize-insurance-commission-management/)
- [Applied Recon 99%+ Accuracy](https://www.insurancebusinessmag.com/us/news/breaking-news/ai-slashes-insurance-admin-overload-applied-brings-99-accuracy-to-commissions-549530.aspx)
- [Applied Recon Human-in-the-Loop](https://www.insurancebusinessmag.com/us/news/technology/ai-and-humanintheloop-applied-systems-smarter-model-for-insurance-data-accuracy-558623.aspx)
- [Eventual Treasury](https://eventualtreasury.com/)
- [Ascend Smart Inbox](https://www.prnewswire.com/news-releases/ascend-releases-ai-powered-smart-inbox-for-retail-agencies-302426899.html)
- [Synatic AI-Powered OCR for DBC](https://www.synatic.com/blog/streamline-the-direct-bill-commissions-process-with-ai-powered-ocr)
- [Eleviant vBots](https://www.eleviant.com/commission-statement-reconciliation-bot/)
- [EXL Insurance LLM](https://www.exlservice.com/about/newsroom/exl-launches-specialized-insurance-large-language-model-leveraging-nvidia-ai-enterprise)

### RPA / Scraping
- [Carrier Connect](https://carrierconnect.ai/)
- [Synatic AutoDB Commission](https://www.synatic.com/solutions/autodb-commission)
- [The Lab Consulting - RPA for DBC Reconciliation](https://thelabconsulting.com/robotic-process-automation-for-insurance-direct-bill-commissions-reconciliations/)
- [RPA Framework MFA](https://rpaframework.org/libraries/mfa/)

### Import Mapping / Parsing
- [AgencyBloc Commissions Processing 101](https://www.agencybloc.com/commissions-management/stepbystep-commissions-processing-in-commissions/)
- [Commission Tracker Smart Mapping](https://help.commission-tracker.com/help/ct/default.aspx?pageid=import_carrier_statements1)
- [GreenWave SmartConnect](https://greenwavecommissions.com/features/)
- [Core Commissions Statement Conversion](https://corecommissions.com/insurance-commission-statement/)
- [Catalyit AI Commission Reconciliation Tools](https://catalyit.com/techtips/unlocking-efficiency-how-commission-reconciliation-ai-tools-are-changing-the-game-for-insurance-agents)
- [Agency Compensation 360](https://catalyit.com/comp360/iot)
