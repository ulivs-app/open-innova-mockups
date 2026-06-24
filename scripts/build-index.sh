#!/usr/bin/env bash
# Regenerates index.html: a card grid linking every mockup HTML in the repo root.
# Title for each card is derived from the filename (kebab-case -> Title Case).
# Run this whenever you add or remove a mockup.
set -euo pipefail
cd "$(dirname "$0")/.."

{
  cat <<'HEAD'
<!doctype html>
<html lang="it">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Open Innova — Mockups</title>
<style>
  *{box-sizing:border-box}
  body{font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",system-ui,sans-serif;background:#eef1f4;color:#1f2a37;margin:0;padding:48px 24px}
  .wrap{max-width:960px;margin:0 auto}
  h1{font-size:28px;font-weight:800;letter-spacing:-.02em;margin:0 0 6px}
  p.sub{color:#7a838d;margin:0 0 32px;font-size:15px}
  .grid{display:grid;gap:16px;grid-template-columns:repeat(auto-fill,minmax(260px,1fr))}
  a.card{display:block;background:#fff;border-radius:12px;padding:22px 24px;text-decoration:none;color:#1f2a37;box-shadow:0 1px 4px rgba(20,30,45,.1);transition:box-shadow .15s,transform .15s}
  a.card:hover{box-shadow:0 8px 24px rgba(20,30,45,.16);transform:translateY(-2px)}
  a.card strong{display:block;font-size:17px;font-weight:700}
  a.card span{display:block;margin-top:6px;font-size:13px;color:#9aa0a7;font-family:ui-monospace,monospace}
  .empty{color:#9aa0a7;font-size:15px}
</style>
</head>
<body>
<div class="wrap">
<h1>Mockups</h1>
<p class="sub">Prototipi generati con Claude Code · ulivs-app</p>
<div class="grid">
HEAD

  found=0
  for f in *.html; do
    [ "$f" = "index.html" ] && continue
    [ -e "$f" ] || continue
    found=1
    name="${f%.html}"
    title="$(printf '%s' "$name" | tr -- '-_' '  ' | awk '{for(i=1;i<=NF;i++)$i=toupper(substr($i,1,1)) substr($i,2)}1')"
    printf '<a class="card" href="./%s"><strong>%s</strong><span>%s</span></a>\n' "$f" "$title" "$f"
  done
  [ "$found" = "0" ] && printf '<p class="empty">Nessun mockup ancora pubblicato.</p>\n'

  cat <<'FOOT'
</div>
</div>
</body>
</html>
FOOT
} > index.html

echo "index.html regenerated."
