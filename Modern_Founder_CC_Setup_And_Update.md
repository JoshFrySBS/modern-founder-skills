# Modern Founder CC - Setup and Update Guide

Everything you need to install, update, and troubleshoot the Modern Founder Skills repo. Keep this open in a tab - come back when something isn't working.

---

## Who This Is For

**New students:** jump to [First-Time Setup](#first-time-setup). Takes 15 minutes.

**Existing students:** jump to [Updating Your Skills](#updating-your-skills). Takes 60 seconds.

**Stuck on something:** jump to [Troubleshooting](#troubleshooting). Covers every common issue.

---

## First-Time Setup

### 1. Prerequisites

You need these installed before anything else:

- **Antigravity** - [antigravity.google/download](https://antigravity.google/download)
- **Git** - Mac: open Terminal, run `xcode-select --install`. Windows: [git-scm.com/download/win](https://git-scm.com/download/win), accept all defaults.
- **Anthropic API account** with credit loaded - [console.anthropic.com](https://console.anthropic.com). Start with $5-10.
- **Instantly account** on Growth plan or higher (needed for API access).
- **Clay account** (free plan is fine to start).

### 2. Create Your Business Folder

Create one folder for your business anywhere on your machine. This is your **business folder root** - everything lives inside it.

Example:

```
/Users/yourname/Documents/MyBusiness/
```

Open this folder in Antigravity: `File > Open Folder > select your business folder`.

### 3. Clone the Repo

Open a terminal inside Antigravity: `Terminal > New Terminal`. It will open inside your business folder.

Run:

```
git clone https://github.com/JoshFrySBS/modern-founder-skills.git
```

This creates a `modern-founder-skills/` folder inside your business folder.

**Critical: do not rename this folder.** Keep it exactly as `modern-founder-skills`. Every command in the course assumes this name. Renaming it (e.g. to `03_Modern Founder Skills`) breaks every update command and every path.

Your folder should now look like this:

```
MyBusiness/
  modern-founder-skills/         <- the repo, don't rename
```

### 4. Run the Setup Script

The setup script copies the skills from inside the repo into your business folder root (`MyBusiness/.claude/skills/`) so Claude Code can find them.

From the terminal, still in your business folder:

**Mac / Linux:**
```
cd modern-founder-skills && bash setup.sh
```

**Windows:**
```
cd modern-founder-skills && setup.bat
```

You'll see output confirming the copy succeeded. Your folder now looks like this:

```
MyBusiness/
  .claude/
    skills/                      <- copied by setup script
      strategy/
      tov/
      campaign-builder/
      ... etc
  modern-founder-skills/         <- the repo
```

### 5. Add Your API Keys

Still inside `modern-founder-skills/`, copy the example env file to a real one:

**Mac / Linux:**
```
cp .env.example .env
```

**Windows:**
```
copy .env.example .env
```

Open `.env` in Antigravity and paste in your two keys:

- `ANTHROPIC_API_KEY=` your key from [console.anthropic.com](https://console.anthropic.com)
- `INSTANTLY_API_KEY=` your key from Instantly `Settings > Integrations > API`

Save the file. `.env` is gitignored - your keys stay private.

### 6. Restart Antigravity

Fully quit Antigravity (Mac: `Cmd+Q`. Windows: right-click the taskbar icon → Close Window). Reopen it, open your business folder. Claude Code now sees the skills.

**Verify it worked:** open Claude Code and type `/`. You should see `/strategy`, `/tov`, `/guide`, `/prompt-adapter`, `/campaign-builder`, `/campaign-analyser`, `/personalisation`, `/share-doc`.

### 7. Create Your CLAUDE.md

Run `/guide` in Claude Code. If you don't have a `CLAUDE.md` in your business folder root yet, the guide will offer to build one with you using the Knowledge Base master prompt. Takes 30-60 minutes. Worth every minute.

When it's done, `CLAUDE.md` lives at `MyBusiness/CLAUDE.md`. Every skill reads it every time.

### 8. Start the Workflow

You're ready. Run `/guide` and ask "what should I do next." It routes you through the 6-phase workflow: Strategy > TOV > Prompt Adapter > Clay > Campaign Builder > Launch > Analyser.

---

## Updating Your Skills

When updates are pushed to the repo (new skills, improved prompts, bug fixes), run one command to pull them and sync them into your business folder.

### Quick Update - One Line

**Open a terminal at your business folder root** (not inside a subfolder - this matters, see [Troubleshooting](#terminal-in-the-wrong-folder) if you get errors).

**Mac / Linux:**
```
cd modern-founder-skills && git pull && bash setup.sh
```

**Windows:**
```
cd modern-founder-skills && git pull && setup.bat
```

Three things happen:
1. You `cd` into the repo
2. `git pull` downloads the updates
3. The setup script copies the updated skills into your `.claude/skills/` folder

### After the Update

**Fully quit and reopen Antigravity.** Some IDEs cache the skills list at startup - a restart guarantees you see the latest versions.

**Quick verification:** type `/` in Claude Code. New skills and updated descriptions should appear.

---

## Troubleshooting

### `cd: no such file or directory: modern-founder-skills`

Your terminal is open in the wrong folder. The update command assumes your terminal is at the **business folder root** (the folder that contains `modern-founder-skills/`), not inside a subfolder.

**How to fix:** find out where you are and where the repo actually lives.

```
pwd
ls
ls ..
find ~ -type d -name "modern-founder-skills" 2>/dev/null
```

Mac / Linux: paste that block.
Windows PowerShell equivalent:

```
Get-Location
Get-ChildItem
Get-ChildItem ..
Get-ChildItem -Path $HOME -Recurse -Filter "modern-founder-skills" -Directory -ErrorAction SilentlyContinue
```

Read the output. The `find` command shows you the full path to the repo on your machine. Then:

```
cd /full/path/to/modern-founder-skills && git pull && bash setup.sh
```

(Swap `bash setup.sh` for `setup.bat` on Windows.)

### Terminal in the Wrong Folder

To avoid this every time: open Antigravity's `File > Open Folder`, select your **business folder root** (the one that contains `modern-founder-skills/` as a subfolder), then open a new terminal. It starts in the right place.

Never open the terminal from inside `Business Docs/`, or any other subfolder. Always start from the business folder root.

### You Renamed the modern-founder-skills Folder

If you renamed it (e.g. to `03_Modern Founder Skills`, `MFS`, `skills`, etc.), the update commands don't work - they look for a folder called `modern-founder-skills` that no longer exists.

**Easiest fix: rename it back.**

**Mac / Linux** (from the business folder root):
```
mv "03_Modern Founder Skills" modern-founder-skills
```

**Windows:**
```
ren "03_Modern Founder Skills" modern-founder-skills
```

Then the normal update command works:

```
cd modern-founder-skills && git pull && bash setup.sh
```

**Alternative: work with the renamed folder (not recommended).**

You'll need to quote the folder name (because of spaces) and use its real name every time:

**Mac / Linux:**
```
cd "03_Modern Founder Skills" && git pull && bash setup.sh
```

**Windows:**
```
cd "03_Modern Founder Skills" && git pull && setup.bat
```

Recommend renaming back. Every instruction you'll ever get about this system assumes the folder is called `modern-founder-skills`.

### Folder Names with Spaces

Any folder name with a space (`Business Docs`, `My Business`, `Modern Founder Skills`) needs quotes around it when used in a terminal command.

Good: `cd "Business Docs"`
Bad: `cd Business Docs` (terminal thinks `Docs` is a separate argument)

### `git pull` Says There Are Conflicts

This happens if you edited a tracked file directly (usually a base prompt).

**Safe fix:**
```
git stash
git pull
git stash pop
```

`git stash` saves your edits, `git pull` gets the updates, `git stash pop` reapplies your edits on top. If you see more conflict warnings after the pop, message the course Slack or WhatsApp group - don't guess.

### Setup Script Fails or Skills Don't Appear

First, check the setup script actually exists in your clone:

**Mac / Linux:**
```
ls modern-founder-skills/setup.sh
```

**Windows:**
```
dir modern-founder-skills\setup.bat
```

If you don't see the file, your clone is out of date. Pull first:

```
cd modern-founder-skills && git pull
```

Then re-run the setup command.

### Manual Copy Fallback

If the setup script genuinely will not run on your machine for any reason, you can copy the skills by hand. From your business folder root:

**Mac / Linux:**
```
mkdir -p .claude/skills && cp -R modern-founder-skills/.claude/skills/* .claude/skills/
```

**Windows (cmd):**
```
xcopy modern-founder-skills\.claude\skills .claude\skills\ /E /I /Y
```

**Windows (PowerShell):**
```
New-Item -ItemType Directory -Force -Path .claude\skills; Copy-Item -Recurse -Force modern-founder-skills\.claude\skills\* .claude\skills\
```

Same result as running the setup script.

### Skills Show in `/` Menu But Fail When Running

Nine times out of ten this is a missing or wrong path reference - usually because your business folder layout doesn't match what the skill expects.

**Check your layout.** A working layout looks like:

```
MyBusiness/                      <- you open this folder in Antigravity
  .claude/skills/                <- skills live here (from setup script)
  CLAUDE.md                      <- your business brain
  modern-founder-skills/         <- the repo
    .env                         <- your API keys
    ... rest of the repo
```

If `CLAUDE.md` is somewhere weirder, or if `modern-founder-skills/` is nested two layers deep, move things back into this shape.

### API Keys Not Working

Open `modern-founder-skills/.env` and check:

- No quotes around the keys (`ANTHROPIC_API_KEY=sk-ant-...` not `ANTHROPIC_API_KEY="sk-ant-..."`)
- No trailing spaces after the key
- Each key on its own line
- Both keys filled in (not left blank)

If Instantly specifically is rejecting the key, double-check your Instantly plan - API access requires Growth or higher.

### I Get a Weird Line-Ending Error on Mac

If `bash setup.sh` fails with a message about carriage returns or `\r` characters, the file got converted to Windows line endings. Fix:

```
cd modern-founder-skills
git checkout setup.sh
```

Then re-run. If it happens repeatedly, tell Josh.

---

## FAQ

**Q: Do I need to run setup.sh every time I update?**
A: Yes. `git pull` updates the repo. The setup script is what syncs those changes into your `.claude/skills/` folder so Claude Code actually sees them. The one-line update command runs both for you.

**Q: Can I use Cursor, VS Code, or another IDE instead of Antigravity?**
A: Antigravity is what the course is built around, so that's what's tested. Other Claude Code IDEs should work but you're on your own for quirks.

**Q: My skills disappeared after restarting Antigravity.**
A: Check that `.claude/skills/` still has files in it. If it's empty, the setup script didn't run successfully - re-run it. If the folder has files but Claude Code doesn't see them, fully quit Antigravity (Cmd+Q on Mac, not just closing the window) and reopen.

**Q: Where should my CLAUDE.md live?**
A: At your business folder root (same level as `modern-founder-skills/` and `.claude/`). Not inside the repo. Not inside a subfolder.

**Q: Can I have multiple business folders, each with their own Modern Founder Skills?**
A: Yes. Each business folder is independent. Clone the repo separately into each, run the setup script in each, maintain separate CLAUDE.md files. Just don't share `.env` files across businesses if they have different API keys.

**Q: Do I need to commit my changes to git?**
A: No. You're not pushing changes back to the shared repo. Git is purely so you can pull updates from Josh. Your own work (strategy docs, campaigns, adapted prompts) stays on your machine - nothing goes public.

---

## Where to Get Help

- Run `/guide` in Claude Code - answers most day-to-day questions about the system
- Course Slack / WhatsApp - fastest for specific errors
- Email Josh - for anything the guide and the group can't answer

---

*Last updated alongside the latest push to `modern-founder-skills`. If something here doesn't match what you're seeing, run `git pull` first - you might just be on an older version.*
