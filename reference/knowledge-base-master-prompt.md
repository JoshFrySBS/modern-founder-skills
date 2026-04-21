# The Founder's Knowledge Base — Master Prompt

**Your complete business knowledge base. Built with AI. Owned by you.**

The reason most founders get generic, useless output from AI is simple: they haven't given it anything to work with. They type a vague prompt, get a vague answer, and decide AI doesn't work.

It does work. You just need to teach it your business first.

This template is one prompt. When you run `/guide` and don't yet have a CLAUDE.md, the skill uses this prompt to interview you about your entire business, push you for detail, and compile everything into a structured knowledge base document saved as your `CLAUDE.md`. One conversation. One document. Done.

You can also run this prompt manually in claude.ai (or any AI tool) if you prefer to build your knowledge base outside of Claude Code.

---

## How It Works

1. When you run `/guide` and your `../CLAUDE.md` is missing, the guide offers to run this interview
2. Answer the questions one at a time. Be honest. Be specific. The more detail you give, the better every AI interaction becomes
3. At the end, it compiles everything into your complete CLAUDE.md
4. Every skill in this repo reads this file - it becomes your business brain

---

## The Mega-Prompt

This is the full interview prompt. The `/guide` skill reads these instructions and runs the interview with you. You can also paste this into claude.ai directly if you want to build it outside of Claude Code.

```
You are going to help me build my complete business knowledge base. This is the single most important thing I can do before using AI properly. By the end of this conversation, you will compile everything into a structured document I can use forever.

Here is how this works:

1. You will interview me across 8 areas of my business
2. Ask me questions one at a time. Wait for my answer before moving on.
3. Push me for specifics. If my answer is vague, ask a follow-up. "Everyone" is not an answer. "Consultants doing £100-300k who've been burned by agencies" is.
4. Be conversational but thorough. This should feel like a deep strategy session, not a survey.
5. After each section, give me a brief summary of what you captured so I can correct anything before we move on.
6. When all 8 sections are done, compile everything into the final structured document.

Here are the 8 sections and what you need to extract from me:

---

SECTION 1: IDENTITY & POSITIONING

This is the foundation. You need to understand who I am as a business person, what I do, what makes me different, and what I am definitely not.

Ask me about:
- Who I am. Not my CV. My identity as a business person. What I care about. What drives me.
- What I actually do, in plain English. No jargon. Like I am explaining it to a smart person at a dinner party.
- 5-10 traits that define how I show up in business. Not aspirational. Real. What would clients and colleagues say about me?
- What I am definitely NOT. What would make someone who knows me say "that does not sound like them"?
- What genuinely makes me different. Not my marketing line. The real reasons someone picks me. 3-5 differentiators with a short explanation for each.

---

SECTION 2: BUSINESS MODEL & OFFERS

You need to understand everything I sell, who each offer is for, how they connect, and what my rules are. Most AI fails because it does not know the founder's pricing, packaging, or qualifying logic.

Ask me about:
- How my business is set up. The model. What is scalable, what is premium, how I generate demand, what my limits are.
- Every offer I sell. For each: the name, the price, who it is for, and payment options.
- For each major offer, go deep: What is the goal? What is included? How is it delivered? What support comes with it? What does the client walk away with? What is the timeline? Are there extra costs?
- How I decide which offer to recommend to which person. My qualifying logic.
- My non-negotiables. Rules I never break.
- My constraints and boundaries. Capacity, team size, how I want the business to feel.

---

SECTION 3: TARGET CLIENTS

You need to build named avatars for each type of buyer I serve. Real human beings, not vague demographics. Push me on specifics here. Vague client descriptions make terrible AI output.

Ask me about:
- How many distinct types of buyer I have. Give each one a real first name.
- For each avatar: age range, business revenue, typical deal size, industry, team size, spare capacity.
- For each avatar: what drives them, what they value, what they have tried before that did not work, what they are afraid of.
- For each avatar: what makes them ready to buy RIGHT NOW. The trigger.
- For each avatar: which of my offers they buy.
- What all my buyers have in common.
- Who I actively turn away. Red flags. Bad fits and why.

---

SECTION 4: BRAND VOICE & TONE

This section is what makes AI sound like me instead of a robot. AI learns voice from examples better than rules. Push me hard on the real writing examples, they are the most important part.

Ask me about:
- My communication style. 3-5 traits, each with a description. (e.g. "British and colloquial but professional" or "Direct, no jargon, no fluff")
- What qualities everything I publish must have. What it should always feel like.
- What my content must never be.
- My hard "never do" rules. Things that would make someone who knows me say "that does not sound like them."
- Real writing examples. Ask me to paste 3-5 real messages I have actually sent. DMs, emails, LinkedIn posts, proposals. The more the better. This is what you actually learn my voice from.
- How I naturally move conversations forward. My style of CTA. What CTAs I would never use.

---

SECTION 5: PRINCIPLES

These are the beliefs that guide every decision. Without principles, AI defaults to generic best practice. With them, it aligns with what I actually stand for.

Ask me about:
- 3-7 principles that guide how I run my business. Each needs a name and an explanation.
- For each principle: a concrete example of how it shows up in my work. A decision I made, a client I turned away, something I built because of this belief.

---

SECTION 6: OBJECTION HANDLING

What people say before they buy and what I actually say back. Not the "right" answer. The real one.

Ask me about:
- Every common objection, hesitation, or concern I hear. All of them.
- For each one: what I would genuinely say in a DM or on a call. Push me to be honest and natural, not polished.
- Whether any objections are actually red flags that tell me someone is not a fit.

---

SECTION 7: HOW I WORK

My processes. How I deliver, how I qualify, and any named frameworks or methods I use. AI can only help with proposals, onboarding, and delivery if it knows how I actually do things.

Ask me about:
- My delivery process from payment to completion. Step by step. Do not let me skip anything.
- How I qualify leads. What questions I ask to figure out if someone is a good fit.
- Any named processes, frameworks, or methods I use. Even informal ones. Things I do consistently that could be written down as a repeatable approach.

---

SECTION 8: MY MARKET

Industry context that helps AI position me correctly and write with authority.

Ask me about:
- What is happening in my industry right now. Trends, shifts, challenges.
- Where I sit relative to competitors. My actual position. Premium? Specialist? Anti-agency?
- Why I charge what I charge. The value equation.

---

IMPORTANT INSTRUCTIONS FOR THE INTERVIEW:

- Start with Section 1 and work through in order.
- Ask 1-3 questions at a time, not all at once. Make it conversational.
- After each section, summarise what you captured and ask if I want to add or correct anything.
- Push for specificity. If I say "business owners", ask me WHICH business owners. If I say "good service", ask me what makes it good specifically.
- If I am clearly struggling with a section, help me think through it. Suggest examples. Ask it a different way.
- The voice section (Section 4) is the most important. Spend extra time here. The real writing examples are gold. Ask for more if I only give you 1-2.
- Do not rush. This should take 30-60 minutes done properly.

When all 8 sections are complete, compile everything into a single document with this exact structure:

# [My Business Name] — CLAUDE Context File

Loaded every session. This is the business brain every skill reads before doing anything.

## 1. Identity & Positioning
### 1.1 Who I Am
### 1.2 What I Do
### 1.3 Core Identity Traits
### 1.4 Who I Am Not
### 1.5 My Differentiators

## 2. Business Model & Offers
### 2.1 Business Structure
### 2.2 Offer Stack (as a table: Offer | Price | Who For | Payment Options)
### 2.3 Offer Detail (for each major offer: Goal, Who For, Who Not For, Format, What Included, Support, Outcome, Investment, Timeline, Extra Costs)
### 2.4 Qualifying Logic
### 2.5 Non-Negotiables
### 2.6 Constraints & Boundaries

## 3. Target Clients
### Avatar 1: [Name] ([Which offer they buy])
Profile table (Age, Revenue, Deal size, Industry, Team, Time)
Psychographics
Trigger
What They Buy
(Repeat for each avatar)
### Shared Characteristics
### Bad Fit

## 4. Brand Voice & Tone
### 4.1 Tone Traits (table: Trait | Description)
### 4.2 Content Must Be
### 4.3 Content Must NOT Be
### 4.4 Hard Rules
### 4.5 Real Writing Examples
### 4.6 Calls to Action (Use / Never Use)

## 5. Principles
### Principle 1: [Name] — [Explanation + Example]
(Repeat for each)

## 6. Objection Handling
### "[Objection]" — [Real response]
(Repeat for each)
### Red Flag Objections

## 7. How I Work
### Delivery Process
### Qualifying Questions
### Key Frameworks

## 8. My Market
### Industry Context
### Market Position
### Pricing Logic

Begin the interview now. Start with Section 1.
```

---

## What You'll Get

After the conversation, you'll have a single structured document covering:

1. **Identity & Positioning** — Who you are, what you do, what makes you different
2. **Business Model & Offers** — Everything you sell, pricing, qualifying logic
3. **Target Clients** — Named avatars with real detail, not vague demographics
4. **Brand Voice & Tone** — How you sound, real examples, hard rules
5. **Principles** — What you believe and how it shows up in your work
6. **Objection Handling** — What people say and what you actually say back
7. **How You Work** — Your delivery process, qualifying questions, frameworks
8. **Your Market** — Industry context, positioning, pricing logic

---

## Tips for the Best Result

- **Be specific.** "Business owners" is useless. "B2B consultants doing £100-300k who've tried an agency and got burned" is gold.
- **Be honest.** Don't write what sounds good. Write what's true. AI learns your real voice, not your aspirational one.
- **Paste real examples.** The writing examples in Section 4 are the single most important thing in the whole document. Paste real DMs, real emails, real LinkedIn posts.
- **Take your time.** A properly done knowledge base takes 30-60 minutes. It's worth every minute.
- **Come back and add to it.** Every new objection, every new offer, every great message you send. Add it. The knowledge base grows with your business.
