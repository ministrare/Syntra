# PHP: Functies

## Inhoud
 - [Functies gebruiken](#Functies-gebruiken)
 - [Variabelen in functies gebruiken](#Variabelen-in-functies-gebruiken)
 - [Parameters & Return](#Parameters-&-Return)
   - [Parameters](#Parameters)
   - [Return](#Return)
 - [Ingebouwde functies](#Ingebouwde-functies)

## Functies gebruiken
Toepassingen voeren vaak dezelfde taken uit op verschillende plaatsen in een programma of in verschillende programma's. De toepassing geeft bijvoorbeeld het bedrijfslogo weer op verschillende webpagina's of in verschillende delen van het programma. Stel dat je de volgende opdrachten gebruikt om het bedrijfslogo weer te geven:
```php
echo '<hr width="50" align="left">',"\n";
echo '<img src="/images/logo.jpg" width="50" height="50"><br>',"\n";
echo '<hr width="50" align="left"><br>',"\n";
```
Je kunt dan een **functie** maken met deze opdrachten en haar bijvoorbeeld de naam ``display_logo`` geven. Op het moment dat het programma het logo moet weergeven, roep je de **functie** met de opdrachten met de volgende eenvoudige **functie**-aanroep aan:
```php
display_logo();
```
Achter de functienaam staan verplichte haakjes om PHP te laten weten dat je een **functie** bedoelt.

Een **functie** biedt de volgende voordelen:

 - **Minder typewerk**. \
 Je hoeft de opdrachten maar één keer in te voeren: in de **functie**. Hierna gebruik je alleen maar de **functie** aanroep en hoef je de opdrachten niet meer in te voeren.
Eenvoudiger te lezen. De regel ``display_logo()`` is in een oogopslag te begrijpen.
 - **Minder fouten**. \
 De opdrachten worden iedere keer correct uitgevoerd nadat je de functie hebt geschreven en eventuele problemen hebt opgelost.
 - **Eenvoudiger te wijzigen**. \
 Je hoeft slechts op één plaats wijzigingen door te voeren als je de uitvoering van de taak wilt veranderen. Je wijzigt eenvoudigweg de functie in plaats van de code op honderd verschillende plaatsen in je programma te wijzigen. 
 
Stel dat je bijvoorbeeld een ander grafisch bestand voor het bedrijfslogo gaat gebruiken. Je hoeft de bestandsnaam dan op maar een plaats te veranderen, in de **functie**, en alles werkt weer perfect.

Je maakt een **functie** door de code in een **functieblok** te zetten. Het algemene formaat is:
```php
function functienaam(){
  opdrachtenblok;
  return;
}
```
Met de volgende opdrachten maak je bijvoorbeeld een **functie** die het bedrijfslogo weergeeft:
```php
function display_logo(){
  echo '<hr width="50" align="left">',"\n";
  echo '<img src="/images/logo.jpg" width="50" height="50"><br>',"\n";
  echo '<hr width="50" align="left"><br>',"\n";
  return;
}
```
De opdracht **return** stopt de functie en keert terug naar het hoofdprogramma. Aan het einde van een **functie** is de opdracht **return** niet verplicht, maar hij maakt de **functie** wel beter leesbaar. Je gebruikt de **return** vaak als conditioneel einde van een **functie**.

Stel dat je **functie** een elektronicacatalogus weergeeft. Je kunt dan de volgende opdracht aan het begin van de **functie** gebruiken:
```php
if($age < 13)
  return;
```
Als de klant jonger dan 13 is, wordt de **functie** stopgezet zonder de elektronicacatalogus weer te geven. **Functies** mogen overal in een programma worden gebruikt, maar het is gebruikelijk alle **functies** aan het begin of aan het einde van het programmabestand te plaatsen. **Functies** die je in meer dan een programma gaat gebruiken, kun je in een apart bestand zetten. De programma's hebben dan via het externe bestand toegang tot de **functies**. In hoofdstuk 10 lees je meer over het ordenen van toepassingen in bestanden en de toegang tot aparte bestanden.

Je ziet dat de voorbeeldfunctie erg eenvoudig is. Er wordt geen gebruikgemaakt van variabelen, en er worden geen gegevens met het hoofdprogramma gedeeld. De **functie** voert alleen een onafhankelijke taak uit nadat ze is aangeroepen. Je kunt ook variabelen in **functies** gebruiken en gegevens tussen de functie en het hoofdprogramma uitwisselen als je de regels en beperkingen kent. In de overige paragrafen van dit hoofdstuk lees je hoe je variabelen gebruikt en waarden meegeeft.

## Variabelen in functies gebruiken
Je kunt variabelen maken en gebruiken die lokaal zijn voor de **functie**. Dit houdt in dat de variabele binnen de **functie** wordt gemaakt en gebruikt. De variabele is **niet beschikbaar** buiten de **functie**, en kan dus niet door het hoofdprogramma worden gebruikt.

Je maakt de variabele voor de rest van het programma beschikbaar met de speciale opdracht **global**, zodat je hem op elke gewenste locatie in het programma kunt gebruiken. De volgende functie maakt een variabele:
```php
function format_name()
{
  $first_name = "Goliath";
  $last_name = "Smith";
  $name = $last_name." ".$first_name;
}
 
format_name();
echo $name;
```
Deze opdrachten produceren geen uitvoer. In de **echo**-opdracht bevat de variabele ``$name`` geen waarde. De variabele ``$name`` is in de **functie** gemaakt, en bestaat niet buiten die **functie**.

Je maakt een variabele in een **functie** die ook buiten die **functie** bestaat door de opdracht global te gebruiken. De volgende opdrachten maken dezelfde **functie**, maar nu met de opdracht global voor de variabele ``$name``:
```php
function format_name()
{
  $first_name = "Goliath";
  $last_name = "Smith";
  global $name;
  $name = $last_name." ".$first_name;
}
 
format_name();
echo $name;
```
Nu geeft het programma de volgende uitvoer:
```
Smith, Goliath
```

De opdracht global maakt de variabele toegankelijk op elke locatie in het programma. Je moet de variabele ``'global'`` maken voordat je hem kunt gebruiken. Het programma geeft geen uitvoer als je de opdracht ``global`` na de toekenningsopdracht $name plaatst.

Dezelfde regel geldt als je een variabele gebruikt die in het hoofdprogramma is gemaakt. Een variabele kan niet in een **functie** worden gebruikt als die variabele zonder **global**-opdracht buiten de **functie** is gemaakt, zoals de volgende opdrachten aantonen:
```php
$first_name = "Goliath";
$last_name = "Smith";
 
function format_name()
{
  global $first_name, $last_name;
  $name = $last_name." ".$first_name;
  echo $name;
}
 
format_name();
```
Zonder **global**-opdracht zijn ``$last_name`` en ``$first_name`` in de **functie** andere variabelen, die zijn gemaakt toen je ze een naam gaf. Ze bevatten geen waarden. Het programma produceert geen uitvoer zonder de opdracht **global**.

## Parameters & return
Je kunt waarden aan een **functie** meegeven en waarden uit een functie ontvangen. Je gebruikt misschien een **functie** om het juiste belastingtarief aan een bestelling toe te voegen. Zo'n **functie** moet de kosten van de bestelling en de staat waarin de klant woont kennen. De **functie** moet het bedrag aan omzetbelasting teruggeven.

### Parameters
Je geeft waarden aan een **functie** mee door ze tijdens de **functie**-aanroep tussen haakjes te zetten:
```php
functienaam (waarde, waarde...);
```
De variabelen mogen natuurlijk niet uit de lucht komen vallen. De **functie** moet ze verwachten. De functieopdracht omvat de variabelen namen voor de waarden die ze verwacht:
```php
function functienaam($varnaam1, $varnaam2...)
{
  opdrachten;
  return;
}
```
De volgende **functie** berekent bijvoorbeeld de omzetbelasting:
```php
function compute_salestax($amount, $custState.)
{
  switch($custState)
  {
    case "OR":
      $salesTaxRate = 0;
      break;
    case "CA":
      $salesTaxRate = 1.0;
      break;
    default :
      $salesTaxRate = .5;
      break;
  }
  $salesTax = $amount * $salesTaxRate;
  echo $salesTax.'<br>';
}
$cost = 2000.00;
custState = "CA";
compute_salestax($cost,$custState);
```
Op de eerste regel zie je dat de **functie** twee waarden verwacht:
```php
function compute_salestax($amount, $custState)
```
Deze laatste regel is de **functie** aanroep, die twee waarden aan de **functie** ``compute_salestax`` meegeeft. Het gaat om het bedrag van de bestelling en de staat waarin de klant woont. De uitvoer voor dit programma is 2000 omdat de omzetbelasting voor California 100 procent is.

Je mag zoveel waarden meegeven als je nodig acht. Waarden kunnen variabelen of waarden zijn, inclusief berekende waarden. De volgende functie aanroepen zijn geldig:
```php
compute_salestax(2000, "CA");
compute_salestax(2*1000,"");
compute_salestax(2000,"C"."A");
```
**Waarden** kunnen in een array worden meegegeven. De **functie** ontvangt de variabele dan als array. Met de volgende opdrachten geef je bijvoorbeeld een array mee:
```php
$arrayOfNumbers = array(100, 200);
addNumbers($arrayOfNumbers);
```
De **functie** ontvangt de volledige array. Stel dat de **functie** met de volgende opdracht begint:
```php
function addNumbers($numbers);
```
De variabele ``$numbers`` is een array. De **functie** kan bijvoorbeeld de volgende opdrachten bevatten:
```php
return $numbers[0] + $numbers[1];
```
De waarden worden in volgorde meegegeven. Dit betekent dat de eerste waarde in de lijst als eerste waarde wordt gebruikt voor de lijst die de **functie** verwacht, de tweede als tweede enzovoort. De **functie** gebruikt de verkeerde waarde tijdens het uitvoeren van de opdrachten als de waarden niet in dezelfde volgorde staan. Je kunt de functie ``compute_salestax`` bijvoorbeeld tijdens de aanroep op de volgende manier waarden in de verkeerde volgorde meegeven:
```php
compute_salestax($custState, $orderCost)
```
De functie gebruikt de staat dan voor de kosten van de bestelling, waardoor de waarde 0 wordt gebruikt omdat de meegegeven waarde een string is. De staat wordt ingesteld op het getal in ``$orderCost``, dat niet met een van de categorieën overeenkomt. De uitvoer is dan 0.

Als je niet voldoende waarden meegeeft, stelt de functie de ontbrekende waarde voor een string op een lege string in en voor een getal op 0. Extra waarden worden genegeerd als je teveel waarden meegeeft.

Je kunt een waarschuwing ontvangen, afhankelijk van het foutmeldingsniveau waarop PHP is ingesteld, als je het verkeerde aantal waarden aan een functie meegeeft.
```php
Warning: Missing Argument 2 for compute_salestax() in /test7.php on line 5
```
Je kunt ook standaardwaarden instellen die worden toegepast als een waarde niet is meegegeven. Je stelt een standaardwaarde als volgt in tijdens het maken van de functie:
```php
function add_2_numbers($num1=1, $num2=1)
{
  $total = $num1 + $num2
  return $total;
}
```
De functie gebruikt de toegekende standaardwaarden als een van de waarden of allebei de waarden niet worden meegegeven. Een meegegeven waarde heeft voorrang op de standaardwaarde. Je kunt bijvoorbeeld een van de volgende aanroepen gebruiken:
```php
add_2_numbers(2,2);
add_2_numbers(2);
add_2_numbers();
```
De resultaten hiervan zijn:
```php
$total = 4;
$total = 3;
$total = 2;
```
### Return
Tijdens het aanroepen van een functie kun je waarden meegeven, zoals je in de vorige paragraaf hebt gelezen. De functie kan ook een waarde teruggeven aan het programma dat haar heeft aangeroepen. Met de opdracht ``return`` geef je een waarde terug aan het aanroepende programma. Het programma kan die waarde in een variabele opslaan of direct gebruiken, bijvoorbeeld in een conditionele opdracht. De opdracht ``return`` geeft bovendien de uitvoering terug aan het hoofdprogramma; de functie wordt dus stopgezet.

Het algemene formaat van de opdracht ``return`` is:
```php
return waarde;
```
In het belastingprogramma van de vorige paragraaf wordt de omzetbelasting bijvoorbeeld met de volgende opdrachten weergegeven:
```php
$salestax = amount * $salesTaxRate;
echo $salestax."<br>";
```
Met de opdracht ``return`` geef je de omzetbelasting op de volgende manier terug aan het hoofdprogramma:
```php
$salestax = amount * $salesTaxRate;
echo $salestax.
```
Het is ook mogelijk de waarde met één opdracht aan het hoofdprogramma te retourneren:
```php
return $salestax = amount * $salesTaxRate;
```
De opdracht ``return`` stuurt het bedrag aan omzetbelasting terug aan het hoofdprogramma en beëindigt de functie. Het hoofdprogramma kan de waarde op een van de gebruikelijke manieren gebruiken. De volgende opdrachten gebruiken de functie aanroep op geldige wijze:
```php
$salestax = compute_salesTax($cost, $custState);
$totalcost = $cost + compute_salesTax($cost, $custState);;
 
if( compute_salesTax($cost,$custState) > 10000.00)
{
  echo 'Thank you very, very, very mutch <br>';
}
 
foreach($customerOrder as $amount){
  $total = $amount + compute_salesTax;
  echo 'Your total is '.$total.'<br>';
}
```
Een ``return``-opdracht kan slechts één waarde retourneren. De geretourneerde waarde mag echter een array zijn, zodat je in feite veel waarden uit een functie kunt retourneren. Je kunt ``return``-opdrachten in een conditionele opdracht gebruiken om verschillende waarden voor verschillende condities te retourneren. De volgende functie retourneert bijvoorbeeld een van twee verschillende strings:
```php
function compare_values($value1, $value2){
  if($value1 < value2)
  {
    return "Less than";
  }else{
    return "Not less than";
  }
}
```
De functie bevat weliswaar twee ``return``-opdrachten, maar slechts een ervan wordt uitgevoerd, afhankelijk van de waarden in ``$valuel`` en ``$value2``.

## Ingebouwde functies
De vele ingebouwde functies van PHP vormen een van de redenen waarom PHP zo krachtig en nuttig voor webpagina's is. De ingebouwde functies van PHP zijn normale functies; ze wijken niet af van de functies die je zelf maakt. PHP heeft je alleen maar wat werk uit handen genomen.