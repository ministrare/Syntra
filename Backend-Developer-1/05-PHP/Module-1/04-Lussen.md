# PHP: Lussen

## Inhoud
- [Introductie](#introductie)
- [De opdracht if](#de-opdracht-if)
- [Switch opdrachten](#switch-opdrachten)
- [Lussen gebruiken](#lussen-gebruiken)
  - [For](#for)
  - [While](#while)
  - [Do..While](#do..while)
  - [Oneindige lussen](#Oneindige-lussen)
  - [Uit een lus breken](#Uit-een-lus-breken)

## Introductie
Een conditionele opdrachten voert een blok opdrachten alleen uit als je aan specifieke condities is voldaan. Twee nuttige conditionele opdrachten zijn:

 - if \
 Stelt een conditie in en test haar. \
 Een blok opdrachten wordt uitgevoerd als de conditie waar is.

 - switch \
 Stelt een lijst in met alternatieve condities. \
 Controleert op condities die waar zijn en voert het toepasselijke blok opdrachten uit.


In de volgende twee paragrafen worden deze opdrachten uitgebreid behandeld.

## De opdracht if
De opdracht **if** controleert op specifieke condities bestaan. \
Een blok opdrachten wordt uitgevoerd, afhankelijk van het feit of aan de condities is voldaan. \
Het algemene formaat van de conditionele opdracht **if** is:

```php
if (conditie ...){
    blok opdrachten
}elseif (conditie ...){
    blok opdrachten
}else{
    blok opdrachten
}
```

De opdracht if bestaat uit die delen:

 - **if**. \
 Dit deel is verplicht. Het test een conditie.
   - **Als een conditie waar is**. Het opdrachtenblok wordt uitgevoerd. Nadat het opdrachtenblok is uitgevoerd, gaat het programma verder met de volgende opdracht. Als de conditionele opdracht een **elseif**- of **else**-opdracht bevat, wordt hij overgeslagen.
   - **Als de conditie niet waar is**. Het opdrachtenblok wordt niet uitgevoerd. Het programma gaat verder met de volgende opdracht, die kan bestaan uit de opdracht **elseif**, **else** of **next**.
 - **elseif**. \
 Dit deel is optioneel. Het test een conditie. Je mag meer dan een **elseif**-opdracht toevoegen.
   - **Als de conditie waar is**. Het opdrachtenblok wordt uitgevoerd. Na de uitvoering gaat het programma verder met de volgende opdracht na de conditionele opdracht; andere **elseif**- of **else**- delen worden overgeslagen.
   - **Als de conditie niet waar is**. Het opdrachtenblok wordt niet uitgevoerd. Het programma gaat verder met de volgende opdracht mogelijkerwijs een opdracht van het type **elseif**, **else** of **next**, na de conditionele opdracht.
- **else**. \
Dit deel is optioneel. er is maar een **else**-deel toegestaan. Dit deel test geen conditie, maar voert een blok opdrachten uit. Als het programma dit deel heeft bereikt, zijn de delen **if** en **elseif** niet waar.

Elk deel van de conditionele opdracht **if** controleert een conditie die uit een of meer vergelijkingen bestaat. Een vergelijking stelt een vraag waarop het antwoord waar of nietwaar is. Voorbeelden van condities zijn:

```php
$a == 1;
$a < $b;
$c != 'Hello';
```

De eerste vergelijking vraagt of ``$a`` gelijk is aan 1, de tweede vergelijking vraagt of ``$a`` kleiner is dan ``$b`` en de derde vergelijking vraagt of ``$c`` ongelijk is aan '**Hello**'. Je gebruikt twee of meer vergelijkingen in een conditie door ze met de operator and, or of xor te combineren. In het volgende voorbeeld worden alle 3 de onderdelen van de conditionele opdracht **if** gebruikt. Stel dat je Duitse, Franse, Italiaanse en Engelse versies van je productencatalogus hebt. Je wilt de juiste taal voor je klant gebruiken, afhankelijk van het land waarin hij woont. De volgende opdrachten stellen een variabele in op de juiste catalogusversie en maken bericht in de correcte taal. Je kunt je klanten dan een bericht in hun eigen taal voorschotelen.

```php
if($country == 'Germany'){
 
   $version = 'German';
   $message = 'Sie sehen unseren Katalog auf Deutsch';
 
}elseif($country == 'France'){
 
   $version = 'French';
   $message = 'Vous verrez notre catalogue en Francais';
 
}elseif($country == 'Italy'){
 
   $version = 'Italian';
   $message = 'Vedrete il nostro catalogo in Italiano';
 
}else{
 
   $version = 'English';
   $message = 'You will see our catalog in English';
 
}
echo $message.'<br/>';
```
De conditionele opdracht **if** werkt als volgt:

1. De variabele ``$country`` wordt met de waarde ``“Germany”`` vergeleken. Als ze overeenkomen, wordt ``$version`` op ``“German”`` en ``$message`` op de Duitse versie ingesteld en gaat het programma verder bij de opdracht echo. Als ``$country`` niet met ``"Germany"`` overeenkomt, worden ``$version`` en ``$message`` niet ingesteld en gaat het programma verder bij het **elseif**-gedeelte.

1. De variabele ``$country`` wordt met de waarde ``“France”`` vergeleken. Als ze overeenkomen, worden ``$version`` en ``$message`` ingesteld en gaat het programma verder bij de opdracht echo. Als ``$country`` niet met ``"France"`` overeenkomt, worden ``$version`` en ``$message`` niet ingesteld en gaat het programma verder bij het **elseif**-gedeelte.

1. De variabele ``$country`` wordt met de waarde ``"Italy"`` vergeleken. Als ze overeenkomen, worden ``$version`` en ``$message`` ingesteld en gaat het programma verder bij de opdracht echo. Als ``$country`` niet met ``"Italy"`` overeenkomt, worden ``$version`` en ``$message`` niet ingesteld en gaat het programma verder bij het **elseif**-gedeelte.

1. De variabele ``$version`` wordt op ``"English"`` en de variabele ``$message`` wordt op de Engelse versie ingesteld. Het programma gaat verder met de **echo**-opdracht.

In dit voorbeeld wordt alleen het bericht geëchood. De variabele ``$version`` wordt opgeslagen omdat de versie nuttige informatie bevat die later in het programma kan worden gebruikt.

Je hebt geen accolades nodig als je het opdrachtenblok dat door een deel van de conditionele **if**-opdracht moet worden uitgevoerd slechts een opdracht bevat. Als het vorige voorbeeld slechts een opdracht bevatte:

```php
if ($country == 'France')
{
    $version = 'French';
}
```
Zou je het als volgt kunnen schrijven:

```php
if ($country == 'France')
    $version = 'French';
```
Dit kan wat typewerk besparen, al leidt het bij verschillende **if**-opdrachten mogelijk tot verwarring.

je kunt conditionele **if**-opdrachten in een andere **if**-opdracht plaatsen. Dit wordt ook wel nesten genoemd. Stel dat je alle klanten wilt bereiken die in de staat Idaho wonen. Je wilt een e-mailbericht sturen aan klanten waarvan je een e-mailadres hebt en een brief aan de overige klanten. Met de volgende geneste **if**-opdrachten identificeer je deze klantengroepen:
```php
if($custState == "10"){
    if($EmailAdd != '' OR $EmailAdd != null){
        $contactMethod = 'letter';    
    }else{
        $contactMethod = 'email';
    }
}else{
    $contactMethod = 'none needed';
}
```
Deze opdrachten controleren eerste welke klanten in Idaho wonen. Bij een klant die in Idaho woont, wordt naar een e-mailadres gezocht. Bij een leeg e-mailadres wordt de contactmethode op **letter** ingesteld. Bij een bestaande e-mailadres wordt de contactmethode op **email** ingesteld. In het gedeelte **else** wordt bij de contactmethode ingesteld dat er geen contact nodig is bij klanten die niet in Idaho wonen

## Switch opdrachten
De conditionele **if**-opdracht werkt goed in de meeste situaties. Je kunt echter ook een lijst met condities hebben waarbij je voor elke conditie andere opdrachten wilt uitvoeren. Stel dat je programma verschillende belastingtarieven berekent. Hoe verwerk je deze verschillende tarieven? De opdracht **switch** is voor dit soort situaties ontworpen.

De opdracht switch controleert de waarde van een variabele en voert een opdrachtenblok uit voor de bijbehorende waarde. Het algemene formaat is:

```php
switch ( $variabelennaam )
{
    case waarde:
      opdrachtenblok
      break;
    case waarde:
      opdrachtenblok
      break;
    case waarde:
      opdrachtenblok
      break;
    default:
      opdrachtenblok
      break;
}
```
De opdracht **switch** controleert de waarde van $variabelennaam. het programma gaat vervolgens naar het **case**-gedeelte voor die waarde en voert opdrachten uit totdat een **break**-opdracht is bereikt of het einde van de opdracht **switch**. Het standaardgedeelte **default** wordt uitgevoerd als er geen **case**-gedeelte voor de waarde van ``$variabelennaam`` is. Je kunt zoveel **case**-gedeelten gebruiken als je nodig hebt. Het **default**-gedeelte wordt standaard aan het einde geplaatst als je het gebruikt, maar het mag overal staan.

De volgende opdrachten stellen de omzetbelasting van verschillende staten in:

```php
switch ( $cusState)
{
    case "OR":
      $salesTaxRate = 0;
      break;
    case "CA":
      $salesTaxRate = 1.0;
      break;
    default:
      $salesTaxRate = .5;
      break;
}
 
$salesTax = $orderTotalCost * $salesTaxRate;
```

Dit voorbeeld is het belastingtarief voor Oregon 0, voor California 100 procent en voor alle andere staten 50 procent. De opdracht **switch** kijkt naar de waaarde van de variabele ``$custState`` en gaat vervolgens naar het gedeelte dat men die waarde overeenkomt. Als de variabele ``$custState`` bijvoorbeeld de waarde **TX** heeft, voert het programma de waarde van de variabele ``$salesTaxRate`` op .5 ingesteld. Na de **switch**-opdracht berekent het programma de waarde van de variabele ``$salesTax`` door de orderkosten met 0.5 te vermenigvuldigen.

**Pas op!** \
De **break**-opdrachten zijn onmisbaar in het **case**-gedeelte. Het programma beëindigt de uitvoering niet aan het einde van een **case**-gedeelte als er geen **break**-opdracht in staat. Het programma gaat dan door met de opdrachten in het volgende **case**-gedeelte en blijft opdrachten uitvoeren tot het einde van de **switch**-opdracht is bereikt of tot het een **break**-opdracht in een andere **case**-gedeelte tegenkomt.

Het laatste **case**-gedeelte in een **switch**-opdracht heeft geen opdracht **break** nodig. Je mag de opdracht dan weglaten, maar het kan geen kwaad hem voor de duidelijkheid te gebruiken.

## Lussen gebruiken
Lussen gebruik je om een blok opdrachten in te stellen die meer dan een keer worden uitgevoerd. Soms wordt een lus een specifiek aantal keren herhaald, bijvoorbeeld om alle provinciehoofdsteden weer te geven. Een lus kan ook worden herhaald totdat een specifieke conditie zich voordoet, bijvoorbeeld om productinformatie weer te geven totdat alle producten zijn weergegeven, ongeacht het aantal producten, Er zijn 3 lus-typen:

Een **for**-lus stelt een teller in en herhaalt een blok opdrachten totdat de teller een gespecificeerde waarde heeft bereikt.
Een **while**-lus stelt een conditie in, controleert de conditie en voert een opdrachtenblok net zo lang uit totdat de conditie niet meer waar is.
Een **do..while**-lus stelt een conditie in, voert een blok opdrachten uit, controleert de conditie in, voert een blok opdrachten net zo lang uit als de conditie waar is.
Deze lussen worden gedetailleerd behandeld in de volgende paragrafen.

### For
Eenvoudige **for**-lussen maken gebruik van een teller. je steld de begin en eindwaarde voor de teller in en geeft aan goe de tellerwaarde wordt vermeerderd.

Het algemene formaat is:
```php
for (beginwaarde; eindconditie; increment){
  Opdrachtenblok
}
```
Vul de volgende waarden in:

 - **Beginwaarde**. \
Een opdracht die een variabele als teller instelt met je **beginwaarde**. De opdracht ``$i =1;`` stelt de tellervariabele ``$i`` op de waarde 1 in. De teller variabele begint vaak met 0 of met 1. De **beginwaarde** kan een combinatie van getallen zijn ``(2 + 2)`` of een variabele.
 - **Eindconditie**. \
 Een opdracht die de **eindwaarde** instelt. Het opdrachtenblok wordt herhaald als deze opdracht waar is. De lus wordt beëindigd als deze opdracht niet waar is. De opdracht ``$i < 10;`` stelt de **eindwaarde** voor de lus bijvoorbeeld op 10 in. De opdracht is niet meer waar als ``$i`` gelijk is aan 10, want ``$i`` is dan niet meer kleiner dan 10, en dus houdt de lus op. De opdracht mag variabelen omvatten, zoals in ``$i < $size;``.
 - **Increment**. \
 Een opdracht die de teller vermeerdert. De opdracht ``$i++;`` voegt bijvoorbeeld de waarde ``I`` aan de teller toe aan het einde van elk opdrachten blok. Je kunt ook andere **increment** opdrachten gebruiken, zoals ``$1+=1;`` en ``$i-;``.

Een algemene for-lus stelt een variabele in als teller, bijvoorbeeld de variabele ``$i``. Deze variabele heeft een waarde bij elke keer dat je de lus doorloopt. De variabele ``$i`` kan worden gebruikt in het opdrachten blok dat herhaaldelijk wordt uitgevoerd. De volgende eenvoudige lus geeft de tekst Hello World! bijvoorbeeld drie keer weer:
```php
for($i=1; $i<=3; $i++)
{
    echo $i.". Hello World! <br/>";
}
```
Je hoeft de opdrachten in het blok niet te laten inspringen. \
Inspringing maakt de code van het programma echter beter leesbaar.

De uitvoer van deze opdrachten is:
```
1. Hello World!
2. Hello World!
3. Hello World!
```
Lussen van het type for zijn handig bij het doorlopen van een array. Stel dat je een array met klantnamen hebt die je allemaal wilt weergeven. Gebruik hiervoor de volgende lus:
```php
for($i=; $i<100; $i++)
{
    echo $customerNames[$i]."<br/>";
}
```
De uitvoer toont een webpagina met een overzicht van alle klantnamen, een per regel. In dit geval weet je dat je honderd klantnamen hebt, maar het kan natuurlijk ook voorkomen dat je niet precies weet hoeveel klanten je hebt. Je kunt dan aan PHP vragen hoeveel waarden er in de array staan en die waarde gebruiken in je **for**-lus. Gebruik bijvoorbeeld de volgende opdrachten:
```php
for($i=0; $i < sizeof($customerNames); $i++)
{
    echo $customerNames[$i]."<br/>";
}
```
De **eindwaarde** is ``sizeof( $customerNames )``. Deze opdracht bepaalt het aantal waarden in de array en gebruikt dat getal. Hierdoor wordt de lus net zo vaak herhaald als er waarden in de array staan.

De eerste waarde in een array met een genummerde index is 0, tenzij je de waarde zelf op een ander getal instelt. Een veelgemaakte fout tijdens het werken met arrays is te denken dat het eerste getal 1 is in plaats van 0.

### While
Een **while**-lus wordt net zo lang uitgevoerd als specifieke condities waar zijn. Deze lus werkt als volgt:

1. Je stelt een conditie in.
1. De conditie wordt aan het begin van de lus gecontroleerd.
1. De lus wordt uitgevoerd als de conditie **waar** is; als de conditie **niet waar** is, wordt de lus beëindigd.

Het algemene formaat van een while-lus is:
```php
while (conditie)
{
  opdrachtenblok
}
```

De conditie kan elke expressie zijn die **waar** of **niet waar** is. Als conditie worden vaak vergelijkingen gebruikt, zoals de volgende. In hoofdstuk 6 vind je gedetailleerde informatie over vergelijkingen.
```php
$test <= 10
$test1 == $test2
$a === "yes" and $b != "yes"
$name != "Smith"
```

De lus blijft herhaald worden als de conditie **waar** is. Hij stopt als de conditie niet waar is. De volgende opdrachten stellen een **while**-lus in die in een array naar een klant met de naam Smith zoekt:
```php
$customers = array("Huang", "Smith", "Jones");
$testvar = "no";
$k = 0;
 
while ($testvar != "yes")
{
  if($customers[$k] == "Smith"){
    $testvar = "yes";
    echo 'Smith <br/>';
  }else{
    echo $customers[$k].', not Smith <br/>';
  }
  $k++;
}
```
Deze opdrachten tonen de volgende gegevens op een webpagina:
```
Huang, not Smith
Smith
```
Het programma voert de vorige opdrachten als volgt uit:

1. De volgende variabelen worden voor het begin van de lus ingesteld: ``$customers`` (een array met drie waarden), ``$testvar`` (een testvariabele die op ``“no”`` is ingesteld) en ``$k`` (een telvariabele die op 0 is ingesteld).
1. Begint de lus door te controleren of ``$testvar`` ``“yes”`` **waar** is. Deze opdracht is **waar**, want ``$testvar`` is op ``“no”`` ingesteld, dus gaat de lus verder.
1. Controleert de **if**-opdracht. Is ``$customers[$k]`` ``“Smith”`` **waar**? De variabele ``$k`` heeft de waarde 0, dus controleert het programma ``$customers[0]``. Aangezien ``$customers[0]`` de waarde ``“Huang”`` heeft, is de opdracht niet waar. De opdrachten in het **if**-blok worden niet uitgevoerd, en het programma gaat verder met de opdracht **else**.
1. De opdracht in het **else**-blok wordt uitgevoerd. Het **else**-blok geeft de regel ``“Huang, not Smith”`` weer. Dit is de eerste regel van de uitvoer.
1. De variabele ``$k`` wordt met 1 vermeerderd, zodat de waarde 1 wordt.
1. Het einde van de lus is bereikt.
1. De uitvoering wordt aan het begin van de lus voortgezet.
1. De conditie wordt opnieuw gecontroleerd. Is ``$testvar != “yes”`` **waar**? Aangezien ``$testvar`` niet is gewijzigd en nog steeds de waarde ``“no”`` heeft, is de conditie waar en gaat de lus verder.
1. Controleert de **if**-opdracht. Is ``$customers[$k] == “Smith”`` **waar**? De variabele ``$k`` heeft de waarde 1, dus controleert het programma ``$customers[l]``. Aangezien ``$customers[l]`` de waarde ``”Smith“`` heeft, is de opdracht **waar**. De lus gaat dus verder met het **if**-blok.
1. De opdrachten in het **if**-blok worden uitgevoerd. De variabele ``$testvar`` wordt op ``“yes”`` ingesteld. De waarde ``“Smith”`` wordt weergegeven. Dit is de tweede regel van de uitvoer.
1. De variabele ``$k`` wordt met 1 vermeerderd, zodat de waarde 2 wordt.
1. Het einde van de lus is bereikt.
De uitvoering wordt aan het begin van de lus voortgezet.
1. Controleert opnieuw de conditie. Is ``$testvar != “yes”`` **waar**? Aangezien ``$testvar`` in ``“yes”`` is gewijzigd, is de conditie **niet waar**. De uitvoering van de lus wordt beëindigd.

Het is mogelijk een oneindige **while**-lus te schrijven; zo'n lus wordt altijd uitgevoerd. Het is erg eenvoudig onbedoeld een lus te schrijven waarvan de conditie altijd **waar** is. De lus wordt continu uitgevoerd als de conditie altijd **waar** is. In de paragraaf 'Oneindige lussen' verderop in dit hoofdstuk lees je meer hierover.

### Do..While
Lussen van het type **do..while** lijken veel op while-lussen. Een **do.. while**-lus wordt net zo lang uitgevoerd totdat specifieke condities niet meer waar zijn. De conditie wordt onder aan elke lus gecontroleerd. Als de conditie waar is, wordt de lus herhaald. De lus stopt als de conditie niet waar is.

Een **do.. while**-lus heeft het volgende formaat:
```php
do{
  Opdrachtenblok
}while(Conditie)
```
De volgende opdrachten maken een lus die naar een klant met de naam ``Smith`` zoekt. Dit programma doet hetzelfde als het programma met de **while**-lus uit het vorige voorbeeld:
```php
$customers = array("Huang", "Smith", "Jones");
$testvar = "no";
$k = 0;
do{
  if($customers[$k] == "Smith"){
    $testvar = "yes";
    echo 'Smith <br/>';
  }else{
    echo $customers[$k].', not Smith <br/>';
  }
}while( $testvar != "yes");
```
De uitvoer van deze opdrachten in een browser is:
```
Huang, not Smith
Smith
```
De uitvoer is identiek aan de uitvoer van het voorbeeldprogramma met de **while**-lus. Het verschil tussen een **while**-lus en een **do ..while**-lus is de plaats waar de conditie wordt gecontroleerd. In een **while**-lus gebeurt dit boven aan de lus. De lus wordt dus nooit uitgevoerd als de conditie **niet waar** is. In een **do..while**-lus wordt de conditie onder aan de lus gecontroleerd. Dit type lus wordt dus minimaal één keer uitgevoerd, ook als de conditie **niet waar** is.

In de vorige lus die op de naam Smith controleert, kun je de oorspronkelijke conditie op yes in plaats van op no instellen met de volgende opdracht:
```php
$testvar = "yes";
```
Deze conditie is vanaf het begin **niet waar**. In een **while**-lus zou er geen uitvoer zijn. Het opdrachtenblok wordt dan nooit uitgevoerd. In een **do..while**-lus wordt het opdrachtenblok echter altijd een keer uitgevoerd voordat de conditie wordt gecontroleerd. De **while**-lus geeft geen uitvoer, maar de **do..while**-lus geeft de volgende uitvoer:
```
Huang, not Smith.
```
De **do..while**-lus geeft één regel uitvoer voordat de conditie wordt gecontroleerd. De tweede regel uitvoer wordt niet geproduceerd, aangezien de conditie **niet waar** is.

### Oneindige lussen
Voordat je het weet, maak je een lus die nooit wordt stopgezet. Zo'n lus wordt een oneindige lus genoemd. Het komt zelden voor dat iemand een oneindige lus expres maakt; meestal is zo'n lus het resultaat van een programmeerfout. Een kleine wijziging in het programma waarmee een **while**-lus wordt gemaakt, maakt hem oneindig.

Het volgende programma komt uit de paragraaf 'Lussen van het type while' eerder uit dit hoofdstuk:
```php
$customers = array("Huang", "Smith", "Jones");
$testvar = "no";
$k = 0;
 
while ($testvar != "yes")
{
  if($customers[$k] == "Smith"){
    $testvar = "yes";
    echo 'Smith <br/>';
  }else{
    echo $customers[$k].', not Smith <br/>';
  }
  $k++;
}
```
Het volgende programma bevat een kleine wijziging:
```php
$customers = array("Huang", "Smith", "Jones");
$testvar = "no";
 
while ($testvar != "yes")
{
  $k = 0;
  if($customers[$k] == "Smith"){
    $testvar = "yes";
    echo 'Smith <br/>';
  }else{
    echo $customers[$k].', not Smith <br/>';
  }
  $k++;
}
```
In dit programma is de opdracht ``$k=0:`` die buiten de lus stond in de lus gezet. Deze kleine wijziging maakt de lus oneindig. De uitvoer van het gewijzigde programma is:
```
Huang, not Smith
Huang, not Smith
Huang, not Smith
Huang, not Smith
.....
```
Dit gaat eindeloos door. De lus stelt de variabele elke keer dat je de lus doorloopt op 0 in. Vervolgens wordt de waarde van $customers[0] opgehaald en weergegeven. Aan het einde van de lus wordt de waarde van ``$k`` met I vermeerderd. De variabele ``$k`` wordt echter aan het begin van de lus weer op 0 ingesteld. Hierdoor wordt alleen de eerste waarde van de array, Huang, gelezen. De lus bereikt de naam ``Smith`` niet, zodat de variabele ``$testvar`` nooit op ``“yes”`` wordt ingesteld. De lus is oneindig.

Je hoeft je niet te schamen als je een oneindige lus schrijft. Neem maar van mij aan dat de beste programmeurs ter wereld veel oneindige lussen hebben geschreven. Dit zijn nu eenmaal dingen die gebeuren. Als tijdens het testen van een programma de uitvoer eindeloos wordt herhaald, zal het programma na een korte periode uit zichzelf stoppen. De
standaardtijd is dertig seconden, al kan deze standaardtijd door de PHP-beheerder zijn gewijzigd.

Je kunt ook op de knop Stoppen in je browser klikken om de weergave te stoppen. Vervolgens moet je de oorzaak van de eindeloze lus achter-halen en het programma verbeteren. Een veelgemaakte fout is één isgelijkteken (=) gebruiken waar er twee moeten staan Eén isgelijkteken kent een waarde aan een variabele toe; twee isgelijktekens

Controleren of twee waarden gelijk zijn. Als je de volgende conditie met één isgelijkteken schrijft:
```php
while($testvar = "yes")
```
is de vergelijking altijd waar. De conditie stelt de variabele ``$testvar`` eenvoudigweg op ``“yes”`` in, zodat de vergelijking altijd **waar** is. Waarschijnlijk werd de volgende conditie bedoeld:
```php
while($testvar == "yes")
```
Deze vergelijking controleert of ``$testvar`` gelijk is aan ``“yes”``, iets wat waar of niet waar kan zijn.

Je beveiligt je programma's tegen dit type fouten door de conditie als ``“yes”=$testvar`` te formuleren. Dit is minder logisch tijdens het lezen, maar voorkomt het probleem met één isgelijkteken. Je ontvangt in dit geval een foutmelding als je per ongeluk één isgelijkteken gebruikt, en de uitvoering van het programma wordt stopgezet.

Een andere veel gemaakte fout is de **increment**opdracht voor de teller vergeten. Als je in het programma aan het begin van de paragraaf bijvoorbeeld ``$k++;`` weglaat, is ``$k`` altijd 0, met als resultaat een oneindige lus.

### Uit een lus breken
Soms moet het programma uit een lus breken. PHP heeft twee opdrachten voor dit doeleinde:

De opdracht **break** breekt volledig uit een lus en zet het programma voort met de opdrachten na de lus.
De opdracht **continue**. Gaat naar het einde van de lus waar de conditie wordt gecontroleerd. Het programma gaat weer naar het begin van de lus als de conditie positief wordt geëvalueerd.
De opdrachten **break** en **continue** worden meestal gebruikt in een conditionele opdracht. De opdracht **break** wordt veel gebruikt in **switch**-opdrachten, waarover je eerder in dit hoofdstuk meer leest.

De volgende twee voorbeelden tonen het verschil tussen **continue** en **break**. In het eerste programma zie je een voorbeeld van de opdracht **break**.
```php
$counter = 0;
while($counter < 5)
{
  $counter++;
  if($counter == 3){
    echo 'break <br/>';
    break;
  }
  echo 'End of while-loop. Counter: '.$counter.'<br/>';
}
echo 'After the break loop <p>';
```
Het tweede programma toont de werking van de opdracht **continue**:
```php
$counter = 0;
while( $counter < 5)
{
  $counter++;
  if($counter == 3){
    echo 'break <br/>';
    continue;
  }
  echo 'End of while-loop. Counter; '.$counter.'<br/>';
}
echo 'After the break loop <p>';
```
Deze programma's maken twee gelijke lussen; de eerste lus gebruikt de opdracht **break**, de tweede de opdracht **continue**. De uitvoer van het eerste programma toont het volgende in je browser:
```
End of while-lus; Counter: l
End of while-lus; Counter: 2 
break 
After the break loop
```
De tweede lus geeft het volgende uitvoer:
```
End of while-lus; Counter: l
End of while-lus; Counter: 2 
Continue 
End of while-lus; Counter: 4
End of while-lus; Counter: 5 
After the continue loop
```
De eerste lus wordt bij de opdracht **break** beëindigd. De uitvoering van het programma wordt voortgezet met de opdracht die direct na de lus volgt. De tweede lus wordt niet gestopt bij de opdracht **continue**, maar stopt alleen de derde herhaling van de lus, waarna naar het begin van de lus wordt teruggegaan. De lus wordt dan voltooid met de vierde en de vijfde herhaling voordat met de opdracht na de lus wordt verdergegaan.

Een reden om **break**-opdrachten te gebruiken, is oneindige lussen tegen te gaan. De volgende opdrachten in een lus kunnen de uitvoering op een acceptabel punt stopzetten:
```php
$test4infinity++;
 
if($test4infinity > 100){
  break;
}
```
Deze opdrachten stoppen de lus voordat hij oneindig wordt als je zeker weet dat de lus niet meer dan honderd keer hoeft te worden uitgevoerd. Gebruik een waarde die redelijk is voor de lus die je maakt.