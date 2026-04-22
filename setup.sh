#!/usr/bin/env bash
# Modern Founder Skills - Setup Script (Mac / Linux)
# Copies skills from this repo to the parent business folder's .claude/skills/
# so Claude Code picks them up when you open your business folder.

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR="$(cd "$REPO_DIR/.." && pwd)"

SKILLS_SRC="$REPO_DIR/.claude/skills"
SKILLS_DEST="$PARENT_DIR/.claude/skills"

echo "Modern Founder Skills - Setup"
echo ""
echo "Copying skills from:"
echo "  $SKILLS_SRC"
echo "to:"
echo "  $SKILLS_DEST"
echo ""

if [ ! -d "$SKILLS_SRC" ]; then
  echo "ERROR: Could not find $SKILLS_SRC"
  echo "Is this script being run from inside a clone of modern-founder-skills?"
  exit 1
fi

mkdir -p "$SKILLS_DEST"
cp -R "$SKILLS_SRC/"* "$SKILLS_DEST/"

echo "Done. Skills copied successfully."
echo ""
echo "Next: fully quit and reopen Antigravity (Cmd+Q on Mac)."
echo "Open your business folder, then type / in Claude Code to see the updated skills."
