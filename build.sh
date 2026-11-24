#!/usr/bin/env bash
# Kokoaa luvut .docx:ksi. Pysähtyy, jos viitettä ei löydy lahteet.bib:stä.
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p build

chapters=( $(ls [0-9][0-9]-*.md | sort) )
appendices=( $(ls liitteet/*.md 2>/dev/null | sort || true) )

args=(--from markdown --to docx --citeproc --bibliography lahteet.bib
      --metadata reference-section-title=Lähteet
      -o build/opinnaytetyo.docx)
[[ -f templates/humak-pohja.docx ]] && args+=(--reference-doc templates/humak-pohja.docx)
[[ -f templates/humak.csl ]] && args+=(--csl templates/humak.csl)

log=$(pandoc "${args[@]}" "${chapters[@]}" "${appendices[@]}" 2>&1) || { echo "$log"; exit 1; }
[[ -n "$log" ]] && echo "$log"

if grep -q "Citeproc: citation .* not found" <<<"$log"; then
  echo "VIRHE: viite puuttuu lahteet.bib:stä (ks. yllä). Koonti hylätty." >&2
  rm -f build/opinnaytetyo.docx
  exit 2
fi
[[ -f templates/humak-pohja.docx ]] || echo "Huom: templates/humak-pohja.docx puuttuu, käytetty Pandocin oletuspohjaa." >&2
[[ -f templates/humak.csl ]] || echo "Huom: templates/humak.csl puuttuu, käytetty Pandocin oletustyyliä (Chicago)." >&2
echo "OK: build/opinnaytetyo.docx"
