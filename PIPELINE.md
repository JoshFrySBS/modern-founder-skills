# Modern Founder Skills -- Clay Pipeline

3 production-ready prompts for your Clay lead scoring table. Each prompt is one column in the pipeline.

## Pipeline Flow

```
Source > Valid URL Check > [01] Company & Founder Research > [02] ICP Fit Score > FILTER 50+
  > [03] Intent & Angle Research > Find Email > Export
  > Campaign Builder in Claude Code (reads company data + angles + hooks > writes personalised campaigns)
```

## Prompts

| # | Prompt | Column Type | AI Model | Credits/row | Input |
|---|--------|-------------|----------|-------------|-------|
| 01 | Company & Founder Research | Claygent | Argon | 3 | /Domain, /Company LinkedIn URL |
| 02 | ICP Fit Score | Use AI | Sonnet (BYOK) | 0 | /Company & Founder Research |
| 03 | Intent & Angle Research | Claygent | Argon | 3 | /Domain, /Company LinkedIn URL, /Founder LinkedIn URL |

## What Each Prompt Produces

**01 -- Company & Founder Research** profiles the company AND finds and profiles the founder/decision maker in a single step:
- Company: value proposition, services, industry, B2B status, revenue signals, business type, deal size
- Founder: name, LinkedIn URL, title, location, employment status, years independent, content activity, audience size, whether they are current and real
- This replaces what used to be two separate prompts (company research + decision maker)

**02 -- ICP Fit Score** scores fit across 7 dimensions:
- Founder fit, service fit, independence, growth stage, outbound need, deal readiness, founder quality
- Automatic pass rules for disqualifiers (competitors, employed elsewhere, volume low-ticket, data protection specialists, founder not found)
- Produces `fit_score` (0-100) and `fit_tier` (Priority / Prospect / Pass)

**03 -- Intent & Angle Research** finds how to approach them AND generates copy variables:
- `recommended_angle` -- which strategic angle to lead with (referral dependency, inbound plateau, recently independent, expertise-pipeline gap, agency sceptic, scaling ambition, craft first)
- `personalisation_hooks` -- 2-3 specific observations for email copy
- `copy_expertise`, `copy_client_descriptor`, `copy_business_descriptor`, `copy_hook` -- merge fields that go directly into email templates in Instantly
- `personalised_line` -- a custom opening line referencing something specific about the prospect
- `intent_score` -- 0-100 based on acquisition gap, business stage, offer fit, personalisation quality, content gap

## How These Feed Into the Campaign Builder

When you export your Clay table and run `/campaign-builder` in Claude Code, the campaign builder reads ALL of this data:

| Data source | What the campaign builder uses it for |
|-------------|--------------------------------------|
| Company & founder data (01) | Segmentation context, founder name, title, LinkedIn URL |
| Fit tier (02) | Segmentation -- Priority leads get deeper personalisation, Prospect leads get broader copy |
| Recommended angle (03) | Which email angle to use for each lead |
| Copy variables (03) | Merge fields in email templates -- makes each email reference their expertise and work |
| Personalisation hooks (03) | Specific references woven into the email body |
| Personalised line (03) | Custom opening line for Priority leads |
| Intent score (03) | Additional segmentation -- high intent leads can get a more direct CTA |

## Native Enrichments (between prompts)

These use Clay's built-in enrichments, no custom prompt needed:

- **Valid URL Check** -- before Prompt 01. Free.
- **Find Email** -- after Prompt 03. Your own API key, 0 Clay credits.

## Credit Gating

The ICP Fit Score (Prompt 02) is the gatekeeper. Only leads scoring 50+ proceed to the expensive Intent & Angle Research step.

See `reference/credit-gating.md` for the full breakdown and savings math.

## How to Use This Pipeline

1. **Adapt each prompt** -- Run `/prompt-adapter` on each of the 3 base prompts to personalise them to your business
2. **Set up Clay table** -- Create columns for each prompt in order, with a filter at the 50+ gate after ICP scoring
3. **Source leads** -- Add leads from Clay's sourcing tools, LinkedIn, Apollo, or any database
4. **Run the pipeline** -- Each column processes automatically. Bad fits get filtered. Good fits get fully researched.
5. **Export** -- Download your scored, researched leads as CSV. Drop into `clay-exports/` and run `/campaign-builder`.
6. **Build campaigns** -- The campaign builder reads the angles, hooks, and copy variables to write hyper-personalised email sequences.

## Tiers

| Tier | Fit Score | What they get |
|------|-----------|---------------|
| **Priority** | 70+ | Full personalisation. Campaign builder uses recommended angle + personalisation hooks + personalised line. Every email references something specific. |
| **Prospect** | 50-69 | Lighter personalisation. Uses copy variables and angle. Broader approach. |
| **Pass** | Below 50 | Not a fit. Pipeline stops after ICP scoring. No wasted credits. |

## Prompt Locations

Base prompts (before adaptation): `prompts/base/`
Adapted prompts (after `/prompt-adapter`): `prompts/adapted/`
