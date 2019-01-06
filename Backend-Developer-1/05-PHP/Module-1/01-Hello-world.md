# PHP: Hello World!

## Inhoud
 - [Introductie](#Introductie)
 - ["Hello World" Script in PHP](#"Hello-World"-Script-in-PHP)
 - [Ontsnappen naar PHP](#Ontsnappen-naar-PHP)
 - [Commentaar bij de PHP-code](#Commentaar-bij-de-PHP-code)
 - [PHP is ongevoelig voor witruimte](#php-is-ongevoelig-voor-witruimte)
 - [PHP is hoofdlettergevoelig](#PHP-is-hoofdlettergevoelig)
 - [PHP-script uitvoeren vanuit Command Prompt](#PHP-script-uitvoeren-vanuit-Command-Prompt)

## Introductie

PHP begon als een klein open-source project dat zich ontwikkelde naarmate meer en meer mensen erachter kwamen hoe nuttig het was. \
Rasmus Lerdorf ontketende de eerste versie van PHP in 1994.

- PHP staat voor “PHP: Hypertext Preprocessor”.
- PHP is een server side scripting taal die is ingebed in HTML. Het wordt gebruikt voor het beheren van dynamische content, databases, het bijhouden van sessies en zelfs voor het bouwen van volledige e-commerce sites.
- Het is geïntegreerd met een aantal populaire databases, waaronder MySQL, PostgreSQL, Oracle, Sybase, Informix en Microsoft SQL Server.
- PHP is aangenaam zippy in de uitvoering, vooral wanneer het wordt gecompileerd als een Apache module aan de Unix kant. De MySQL server, ooit gestart, voert zelfs zeer complexe queries uit met enorme resultaten in recordtijd.
- PHP ondersteunt een groot aantal belangrijke protocollen zoals POP3, IMAP en LDAP. PHP4 voegde ondersteuning voor Java en gedistribueerde objectarchitecturen (COM en CORBA) toe, waardoor n-tier ontwikkeling voor het eerst mogelijk werd.
- PHP is vergevingsgezind: PHP taal probeert zo vergevingsgezind mogelijk te zijn.
- PHP Syntax is C-achtig.

**Veelvoorkomende toepassingen van PHP**
- PHP voert systeemfuncties uit, d.w.z. vanuit bestanden op een systeem kan het deze aanmaken, openen, lezen, schrijven en sluiten.
- PHP kan omgaan met formulieren, d.w.z. gegevens verzamelen uit bestanden, gegevens opslaan in een bestand, via e-mail kunt u gegevens verzenden, gegevens terugsturen naar de gebruiker.
- U voegt toe, verwijdert, wijzigt elementen in uw database via PHP.
- Toegang tot cookies variabelen en het instellen van cookies.
- Met behulp van PHP kunt u de toegang tot sommige pagina's van uw website beperken.
- Het kan gegevens versleutelen

**Kenmerken van PHP**
Vijf essentiële kenmerken maken het praktische gebruik van PHP mogelijk -

- Eenvoud
- Efficiëntie
- Veiligheid
- Flexibiliteit
- Vertrouwdheid

## "Hello World" Script in PHP
Om een gevoel voor PHP te krijgen, begin je eerst met eenvoudige PHP scripts. \
Aangezien “Hallo, Wereld!” een essentieel voorbeeld is, zullen we beginnen met het maken van een vriendelijk klein “Hallo, Wereld! script.

Zoals eerder vermeld is PHP ingebed in HTML. \
Dat betekent dat je onder je normale HTML (of XHTML als je cutting-edge bent) PHP statements als deze zult hebben.

```html
<html>
 
   <head>
      <title>Hello World</title>
   </head>
 
   <body>
      <?php echo "Hello, World!";?>
   </body>
 
</html>
```

Het zal het volgende resultaat opleveren:
```
Hello, World!

```
Als u de HTML-uitvoer van het bovenstaande voorbeeld bekijkt, zult u merken dat de PHP-code niet aanwezig is in het bestand dat van de server naar uw webbrowser wordt gestuurd. \
Alle PHP die op de webpagina aanwezig is, wordt verwerkt en ontdaan van de pagina; het enige wat van de webserver naar de client wordt teruggestuurd is pure HTML-uitvoer.

Alle PHP-code moet worden opgenomen in een van de drie speciale markup-tags die worden herkend door de PHP Parser.

```php
<?php PHP code goes here ?>
 
<?    PHP code goes here ?>
 
<script language = "php"> PHP code goes here </script>
```
De meest gebruikte tag is de <?php…..?>

## Ontsnappen naar PHP
De PHP parsing engine heeft een manier nodig om PHP code te onderscheiden van andere elementen in de pagina. Het mechanisme om dit te doen staat bekend als 'escapen naar PHP'. Er zijn vier manieren om dit te doen -

### Canonical PHP-tags

De meest universele effectieve PHP-tagstijl is:
```php
<?php  ?>
```
Als u deze stijl gebruikt, kunt u er zeker van zijn dat uw tags altijd correct worden geïnterpreteerd.

### Kort open (SGML-stijl) tags
Korte of kortgeopende tags zien er als volgt uit:
```php
<?...?>
```

Korte tags zijn, zoals men zou verwachten, de kortste optie. Je moet een van de twee dingen doen om PHP in staat te stellen de tags te herkennen.

 - Kies de optie –enable-short-tags configuratie optie wanneer u PHP aan het bouwen bent.
 - Zet de korte_open_tag instelling in je php.ini bestand aan. Deze optie moet uitgeschakeld zijn om XML te parsen met PHP omdat dezelfde syntaxis wordt gebruikt voor XML tags.

### ASP-style tags
ASP-stijl tags imiteren de tags die door Active Server Pages worden gebruikt om codeblokken af te bakenen. ASP-stijl tags zien er als volgt uit :
```php
<%...%>
```
Om ASP-stijl tags te gebruiken, moet je de configuratie optie instellen in je php.ini bestand.
### HTML script tags
HTML-scripttags zien er als volgt uit:
```html
<script language="PHP">...</script>
```

## Commentaar bij de PHP-code

Commentaar is het gedeelte van een programma dat alleen voor de menselijke lezer bestaat en wordt verwijderd voordat het programmaresultaat wordt weergegeven. Er zijn twee commentaarformaten in PHP:

### Commentaar op één regel 
Ze worden over het algemeen gebruikt voor korte toelichtingen of notities die relevant zijn voor de lokale code. Hier zijn de voorbeelden van opmerkingen op één regel.

```php
<?php
   # This is a comment, and
   # This is the second line of the comment
   
   // This is a comment too. Each style comments only
   print "An example with single line comments";
?>
```
### Commentaar van meerdere regels
Hier zijn de voorbeelden van het maken van meerdere regels commentaar in één enkel afdrukstatement:

```php
<?
   # First Example
   print <<<END
   This uses the "here document" syntax to output multiple lines with $variable interpolation. Note that the here document terminator must appear on a line with just a semicolon no extra whitespace! END;

   # Second Example
   print "This spans
   multiple lines. The newlines will be
   output as well";
?>
```

### Multi-lines commentaar
Ze worden over het algemeen gebruikt om pseudocode-algoritmen en meer gedetailleerde uitleg te geven indien nodig. De meerregelige stijl van commentaren is dezelfde als in C. Hier is het voorbeeld van meerregelige commentaren.

```php
<?php
   /* This is a comment with multiline
      Author : Mohammad Mohtashim
      Purpose: Multiline Comments Demo
      Subject: PHP
   */
 
   print "An example with multi line comments";
?>
```

## PHP is ongevoelig voor witruimte
Witruimte is de spaties die je typt die typisch onzichtbaar zijn op het scherm, inclusief spaties, tabs en carriage returns (einde-regel karakters).

PHP witruimte ongevoelig betekent dat het er bijna nooit toe doet hoeveel witruimte-tekens je op een rij hebt. één witruimte-teken is hetzelfde als veel van zulke tekens.

Bijvoorbeeld, elk van de volgende PHP statements die de som van 2 + 2 toewijzen aan de variabele $four is equivalent:
```php
<?php
  $four = 2 + 2; // single spaces
  $four   =    2    +    2 ; // spaces and tabs
  $four =
2+
2; // multiple lines
?>
```
## PHP is hoofdlettergevoelig
Ja, het is waar dat PHP een hoofdlettergevoelig taalgebruik is. Probeer het volgende voorbeeld uit:
```html
<html>
   <body>
 
      <?php
         $capital = 67;
         print("Variable capital is $capital<br>");
         print("Variable CaPiTaL is $CaPiTaL<br>");
      ?>
 
   </body>
</html>
```
Dit zal het volgende resultaat opleveren
```
Variable capital is 67
Variable CaPiTaL is
```

#### Statements zijn uitdrukkingen die worden beëindigd door puntkomma's
Een statement in PHP is elke uitdrukking die wordt gevolgd door een puntkomma (;).Elke opeenvolging van geldige PHP statements die wordt ingesloten door de PHP-tags is een geldig PHP-programma. Hier is een typische verklaring in PHP, die in dit geval een reeks karakters toewijst aan een variabele genaamd $greeting:
```php
$greeting = "Welcome to PHP!";
```
#### Expressies zijn combinaties van tokens
De kleinste bouwstenen van PHP zijn de onzichtbare tokens,zoals getallen (3.14159), strings (.two.), variabelen ($two), constanten (TRUE), en de speciale woorden die de syntaxis van PHP zelf vormen, zoals if, else, while, for en ga zo maar door

#### Accolades maken blokken
Hoewel stellingen niet als uitdrukkingen kunnen worden gecombineerd, kunt u altijd een reeks stellingen plaatsen door ze in een set van accolades in te sluiten.

Hier zijn beide stellingen gelijkwaardig:

```php
if (3 == 2 + 1)
   print("Good - I haven't totally lost my mind.<br>");
 
if (3 == 2 + 1) {
   print("Good - I haven't totally");
   print("lost my mind.<br>");
}
```


## PHP-script uitvoeren vanuit Command Prompt

U kunt uw PHP-script op uw opdrachtprompt uitvoeren. \
Ervan uitgaande dat u de volgende inhoud in test.php-bestand hebt:
```php
<?php
   echo "Hello PHP!!!!!";
?>
```
Als dit script nu in de commando prompt wordt uitgecvoerd

```
$ php test.php
```
Zal het de volgende resultaat opleveren:

```
Hello PHP!!!!!
```