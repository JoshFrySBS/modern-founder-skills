# Credit Gating — How the Pipeline Saves You Money

The Clay pipeline uses a scoring filter to make sure you never waste credits on companies that are not a good fit.

---

## How It Works

```
Source leads (from Clay, LinkedIn, Apollo, etc.)
    ↓
[01] Company Research (3 credits/row) — profiles every company + generates copy variables
    ↓
[02] ICP Fit Score (0 credits, BYOK) — scores how well they match your ICP
    ↓
★ FILTER: fit_score below 50 → STOP HERE
   These leads never get enriched. You save credits on every bad fit.
    ↓
[03] Decision Maker (3 credits/row) — finds the right person to contact
    ↓
[04] Intent & Angle Research (3 credits/row) — researches angles, personalisation hooks, intent
    ↓
Find Email (0 Clay credits, own API key) — gets verified email
    ↓
Export → Campaign Builder in Claude Code
```

The key insight: **bad fits get filtered out before the expensive research steps**. You only spend credits on decision maker finding and intent research for companies worth emailing.

---

## The Numbers

For every 1,000 leads you source:

| Step | Leads | Credits/lead | Total credits |
|------|-------|-------------|---------------|
| Company Research | 1,000 | 3 | 3,000 |
| ICP Fit Score | 1,000 | 0 (BYOK) | 0 |
| **Filter: 50+ only** | **~600 pass** | — | — |
| Decision Maker | 600 | 3 | 1,800 |
| Intent & Angle Research | 600 | 3 | 1,800 |
| Find Email | ~420 | 0 (own API) | 0 |

**With gating: ~6,600 credits per 1,000 leads** (6.6 credits/lead average)

**Without gating:** every lead gets every enrichment = ~9,000 credits per 1,000 leads

**Savings: ~27%** — and the savings increase as your ICP scoring gets more precise.

---

## The 50+ Filter

After ICP Fit Scoring, only leads with a **fit_score of 50 or above** proceed to the next steps.

| Tier | Score | What happens |
|------|-------|-------------|
| **Priority** | 70+ | Best fits. Get full research (decision maker + intent + angles). Hyper-personalised campaigns. |
| **Prospect** | 50-69 | Worth reaching out. Get full research. Lighter personalisation in campaigns. |
| **Pass** | Below 50 | Not a fit. Pipeline stops here. No credits wasted on research. |

---

## What You Get for the Credits

The intent & angle research step (3 credits/row) produces data that dramatically improves your campaign quality:

- **Recommended angle** — which approach to lead with for each person
- **Personalisation hooks** — 2-3 specific things to reference in the email
- **Offer positioning** — how to frame your offer for their specific situation
- **Intent score** — how likely they are to be receptive

Without this step, the campaign builder has to write generic emails using just company data. With it, every email can reference something specific about the person and lead with the right angle for their situation.

The ROI is in reply rates, not credit savings. Hyper-personalised emails at 3-5% reply rate are worth far more than generic emails at 1-2%.

---

## Why This Matters

Clay credits cost real money. Without gating, you are paying to research companies that will never buy from you.

With gating, your Clay budget goes further and every lead that makes it through gets the research that makes your emails actually land. The ICP Fit Score prompt is the gatekeeper — getting it right means better leads in your campaigns and lower Clay costs.
