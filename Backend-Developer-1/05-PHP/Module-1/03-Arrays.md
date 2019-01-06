# PHP: Arrays

## Inhoud
- [Introductie](#introductie)
- [Arrays maken](#Arrays-maken)
- [Arrays bekijken](#Arrays-bekijken)
- [Waarden uit array verwijderen](#Waarden-uit-array-verwijderen)
- [Array sorteren](#Array-sorteren)
- [Waarden uit array halen](#Waarden-uit-array-halen)
- [Foreach en arrays](#Foreach-en-arrays)
- [Multidimensionale arrays](#Multidimensionale-arrays)
- [Opdrachten](#opdrachten)

## Introductie
Arrays zijn complexe variabelen. Een array slaat een groep waarden onder een variabelenaam op. een array is handig voor het opslaan van verwante waarden. Je kunt bijv. gegevens over een overhemd zoals maat kleur en kosten in een array met een naam $shirtinfo opslaan. De gegevens in een array zijn eenvoudig te verwerken, bekijken en aan te passen. PHP heeft verschillende methoden om een array te sorteren.

In de volgende paragrafen lees je alles over arrays.


## Arrays maken
De eenvoudigste manier om een array te maken, is een waarde aan het variabele toe kennen met rechte haken ([ ]) achter een variabelennaam. Op de volgende manier maak je een array met de naam $pets als je deze variabelennaam nog niet eerder in je programma hebt gebruikt.

```php
$pets[1] = 'dragon';
```
Je hebt nu de array $pets gemaakt met slechts een waarde: “Dragon”. Vervolgens gebruik je de volgende opdrachten:
```php
$pets[2] = 'unicorn';
$pets[3] = 'tiger';
```
Nu heeft de array $pets die waarden: “dragon”, “unicorn”, “tiger”. Een array bestaat uit een lijst met sleutel- en waardenparen. Je specificeert tussen de rechte haken de sleutel die naar een specifieke waarde verwijst. In de vorige array zijn getallen als sleutels gebruikt. 1, 2, 3. Je mag echter ook woorden gebruiken. De volgende opdrachten maken bijvoorbeeld een array met hoofdsteden van Amerikaanse staten:
```php
$capitals['CA'] = 'Sacramento';
$capitals['TX'] = 'Austin';
$capitals['OR'] = 'Salem';
```
Je mag een verkorte notatie gebruiken in plaats van aparte toekenningsopdrachten voor elke item te maken. Een verkorte notatie ziet er als volgt uit:
```php
$pets[] = 'dragon';
$pets[] = 'unicorn';
$pets[] = 'tiger';
```
Als je op deze manier een array maakt krijgen de waarden automatisch opeenvolgende nummers toegekend, te beginnen bij het getal 0. De volgende opdracht:
```php
echo $pets[0];
```
Verstuurd deze uitvoer:
```
dragon
```
De eerste waarde in een array met een genummerde index is 0, tenzij je een andere waarde specificeert. Een algemene fout tijdens het werken met arrays is ervan uitgaan dat het eerste nummer 1 in plaats van 0 is.

De volgende opdracht gebruikt een nog kortere notatie:
```php
$pets = array('dragon','unicorn','tiger')
```
Deze opdracht maakt dezelfde array als de vorige verkorte notatie. Getallen worden als sleutels toegekend, te beginnen bij 0. Op soortgelijke wijze maak je een array met woorden als sleutels. De volgende opdracht maakt bijv de array met hoofdsteden van staten:
```php
$capitals = array('CA' => 'Sacramento', 'TX' => 'Austin', 'OR' => 'Salem');
```

## Arrays bekijken
Je echoot een arraywaarde op de volgende manier:
```php
echo $capitals['TX'];
```
Bekijk de structuur en de waarden van een array met de functie print_r. Met de volgende opdracht geef je de array $capitals weer:
```php
print_r($capitals);
```
Deze opdracht geeft het volgende uitvoer weer:
```
Array
(
  [CA] => Sacramento
  [TX] => Austin
  [OR] => Salem
)
```
De uitvoer toont de sleutel en de waarde van elke element in de array.

De uitvoer wordt op een webpagina met HTML weergegeven, wat in houdt dat een lange regel word getoond. Gebruikt HTML-tags om de browser de tekst te laten weergeven zoals hij is ontvangen. Gebruik bijvoorbeeld de volgende opdrachten:
```php
echo '<pre>';
print_r($capitals);
echo '</pre>';
```
## Waarden uit array verwijderen

Soms moet je een waarde uit een array verwijderen. Kijk eens naar de volgende array:
```php
$pets = array('dragon', 'unicorn', 'tiger', 'parrot', 'scorpion');
```

Deze array heeft vijf waarden. Je besluit dat je geen schorpioenen meer in je “fictieve” dierenwinkel wilt verkopen, dus gebruik je de volgende opdracht om schorpioenen uit de array te verwijderen:
```php
$pets[4] = '';
```

Deze opdracht stelt $pets[4] weliswaar op een lege string in, maar verwijdert het element niet uit de array. De array blijft vijf waarden bevatten, waarvan een de waarde beingempty1 heeft. Gebruik de functie unset om een waarde volledig uit de array te verwijderen:
```php
unset($pets[4]);
```
Nu heeft de array nog maar 4 waardes.


## Array sorteren
Een van de nuttigste voorzieningen van arrays is dat PHP ze voor je kan sorteren. PHP slaat array-elementen op in de volgorde waarin je ze maakt. Ze worden ook in die volgorde weergegeven als je de volledige array toont zonder de volgorde te wijzigen. Vaak is het nuttig de volgorde te wijzigen, bijvoorbeeld als je de array in alfabetische volgorde op waarde of op de sleutel wilt weergegeven.

PHP kan arrays op verschillende manieren sorteren. Gebruik de volgende sorteeropdracht als je een array met genummerde sleutels wilt sorteren:

```php
sort($pets);
```

Deze opdracht sorteert de waarden en kent nieuwe nummers als sleutels toe. De waarden worden eerst op getallen gesorteerd, vervolgens op hoofdletters en ten slotte op kleine letters. Neem bijvoorbeeld de array $pets uit de vorige paragraaf:
```php
$pets[0] = 'dragon';
$pets[1] = 'unicorn';
$pets[2] = 'tiger';
```

Na de volgende sorteeropdracht:
```php
sort($pets);
```

Krijg je deze array:
```php
$pets[0] = 'dragon';
$pets[1] = 'tiger';
$pets[2] = 'unicorn';
```

De woorden worden in nummers omgezet en de woorden verdwijnen als je de functie sort gebruikt om een array met sleutelwoorden te sorteren.

Gebruik op de volgende manier de functie asort bij arrays die woorden als sleutels gebruiken:
```php
asort($capitals);
```

Deze functie sorteert de hoofdsteden als waarde maar behoudt de oorspronkelijke sleutel van elke waarde in plaats van een genummerde sleutel toe te kennen. Kijk bijvoorbeeld naar de array met hoofdsteden van straten die in de vorige paragraaf is gemaakt:
```php
$capitals['CA'] = 'Sacramento';
$capitals['TX'] = 'Austin';
$capitals['OR'] = 'Salem';
```

Na de volgende sorteeropdracht:
```php
$sort($pets);
```

krijg je deze array:
```php
$pets = array('dragon', 'tiger', 'unicorn');
```
De woorden worden in nummers omgezet en de woorden verdwijnen als je de functie ``sort`` gebruikt om een array met sleutelwoorden te sorteren.

Gebruik de volgende manier op de functie ``asort`` bij arrays die woorden als sleutels gebruiken:
```php
asort($captitals);
```
Deze functie sorteert de hoofdsteden als waarde maar behoudt de oorspronkelijke sleutel van elke waarde in plaats van een genummerde sleutel toe te kennen. Kijk bijvoorbeeld naar de array met hoofdsteden van straten die in de vorige paragraaf is gemaakt:
```php
$captitals = array('CA' => 'Sacramento', 'TX' => 'Austin', 'OR' => 'Salem');
```
Na de volgende sorteeropdracht:
```php
asort($capitals);
```
Krijg je deze array:
```php
$capitals = array('TX' => 'Austin', 'CA' => 'Sacramento', 'OR' => 'Salem');
```
De sleutels blijven gekoppeld aan de waarde na het sorteren van de elementen. De array-elementen staan nu in alfabetische volgorde, met de juiste afkorting bij elke hoofdstad. als de sleutels genummerd waren, zouden ze in een andere volgorde staan. de oorspronkelijke array zou er dan als volgt uitzien:
```php
$capitals = array( 0 => 'Sacramento', 1 => 'Austin', 2 => 'Salem');
```
De kans is niet groot dat je de functie ``asort`` nodig hebt bij een array met genummerde sleutels.

Er zijn nog meer sorteerfuncties die op een andere manier sorteren. In de onderstaande tabel zie je een overzicht van de beschikbare sorteeropdrachten.

| Soorteeropdracht | Werking | 
| -- | -- |
| sort($arraynaam)  | Sorteert op waarde; kent nieuwe nummers als sleutel toe
| asort($arraynaam) | Sorteert op waarde; behoudt dezelfde sleutel
| rsort($arraynaam)	| Sorteert op waarde in omgekeerde volgorde, kent nieuwe nummers als | sleutels toe
| arsort($arraynaam)| Sorteert op waarde in omgekeerde volgorde, behoudt dezelfde sleutel
| ksort($arraynaam)	| Sorteert op sleutel
| krsort($arraynaam)| Sorteert op sleutel in omgekeerde volgorde
| usort($arraynaam, functienaam)|	Sorteert op functie (hier later meer over)

## Waarden uit array halen
Je kunt een individuele waarde rechtstreeks uit een array halen. Kijk eens naar de volgende voorbeeld:

```php
$CAcaptital = $capitals['CA'];
echo $CAcapital;
```

De uitvoer van deze opdrachten is:
```
Sacramento
```

Je ontvangt een melding (notice) als je een niet-bestaand array-element in een opdracht probeert te gebruiken. Stel dat je de volgende opdracht gebruikt:
```php
$CAcapital = $capitals['CAx'];
```

Je ontvangt de volgende melding als de array ``$capitals`` bestaat, maar geen element met de sleutel ``CAx`` bevat:
```
Notice: undefined index: CAx in d:\testarray.php on line 9
```

Een melding zet de uitvoering van het script niet stop. Opdrachten na de melding worden gewoon uitgevoerd. Een echo-opdracht echoot echter een lege ruimte omdat er geen waarde in $CAcapitals staat. Je voorkomt dat een melding wordt getoond door een apenstaartje (@) te gebruiken:
```php
@$CAcapital = $capitals['CAx'];
```

Met de functie ``list`` toon je verschillende waarden uit een array en met de functie ``extract`` toon je alle waarden. De opdracht ``list`` haalt waarden uit een array en plaatst ze in variabelen. Een voorbeeld van een ``list``-opdracht ziet er als volgt uit:
```php
$shirtInfo = array('large', 'blue', 12.00);
sort($shirtInfo);
list($shirtSize, $shirtColor,) = $shirtInfo;
echo $shirtSize;
echo $shirtColor;
```

Op de eerste regel wordt de array $shirtInfo gemaakt. De tweede regel sorteert de array. De derde regel stelt de twee variabelen $shirtSize en $shirtColor in en kopieert de eerste twee waarden van $shirtInfo naar de nieuwe variabelen, net alsof je de volgende opdrachten hebt gebruikt:
```php
$shirtSize = shirtInfo[0];
$shirtColor = shirtInfo[1];
```

De derde waarde in $shirtInfo wordt niet naar een variabele gekopieerd omdat er maar twee variabelen in de list-opdracht staan. De uitvoer van de echo-opdrachten is:
```
blue
large
```

Je ziet dat de uitvoer in alfabetische volgorde staat en niet in de volgorde waarin de waarde zijn ingevoerd. Ze staan in alfabetische volgorde omdat de array na het maken is gesorteerd.

Je haalt alle waarde uit een array met woorden als sleutels met de opdracht ``extract``. Elke waarde wordt gekopieerd naar een variabele die de naam van de sleutel krijgt. de volgende opdrachten halen bijvoorbeeld alle gegevens uit $shirtInfo en echoën ze:
```php
extract($shirtInfo);
echo 'Size is '. $size . ', color is ' .$color. ', cost is ' .$cost;
```

De uitvoer van deze opdrachten is:
```
Size is large, color is blue, cost is 12.00
```
## Foreach en arrays
Het komt vaak voor dat je met elke waarde in een array iets wilt doen. Misschien wil je alle waarden weergeven, ze in de database opslaan of de waarde zes toevoegen aan elke waarde in de array. Voor het in volgorde doorlopen van elke waarde in een array wordt ook wel de technische term iteratie gebruikt. De term doorlopen wordt echter ook gebruikt. Je kunt een array op de volgende manier doorlopen:

- Handmatig
- Met de opdracht ``foreach``. De array wordt automatisch van begin tot einde, waarde voor waarde doorlopen.

### Handmatig
Je doorloopt een array handmatig door een pointer te gebruiken. zie de array als een lijst. Met een pointer verwijs je naar een waarde in die lijst. De pointer blijft bij een waarde totdat je hem verplaatst. Na verplaatsing blijft de pointer bij een volgende waarde staan totdat je hem opnieuw verplaatst. Je verplaatst de pointer met de volgende opdrachten:

- current($arraynaam). \
Verwijst naar de waarde waar de pointer zich momenteel bevindt; de pointer wordt niet verplaatst.
- next($arraynaam). \
Verplaatst de pointer naar de volgende waarde.
- previous($arraynaam). \
Verplaatst de pointer naar de vorige waarde.
- end($arraynaam). \
Verplaatst de pointer naar de laatste waarde in de array.
- reset($arraynaam). \
Verplaatst de pointer naar de eerste waarde in de array.

De volgende opdrachten doorlopen een array met hoofdsteden van de Amerikaanse staten handmatig:
```php
$value = current($capitals);
echo $value.'<br>';
$value = next($capitals);
echo $value.'<br>';
$value = next($capitals);
echo $value.'<br>';
```

De pointer bevindt zich bij het eerste element van de array als je begint, tenzij je hem eerder al hebt verplaatst. Gebruik de opdracht ``reset`` voordat je begint als je denkt dat de array pointer eerder in het script verplaatst is of als je de uitvoer van de array ergens in het midden lijkt te beginnen:
```php
reset($capitals);
```

Je hebt een toekenningsopdracht en een ``echo``-opdracht voor alle waarden nodig, dus voor elk van de vijftig staten, als je deze methode gebruikt om een array te doorlopen.

Deze methode is erg flexibele. je kunt op elke gewenste manier een array doorlopen, en niet slechts een waarde per keer. Je kunt teruggaan, rechtstreeks naar het einde gaan, een waarde overslaan door twee ``next``-opdrachten achter elkaar in te geven of een andere nuttige methode toepassen. Als je echter vanaf het begin een voor een alle waarde wilt doorlopen, biedt PHP een efficiëntere methode met de opdracht ``foreach``, die de volgende paragraaf wordt behandeld.

### Foreach opdracht
De opdracht foreach doorloopt de array waarde voor waarde en voert een blok opdrachten bij elke waarde uit. Het algemene formaat is:
```
foreach($arraynaam as $sleutelnaam => $waardenaam){
    blok opdrachten;
}
```
Gebruik de volgende elementen:
 - Arraynaam. \
 De naam van de array die wordt doorlopen.
 - Sleutelnaam. \
 De naam van de variabele waarin de sleutel moet worden opgeslagen. Deze toevoeging is optioneel. Als je $sleutelnaam ⇒ weglaat, wordt de waarde aan $waardenaam toegevoegd.
 - Waardenaam. \
 De naam van de variabele waarin de waarde moet worden opgeslagen.

De volgende ``foreach``-opdracht doorloopt de voorbeeldarray met hoofdsteden van Amerikaanse staten en toont een lijst:
```php
$capitals = array('CA'=>'Sacramento', 'OR'=>'Salem', 'TX'=>'Austin');
 
ksort($capitals);
foreach($capitals as $state => $city){
    echo $city.', '.$state.'<br/>';
}
```

Deze opdrachten geven de volgende uitvoer op een webpagina:
```
Sacramento, CA
Salem, OR
Austin, TX
```

Je kunt de volgende regels gebruiken in plaats van de regel met de opdracht ``foreach`` in het vorige voorbeeld.
```php
foreach($capitals as $city)
```

Bij deze ``foreach``-opdracht wordt alleen de stadsnaam als uitvoer gegeven. Vervolgens gebruik je deze ``echo``-opdracht:
```php
echo $city.'<br/>';
```

De uitvoer na deze wijzigingen ziet er nu als volgt uit:
```
Sacramento
Salem
Austin
```
De pointer wordt naar het begin van de array verplaatst op het moment dat de opdracht ``foreach`` een array begint te doorlopen. Je hoeft dus geen gebruik te maken van de opdracht ``reset``.

## Multidimensionale arrays
In de vorige hoofdstukken zijn arrays behandeld die uit een lijst met sleutel- en waardeparen bestaan. Het kan echter ook nuttig zijn waarden met meer dan een sleutel op te slaan. Stel dat je de volgende productprijzen samen in een variabele wilt opslaan:

- Shirt, 20.00
- Pants, 22.50
- Blanket, 25.00
- Bedspread, 50.00
- Lamp, 44.00
- Rug, 75.00

je zou ze als volgt aan de een array kunnen toevoegen:
```php
$productPrices['shirt'] = 20.00;
$productPrices['pants'] = 22.50;
$productPrices['blanket'] = 25.00;
$productPrices['bedspread'] = 50.00;
$productPrices['lamp'] = 44.00;
$productPrices['rug'] = 75.00;
```

Je programma kan deze array eenvoudig doorzoeken als je de prijs van een artikel nodig hebt, maar wat doe je als je drieduizend artikelen hebt? Je programma moet dan al die artikelen langs opzoek naar de sleutel shirt of rug.

Je ziet dat de lijst met producten en prijzen een grote verscheidenheid aan producten bevat die in groepen kunnen worden geclassificeerd; kleding, beddengoed en meubels. Het programma zou slechts in een groep naar de juiste prijs hoeven te zoeken als je zo`n classificatie gebruikt. Het classificeren van producten is dus een stuk efficiënter. Plaats de kosten als volgt in een multidimensionale array om de producten te classificeren:
```php
$productPrices['clothing']['shirt'] = 20.00;
$productPrices['clothing']['pants'] = 22.50;
$productPrices['linens']['blanket'] = 25.00;
$productPrices['linens']['bedspread'] = 50.00;
$productPrices['furniture']['lamp'] = 44.00;
$productPrices['furniture']['rug'] = 75.00;
```

Dit type array wordt een multidimensionale array genoemd omdat hij in feite uit een array met arrays bestaat. In het volgende tabel zie je de structuur van $productPrices als array met arrays. De array $productPrices bevat 3 sleutel- en waardeparen. De sleutels zijn clothing,linens,furniture. De waarde van elke sleutel is een array met twee sleutel- en waardeparen. De waarde van de sleutel clothing is bijvoorbeeld een array met sleutel- en waardeparen shirt/20.00 en pants/22.50.

``TO DO: Tabel``

De array ``$productPrices`` is tweedimensionaal. PHP kan ook overweg met multidimensionale arrays die 4, 5, 6 of meer niveau's hebben. \
De kans is echter groot dat je hoofdpijn krijgt als je een array probeert te begrijpen met meer dan 3 niveau's. \
De mogelijkheid tot verwarring neemt elke extra arraydimensie toe.

In multidimensionale array haal je waarden volgens dezelfde procedures op als bij eendimensionale arrays. \
Je kunt de waarde met de volgende opdracht rechtstreeks benaderen:
```php
$shirtPrice = $productPrices['clothing']['shirt'];
```

je kunt de waarde ook echoën:
```php
echo $productPrices['clothing']['shirt'];
```

Je moet de variabelennaam tussen accolades zetten als je de waarden tussen dubbelen aanhalingstekens combineert. Het dollarteken van de variabelennaam moet direct na de begin accolade volgen, zonder spatie:
```php
echo 'The price of a shirt is \$'.$productPrices['clothing']['shirt'];
```

Let op de backslash (\) voor het eerste dollarteken ($). Met deze backslash laat je PHP weten dat het dollarteken een letterlijke dollarteken is en niet het begin van een variabelenaam. De uitvoer ziet er als volgt uit:
```
The price of a shirt is $20
```

Je kunt een multidimentionale array doorlopen met foreach-opdrachten (zie vorige paragraaf). je hebt dan voor elke array een foreach-opdracht nodig. De foreach-opdrachten worden genest ofwel in elkaar geplaatst.

Bij tweedimensionale arrays, zoals $productPrices, heb je 2 foreach-opdrachten nodig om ze beide te doorlopen. De voglende opdrachten halen de waarden uit de multidimensionale array en voeren ze naar een HTML-tabel:
```php
echo '<table border=1>';
foreach($productPrices as $category){
  foreach($category as $product => $price){
    $f_price =sprintf('%01.2f', $price);
    echo '<tr><td>'.$product.'</td><td>\$'.$f_price.'</td></tr>';
  }
}
echo '</table>';
```
Het programma interpreteert deze opdrachten als volgt:
1. De tabeltag wordt uitgevoerd.
1. Het eerste sleutel- en waardepaar uit de array ``$productPrices`` wordt in de variabele ``$category`` opgeslagen. Deze waarde is een array.
1. Het eerste sleutel- en waardepaar uit de array ``$category`` wordt opgehaald. De sleutel wordt in de variabele ``$product`` opgeslagen en de waarde in $price.
1. Maakt de waarde in ``$price`` op in het juiste valutaformaat.
1. Voert een tabel rij met het product en de prijs uit.
1. Gaat naar het volgende sleutel- en waardepaar in de array ``$category``.
1. Maakt de prijs op en voert de tabel rij met het product en de prijs uit.
1. De binnenste foreach-opdracht wordt beëindigd omdat er geen sleutel- en waardepaar meer in de array staan.
1. Gaat naar het volgende sleutel- en waardepaar in de buitenste foreach-opdracht. Zet de volgende waarde in ``$category``, een array.
1. Herhaalt de stappen 2 tot en met 9 totdat het laatste sleutel- en waardepaar in de laatste ``$category-array`` is bereikt. eerst wordt de binnenste foreach-opdracht beëindigd en vervolgens de buitenste foreach-opdracht.
1. Voert de tag ``</table>`` uit om de tabel af te sluiten.

De buitenste ``foreach``-opdracht begint dus met het eerste sleutel- en waardepaar in de array. De sleutel is clothing en de waarde van dit paar als een array die aan de variabele ``$category`` wordt toegevoegd. De binnenste ``foreach``-opdracht doorloopt vervolgens de array in de variabele ``$category``. Deze opdracht wordt beeindigd als het laatste sleutel- en waardepaar in ``$category`` is bereikt. Het programma gaat dan door met de buitenste lus, die met het tweede sleutel- en waardepaar verder gaat… enz, totdat het einde van de array is bereikt.

## Opdrachten