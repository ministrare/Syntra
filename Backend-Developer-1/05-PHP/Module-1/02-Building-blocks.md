# PHP: Building Blocks

## Inhoud
 - [Variabelen](#Variabelen)
 - [Werken met meldingen](#Werken-met-meldingen)
 - [Constanten](#Constanten)
 - [Eenvoudige opdrachten](#Eenvoudige-opdrachten)
 - [Vergelijkingen](#Vergelijkingen)
 - [Condities](#Condities)
 - [Opdrachten](#Opdrachten)
 

## Variabelen

Het geheugen van een computer wordt wel eens vergeleken met een laden kast, met laden die een naam kunnen hebben en allerlei inhoud kunnen bevatten. Dit is een goede manier om over variabelen ​te denken. Een variabele is zo'n lade, met een naam​en een inhoud​. Verschillende laden kunnen niet dezelfde naam hebben, dat zou verwarring opleveren. Het is echter geen enkel probleem als ze dezelfde inhoud hebben. De naam van een lade zou bijvoorbeeld “plaats” kunnen zijn en de inhoud “Amsterdam”. Er is dan een variabele die “plaats” heet en de waarde “Amsterdam” heeft. In PHP schrijven we dat zo op:

```php
$plaats = "Amsterdam";
```

We kunnen altijd een nieuwe lade maken. We kunnen de inhoud van laden veranderen. We kunnen ze kopiëren. De inhoud van een lade kan bij die van een andere gegooid worden.

```php
//Nieuwe variabele
$plaats = "Amsterdam"; 
 
//Waarde veranderen
$plaats = "Rotterdam"; 
 
// Waarde kopiëren:
$plaats = "Amsterdam";
$woonplaats = $plaats;
```

### Verschillende types variabelen
Hieronder volgt een volledige lijst van de beschikbare variabele typen in PHP, met steeds voorbeelden van de waarden die de variabelen kunnen bevatten.

Integer: Gehele getallen
```php
$a = 3;
$b = ­-16;
$c = 130;
```

Double: Dubbele precisie
```php
$a = 0.9;
$b = ­19.734;
$c = 100.001;
```

Float: Drijvende komma
```php
$a = 4e­15;
$b = 6.000000000001;
$c = 15.1;
```

Boolean: Booleaanse
```php
$a = True;
$b = False;
```

Char: Karakters
```php
$a = 'b';
$b = '6';
$c = '#';
```

String: Tekenreeks
```php
$a = "ik ben een string";
$b = "String";
$c = "";
```

Array: Variabele die meerdere variabelen kan bevatten
```php
$a = array("a", "b", 12, 5.0, True);
 
// 2 verschillende methodes om een array te defineren
$b = array("a", "b", "c");
$c[0] = "a";
$c[1] = "b";
$c[2] = "c";
```

## Werken met meldingen
Je ontvangt misschien een melding (notice) als je een opdracht gebruikt met een variable die niet meer bestaat. Dit is afhankelijk van het foutmeldingsniveau waarop PHP is ingesteld. Meldingen zijn niet hetzelfde als foutmeldingen (errors); meldingen stoppen de uitvoering van het programma niet. Meldingen signaleren alleen dat je iets ongebruikelijks doet en vragen je er naar te kijken om te controleren of dat de bedoeling is.

Stel dat je de volgende opdracht gebruikt:
```php
unset($age);
echo $age;
$age2 = $age;
```

Je krijgt dan misschien twee meldingen: een voor de tweede opdracht en een voor de derde.

Stel dat je deze opdrachten absoluut wilt gebruiken. Het programma werkt namelijk precies zoals je wilt. Het enige probleem is die vervelende meldingen. Je voorkomt meldingen in een programma door een apenstaartje (@) in te voegen op de plek waar de melding wordt gegeven. Je voorkomt de meldingen die de vorige opdrachten genereren door ze als volgt te wijzigen:

```php
unset($age);
echo @$age;
$age2 = @$age;
```

## Constanten
PHP-constanten lijken veel op variabelen. Constanten krijgen een naam worden gebruikt om een waarde op te slaan. Constanten zijn echter constant; ze kunnen niet door het programma worden gewijzigd. De waarde die je voor een constante instelt, blijft onveranderd. Een constante voor leeftijd die je op de waarde 29 instelt, kan niet meer worden gewijzigd. Zou dat niet mooi zijn, altijd 29 blijven?

Je gebruikt constanten als je gegevens die niet veranderen op verschillende plaatsen in het programma nodig hebt. Het is handig een constante voor een waarde aan het begin van je programma in te stellen en in het programma te gebruiken. Als je een constante in plaats van variabel gaat gebruikt, weet je zeker dat de waarde niet per ongeluk kan worden gewijzigd. Door de constante een naam te geven, weet je direct wat zijn waarde is. Door de constante aan het begin van het programma in te stellen in plaats van de waarde steeds weer te gebruiken, hoef je de waarde maar op een plaats te wijzigen in plaats van het volledige programma te doorlopen als je een andere waarde wilt gebruiken.

Constanten worden met de opdracht define ingesteld. Het formaat is:
```php
define("Constantennaam","Constantenwaarde");
```
Met de volgende opdracht stel je bijv een constante met de bedrijfsnaam in:
```php
define("COMPANY","Syntra");
```
En vervolgens gebruik je de constante in je programma in plaats van de bedrijfsnaam:

```php
echo COMPANY;
```
Zet de constante niet tussen aanhalingstekens als je de opdracht echo gebruikt. Als je dat doet, wordt de waarde als een string beschouwt en zo weer gegeven ipv de waarde van de constant.

Volgens de conventie schrijven we constanten namen in hoofdletters, zodat je ze direct ziet dat het constanten zijn. PHP kan echter niet schelen welke naam een constante krijgt. Je kunt zowel strings als getallen opslaan. De volgende opdracht is toegestaan in php:
```php
define("AGE","29");
```
## Eenvoudige opdrachten
Een eenvoudige opdracht is een instructie, gevolgd door een puntkomma(;). Enkele nuttige eenvoudige opdrachten voor PHP-programma`s zijn:

 - De opdracht echo. Produceert uitvoer die browsers als HTML verwerken.
 - Incrementopdracht. Vermeerdert of vermindert de waarden in variabelen.
 - De opdacht exit. Stopt de uitvoering van je programma.

### Echo
Je gebruikt de opdracht echo om uitvoer te produceren. De uitvoer van een echo-opdracht wordt naar de brwoser van de gebruiker gestuurd en als HTML behandeld.

Het algemene formaat van de opdracht echo is:
```
echo uitvoeritem, uitvoeritem, uitvoeritem, ...
```
De volgende regels zijn van toepassing:
 - Een uitvoeritem kan bestaan uit een getal, een string of variabel. Een string moet tussen aanhalingstekens staan. Het verschil tussen dubbelen en enkele aanhalingstekens word later uitgelegd.
 - Gebruik zoveel uitvoeritems als je nodig hebt.
 - Scheid uitvoeritems met een komma van elkaar.


### Incrimentopdrachten
Een variabele wordt vaak als teller gebruikt. je toont het bedrijfslogo bijvoorbeeld 3 keer om er zeker van te zijn dat iedereen het heeft gezien. Om dit te bereiken, stel je een variabele op 0 in. Elke keer dat het logo wordt weergegeven, tel je de waarde 1 bij de variabele op. Als de waarde 3 is bereikt, weet je dat het logo niet hoeft worden weergegeven. De volgende opdrachten tonen de werking van een teller:
```php
$counter = 0;
$counter = $counter +1;
echo $counter;
```
Deze opdrachten geven de waarde 1 als uitvoer. PHP biedt een kortere notatieformaat omdat tellers zo vaak worden gebruikt. De volgende opdrachten geven hetzelfde resultaat als de vorige:
```php
$counter = 0;
$counter++;
echo $counter;
```
Deze echo-opdracht geeft ook de waarde 1 als uitvoer, want ++ voegt 1 aan de huidige waarde van de variabele $counter toe. Je kunt ook de volgende opdracht gebruiken:
```php
$counter--;
```
Deze opdracht trekt 1 af van de huidige waarde van de variabele $counter.

Je kunt ook andere rekenwiskundige bewerkingen uitvoeren. Je hebt de beschikking over de volgende kortere notaties:
```php
$counter+=2; // Add 2
$counter-=3; // Substracts 3
$counter*=2; // Multiply by 2
$counter/=3; // Devide by 3
```

### Exit
Het is soms nodig om de uitvoering in het midden van het programma stop te zetten. Als het programma een fout tegenkomt, is het vaak verstandiger om te stoppen dan de overige opdrachten uit te voeren. De opdracht exit stopt het programma. Er worden geen opdrachten meer uitgevoerd na deze opdracht. Deze opdracht heeft het volgende formaat:

```php
exit("Bericht");
```

Het bericht wordt weergegeven nadat de uitvoering van het programma is stopgezet. Gebruik bijv de opdracht:
```php
exit("Program stopt.");
```
Je kunt een programma ook met de opdracht _die_ stoptzetten:
```php
die("Program killed!");
```
De opdracht die is gelijk aan de opdracht exit. Soms is het echter leuker om sterf te zeggen.


## Vergelijkingen

Het vergelijken van waarden is een zeer belangrijk onderdeel van de programmering. Het maakt het mogelijk om beslissingen te nemen in de code.

Net als in de wiskunde zijn er sets van operators. Vergelijkingsoperators doen, net als de andere operators, iets met de waarde die ervoor en erna komt. In dit geval vergelijken ze, logischer wijs, de verschillende waarden met elkaar. In de tabel hieronder staan de meest gebruikte operators.

|Operator|Betekenis|
| ---   | ---            
| ==	| Gelijk aan
| !=    | Niet gelijk aan
| ===   | Identiek aan (datatype controle)
| !==   | Niet identiek aan (datatype controle)
| >	    | Groter dan
| <	    | Kleiner dan
| >=    | Gelijk aan, of groter dan
| <=	| Gelijk aan, of kleiner dan

## Condities
Logica wordt gebruikt om beslissingen te nemen in de code. De keuze om al dan niet een deel van de code uit te voeren is afhankelijk van de gemaakte vergelijkingen. Dit vereist het gebruik van wat een condities wordt genoemd. Er zijn een aantal verschillende voorwaarden die u kunt gebruiken, maar we zullen ons eerst richten op de conditie die het vaakst gebruikt worden: if.

### If.. else
Als een bepaalde logica TRUE is, dan wordt een codeblok uitgevoerd. U kunt ook een code opgeven om uit te voeren als de voorwaarde niet TRUE is. Deze vormen worden if en else genoemd, zoals u hieronder kunt zien. De vorm van de if en else verklaring wordt gebruikt om een alternatief voor de code uit te voeren als de voorwaarde niet TRUE is. Hier wordt de code in het if blok hieronder genegeerd, de code in het else blok wordt uitgevoerd.
```php
if (43 < 2) {
	// Voert deze code uit
} else {
	// Voer anders deze code uit
}
```

### if..else if..else
Indien deze 2 vormen nog niet volstaan en u nog een (aantal) extra controles wenst uit te voeren kunt u gebruik maken van de else if voorwaarde. Dit geeft ons de mogelijkheid om nog een extra voorwaarde te stellen en zo een specifiek blok code te laten uitvoeren.
```php
if (43 < 2) {
	// indien correct, voer deze code uit
} else if(43 > 25){
    // indien correct, voer deze code uit
}else {
	// Voer anders deze code uit
}
```

### Switch
De conditionele if-opdracht werkt goed in de meeste situaties. Je kunt echter ook een lijst met condities hebben waarbij je voor elke conditie andere opdrachten wilt uitvoeren. Stel dat je programma verschillende belastingtarieven berekent. Hoe verwerk je deze verschillende tarieven? De opdracht switch is voor dit soort situaties ontworpen.

De opdracht switch controleert de waarde van een variabele en voert een opdrachtenblok uit voor de bijbehorende waarde. Het algemene formaat is:
```php
Switch(variabel)
{
  case __waarde__ :
    Opdrachtenblok;
    break;
  case __waarde__ :
    Opdrachtenblok;
    break;
  ....
  default:
    Opdrachtenblok;
    break;
 
}
```
De opdracht switch controleert de waarde van $variabelenaam. Het programma gaat vervolgens naar het case-gedeelte voor die waarde en voert opdrachten uit totdat een break-opdracht is bereikt of het einde van de opdracht switch. Het standaardgedeelte default wordt uitgevoerd als er geen case-gedeelte voor de waarde van $variabelenaam is. Je kunt zoveel case-gedeelten gebruiken als je nodig hebt. Het default-gedeelte wordt standaard aan het einde geplaatst als je het gebruikt, maar het mag overal staan.

De volgende opdrachten stellen de omzetbelasting van verschillende landen in:

```php
switch($cusCountry)
{
  case "BE" :
    $salesTaxRate = 0;
    break;
  case "FR" :
    $salesTaxRate = 1.0;
    break;
  default:
    $salesTaxRate = 0.5;
    break;
}
 
$salesTaxRate = $orderTotalCost * $salesTaxRate;
```

## Opdrachten
Oefening:

1. Fortuinbouwer \
Rapporteer de volgende variabelen:
    * n = aantal kinderen.
    * x = beroep.
    * y = een land.
    * z = naam van een vrouw.

    Display in de console: U wordt X en woont in Y, en bent getrouwd met Z met N kinderen.

1. Bereken de leeftijd \
 Rapporteer de volgende variabelen:
    * Het huidige jaar
    * Geboortejaar van een persoon
    * Geef in de console de leeftijd van deze persoon weer

1. Voorspeller \
 Rapporteer de volgende variabelen:
    * Uw leeftijd
    * Een maximum leeftijd, laten we allemaal hopen 100 jaar te leven
    * Bereken hoe veel jaar u nog te leven hebt. 
    
    Zet het resultaat op deze manier in de console: \
    ``Je hebt nog steeds N jaar voordat je de leeftijd van Y jaar bereikt hebt.``

1. Prioriteren \
Ontleed de uitkomst van de volgende berekening. 
Leg uit welke operator uitgevoerd word in welke stap: \
let resultaat = (1 + 2) * 3 + 4 / 2;

    stap 1: (1 + 2) * 3 + 4 / 2; \
    stap 2: (1 + 2) * 3 + 4 / 2; \
    stap 3: (1 + 2) * 3 + 4 / 2; \
    stap 4: (1 + 2) * 3 + 4 / 2; 

    
1. Talen
   * Creëer een variabele om een taal te specificeren (“fr”, “nl”, “en”)
   * Creëer een andere variabele die gebruikt zal worden om een bericht op te slaan
   * Creëer een voorwaarde om te weten wat de waarde van het bericht zal zijn als het “fr”, “nl”, “en” is.
   * Toon “Bonjour tout le monde”, “Hallo iedereen”, “Hallo wereld” in de juiste taal.

1. Scores weergeven
   * Creëer een variabele die een score bevat
   * Creëer een variabele die het resultaat bevat
   *  Maak voorwaarden om de rangschikking te bepalen op basis van de score: \
       Je hebt de rang A als je een score hebt die gelijk is aan of hoger dan 90 \
       Je hebt de rang B als je een score onder de 90 hebt. \
       Je hebt de rang C als je een score van minder dan of gelijk aan 50 hebt.

1. In het meervoud
    * Creëer een variabele die een woord in het enkelvoud bevat
    * Maak een variabele aan die het getal bevat dat u beschikbaar heeft
    * Creëer een variabele die het resultaat zal bevatten
    * Maak een voorwaarde om te weten of het nodig is om een “s” toe te voegen of niet \
    Het resultaat moet bijvoorbeeld zijn: “Ik heb 4 appels”.

1. Celsius, Fahrenheit en Kelvin temperatuurconversie \
De gebruiker kiest eerst in het getoonde menu wat voor soort conversie hij wil, hij geeft zijn keuze aan door 
middel van een variabel die mee worden gegeven aan de functie.

   Vervolgens zal een nog een variabelen meegegeven worden waarin de temperatuur vermeld word die moet worden geconverteerd. geef het resultaat weer op het scherm.

   Het menu :

   0. End of the program
   1. Celsius to Fahrenheit
   2. Celsius to Kelvin
   3. Fahrenheit to Celsius
   4. Fahrenheit to Kelvin
   5. Kelvin to Celsius
   6. Kelvin to Fahrenheit

   Om de omrekening te berekenen, gebruikt u de volgende formules : \
   [°F] = ([°C]  x 9/5) + 32 \
   [K]  = [°C]   + 273,15 \
   [°C] = ([°F]  - 32) / (9/5) \
   [K]  = (([°F] - 32) x (5/9)) + 273,15 \
   [°C] = [K]    - 273,15 \
   [°F] = ([K]   x 9/5) - 459,67 
   
   waarin  [K] de temperatuur in Kelvin vertegenwoordigt \
   waarin [°F] de temperatuur in graden Fahrenheit vertegenwoordigt \
   waarin [°C] de temperatuur in graden Celsius vertegenwoordigt