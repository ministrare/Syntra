
# PHP: Hello World!

## Inhoud
 - [Introductie](#introductie)
 - [Inlezen van een .txt bestand](#Inlezen-van-een-txt-bestand)
 - [Opslaan in een .txt bestand](#Opslaan-in-een-txt-bestand)
 - [Opdracht](#Opdracht)
 - [Codering JSON naar PHP](#Codering-JSON-naar-PHP)
 - [Decoderen van JSON in PHP](#Decoderen-van-JSON-in-PHP)
 - [Foutafhandeling en testen](#Foutafhandeling-en-testen)
 - [Opdrachten](#Opdrachten)

## Introductie
Tijd om ons geluk te beproeven met het lezen en schrijven naar bestanden in PHP. \
PHP maakt het ons eigenlijk heel gemakkelijk om te doen wat we willen met bestanden; lezen, schrijven en verwijderen. \
We beginnen met het lezen van een bestand.

## Inlezen van een .txt bestand
Maak een bestand aan genaamt: sampleFile.txt. \
Plaats in de txt bestand de volgende zin: \
``I am the sample file…Back off me.`` \

Maak nu een index.php file aan en plaats daarin de volgende code:
```php
$myFile = "sampleFile.txt";
$fh = fopen($myFile, 'r');
$myFileContents = fread($fh, 21);
fclose($fh);
echo $myFileContents;
```

**Result**: \
I am the sample file. 

We beginnen met het instellen van onze bestandsnaam met de ``$myFile`` ingesteld op ``"sampleFile.txt"``. Dan openen we onze gevestigde link met de ``$myFileLink`` variabele door onze bestandsnaam in te stellen en wat we met het bestand moeten doen (r voor read). We gaan dan naar de belangrijkste regel waar we de inhoud van het bestand krijgen met onze variabele ``$myFileContents``. We gebruiken de ``fread`` functie, en gaan in onze variabele link als eerste parameter gevolgd door het aantal karakters dat we willen lezen (in dit geval 21 karakters). PHP leest bestanden zoals u dat zou doen. Het begint met het begin en gaat verder door het bestand, dus onthoud altijd dat je vanaf het begin begint, tenzij je anders aangeeft.

Nu is dat geweldig en alles om gewoon de eerste 21 tekens van een bestand te lezen, maar wat als we niet weten hoeveel tekens we willen lezen? \
We moeten een manier vinden om PHP te vertellen hoeveel karakters er in het hele bestand zitten. \
Goed dat PHP al een functie heeft die ons kan helpen.

```php
$myFile = "sampleFile.txt";
$myFileLink = fopen($myFile, 'r');
$myFileContents = fread($myFileLink, filesize($myFile));
fclose($myFileLink);
echo $myFileContents;
```
I am the sample file…Back off me.

Het belangrijkste verschil tussen dit voorbeeld en het vorige is de bestandsgrootte functie. \
De functie bestandsgrootte krijgt gewoon de grootte van het bestand, wat betekent dat we het kunnen gebruiken om ons het aantal karakters te vertellen die in het bestand staan. Door die functie in te voeren in de fread-functie kunnen we PHP vertellen om het bestand tot het einde te lezen. U kon ook van de bestandsgroottefunctie aftrekken als u zoveel karakters wilde weglaten.

## Opslaan in een .txt bestand
Het belangrijkste verschil tussen dit voorbeeld en het vorige is de bestandsgrootte functie. De functie bestandsgrootte krijgt gewoon de grootte van het bestand, wat betekent dat we het kunnen gebruiken om ons het aantal karakters te vertellen die in het bestand staan. Door die functie in te voeren in de ``fread``-functie kunnen we PHP vertellen om het bestand tot het einde te lezen. U kon ook van de bestandsgroottefunctie aftrekken als u zoveel karakters wilde weglaten.

```php
$myFile2 = "testFolder/sampleFile2.txt";
$myFileLink2 = fopen($myFile2, 'w+') or die("Can't open file.");
$newContents = "You wrote on me...";
fwrite($myFileLink2, $newContents);
fclose($myFileLink2);
```
Vergeet niet dat het schrijven naar een bestand onmiddellijk zal wissen. Dus, als u de schrijffunctie gaat gebruiken, zorg er dan voor dat u het op een aantal testcontent uitvoert voordat u al uw belangrijke bestanden uitveegt. QUICK OPMERKING: zorg ervoor dat je schrijfrechten hebt ingesteld op de map. Als de schrijfrechten niet zijn ingeschakeld, zal de server PHP vertellen dat hij niet naar dat bestand kan schrijven. We openen de bestandslink net als normaal. Dan zetten we de variabele ``$newContents`` op de inhoud die we naar het bestand willen schrijven. Tenslotte gebruiken we de fwrite functie om naar onze ``$newContents`` te schrijven naar onze ``$myFileLink2``. En natuurlijk sluiten we de bestandslink als een goede webontwikkelaar die zich om zijn server bekommert.

### Schrijven naar het einde van een bestand
We kunnen schrijven naar het einde van het bestand, bekend als appending. \
Met behulp van het vorige voorbeeld kun je gewoon de w+ veranderen in een a. Append is precies zoals schrijven, maar het houdt de huidige inhoud en voegt nieuwe inhoud aan het einde toe. Toevoegen is veel veiliger dan schrijven, maar soms moet je over een bestand schrijven. Wees voorzichtig.


## Opdrachten
1. Maak een programma waarmee de klant een playlist kan maken voor zijn 50ste verjaardag avond, van de top 3 van ieder van de genodige gasten. Hij wenst een website die de volgende zaken registreerd en de data via een .txt file opslaat:
   * Naam
   * Email adres
   * Artiest
   * Titel
   * **(optioneel)** \
   De url van een youtube video.

   Vergeet zeker niet om eerst te controlleren of alle waardes ook zijn ingegeven voordat de data ook effectief kan worden opgeslagen en een bedank pagina te voorzien waarbij de gebruiker wordt bedankt voor zijn medewerking.

## Inleiding .json
JSON (JavaScript Object Notation) is een gegevensuitwisselingsformaat dat zowel licht van gewicht als menselijk leesbaar is (zoals XML, maar zonder de opmaak rond uw werkelijke lading). De syntaxis is een subset van de JavaScript-taal die in 1999 werd gestandaardiseerd. Als u meer wilt weten, bezoek dan de officiële website.

Het leuke van JSON is dat je het in JavaScript kunt verwerken, dus het werkt als de perfecte lijm tussen server- en client-side applicatielogica. Omdat de syntactische overhead (in vergelijking met XML) erg laag is, hoef je ook minder bytes van de draad over te zetten. In moderne webstacks heeft JSON vrij veel XML vervangen als de de-factor payload formaat (afgezien van de Java-wereld veronderstel ik) en client side application frameworks zoals backbone.js maken er zwaar gebruik van in de modellaag.

Voordat we JSON in PHP gaan gebruiken, moeten we eerst even kijken naar de JSON specificatie om te begrijpen hoe het is geïmplementeerd en wat er mogelijk is.

Aangezien JSON een subset is van de JavaScript taal, deelt het al zijn taalconstructies met zijn ouders. In JSON kunt u ongeordende toets/waardecombinaties in objecten opslaan of arrays gebruiken om de volgorde van waarden te behouden. Dit maakt het gemakkelijk om te parseren en te lezen, maar heeft ook een aantal beperkingen. Omdat JSON slechts een klein aantal datatypes definieert, kun je geen datatypes zoals datums verzenden (dat kan, maar je moet ze omzetten in een string of een unix timestamp als geheel getal).

Dus, welke datatypes ondersteunt JSON? Het komt allemaal neer op strings, nummers, booleans en null. Natuurlijk kun je ook objecten of arrays aanleveren als waarden.

Hier is een voorbeeld van een JSON document:

```json
{
    "title": "A cool blog post",
    "clicks": 4000,
    "children": null,
    "published": true,
    "comments": [
        {
            "author": "Mister X",
            "message": "A really cool posting"
        },
        {
            "author": "Mister Y",
            "message": "It's me again!"
        }
    ]
}
```
Het bevat in principe alles wat je kunt uitdrukken via JSON. Zoals je geen data, regexen of iets dergelijks kunt zien. Je moet er ook voor zorgen dat je hele JSON document gecodeerd is in UTF-8. We zullen later zien hoe we dat in PHP kunnen garanderen. Vanwege deze tekortkomingen (en om andere goede redenen) is BSON(Binary JSON) ontwikkeld. Het is ontworpen om meer ruimtebesparend te zijn en biedt traversability en uitbreidingen zoals het datumtype. De meest prominente use case is MongoDB, maar eerlijk gezegd ben ik het nooit ergens anders tegengekomen. Ik raad je aan om een korte blik te werpen op de specificatie als je nog wat tijd over hebt, want ik vind het erg leerzaam.

Aangezien PHP een rijker type handling heeft dan JSON, moet je jezelf voorbereiden op het schrijven van wat code aan beide uiteinden om de juiste informatie te transformeren, afgezien van de verplichte codering/decodering stap. Als je bijvoorbeeld datumobjecten wilt transporteren, moet je nadenken of je gewoon een unix tijdstempel over de draad kunt sturen of misschien een voorgeformatteerde datumstring (zoals strftime) kunt gebruiken.

## Codering JSON naar PHP
Enkele jaren geleden, JSON ondersteuning werd verleend door middel van de json pecl uitbreiding. Sinds PHP 5.2 is het direct in de kern opgenomen, dus als je een recente PHP-versie gebruikt, zou je er geen problemen mee moeten hebben.

Opmerking: Als u een oudere versie van PHP gebruikt dan 5.3, raad ik u aan om toch te upgraden. PHP 5.3 is de oudste versie die momenteel wordt ondersteund en met de nieuwste PHP-beveiligingsfouten zou ik het van cruciaal belang vinden om zo snel mogelijk te upgraden.

Terug naar JSON. Met json_encode kun je alles wat UTF-8 gecodeerd is (behalve bronnen) van PHP vertalen naar een JSON string. Als vuistregel geldt dat alles, behalve pure arrays (in PHP betekent dit arrays met een geordende, numerieke index) wordt omgezet in een object met sleutels en waarden.

De methode-aanroep is eenvoudig en ziet er als volgt uit:
```php
json_encode(mixed $value, int $options = 0);
```
Een geheel getal voor opties die u zou kunnen vragen? Yup, dat heet een bitmasker. We zullen ze later in een apart deel behandelen. Omdat deze bitmask opties de manier waarop de data gecodeerd wordt veranderen, gaan we er voor de volgende voorbeelden van uit dat we standaardinstellingen gebruiken en geen aangepaste params aanbieden.

Laten we eerst beginnen met de basistypes. Omdat het zo gemakkelijk te begrijpen is, is hier de code met korte opmerkingen over wat er vertaald is:
```php
<?php
// Returns: ["Apple","Banana","Pear"]
json_encode(array("Apple", "Banana", "Pear"));

// Returns: {"4":"four","8":"eight"}
json_encode(array(4 => "four", 8 => "eight"));

// Returns: {"apples":true,"bananas":null}
json_encode(array("apples" => true, "bananas" => null));
?>
```
Hoe uw arrays worden vertaald hangt af van uw gebruikte indexen. U kunt ook zien dat json_encode zorgt voor de juiste type conversie, dus booleans en null worden niet omgezet in strings maar gebruiken hun juiste type. Laten we nu eens kijken naar objecten:

```php
<?php
class User {
    public $firstname = "";
    public $lastname  = "";
    public $birthdate = "";
}

$user = new User();
$user->firstname = "foo";
$user->lastname  = "bar";

// Returns: {"firstname":"foo","lastname":"bar"}
json_encode($user);

$user->birthdate = new DateTime();

/* Returns:
    {
        "firstname":"foo",
        "lastname":"bar",
        "birthdate": {
            "date":"2012-06-06 08:46:58",
            "timezone_type":3,
            "timezone":"Europe\/Berlin"
        }
    }
*/
json_encode($user);
?>
```
Objecten worden geïnspecteerd en hun publieke attributen worden omgezet. Dit gebeurt recursief, dus in het voorbeeld hierboven worden de publieke attributen van het DateTime object ook vertaald naar JSON. Dit is een handige truc als u eenvoudig gegevens over JSON wilt verzenden, omdat de klantzijde dan zowel op de werkelijke tijd als op de tijdzone kan werken.

```php
<?php
class User {
    public $pub = "Mister X.";
    protected $pro = "hidden";
    private $priv = "hidden too";

    public $func;
    public $notUsed;

    public function __construct() {
        $this->func = function() {
            return "Foo";
        };
    }
}

$user = new User();

// Returns: {"pub":"Mister X.","func":{},"notUsed":null}
echo json_encode($user);
?>
```
Hier kunt u zien dat alleen publieke attributen worden gebruikt. Niet geïnitialiseerde variabelen worden vertaald naar nul terwijl sluitingen die gebonden zijn aan een publiek attribuut worden gecodeerd met een leeg object (vanaf PHP 5.4 is er geen optie om te voorkomen dat publieke sluitingen worden vertaald).

### The $option bitmasks
Bitmaskers worden gebruikt om bepaalde vlaggen aan of uit te zetten in een functieoproep. Dit taalpatroon wordt vaak gebruikt in C en aangezien PHP in C geschreven is, heeft dit concept ook enkele PHP-functie-argumenten opgeleverd. Het is eenvoudig te gebruiken: als je een optie wilt instellen, passeer dan gewoon de constante als argument. Als je twee of meer opties wilt combineren, combineer ze dan met de bitwise OF operatie |. Een aanroep naar json_encode kan er dus zo uitzien:

```php
<?php
// Returns: {"0":"Starsky & Hutch","1":123456}
json_encode(array("Starsky & Hutch", "123456"), JSON_NUMERIC_CHECK | JSON_FORCE_OBJECT);
?>
```
JSON_FORCE_OBJECT dwingt de array te vertalen naar een object en JSON_NUMERIC_CHECK converteert getallen in tekenreeksopmaak naar werkelijke getallen. U kunt hier alle bitmaskers (constanten) vinden. Merk op dat de meeste constanten beschikbaar zijn sinds PHP 5.3 en sommige ervan zijn toegevoegd in 5.4. De meeste gaan over het converteren van tekens zoals < >, & of "". PHP 5.4 biedt een JSON_PRETTY_PRINT constante die je kan helpen tijdens de ontwikkeling, omdat het gebruik maakt van witruimte om de uitvoer te formatteren (aangezien het karakter overhead toevoegt, zal ik het niet inschakelen in de productie natuurlijk).

## Decoderen van JSON in PHP
Het decoderen van JSON is net zo eenvoudig als het coderen. PHP biedt u een handige json_decode functie die alles voor u afhandelt. Als je gewoon een geldige JSON string in de methode passeert, krijg je een object van het type stdClass terug. Hier is een kort voorbeeld:

```php
<?php
$string = '{"foo": "bar", "cool": "attr"}';
$result = json_decode($string);

// Result: object(stdClass)#1 (2) { ["foo"]=> string(3) "bar" ["cool"]=> string(4) "attr" }
var_dump($result);

// Prints "bar"
echo $result->foo;

// Prints "attr"
echo $result->cool;
?>
```
Als je in plaats daarvan een associatieve array terug wilt krijgen, zet dan de tweede parameter op true:

```php
<?php
$string = '{"foo": "bar", "cool": "attr"}';
$result = json_decode($string, true);

// Result: array(2) { ["foo"]=> string(3) "bar" ["cool"]=> string(4) "attr" }
var_dump($result);

// Prints "bar"
echo $result['foo'];

// Prints "attr"
echo $result['cool'];
?>
```
Als u een zeer groot geneste JSON-document verwacht, kunt u de recursiediepte beperken tot een bepaald niveau. De functie keert terug naar nul en stopt met parseren als het document dieper is dan de opgegeven diepte.

```php
<?php
$string = '{"foo": {"bar": {"cool": "value"}}}';
$result = json_decode($string, true, 2);

// Result: null
var_dump($result);
?>
```

Het laatste argument werkt hetzelfde als in json_encode, maar er wordt momenteel slechts één bitmask ondersteund (waardoor je bigints naar strings kunt converteren en alleen beschikbaar is vanaf PHP 5.4. We hebben tot nu toe met geldige JSON strings gewerkt (afgezien van de null depth error). Het volgende deel laat je zien hoe om te gaan met fouten.

## Foutafhandeling en testen

Als de JSON-waarde niet kon worden geparseerd of als er geen nestniveau dieper dan de gegeven (of standaard) diepte wordt gevonden, wordt NULL teruggezonden van json_decode. Dit betekent dat geen enkele uitzondering direct door json_encode/json_deocde wordt verhoogd.

Dus hoe kunnen we de oorzaak van de fout identificeren? De json_last_error functie helpt hierbij. json_last_error geeft een integer error code die een van de volgende constanten kan zijn (hier genomen):

* JSON_ERROR_NONE: Er is geen fout opgetreden.
* JSON_ERROR_DEPTH: De maximale stapeldiepte is overschreden.
* JSON_ERROR_STATE_STATE_MISMATCH: Ongeldig of misvormd JSON.
* JSON_ERROR_CTRL_CHAR: Controle karakterfout, mogelijk onjuist gecodeerd.
* JSON_ERROR_SYNTAX: syntaxisfout.
* JSON_ERROR_UTF8: Misvormde UTF-8 tekens, mogelijk onjuist gecodeerd (sinds PHP 5.3.3.3).

Met deze informatie bij de hand, kunnen we een snelle parsing helper methode schrijven die een beschrijvende uitzondering oproept wanneer een fout wordt gevonden.

```php
<?php
class JsonHandler {

    protected static $_messages = array(
        JSON_ERROR_NONE => 'No error has occurred',
        JSON_ERROR_DEPTH => 'The maximum stack depth has been exceeded',
        JSON_ERROR_STATE_MISMATCH => 'Invalid or malformed JSON',
        JSON_ERROR_CTRL_CHAR => 'Control character error, possibly incorrectly encoded',
        JSON_ERROR_SYNTAX => 'Syntax error',
        JSON_ERROR_UTF8 => 'Malformed UTF-8 characters, possibly incorrectly encoded'
    );

    public static function encode($value, $options = 0) {
        $result = json_encode($value, $options);

        if($result)  {
            return $result;
        }

        throw new RuntimeException(static::$_messages[json_last_error()]);
    }

    public static function decode($json, $assoc = false) {
        $result = json_decode($json, $assoc);

        if($result) {
            return $result;
        }

        throw new RuntimeException(static::$_messages[json_last_error()]);
    }

}
?>
```

We kunnen nu de uitzonderings testfunctie van de laatste post over uitzonderingsbehandeling gebruiken om te testen of onze uitzondering correct werkt.
```php 
// Returns "Correctly thrown"
assertException("Syntax error", function() {
    $string = '{"foo": {"bar": {"cool": NONUMBER}}}';
    $result = JsonHandler::decode($string);
});
```

Merk op dat er sinds PHP 5.3.3.3 een JSON_ERROR_UTF8 fout is opgetreden wanneer een ongeldig UTF-8 teken in de string wordt gevonden. Dit is een sterke aanwijzing dat een andere karakterset dan UTF-8 wordt gebruikt. Als de inkomende string niet onder uw controle is, kunt u de utf8_encode functie gebruiken om deze om te zetten in utf8.

```php
<?php echo utf8_encode(json_encode($payload)); ?>
```

## Opdrachten

2. De klant heeft zich bedacht en zou graag de data als een .json bestand willen laten opslaan.
Voorzie een mogelijkheid in de code waardoor er "makkelijk" geswitched kan worden tussen opslaan in een .txt bestand en opslaan in een .json bestand.

3. Maak een bestand aan genaamd: ``admin.php``. Laat op deze pagina alle informatie zien die is opgeslagen in de .json en/of .txt bestand en voorzie een link naar deze pagina op homepagina. Zorg er wel voor dat je niet op deze pagina kan komen zonder een wachtwoord te hebben ingegeven.

### **Bonus opdracht
Zorg er voor dat je applicatie er ook goed uit ziet.

Om het je zelf makkelijk te maken raad ik aan om het framework bootstrap te gebruiken.

De volledige uitleg kan je vinden op hun [website](https://getbootstrap.com/) onder het menu item, [Documentation](https://getbootstrap.com/docs/4.2/getting-started/introduction/)