# Modern Founder Skills -- Clay Pipeline

Two pipelines depending on how you source leads. Same ICP scoring in both. Choose the one that matches your Clay table.

---

## Company Pipeline (01, 02, 03)

Use when you source leads via **Clay Company Search** or import a list of company domains. You start with companies and the pipeline finds the decision maker for you.

```
Source companies > Valid URL Check > [01] Company & Founder Research > [02] ICP Fit Score > FILTER 50+
  > [03] Intent & Angle Research > Find Email > Export
  > Campaign Builder in Claude Code
```

| # | Prompt | Column Type | AI Model | Credits/row | Input |
|---|--------|-------------|----------|-------------|-------|
| 01 | Company & Founder Research | Claygent | Argon | 3 | /Domain, /Company LinkedIn URL |
| 02 | ICP Fit Score | Use AI | Sonnet (BYOK) | 0 | /Company & Founder Research |
| 03 | Intent & Angle Research | Claygent | Argon | 3 | /Domain, /Company LinkedIn URL, /Founder LinkedIn URL |

**Total credits per qualified lead: ~6 (3 for research + 0 for scoring + 3 for intent)**

---

## People Pipeline (01b, 02, 03b)

Use when you source leads via **Clay People Search**. You already have the person's name, title, and LinkedIn URL. The pipeline just needs to research their company and verify their profile.

```
Source people > Valid URL Check > [01b] Company Research (People Search) > [02] ICP Fit Score > FILTER 50+
  > [03b] Intent & Angle Research (People Search) > Find Email > Export
  > Campaign Builder in Claude Code
```

| # | Prompt | Column Type | AI Model | Credits/row | Input |
|---|--------|-------------|----------|-------------|-------|
| 01b | Company Research (People Search) | Claygent | Argon | 3 | /Domain, /Person LinkedIn URL |
| 02 | ICP Fit Score | Use AI | Sonnet (BYOK) | 0 | /Company Research |
| 03b | Intent & Angle Research (People Search) | Claygent | Argon | 3 | /Domain, /Person LinkedIn URL, /Company Research |

**Total credits per qualified lead: ~6 (3 for research + 0 for scoring + 3 for intent)**

### Why a separate people pipeline?

The company pipeline (01) spends page visits and Google searches finding the founder. When you source via people search, you already have them. The people pipeline skips that work, uses fewer page visits per lead, and takes the person's LinkedIn URL as a direct input instead of hunting for it.

---

## What Each Prompt Produces

### 01 -- Company & Founder Research (Company Pipeline)
Profiles the company AND finds and profiles the founder/decision maker in a single step:
- Company: value proposition, services, industry, B2B status, revenue signals, business type, deal size
- Founder: name, LinkedIn URL, title, location, employment status, years independent, content activity, audience size, whether they are current and real

### 01b -- Company Research, People Search (People Pipeline)
Profiles the company and verifies key details about the known contact:
- Company: value proposition, services, industry, B2B status, revenue signals, business type, deal size
- Contact verification: employment status, years independent, audience size, whether they are current and real
- Does NOT search for the founder (you already have them)

### 02 -- ICP Fit Score (Both Pipelines)
Scores fit across 7 dimensions:
- Founder fit, service fit, independence, growth stage, outbound need, deal readiness, founder quality
- Automatic pass rules for disqualifiers (competitors, employed elsewhere, volume low-ticket, data protection specialists, founder not found)
- Produces `fit_score` (0-100) and `fit_tier` (Priority / Prospect / Pass)

### 03 -- Intent & Angle Research (Company Pipeline)
Finds how to approach them AND generates copy variables:
- `recommended_angle` -- which strategic angle to lead with
- `personalisation_hooks` -- 2-3 specific observations for email copy
- `copy_expertise`, `copy_client_descriptor`, `copy_business_descriptor`, `copy_hook` -- merge fields for email templates
- `personalised_line` -- a custom opening line referencing something specific about the prospect
- `intent_score` -- 0-100 based on acquisition gap, business stage, offer fit, personalisation quality, content gap

### 03b -- Intent & Angle Research, People Search (People Pipeline)
Same output as 03 but takes /Person LinkedIn URL directly instead of /Founder LinkedIn URL, and does not reference Company LinkedIn URL.

## How These Feed Into the Campaign Builder

When you export your Clay table and run `/campaign-builder` in Claude Code, the campaign builder reads ALL of this data:

| Data source | What the campaign builder uses it for |
|-------------|--------------------------------------|
| Company data (01 or 01b) | Segmentation context, founder name, title, LinkedIn URL |
| Fit tier (02) | Segmentation -- Priority leads get deeper personalisation, Prospect leads get broader copy |
| Recommended angle (03 or 03b) | Which email angle to use for each lead |
| Copy variables (03 or 03b) | Merge fields in email templates -- makes each email reference their expertise and work |
| Personalisation hooks (03 or 03b) | Specific references woven into the email body |
| Personalised line (03 or 03b) | Custom opening line for Priority leads |
| Intent score (03 or 03b) | Additional segmentation -- high intent leads can get a more direct CTA |

## Native Enrichments (between prompts)

These use Clay's built-in enrichments, no custom prompt needed:

- **Valid URL Check** -- before Prompt 01 or 01b. Free.
- **Find Email** -- after Prompt 03 or 03b. Your own API key, 0 Clay credits.

## Credit Gating

The ICP Fit Score (Prompt 02) is the gatekeeper in both pipelines. Only leads scoring 50+ proceed to the expensive Intent & Angle Research step.

See `reference/credit-gating.md` for the full breakdown and savings math.

## How to Use This Pipeline

1. **Choose your pipeline** -- Company search? Use 01, 02, 03. People search? Use 01b, 02, 03b.
2. **Adapt each prompt** -- Run `/prompt-adapter` on each prompt to personalise them to your business
3. **Set up Clay table** -- Create columns for each prompt in order, with a filter at the 50+ gate after ICP scoring
4. **Source leads** -- Add leads from Clay's sourcing tools, LinkedIn, Apollo, or any database
5. **Run the pipeline** -- Each column processes automatically. Bad fits get filtered. Good fits get fully researched.
6. **Export** -- Download your scored, researched leads as CSV. Drop into `clay-exports/` and run `/campaign-builder`.
7. **Build campaigns** -- The campaign builder reads the angles, hooks, and copy variables to write hyper-personalised email sequences.

## Tiers

| Tier | Fit Score | What they get |
|------|-----------|---------------|
| **Priority** | 70+ | Full personalisation. Campaign builder uses recommended angle + personalisation hooks + personalised line. Every email references something specific. |
| **Prospect** | 50-69 | Lighter personalisation. Uses copy variables and angle. Broader approach. |
| **Pass** | Below 50 | Not a fit. Pipeline stops after ICP scoring. No wasted credits. |

## Prompt Locations

Base prompts (before adaptation): `prompts/base/`
Adapted prompts (after `/prompt-adapter`): `prompts/adapted/`
