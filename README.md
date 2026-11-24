# humak-ont

Lauri Lehdon YAMK-opinnäytetyön käsikirjoitus (Humak, kulttuurituotanto).
Työnimi: *Järjestäjä ja esityspaikka samassa mainoksessa — kulttuuritapahtuman digitaalisen markkinoinnin yhteistyömalli.*

Tämä repo on **käsikirjoituksen** kanoni. Projektin tila, päätösloki ja henkilötietoja sisältävä aineisto ovat Teamsissa:
Opinnot / Humak - Kulttuurituottaja YAMK / Oppari (`opinnaytetyo.md`, `paatokset-opinnaytetyo.md`).

## Rakenne

| Tiedosto | Sisältö |
|---|---|
| `00-rakenne.md` | työnimi, tutkimuskysymys, sisällys, metatiedot |
| `01-johdanto.md` | johdanto |
| `02-tietoperusta.md` | tietoperusta |
| `03-menetelmat.md` | pilotin toteutus, haastattelut, etiikka, tekoälyn käytön kuvaus |
| `04-tulokset.md` | pilotin tulokset, haastattelut, yhteistyömalli (tuotos) |
| `05-pohdinta.md` | pohdinta |
| `liitteet/` | liitteet (Liite 1: kumppanuusmainoksen kytkentäohje) |
| `lahteet.bib` | kaikki lähteet BibTeX-muodossa |
| `aineisto/koosteet/` | vain koosteluvut, lähde ja ottopäivä mukana |
| `templates/` | Humakin mallipohja (`humak-pohja.docx`) ja lähdeviitetyyli (`humak.csl`) |
| `AI-KAYTTO.md` | append-only-loki tekoälyn käytöstä |
| `build.sh` | koonti .docx:ksi |

Luku on yksi tiedosto. Jos luku kasvaa hankalaksi, sen voi jakaa alalukutiedostoihin (`03-1-pilotti.md`, `03-2-haastattelut.md`); build.sh ottaa ne mukaan nimen mukaisessa järjestyksessä.

## Säännöt

1. **Teksti:** Lauri kirjoittaa tekstin itse tekoälyavusteisesti. Tekoäly ei generoi lukua uudelleen. Se tekee kohdistetun korvauksen, ja diff tarkistetaan ennen committia.
2. **Lähteet:** viitataan vain lähde-id:llä, joka on `lahteet.bib`:ssä: `[@toikko2009, 45]`. Tekoäly ei lisää lähdettä, jota ei ole bib-tiedostossa, eikä keksi sivunumeroita. `build.sh` pysähtyy tuntemattomaan viitteeseen.
3. **Aineisto:** repoon tulevat vain koosteluvut ja anonymisoidut otteet. Haastattelujen raaka-aineisto, nimet ja yhteystiedot ovat SharePointissa, eivät täällä. Orkesterin kampanjadataa ei kopioida.
4. **Tekoälyn käyttö:** jokainen tekoälyavusteinen commit saa trailerin `AI-assist: <työkalu> — <mitä>` (esim. `AI-assist: Claude — kieliasu, luku 01`). Pidempi kuvaus menee tiedostoon `AI-KAYTTO.md`. Näistä kootaan menetelmälukuun tekoälyn käytön kuvaus (Humak: käyttö ilmaistaan läpinäkyvästi, mitkä työkalut ja miten).

## Koonti

```
./build.sh            # → build/opinnaytetyo.docx
```

Vaatii Pandocin (≥ 3). Jos `templates/humak-pohja.docx` on olemassa, sitä käytetään muotoilupohjana (`--reference-doc`); jos `templates/humak.csl` on olemassa, sitä käytetään lähdeviitetyylinä. Kumpaakaan ei ole vielä lisätty (HUMAK-77: CSL; mallipohja: humak.fi, Opinnäytetyön mallipohja).
