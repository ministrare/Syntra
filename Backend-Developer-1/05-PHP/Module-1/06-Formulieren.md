# PHP: Formulieren

## Inhoud
- [Introductie](#introductie)
- [De HTML code](#De-HTML-code)
- [Verwerking van het formulier: de php](#Verwerking-van-het=formulier-de-php)
- [Verwerking van het formulier: de uitleg](#Verwerking-van-het-formulier-de-uitleg)
  1. [Controleren of een formulier gepost is](#1-Controleren-of-een-formulier-gepost-is)
  1. [Controleren of de vereiste velden ingevuld zijn](#Controleren-of-de-vereiste-velden-ingevuld-zijn)
  1. [Eventuele andere controles op de velden uitvoeren](#3-Eventuele-andere-controles-op-de-velden-uitvoeren)
  1. [Geen errors? Gegevens verwerken](4-Geen-errors-Gegevens-verwerken)
  1. [Wel errors? Fouten weergeven en terug naar formulier](#5-Wel-errors-Fouten-weergeven-en-terug-naar-formulier)
- [Uitbreiden van het formulier](#Uitbreiden-van-het-formulier)
- [Verwerking van het uitgebreide formulier](#Verwerking-van-het-uitgebreide-formulier)
- [Opdrachten](#opdrachten)

## Introductie
Een van de eerste toepassingen van **PHP** die een beginnende programmeur gebruikt, is vaak de afhandeling van een formulier. Het is dan ook een toepassing waar **PHP** uitermate geschikt voor is! Ik zal beginnen met eerst een korte uitleg van de **HTML** code van een simpel formulier, om daarna snel verder te gaan met het **PHP** script dat de verwerking verzorgt.

## De HTML code
Laten we eens kijken naar een simpel formulier waar een gebruiker om te beginnen zijn voor en achternaam kan invullen. Zonder opmaak (dat is nu niet belangrijk) ziet de HTML code van de pagina ``formulier.php`` er als volgt uit:

```html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <title>Mijn eerste formulier!</title>
    </head>

    <body>
        <form action="verwerk.php" method="post">
        <p>
            <label for="voornaam">Voornaam:</label>
            <input type="text" name="voornaam" id="voornaam" />
        </p>
        <p>
            <label for="achternaam">Achternaam:</label>
            <input type="text" name="achternaam" id="achternaam" />
        </p>
        <p>
            <input type="submit" value="Verzenden" />
        </p>
        </form>
    </body>
</html>
``` 

Als je nog nooit een regel **HTML** gezien hebt, is een klein beetje uitleg waarschijnlijk wel gewenst. Ik zal me beperken tot het gedeelte tussen de ``<body>`` tags, aangezien dat het gedeelte is dat op het scherm weergegeven wordt.

De ``<form>`` tag geeft zoals verwacht aan dat we een formulier tonen. Het action attribuut bevat de naam van de pagina waar het formulier zijn gegevens heen stuurt. Dit is dus de naam van de pagina die wij straks gaan maken. Het method attribuut heeft twee mogelijke waarden: ``GET`` en ``POST``. In het geval van ``GET`` worden de ingevulde waarden meegezonden in de URL. Bij de ``POST`` methode worden de variabelen onzichtbaar naar de andere pagina verzonden.

Vervolgens zien we twee ``<input>`` velden. Het type attribuut geeft het soort inputveld aan. We gebruiken nu twee text velden, maar later zullen we ook andere varianten zien. De name is de naam van het input veld en gebruiken we tijdens de verwerking om de inhoud van dat veld op te halen. Het id gebruik je voornamelijk met Javascript, maar het is een goede gewoonte om deze dezelfde waarde als de name te geven

## Verwerking van het formulier: de php
Genoeg gepraat over de **HTML**, laten we eens kijken hoe we het formulier controlen met **PHP**. \
Er zijn een aantal onderdelen die altijd aanwezig moeten zijn in de verwerking van een formulier. \
Op volgorde van verschijning in het script:

 - Controleren of er een formulier gepost is
 - Controleren of de vereiste velden ingevuld zijn
 - Eventuele andere controles op de velden uitvoeren
 - Geen errors? Gegevens verwerken.
 - Wel errors? Fouten weergeven en terug naar formulier

Ik zal beginnen met de complete code van de verwerking en deze vervolgens stap voor stap bespreken. Schrik niet als het er moeilijk uitziet of als je dingen tegenkomt die je niet kent, we gaan er zo uitgebreid naar kijken.

```php
<?php
include '../../inc/stats.php';
// Controle of een formulier gepost is
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    // Arrays declareren voor opslag van fouten en data
    $aErrors = array();
    $aData = array();
    
    // Velden die in het formulier aanwezig moeten zijn
    $aFormulierVelden = array('voornaam', 'achternaam');
    
    // Alle formuliervelden doorlopen
    foreach($aFormulierVelden as $sVeld){
        // Controleren of er een waarde voor het formulierveld bestaat
        if(isset($_POST[$sVeld])){    
            // Spaties aan begin en eind weghalen
            $sValue = trim($_POST[$sVeld]);
            
            // Controle of variabele gevuld is
            if(empty($sValue)){
                // Foutmelding toevoegen
                $aErrors[] = 'Je bent vergeten om '.$sVeld.' in te vullen';
            }
            
            // Ingevulde waarden aan data array toevoegen
            $aData[$sVeld] = $sValue;
        }else{
            $aErrors[] = 'Het veld '.$sVeld.' is niet gepost!';
        }
    }
    
    // Controleren of er geen fouten opgetreden zijn
    if(empty($aErrors)){
        // Formulier succes!
        echo '<p>Je hebt het formulier succesvol ingevuld! De volgende gegevens zijn bekend:</p>';
        echo '<p>Voornaam: '.$aData['voornaam'].'<br />';
        echo 'Achternaam: '.$aData['achternaam'].'</p>';
    }else{
        // Fouten opgetreden: weergeven en terug naar formulier
        header('Refresh: 3; url=formulier.php');
        foreach($aErrors as $sError){
            echo '<p style="color:red">'.$sError.'</p>';
        }
    }
}else{
    // Verwerk.php mag nog niet bezocht worden, terug naar het formulier
    header('Location: formulier.php');
}
?>
```
Wat een lap onbegrijpbare code denk je wellicht, maar daar gaan we nu verandering in brengen!

## Verwerking van het formulier: de uitleg

Aan de hand van de verschillende onderdelen die in een verwerkingsscript aanwezig moeten zijn, zal ik dit formulier met je doorlopen

### 1. Controleren of een formulier gepost is
```php
<?php
// Controle of een formulier gepost is
if($_SERVER['REQUEST_METHOD'] == 'POST')
?>
```
Bij het stukje over de **HTML** code vertelde ik over het method attribuut. Dat zien we hier nu terug. Aangezien in het formulier ``POST`` gebruikten, kunnen we hier op deze manier controleren of een formulier gepost is. De superglobal ``$_SERVER['REQUEST_METHOD']`` heeft namelijk de waarde ``POST`` als dat het geval is. Over superglobals komen we overigens later nog te spreken, voor nu laten we dat nog even voor wat het is.

### 2. Controleren of de vereiste velden ingevuld zijn
In dit geval beschouwen we zowel de ``voornaam`` als ``achternaam`` als een vereist veld. We willen dus van allebei weten of er een waarde ingevuld is. De ingevulden waarden zijn te vinden in de array ``$_POST`` (weer zo'n superglobal)

Allereerst zetten we de namen van alle velden die in ons formulier voorkomen in een array. Dit geeft ons de mogelijkheid om daadwerkelijk te controleren of alle velden wel ingevuld zijn:

```php
<?php
// Velden die in het formulier aanwezig moeten zijn
$aFormulierVelden = array('voornaam', 'achternaam');
?>
```
Vervolgens kunnen we deze array met een **foreach** loop doorlopen. Voor elk veld controleren we vervolgens of er een waarde in de ``$_POST`` array bestaat, dan weten we zeker dat de eventuele waarde van het veld in ieder geval gepost is.

```php
<?php
// Alle formuliervelden doorlopen
foreach($aFormulierVelden as $sVeld)
{
    // Controleren of er een waarde voor het formulierveld bestaat
    if(isset($_POST[$sVeld]))
    {    
        // Spaties aan begin en eind weghalen
        $sValue = trim($_POST[$sVeld]);
        
        // Controle of variabele gevuld is
        if(empty($sValue))
        {
            // Foutmelding toevoegen
            $aErrors[] = 'Je bent vergeten om '.$sVeld.' in te vullen';
        }
        
        // Ingevulde waarden aan data array toevoegen
        $aData[$sVeld] = $sValue;
    }
    else
    {
        $aErrors[] = 'Het veld '.$sVeld.' is niet gepost!';
    }
}
?>
```

Als het veld niet bestaat voegen we een foutmelding toe aan de array ``$aErrors``. Bestaat het veld wel, dan gaan we verder met de controle. Met de functie ``trim()`` verwijderen we loze spaties aan het begin en eind van de de input om vervolgens met ``empty()`` te controleren of de waarde wel ingevuld is. Zo niet, dan voegen we weer een foutmelding toe aan de array ``$aErrors``.

Tenslotte voegen we de ingevulde waarde toe aan de array ``$aData``.
```php
<?php
// Ingevulde waarden aan data array toevoegen
$aData[$sVeld] = $sValue;
?>
```

Als sleutel geven we de naam van het veld op. Zo weten we tenminste uit welk veld die waarde kwam. Dit stukje code wordt dus toegepast op elk veld dat wij gedefinieerd hebben in de array ``$aFormulierVelden``.

### 3. Eventuele andere controles op de velden uitvoeren
Wij hebben op dit moment geen andere controles, dus dit slaan we over. Hadden we wel overige controles, dan hadden we die in de foreach loop toegepast. Wees gerust, dit komt in een later voorbeeld nog wel...


### 4. Geen errors? Gegevens verwerken
```php
<?php
if(empty($aErrors)){
    // Formulier succes!
    echo '<p>Je hebt het formulier succesvol ingevuld! De volgende gegevens zijn bekend:</p>';
    echo '<p>Voornaam: '.$aData['voornaam'].'<br />';
    echo 'Achternaam: '.$aData['achternaam'].'</p>';
}
?>
```
Wederom gebruiken we ``empty()``, maar nu om te controleren of de array met foutmeldingen nog steeds leeg is. Als dat namelijk het geval is, is de controle geslaagd.

Als die array leeg is kunnen we dus verder met de verwerking van het formulier. Voor nu bestaat dat enkel uit het weergeven van de ingevulde gegevens. Herinner je dat we in stap 2 de gegevens in de array ``$aData`` hebben gezet. Daar kunnen we de gegevens nu dus ook vandaan halen. De manier van het echoën van strings en variabelen zal je nu wel bekend zijn.

Natuurlijk zijn er veel meer toepassingen voor de verwerking van deze gegevens. Zo zou je ze bijvoorbeeld weg kunnen schrijven naar een database of kunnen versturen per e-mail. Dit soort toepassingen liggen echter buiten het onderwerp van deze les, dus die zal ik nu niet bespreken.

### 5. Wel errors? Fouten weergeven en terug naar formulier
```php
<?php
// Fouten opgetreden: weergeven en terug naar formulier
header('Refresh: 3; url=formulier.php');
foreach($aErrors as $sError)
{
    echo '<p style="color:red">'.$sError.'</p>';
}
?>
```
De foutmeldingen staan in de array ``$aErrors``. Deze kunnen we dus uitlezen met een foreach loop en de foutmeldingen op het scherm weergeven. Omdat het foutmeldingen zijn, heb ik ze even een rood kleurtje gegeven.

Dan zien we hier ook een functie die we nog niet eerder gezien hadden: ``header()``. Deze functie gebruik je om een HTTP header naar de browser te versturen. Nu hoef je niet precies te begrijpen wat dat is, als je alleen maar onthoudt dat je er onder andere een gebruiker mee naar een andere pagina kunt sturen. Hier gebruik ik een ``header('Refresh: ...')``, welke ervoor zorgt dat de pagina na een bepaalde tijd herladen wordt op de gegeven url. Helemaal aan het eind van ``verwerk.php`` zien we ook een ``header('Location: ...')``, deze stuurt de gebruiker direct door naar de opgegeven pagina. Na deze vorm van ``header()`` gebruiken we altijd een ``exit()``, zodat de rest van het script niet meer uitgevoerd wordt.

De reden dat de ``header()`` voor de foreach loop staat, is dat er voordat je deze functie aanroept, geen enkele output naar de browser plaatsgevonden mag hebben. Dus geen **HTML**, geen echo en zelfs geen loze spatie ergens buiten je **PHP** tags.

De manier waarop we nu een formulier verwerkt hebben, is een goede basis. Er zijn uiteraard andere manieren, maar dit vind ik persoonlijk de meest veilige, flexibele en fijne manier om de verwerking van een formulier af te handelen.


## Uitbreiden van het formulier

Nu we de basis van het verwerken van een forumlier gezien hebben, kunnen we het formulier wat uitbreiden. Laten we een mogelijkheid tot het invullen van een geboorte datum toevoegen. Het formulier komt er dan zo uit te zien:

```html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Mijn eerste formulier!</title>
</head>

<body>
    <form action="verwerk2.php" method="post">
    <p>
        <label for="voornaam">Voornaam:</label>
        <input type="text" name="voornaam" id="voornaam" />
    </p>
    <p>
        <label for="achternaam">Achternaam:</label>
        <input type="text" name="achternaam" id="achternaam" />
    </p>
    <p>
        <label>Geboortedatum:</label>
        <select name="dag">
            <?php
            for($i = 1; $i <= 31; $i++)
            {

                echo '<option value="'.$i.'">'.$i.'</option>';
            }
            ?>
        </select>
        <select name="maand">
            <?php
            for($i = 1; $i <= 12; $i++)
            {
                echo '<option value="'.$i.'">'.$i.'</option>';
            }
            ?>
        </select>
        <select name="jaar">
            <?php
            for($i = date('Y'); $i >= 1950; $i--)
            {
                echo '<option value="'.$i.'">'.$i.'</option>';
            }
            ?>
        </select>
    </p>
    <p>
        <input type="submit" value="Verzenden" />
    </p>
       </form>
</body>
</html>
```

We zien dat er wat extra velden bijgekomen zijn en dat er nu ook wat **PHP** code in het formulier verwerkt zit. Ik wil voor het invoeren van de geboortedatum namelijk drie ``<select>`` boxjes gebruiken voor repectievelijk de dag, de maand en het jaar.

Nu zouden we natuurlijk alle opties handmatig in **HTML** kunnen gaan invoeren (31 dagen, 12 maanden, 58 jaren) maar dat zou natuurlijk niet echt slim zijn. We hebben immers de beschikking over **PHP** die zoiets heel eenvoudig voor ons kan genereren. Met een drietal **for**-loopjes is dat probleem zo opgelost.

De eerste twee loopjes spreken voor zich. In de derde for loop tellen we nu een keer af in plaats van op. We gaan nu dus vanaf het huidige jaar, dat we bepalen met behulp van de ``date()`` functie, aftellen tot aan het jaar 1950. Vandaar dat we ook ``$i--`` gebruiken om de waarde van ``$i`` telkens met **1** te verlagen.

## Verwerking van het uitgebreide formulier
We hebben nu een nieuw element aan ons formulier toegevoegd, dus de verwerking van het formulier moeten we ook aanpassen. Deze komt er als volgt uit te zien:

```php
<?php
include '../../inc/stats.php';
// Controle of een formulier gepost is
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    // Arrays declareren voor opslag van fouten en data
    $aErrors = array();
    $aData = array();
    
    // Velden die in het formulier aanwezig moeten zijn
    $aFormulierVelden = array(
        'voornaam', 
        'achternaam', 
        'dag',
        'maand',
        'jaar'
    );
    
    // Waarden uit de $_POST array doorlopen
    foreach($aFormulierVelden as $sVeld){
        if(isset($_POST[$sVeld])){    
            // Spaties aan begin en eind weghalen
            $sValue = trim($_POST[$sVeld]);
            
            // Controle of variabele gevuld is
            if(empty($sValue)){
                // Foutmelding toevoegen
                $aErrors[] = 'Je bent vergeten om '.$sVeld.' in te vullen';
            }
            
            // Ingevulde waarden aan data array toevoegen
            $aData[$sVeld] = $sValue;
        }else{
            $aErrors[] = 'Het veld '.$sVeld.' is niet gepost!';
        }
    }
    
    // Datum controle
    if(isset($aData['maand'], $aData['dag'], $aData['jaar']) && checkdate($aData['maand'], $aData['dag'], $aData['jaar'])){
        $sDatum = $aData['dag'].'-'.$aData['maand'].'-'.$aData['jaar'];
    }else{
        $aErrors[] = 'Dit is geen geldige datum';
    }
    
    // Controleren of er geen fouten opgetreden zijn
    if(empty($aErrors)){
        // Formulier succes!
        echo '<p>Je hebt het formulier succesvol ingevuld! De volgende gegevens zijn bekend:</p>';
        echo '<p>Voornaam: '.$aData['voornaam'].'<br />';
        echo 'Achternaam: '.$aData['achternaam'].'</p>';
        echo '<p>Geboortedatum: '.$sDatum.'</p>';
    }else{
        // Fouten opgetreden: weergeven en terug naar formulier
        header('Refresh: 3; url=formulier2.php');
        foreach($aErrors as $sError){
            echo '<p style="color:red">'.$sError.'</p>';
        }
    }
}else{
    // Verwerk.php mag nog niet bezocht worden, terug naar het formulier
    header('Location: formulier2.php');
}
?>
```
We zien dat de verwerking eigenlijk bijna hetzelfde is, op een paar kleine veranderingen na. Allereerst zijn de verwijzingen naar ``formulier.php`` natuurlijk veranderd in ``formulier2.php``.

Daarnaast heb ik nu een controle ingebouwd die controleert of de ingevulde datum wel geldig is:

```php
<?php
if(isset($aData['maand'], $aData['dag'], $aData['jaar']) && checkdate($aData['maand'], $aData['dag'], $aData['jaar'])){
    $sDatum = $aData['dag'].'-'.$aData['maand'].'-'.$aData['jaar'];
}else{
    $aErrors[] = 'Dit is geen geldige datum';
}
?>
```

Allereerst controleren we met ``isset()`` of de benodigde variabelen wel voorkomen in de $aData array, en of ze dus wel in het formulier voorkomen. De functie ``checkdate()`` wordt vervolgens gebruikt om de geldigheid van een ingevoerde datum te controleren. Deze functie accepteert 3 parameters, in volgorde: een maand, dag en jaar. Vervolgens wordt een ``boolean`` terug gegeven of de datum geldig is of niet. Op deze manier is het dus niet mogelijk om bijvoorbeeld een datum als 31 februari 2008 te selecteren.

Als de controle van de datum slaagt, voegen we de verschillende onderdelen samen in een variabele ``$sDatum``. Zo niet, dan voegen we een foutmelding toe aan de array ``$aErrors``.

De laatste kleine verandering bevindt zich in de verwerking van de gecontroleerde gegevens. Naast de voor- en achternaam, wordt nu ook de ingevulde geboortedatum op het scherm getoond.

## Opdrachten