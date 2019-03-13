# PHP

## Joins
In de meeste gevallen bevatten (grote) databases veel aan elkaar verwante tabellen en je zult vaak informatie uit deze verschillende aan elkaar verwante tabellen moeten selecteren.
Indien verschillende en tevens samenhangende gegevens verspreid zijn over meerdere tabellen, kunnen deze gegevens gecombineerd worden door een join of verbinding te maken tussen deze tabellen van waaruit de zogenoemde samenhorende gegevens moeten worden afgeleid en geselecteerd.
Met joins worden in feite de verschillende en samenhorende gegevens, afkomstig uit twee of meerdere tabellen, op een dusdanige manier gecombineerd tot één tabel, dat deze dan alle geselecteerde gegevens (vergelijk select-instructie) van deze twee of meerdere tabellen met elkaar verbindt of een combinatie van rijen van de ene tabel
met rijen van de andere tabel(len) vormt.


#### Syntax
De syntax wordt verduidelijkt aan de hand van de hieronder vermelde cases

Zoals je uit onderstaande grafische voorstelling kunt opmaken, bestaat er tussen de tabel personen, de tabel talen en de tabel diensten een verband.

Door middel van de sleutel taal_id wordt de tabel personen verbonden met de tabel talen, hetzelfde geldt voor het dienst id dat de tabel personen verbindt met de tabel
diensten. voornaam geslacht taal _íd dienst id geboortedatum diensten jaarsalaris — | dienst id vakantiegeld dienst

#### Wat gebeurt er achter de schermen?
Wanneer een join wordt gemaakt tussen twee of meerdere tabellen, wordt er in feite een cartesiaans product gemaakt van deze tabellen.

Als we enerzijds een tabel A hebben met 3 rijen en een tweede tabel B met 5 rijen is het cartesiaans product een samenvoeging van alle mogelijke combinaties van de rijen van deze twee tabellen, ofwel 15 rijen.

Een praktisch voorbeeld van een cartesiaans product:

tabel AAA 
id | veld   
1 | A1
2 | A2 
3 | A3

tabel BBB
id | veldr
1 | B1
2 | B2

Als we nu een sql-statement schrijven op basis van deze twee tabellen, krijgen we het volgende:

```sql
SELECT * FROM AAA, BBB;
```

AAA.id | AAA.Veld1 | BBB.id | BBB.veld1
| | | 
| | | 
| | | 
| | | 

### Inner Join

### Left Join

### Right Join




## Opdrachten
1. Maak een applicatie die alle gegevens van de 3 bestuursleden in een tabel weergeeft op het scherm.

1. Geef een volledige overzicht weer van de financiele data per persoon, en bereken de volledige uitgaven per jaar.

