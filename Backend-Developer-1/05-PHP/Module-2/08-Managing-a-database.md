# Beheren van een database

## Inhoudsopgave
- [Introductie](#introductie)
- [Database types](#Database-types)
- [Wat zijn ‘relationele’ databases](#Wat-zijn-relationele-databases)
  - [Veelgebruikte relationele databases zijn](#Veel-gebruikte-relationele-databases-zijn)
- [MySQL](#MySQL)
- [PHPMyAdmin](#PHPMyAdmin)
- [Een database](#Een-database)

## introductie

Als we data willen opslaan (bijvoorbeeld uit webformulieren) dan kunnen we dat in tekstbestanden doen. En dat gaat goed zolang het niet teveel data is en zolang we geen ingewikkelde bewerkingen of zoektochten door deze data ondernemen. Zodra we dat wél willen doen wordt het slim een database systeem te gebruiken.

Databases (ook wel: databanken of gegevensbanken) zijn programma's die gemaakt zijn om informatie mee op te slaan en te beheren. Je kunt je een database voorstellen als een virtuele archiefkast… Maar dan met wat extra toeters en bellen.

## Database types:
Er worden verschillende soorten databases gebruikt vandaag de dag. De meest gangbare zijn:

1. Relationele databases.
1. Object databases.
1. Flat file databases.

Je kunt je elk type database voorstellen als een verschillende manier (in concept en in de praktijk) om informatie te bewaren en te beheren.

Elk type database heeft z’n voor- en nadelen. Dat gezegd zijnde, de meest populaire database bij uitstek is de ‘relationele database’. Daarom gaan we deze nu hier bespreken.

## Wat zijn ‘relationele’ databases?

Zoals eerder vermeld, heeft elk type database een verschillende manier om informatie op te slaan en te beheren.

Een relationele database beheert haar data (informatie) door relaties te maken tussen de verschillende stukken informatie (opgeslagen in virtuele containers) die een verband met elkaar hebben.

Anders gezegd: als je een broer zou hebben, dan is je moeder de ‘sleutel’ die het verband is (de relatie) tussen jou en je broer.

Met dit beeld in gedachten, kunnen we zeggen dat een relationele database de informatie opslaat en beheert door ‘sleutels’ te gebruiken (in dit geval je moeder) die twee stukken informatie gemeen hebben - jullie hebben allebei dezelfde moeder.

### Veelgebruikte relationele databases zijn:

- MySQL (veel gebruikt in combinatie met PHP omdat het gratis is)
- Oracle
- Microsoft SQL Server

## MySQL

MySQL is zo'n database systeem, we gebruiken dit systeem omdat:

- het open source (en dus gratis) is
- het ondanks dat het gratis is, een zeer uitgebreide en stabiele database server is
- het de meeste gebruikte database in combinatie met PHP is
- al geïnstalleerd staat op uw computer vanaf het moment dat wij WAMP geïnstalleerd hadden.

Genoeg redenen dus, maar het is ook mogelijke andere database-systemen als Microsoft Access, Postgress of SQL server te gebruiken.

## PhpMyAdmin

Een database is een systeem dat zorg draagt voor het opslaan, bewerken en bevragen van data. En dat is eigenlijk ook alles wat het is. Er is niets aan te zien. Als u Microsoft Access wel eens geopend heeft, dan weet u dat daar wel wat te zien is (tabellen, queries, formulieren, etc). Al wordt dit vaak de database genoemd, het is in feite een DBMS (DataBase Management System) dat u ziet. Een DBMS is de interface voor een gebruiker naar de achterliggende database. Voor MySQL hebben we ook zo'n interface nodig, er zijn er meerdere, maar wederom kiezen we voor de meest gebruikte en meest gebruikersvriendelijke variant die wederom al op uw computer is geïnstalleerd als u XAMP heeft geïnstalleerd. Dit DBMS heet PhpMyAdmin.

PhpMyAdmin is te vinden, als het geïnstalleerd staat, op http://localhost/phpmyadmin/. In dit geval is het DBMS niet beveiligd (u hoeft niet in te loggen), omdat we alleen op de eigen computer werken. In PhpMyAdmin kunnen we de databases bewerken. We kunnen nieuwe databases aanmaken, tabellen toevoegen, tabellen veranderen, verwijderen, de databases bevragen en nog meer. Voor meer informatie kunt u de [website van het PhpMyAdmin Project](http://www.phpmyadmin.net/) bekijken.

## Een database

![database](./08-images/database.png)

Opmerking: de bovenstaande afbeelding is met MS Acces gemaakt omdat PhpMyAdmin niet een dergelijke weergave heeft. Het is slechts bedoeld als illustratie!

Wat we zien is een database (het geheel) die reacties heet. Twee zogenaamde tabellen die personen en reacties heten. Beide tabellen hebben op hun beurt weer zogenaamde attributen. Verder is er een één-op-veel relatie tussen personen en reacties hetgeen zoveel wil zeggen dat één persoon meerdere reacties kan maken. Een ander belangrijk aspect is dat beide tabellen een attribuut Id hebben. Dit zorgt ervoor dat een record dat uiteindelijk in de tabel komt te staan uniek te identificeren is (het is mogelijk dat een persoon twee keer hetzelfde berichtje stuurt, deze willen we wel uit elkaar kunnen houden).

U kunt proberen zelf bovenstaande database aan te maken met behulp van PhpMyAdmin. U kunt ook gewoon create.txt downloaden, de inhoud naar het klembord kopiëren, naar http://localhost/phpmyadmin/ surfen en links op het knopje SQL (sql) klikken. Er verschijnt dan een zogenaamd query window alwaar u de inhoud van het klembord kunt plakken. Op Go (of start afhankelijk van uw versie) drukken zorgt ervoor dat de database Reacties aangemaakt wordt!

![database](./08-images/query_window.png)

## SQL

