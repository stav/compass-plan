# Eligibility Lookup Research

!!! info "Related"
    - Product roadmap: [Business Plan — Phase 1.5 — Eligibility Lookups](index.md#phase-15-eligibility-lookups)
    - Commission ingestion: [Commission Ingestion Deep Dive](commission-deep-dive.md)
    - Technical architecture: [Tech Stack](tech-stack.md)

## The Problem

Agents need to verify Medicare/Medicaid eligibility for their clients — Part A/B status, MA plan enrollment, dual-eligible (D-SNP) status, MBI numbers. Today this requires logging into multiple carrier portals, calling CMS hotlines, or using state-specific systems. There's no single tool that checks eligibility across all sources from within the agent's existing workflow.

---

## CMS / Government Systems

### MARx (Medicare Advantage Prescription Drug System)

- **What**: CMS's system for MA/Part D enrollment and eligibility data
- **Access**: CMS Enterprise Portal (portal.cms.gov) — available to appointed agents/brokers
- **Two search modes**:
  1. Contract-specific: requires plan contract access, returns detailed enrollment history
  2. General eligibility: returns Part A/B start dates and enrollment history without contract access
- **Limitations**: Primarily for call centers, carriers, and some nursing facilities. Agent access requires requesting a MARx role through the Enterprise Portal.
- **Contact**: MAPD Help Desk 1-800-927-8069, mapdhelp@cms.hhs.gov (Mon-Fri 7am-7:30pm ET)

### HETS (HIPAA Eligibility Transaction System)

- **What**: CMS-operated 270/271 clearinghouse for Medicare eligibility queries
- **How it works**: Send a 270 eligibility inquiry, receive a real-time 271 response
- **Access**: Provider-facing, but accessible through clearinghouses and third-party APIs (pVerify, Stedi, Approved Admissions)
- **Data returned**: Medicare Part A/B eligibility, coverage dates, plan enrollment
- **Volume**: Processes millions of inquiries monthly

### Ohio MITS (Medicaid Information Technology System)

- **What**: Ohio's state Medicaid eligibility database — direct connection, always up to date (per CareSource)
- **Access**: Agent accounts set up by Provider Administrator via MITS portal
- **Limitations**: Each agent must have own account (no sharing). Fee-for-service members get full eligibility response; managed care members get limited response.
- **Note**: Other systems that look up Medicaid may have latency in updating information (CareSource warns against non-MITS tools)
- **Contact**: IHD 800-686-1516 (Mon-Fri 8am-4:30pm EST)
- **IVR**: 24/7 automated access to eligibility, claim status, and provider info

### MAC Portals (Medicare Administrative Contractors)

- **What**: Regional Medicare contractors that offer MBI lookup via secure web portal
- **Lookup requires**: First name, last name, DOB, and SSN
- **Access**: Free for authorized users
- **Use case**: Finding a client's MBI when they don't have their Medicare card

### 1-800-MEDICARE

- **What**: Phone-based eligibility verification
- **How**: Three-way call or speakerphone with the client present
- **Limitations**: Slow, manual, requires client participation

---

## Carrier-Specific Agent Portals

### Devoted Health

- **Portal**: https://agent.devoted.com/
- **Features**: Medicare + Medicaid eligibility checks built into the agent portal
- **D-SNP**: Can check Medicaid eligibility for applicable D-SNP states under "Medicaid" in sidebar
- **Also includes**: Enrollment submission, commission statements, sales materials

### Anthem / Elevance

- **Portal**: Producer Toolbox (brokerportal.anthem.com) + Broker Plus app
- **D-SNP eligibility**: Via live chat with Medicare Agent Services team (8:30am-8pm EST, Mon-Fri)
- **Contact**: medicareagentsupport@anthem.com, (800) 633-4368

### CareSource (Ohio Medicaid)

- **System**: Uses Ohio MITS directly — most up-to-date Medicaid data
- **Eligibility hotline**: (800) 833-3239
- **Sales Operations**: (833) 230-2002, Thomas Dabbs (Sales Coordinator II)

---

## Third-Party APIs & Platforms

| Platform | Type | Coverage | MBI Lookup | Pricing |
|---|---|---|---|---|
| **pVerify** | REST API, batch, portal | Medicare (including MA/HMO, QMB), Medicaid | Yes | Commercial |
| **Approved Admissions** | REST API | 1,300+ payers (Medicare, Medicaid, commercial) | Yes, plus coverage discovery and change detection | Commercial |
| **Stedi** | 270/271 JSON API | Medicare, Medicaid, commercial | Yes (returns MBI in eligibility response) | Commercial |
| **Episode Alert** | FHIR/HIPAA API | Medicare | Yes | Commercial |
| **ZOLL Data Systems** | Batch tool | Medicare | Yes (HICN/SSN → MBI conversion) | Commercial |
| **Experian Health** | RCM tool | Medicare | Yes (automated MBI discovery) | Enterprise |

### CMS Public APIs (potential future integration)

- **Blue Button 2.0**: OAuth2-based FHIR API — beneficiaries share claims/coverage data with third-party apps with consent. 60M+ Medicare beneficiaries eligible.
- **CMS Developer Portal**: developer.cms.gov — public APIs for various CMS data
- **Coverage API**: api.coverage.cms.gov

---

## Compass Integration Strategy

### Near-term (Desktop MVP enhancement)

1. **MARx integration** — Agent logs in once via CMS Enterprise Portal credentials, Compass queries eligibility for clients in their book
2. **Carrier portal lookups** — Leverage existing carrier sync infrastructure (Devoted, Anthem portals) to also pull eligibility data
3. **Manual MBI entry** — Agent enters MBI from client's Medicare card, Compass stores it encrypted with the client record

### Medium-term (with cloud/API infrastructure)

4. **270/271 via clearinghouse** — Integrate pVerify or Stedi API for real-time eligibility checks across all payers from within Compass
5. **State Medicaid** — Ohio MITS for D-SNP eligibility, expandable to other state systems
6. **Batch eligibility** — Check eligibility for entire book of business in one pass (AEP prep)

### Long-term

7. **Eligibility change detection** — Automated alerts when a client's eligibility status changes (lost Medicaid, aged into Medicare, plan terminated)
8. **Enrollment opportunity detection** — Flag clients who became newly dual-eligible (D-SNP opportunity) or lost coverage (SEP opportunity)

---

## Key Insight

Eligibility lookups are a **high-frequency, high-value agent activity** — especially during AEP and when working D-SNP clients. Building this into Compass means the agent doesn't need to leave the app to check eligibility, cross-reference with their book, and take action. It's a natural extension of client management that deepens the product's value and stickiness.
