#!/usr/bin/env bash
#
# Sync Obsidian SSOT → MkDocs docs/
#
# Usage: ./sync.sh
#
# Converts wikilinks, strips frontmatter, converts callouts,
# then copies into docs/ ready for mkdocs build/serve/deploy.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
OBSIDIAN_DIR="$HOME/Obsidian/Resources/Compass"
DOCS_DIR="$SCRIPT_DIR/docs"

# Source file → output file mapping
declare -A FILE_MAP=(
  ["Business Plan.md"]="index.md"
  ["Commission Ingestion Deep Dive.md"]="commission-deep-dive.md"
  ["Commission Tracking Research.md"]="commission-tracking.md"
  ["Eligibility Lookup Research.md"]="eligibility-research.md"
  ["Tech Stack.md"]="tech-stack.md"
)

# Check source directory exists
if [[ ! -d "$OBSIDIAN_DIR" ]]; then
  echo "Error: Obsidian source not found: $OBSIDIAN_DIR" >&2
  exit 1
fi

# Convert one file: reads stdin, writes stdout
convert() {
  python3 -c '
import re, sys

PAGE_MAP = {
    "Business Plan": "index.md",
    "Commission Ingestion Deep Dive": "commission-deep-dive.md",
    "Commission Tracking Research": "commission-tracking.md",
    "Eligibility Lookup Research": "eligibility-research.md",
    "Tech Stack": "tech-stack.md",
}

# Obsidian resolves partial anchors; MkDocs needs exact matches.
# Map short Obsidian section names to full heading slugs.
ANCHOR_FIXES = {
    "index.md#revenue-projections": "index.md#revenue-projections-year-1-of-charging-2027",
}

def slugify(s):
    s = s.lower().strip()
    s = re.sub(r"[^a-z0-9\s-]", "", s)
    s = re.sub(r"\s+", "-", s)
    return re.sub(r"-+", "-", s).strip("-")

def page_file(name):
    return PAGE_MAP.get(name, name.lower().replace(" ", "-") + ".md")

def convert_wikilinks(t):
    t = re.sub(r"\[\[([^#\]|]+)#([^|\]]+)\|([^\]]+)\]\]",
        lambda m: f"[{m[3]}]({page_file(m[1])}#{slugify(m[2])})", t)
    t = re.sub(r"\[\[([^#\]|]+)#([^\]]+)\]\]",
        lambda m: f"[{m[1]} — {m[2]}]({page_file(m[1])}#{slugify(m[2])})", t)
    t = re.sub(r"\[\[([^\]#|]+)\|([^\]]+)\]\]",
        lambda m: f"[{m[2]}]({page_file(m[1])})", t)
    t = re.sub(r"\[\[([^\]#|]+)\]\]",
        lambda m: f"[{m[1]}]({page_file(m[1])})", t)
    return t

def convert_callouts(t):
    lines, result, i = t.split("\n"), [], 0
    while i < len(lines):
        m = re.match(r"^>\s*\[!(\w+)\]\s*(.*)", lines[i])
        if m:
            title = m[2].strip()
            result.append(f"!!! {m[1]} \"{title}\"" if title else f"!!! {m[1]}")
            i += 1
            while i < len(lines) and lines[i].startswith(">"):
                result.append("    " + re.sub(r"^>\s?", "", lines[i]))
                i += 1
        else:
            result.append(lines[i])
            i += 1
    return "\n".join(result)

def strip_frontmatter(t):
    if t.startswith("---"):
        end = t.find("---", 3)
        if end != -1:
            t = t[end + 3:].lstrip("\n")
    return t

text = sys.stdin.read()
text = strip_frontmatter(text)
text = convert_callouts(text)
text = convert_wikilinks(text)

# Fix partial anchors that Obsidian resolves but MkDocs does not
for short, full in ANCHOR_FIXES.items():
    text = text.replace(short, full)

# Strip links to excluded pages (keep display text, remove link)
EXCLUDED_PAGES = {"aios.md", "affiliate-program.md"}
def strip_excluded_links(t):
    def replace(m):
        return m[1]  # keep display text only
    for page in EXCLUDED_PAGES:
        t = re.sub(rf"\[([^\]]+)\]\({re.escape(page)}(?:#[^)]+)?\)", replace, t)
    return t
text = strip_excluded_links(text)

# Replace "Stav" author attribution
text = re.sub(r"\*\*Author:\*\*\s*Stav", "**Author:** Steven Almeroth", text)

print(text, end="")
'
}

echo "Syncing from $OBSIDIAN_DIR → $DOCS_DIR"

for src in "${!FILE_MAP[@]}"; do
  dst="${FILE_MAP[$src]}"
  src_path="$OBSIDIAN_DIR/$src"

  if [[ ! -f "$src_path" ]]; then
    echo "  SKIP  $src (not found)"
    continue
  fi

  convert < "$src_path" > "$DOCS_DIR/$dst"
  echo "  OK    $src → $dst"
done

echo "Done. Run 'mkdocs serve' to preview or 'mkdocs gh-deploy' to publish."
