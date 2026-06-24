# open-innova-mockups

Prototipi / mockup generati con **Claude Code**, pubblicati su GitHub Pages.

🔗 **Sito:** https://ulivs-app.github.io/open-innova-mockups/

Ogni mockup è un singolo file HTML autosufficiente (tutti gli asset sono
incorporati), quindi GitHub Pages li serve direttamente senza alcun build.

## Aggiungere un nuovo mockup

1. Esporta da Claude Code il file **HTML** (non lo zip) — è già completo di tutti gli asset.
2. Copialo nella root del repo con un nome in *kebab-case* (minuscolo, senza spazi):

   ```bash
   cp ~/Downloads/"Nuovo Mockup.html" ./nuovo-mockup.html
   ```

3. Rigenera la pagina indice:

   ```bash
   ./scripts/build-index.sh
   ```

4. Commit e push:

   ```bash
   git add -A && git commit -m "Aggiunto nuovo-mockup" && git push
   ```

GitHub Pages si aggiorna automaticamente in ~1 minuto. Il mockup sarà a
`https://ulivs-app.github.io/open-innova-mockups/nuovo-mockup.html`.

## Note

- `index.html` è **generato** da `scripts/build-index.sh` — non modificarlo a mano.
  Il titolo di ogni card deriva dal nome del file (kebab-case → Title Case).
- `.nojekyll` disattiva Jekyll così Pages serve i file così come sono.
