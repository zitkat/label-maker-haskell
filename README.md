# label-maker

Sesterský projek v Haskellu k [label-maker](https://github.com/JakubDotPy/label-maker) který je součástí navazujícího kurzu [pyladies Plzeň](https://pyladies.cz/plzen/).


## Popis projektu

Program, který usnadňuje práci při tvorbě cenovek v lékárně.

Uživatel zadá potřebné hodnoty, výsupem je pak tisknutelný soubor připravený k rozstříhání.

---

## Vstupy:

### Z příkazové řádky pomocí inputů

```commandline
label-maker-exe
Zadejte jméno: b
Zadejte lékovou formu: gtt
Zadejte jednotky: ml
Zadejte celkové množství: 10
Zadejte celkovou cenu: 5
Zadat další [A/n]?
```

### Ze souboru (csv)

```commandline
label-maker-exe --soubor cedulky.csv
```

### Pomocí commandline agrumentů

```commandline
label-maker-exe --nazev Bromhexin --jednotka ml --mnozstvi 100 --cena 194
```

### Omezení vstupu jednotlivých polí

#### Nazev:

- max 60 znaků (doladit, možno i dvouřádkový)

#### Celková cena:

- musí umožnit 4 cifry `1200,-`

#### Jednotky:

- pouze jedna z možností (ml, kus, tbl, gtt ...)

#### Počet:

- vždy celé číslo (int)

#### Jednotková cena:

- zaokrouhlit na 2 des.m. `12.54,-`

---

## Výstupy

- soubor s cedulkami připravený pro tisk.
- seznam vygenerovaných cedulek.
- csv soubor který je možnost programem načíst
