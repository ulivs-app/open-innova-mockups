# open-innova-mockups

Prototipi / mockup pubblicati su GitHub Pages.

🔗 **Sito:** https://ulivs-app.github.io/open-innova-mockups/

Ogni mockup è un singolo file HTML autosufficiente (tutti gli asset sono
incorporati), quindi GitHub Pages li serve direttamente senza alcun build.

> **Eccezione — mockup con componenti `dc-import`.** Se un mockup usa il
> runtime a componenti (tag `<dc-import name="X">`), il file HTML **non**
> contiene la definizione dei componenti: a runtime il dc-runtime li carica
> via `fetch("./X.dc.html")`. In quel caso vanno deployati nella root anche i
> relativi file `X.dc.html` (presenti nello ZIP di export, non nell'HTML
> singolo), altrimenti i componenti rendono come placeholder vuoti e in console
> compare `sibling fetch for <X/> failed … 404`. Es. `gestiscu-lite.html`
> richiede `VolContent.dc.html` e `DocField.dc.html`.

## Aggiungere un nuovo mockup

1. Esporta il file **HTML** (non lo zip) — è già completo di tutti gli asset.
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
  I file `*.dc.html` (componenti) sono esclusi dall'indice.
- `.nojekyll` disattiva Jekyll così Pages serve i file così come sono.
