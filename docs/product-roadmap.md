# Product Roadmap

Full product roadmap for [Compass](index.md).

---

## Phase 1 — Desktop MVP + Marketing Site (Current)

Local-first desktop app covering client/enrollment tracking and commission reconciliation. Single-user, offline-capable, data encrypted at rest. This is the foundation that establishes trust and proves value.

The desktop download is an initial barrier to entry — agents need to see what they're getting before they'll install anything. A marketing site at compass.broker ships alongside the MVP with:

- Product showcase — screenshots, feature walkthrough, demo videos
- Clear explanation of the privacy/local-first value proposition
- Download page with one-click install for Windows/macOS/Linux
- Comparison table vs. SaaS competitors (price, privacy, features)

## Phase 1.5 — Eligibility Lookups

Built-in Medicare/Medicaid eligibility verification for an agent's clients. Instead of logging into multiple carrier portals or calling 1-800-MEDICARE, the agent checks eligibility directly from Compass against the client record they already have open.

- Medicare Part A/B eligibility, MA plan enrollment status, MBI lookup
- Medicaid/dual-eligible (D-SNP) verification
- Integration targets: MARx (CMS Enterprise Portal), HETS (CMS 270/271), state Medicaid systems (Ohio MITS, etc.), carrier-specific portals (Devoted, Anthem)
- Third-party API options: pVerify, Approved Admissions, Stedi (270/271)
- High value for agents — saves time during enrollment season and client meetings
- See [Eligibility Lookup Research](eligibility-research.md) for full landscape

## Phase 2 — Web App (Free Tier)

A lightweight browser-based version of Compass that lets agents try the product without downloading anything. This directly addresses the desktop distribution barrier — agents who are hesitant to install software can experience the core features in their browser first, then decide whether to download the desktop app (free, with full privacy) or upgrade to a paid cloud tier to keep using the web app.

- Free-tier web app with the same 50-client limit as the desktop free tier
- Core features: client tracking, enrollment management, basic commission import
- Hosted at compass.broker — the marketing site becomes the front door, the web app is the on-ramp
- Two conversion paths: (1) download the desktop app for free (privacy-first, offline, unlimited local use) or (2) upgrade to paid cloud tier for continued web access + sync
- Lowers barrier to entry from "download and install unknown software" to "sign up and try it in your browser"
- Requires cloud infrastructure (see Phase 2.5)

## Phase 2.5 — Cloud Storage

The backend infrastructure that powers both the web app (Phase 2) and optional desktop sync. Once trust is established, desktop users can opt in to sync their local database to the cloud for backup and cross-device access.

- Powers the Phase 2 web app
- Optional sync for desktop users — the local-first, privacy-respecting foundation remains
- Unlocks recurring revenue at a higher tier (cloud infrastructure has real costs)
- Addresses the "what if my laptop dies" concern
- Prerequisite for Phase 3

## Phase 3 — Mobile Client

With cloud storage in place, offer a phone-based client — either a PWA or React Native app. Agents meet clients at kitchen tables, senior centers, and health fairs — having their book of business in their pocket is a natural fit.

- Requires cloud storage (Phase 2.5)
- PWA is lower cost to build/maintain; React Native if native feel is needed
- Read-heavy use case (look up a client, check enrollment status) vs. desktop for heavy data entry

## Phase 4 — Plan Wizard

An interactive plan comparison tool that acts like a smart spreadsheet — agents can view, filter, sort, and drill into every plan they're licensed to sell. But beyond static data, the Plan Wizard uses algorithms that factor in the agent's licensing, certifications, carrier appointments, past sales performance, and commission history to surface intelligent recommendations per client.

- Full plan catalog: MA, Medigap, Part D, D-SNP — filterable by carrier, county, plan type, premium, benefits
- Client-aware recommendations: "For this client, based on their county, current plan, and your carrier appointments, here are the top 3 options"
- Agent-aware scoring: factors in which carriers the agent performs best with, commission rates, and historical retention
- Drill-down into plan details: formulary, provider network, premium, copays, star ratings
- AEP/OEP mode: highlights new plans, plan changes, and discontinued plans for the upcoming year
- Data sources: CMS Plan Finder data, carrier rate tables, agent's own performance data in Compass

## Phase 5 — CRM Features

Add CRM capabilities to the solo-agent product: lead management, sales pipeline, activity tracking, follow-up reminders, and reporting. This deepens the value of Compass for individual agents beyond book-of-business management.

- Lead capture and pipeline stages
- Activity logging (calls, meetings, follow-ups)
- Task/reminder system
- Reporting and dashboards

## Phase 6 — AI Assistant

Built-in LLM interface that lets agents interact with their own data conversationally. On desktop, it's a chat sidebar. On the mobile client, it comes alive with speech-to-text and text-to-speech — the agent talks to Compass and Compass talks back, hands-free.

The AI assistant is also deeply integrated with the Plan Wizard (Phase 4) — agents can ask natural-language questions about plans and get recommendations in conversation rather than filtering through tables manually.

Example queries:
- "Who should I call today?"
- "What's coming up next week?"
- "Which clients have I lost recently?"
- "Am I on track to hit my enrollment goal this quarter?"
- "How much commission am I missing from Humana this month?"
- "What's the best MA plan for Mrs. Johnson in Franklin County?"
- "Compare the top 3 Humana plans for a dual-eligible client in zip 43004"

Key considerations:
- The LLM has full context of the agent's book, enrollments, commissions, activity history, and plan catalog
- STT/TTS on mobile makes it a true voice assistant for agents on the road between appointments
- Privacy advantage: can run a local LLM on desktop (Ollama) so data never leaves the machine — aligns with the [research on local LLM for commission parsing](commission-deep-dive.md#key-takeaways-for-compass)
- Cloud version can use a hosted model with the agent's encrypted data
- This is a premium feature — strong justification for a higher pricing tier
- Differentiator: no competitor offers a conversational AI layer over an agent's own book of business

## Phase 7 — Communication Campaigns

Drip campaign management for agents to stay in touch with their book of business — newsletters, text alerts, and voice calls. Agents set up automated touchpoints; clients can opt in to the channels they prefer. See Campaigns & Alerts Design for the full design.

- **Email campaigns** — Newsletter templates, AEP/OEP reminders, birthday/anniversary messages, plan change alerts
- **Text/SMS alerts** — Clients opt in to receive text updates; agents can send bulk or targeted messages
- **Voice calls** — Automated appointment reminders, wellness check-ins, and outbound campaign calls
- **Drip sequences** — Multi-step campaigns triggered by events (new enrollment, renewal approaching, plan discontinued)
- **TCPA compliance** — Opt-in/opt-out management, consent tracking, do-not-call list integration
- **Integrations** — Twilio (SMS/voice), SendGrid (email), or similar providers
- **Analytics** — Open rates, click rates, response rates, campaign ROI

## Phase 8 — Client Portal

A web portal where an agent's clients can log in to view their own plan details, communicate with their agent, and interact with an AI chatbot for Medicare questions. Available to agents on paid tiers with cloud sync enabled.

- **Client self-service** — View current plan details, coverage summary, ID cards, important dates
- **Settings management** — Clients update their contact info, communication preferences, and notification settings
- **Agent messaging** — Secure chat between client and agent, with message history
- **AI chatbot** — Clients can ask Medicare questions ("Does my plan cover this medication?", "When is open enrollment?", "What's my copay for a specialist?") and get answers grounded in their specific plan data
- **Appointment scheduling** — Clients request or book time with their agent
- **Document sharing** — Agents share plan comparison PDFs, enrollment confirmations, or other documents
- **Branded experience** — Agent's name, photo, and contact info — reinforces the relationship
- **Requires:** Cloud sync (Phase 2.5), web infrastructure (Phase 2), paid tier

## Phase 9 — Voice Agent

An AI-powered voice agent that answers the phone on behalf of the agent. Handles common inquiries, routes urgent calls, and can triage client needs when the agent is unavailable — especially valuable during AEP when agents are in back-to-back appointments.

- **Inbound call handling** — Answers with the agent's greeting, identifies the caller against the client database
- **Common inquiries** — "When does my plan renew?", "What's my agent's email?", "I need to schedule an appointment"
- **Appointment booking** — Integrates with the agent's calendar to schedule directly
- **Triage and routing** — Urgent calls (hospitalization, coverage issues) get forwarded immediately; routine calls get a callback scheduled
- **Call summaries** — Every call is transcribed and summarized in Compass with action items
- **Voicemail replacement** — Instead of leaving a voicemail, the caller has a conversation and their needs are captured
- **Integrations** — Twilio Voice, agent's existing phone number via call forwarding
- **Requires:** Cloud sync, AI infrastructure, Twilio Voice

## Phase 10 — Compass for Agencies (Separate Application)

A distinct product built for agencies, brokerages, and FMOs. This is not a feature added to the solo app — it's a separate application with fundamentally different architecture: authentication, user roles and permissions, shared databases, agency-level administration, and multi-agent workflows.

- Multi-user with role-based access (owner, admin, agent, staff)
- Shared client/enrollment database across the agency
- Agent performance tracking and dashboards
- Agency-level commission reconciliation and reporting
- Downline management (for FMOs/uplines)
- Per-seat pricing model
- Likely cloud-native from the start (agencies expect shared access)

This is a different buyer (agency owners), a different sales motion (B2B, longer sales cycle), and a different price point (per-seat, potentially $50-100+/seat/mo). The solo Compass app serves as the proving ground and pipeline — agents who love Compass individually become advocates for the agency product.

---

## Expansion Implications

| Phase | Revenue Impact | Market Expansion |
|---|---|---|
| Desktop MVP + Marketing Site | Freemium conversion | Solo agents |
| Web App (Free Tier) | Lowers barrier to entry, widens funnel | Agents hesitant to download software |
| Cloud Storage | Higher-tier subscription | Agents who want backup/access anywhere |
| Mobile Client | Retention + stickiness | Field agents, AEP season use |
| Plan Wizard | Major retention driver, upsell to paid | Agents selling across multiple carriers/counties |
| CRM Features | Higher retention, upsell | Solo agents wanting more than a book tracker |
| AI Assistant | Premium tier, major differentiator | Agents who want a hands-free, voice-driven workflow |
| Communication Campaigns | Premium tier, high-value add | Agents who want to automate client touchpoints |
| Client Portal | Premium tier, client-facing value | Agents who want to offer a professional client experience |
| Voice Agent | Premium tier, high willingness to pay | Busy agents drowning in calls during AEP |
| Compass for Agencies | Per-seat B2B pricing | Small agencies, brokerages, FMOs — separate product and market |
