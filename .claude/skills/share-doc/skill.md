---
name: share-doc
description: Share a markdown file as a viewable Google Doc. Converts markdown to a formatted Google Doc via n8n, sets "anyone with link can view" permissions, and returns the shareable link. Use when sharing documents with clients. Triggers: "share this with", "create a google doc", "share doc", "send to client", "make shareable".
---

# share-doc

Convert a markdown file to a Google Doc and get a shareable "anyone with link can view" link.

## Prerequisites

- Pandoc installed
- n8n workflow "share-doc" imported and active (see `Automation/share-doc/SETUP.md`)
- `SHARE_DOC_WEBHOOK_URL` set in `.env`
- Dependencies installed: `cd Automation/share-doc && npm install`

## Usage

When the user asks to share a file with a client or create a Google Doc from a markdown file:

1. Identify the markdown file path
2. Run the share script:

```bash
export PATH="$PATH;C:\\Users\\Fry\\AppData\\Local\\Pandoc" && cd "c:/Users/Fry/Documents/SidebySide CC" && node Automation/share-doc/share.js "<file-path>"
```

With a custom title:

```bash
export PATH="$PATH;C:\\Users\\Fry\\AppData\\Local\\Pandoc" && cd "c:/Users/Fry/Documents/SidebySide CC" && node Automation/share-doc/share.js "<file-path>" --title "Rebecca Hannah - Voice Document"
```

Into a specific Google Drive folder:

```bash
export PATH="$PATH;C:\\Users\\Fry\\AppData\\Local\\Pandoc" && cd "c:/Users/Fry/Documents/SidebySide CC" && node Automation/share-doc/share.js "<file-path>" --folder "<folder-id>"
```

3. The script outputs JSON with the shareable link. Present the link clearly to the user.

## If Setup Not Done

If the webhook URL is missing or the workflow isn't active, tell the user:

"The share-doc skill needs the n8n workflow set up first. Follow `Automation/share-doc/SETUP.md` - import the workflow JSON, connect your Google Drive OAuth, and add the webhook URL to .env."

## Notes

- Pandoc converts markdown to HTML without `--standalone` (no default CSS that breaks table widths)
- The script injects custom CSS for clean spacing (headings, paragraphs, lists, tables, hr)
- Tables are forced to full page width via oversized `<colgroup>` injection (Google Docs clamps to margins)
- n8n converts HTML to native Google Doc formatting via Google Drive API
- Documents are created with "anyone with link can view" permissions
- No service account needed - uses existing n8n Google Drive OAuth