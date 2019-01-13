# PHP: Superglobals

## Inhoud
- [Introductie](#Introductie)
- [$_GET](#$_GET)
- [$_POST](#$_POST)
- [$_SERVER](#$_SERVER)
- [$_SESSION](#$_SESSION)
- [$_REQUEST](#$_REQUEST)
- [Opdrachten](#Opdrachten)

## Introductie
PHP kent enkele vooraf gedefinieerde variabelen, de zogenaamde superglobals. \
Deze variabelen zijn arrays die afhankelijk van de situatie allerlei waarden kunnen bevatten. \
Deze superglobals zijn overal en in elk script beschikbaar. \
Dit wil echter niet zeggen dat ze ook altijd gevuld zijn, dat hangt van de situatie af.

De superglobals waarin ik in deze les aandacht zal besteden zijn:

 - **$_GET**
 - **$_POST**
 - **$_FILES**
 - **$_SERVER**
 - **$_COOKIE**
 - **$_REQUEST**

Naast deze lijst zijn er nog twee variabelen: ``$_ENV`` en ``$GLOBALS``. \
Deze gebruik je echter (bijna) nooit, dus daar zal ik hier verder ook geen aandacht aan besteden.

## $_GET
Iedereen heeft wel eens een url van een website gezien die er bijvoorbeeld zo uit zag: ``http://www.eensite.nl/index.php?show=bericht&id=10``. Wellicht dat je je ook ooit al eens afgevraagd hebt wat de ``?`` en ``&`` in de url nou precies doen en dat je al misschien een vermoeden had dat dit variabelen zijn. Dan zat je helemaal op het juiste spoor. Deze zogenaamde ``GET`` variabelen zijn variabelen die aan de url meegegeven kunnen worden en die we later in ons script kunnen gebruiken. In bovenstaand voorbeeld heb je dus beschikking over de ``GET`` variabelen ``show`` en ``id``.

In ons script zijn deze variabelen te vinden in de **superglobal** ``$_GET``. Deze variabele is een array waarin alle variabelen uit de url opgeslagen zijn. Met het volgende scriptje in onze ``index.php`` zal ik laten zien hoe dit werkt:

```php
<?php
if(isset($_GET['naam'], $_GET['leeftijd'])){
    echo 'Hoi '.$_GET['naam'].', jij bent '.$_GET['leeftijd'].' jaar.';
}else{
    echo 'Een van de benodigde GET variabelen bestaat niet';
}
?>
```
Als we het script nu aan zouden roepen met de volgende url: ``index.php?naam=Kees&leeftijd=42``, zou dat de volgende output geven:

```
Hoi Kees, jij bent 40 jaar.
```
Allereerst controleren we met ``isset()`` of de twee ``GET`` variabelen wel bestaan. Dit moeten we altijd doen met variabelen die uit de url komen, het wordt namelijk lastig werken met variabelen die niet bestaan. Vervolgens gebruiken we de variabelen om wat informatie op het scherm te zetten.

Om te laten zien dat de controle of de variabelen bestaan werkt, roepen we de pagina nu als volgt aan: ``index.php?naam=Kees``. 
Dit is de output die we nu krijgen:
```
Een van de benodigde GET variabelen bestaat niet
```

## $_POST

De werking van deze variabele hebben we in het vorige hoofdstuk al kunnen aanschouwen. Kort gezegd bevat deze variabele de waarden die met behulp van een formulier gepost zijn. Een formulier met als method 'post' is tevens ook de enige manier om deze variabele te vullen.

In het vorige hoofdstuk staat een uitgebreid voorbeeld van de werking van deze superglobal, dus ik ga hier niet nog eens een voorbeeld geven. Wij gaan snel door met de volgende superglobal.

## $_SERVER
Ook van deze superglobal hebben we in het vorige hoofdstuk gebruik gemaakt. In deze variabele is informatie over de server en de manier waarop met de server gecommuniceerd is, opgeslagen. Laten we eens kijken wat we er allemaal in vinden:

```php
<?php
echo '<pre>'.print_r($_SERVER, true).'</pre>';
?>
```
Uitkomst:
```
Array
(
    [HTTP_HOST] => localhost
    [HTTP_USER_AGENT] => Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.8.1.11) Gecko/20071127 Firefox/2.0.0.11
    [HTTP_ACCEPT] => text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
    [HTTP_ACCEPT_LANGUAGE] => en-gb,en;q=0.5
    [HTTP_ACCEPT_ENCODING] => gzip,deflate
    [HTTP_ACCEPT_CHARSET] => ISO-8859-1,utf-8;q=0.7,*;q=0.7
    [HTTP_KEEP_ALIVE] => 300
    [HTTP_CONNECTION] => keep-alive
    [HTTP_COOKIE] => mtrack=119762117M1932826833; PHPSESSID=g5fiq9d9udq9vanpvuosb0dsn4
    [PATH] => C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\Program Files\ATI Technologies\ATI Control Panel;C:\Program Files\QuickTime\QTSystem\;C:\WINDOWS\Microsoft.NET\Framework\v2.0.50727
    [SystemRoot] => C:\WINDOWS
    [COMSPEC] => C:\WINDOWS\system32\cmd.exe
    [PATHEXT] => .COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH
    [WINDIR] => C:\WINDOWS
    [SERVER_SIGNATURE] => 
    [SERVER_SOFTWARE] => Apache/2.2.6 (Win32) PHP/5.2.5
    [SERVER_NAME] => localhost
    [SERVER_ADDR] => 127.0.0.1
    [SERVER_PORT] => 80
    [REMOTE_ADDR] => 127.0.0.1
    [DOCUMENT_ROOT] => C:/wamp/www/
    [SERVER_ADMIN] => webmaster@localhost
    [SCRIPT_FILENAME] => C:/wamp/www/index.php
    [REMOTE_PORT] => 4819
    [GATEWAY_INTERFACE] => CGI/1.1
    [SERVER_PROTOCOL] => HTTP/1.1
    [REQUEST_METHOD] => GET
    [QUERY_STRING] => 
    [REQUEST_URI] => /index.php
    [SCRIPT_NAME] => /index.php
    [PHP_SELF] => /index.php
    [REQUEST_TIME] => 1199267859
)
```
Ik zal niet elke waarde uit deze array bespreken, enkel de variabelen die je regelmatig gebruikt zal ik kort toelichten:

 - HTTP_HOST \
 Geeft de hostnaam weer. Bijvoorbeeld ``localhost`` of ``www.google.com``.
 - REMOTE_ADDR \
 Het ip adres van de bezoeker van het script.
 - DOCUMENT_ROOT \
 Geeft het pad waarin het script zich bevind, relatief vanaf de root van de server.
 - REQUEST_METHOD \
 Geeft de manier waarop de pagina is aangeroepen. Meestal ``GET`` of ``POST``.
 - REQUEST_URI \
 De url waarmee het script aangeroepen is, inclusief ``GET`` variabelen.
 - SCRIPT_NAME \
 De bestandsnaam van het uitgevoerde script.

De variabelen uit deze array gebruik je in de meeste gevallen om bijvoorbeeld te controleren of een formulier gepost is, te controleren hoe het script aangeroepen is, of om gegevens over de bezoeker te achterhalen. 
Meestal kun je variabelen uit deze array wel combineren tot een gewenst resultaat.

## $_SESSION
We hebben nu de werking van onder andere de ``$_GET`` en ``$_POST`` superglobal gezien, en hoe we daarmee variabelen van buitenaf in een script kunnen krijgen. Maar wellicht dat je je wel eens afgevraagd hebt of er niet een manier is om variabelen beschikbaar te maken op een pagina zonder dat je deze via een formulier verstuurd of in de url zet.

Dat is nou precies waar je binnen PHP een sessievariabele voor kunt gebruiken. Deze kun je aanmaken op pagina1 en vervolgens op pagina2 weer uitlezen. De voorwaarde is dat je elke pagina waarop je sessievariabelen wilt gebruiken, begint met ``session_start()``. Sessievariabelen worden tijdelijk opgeslagen op de server en zijn te gebruiken met de superglobal ``$_SESSION``.

```php
<?php
// Elke pagina waar we sessies gebruiken, beginnen met met session_start()
session_start();

// Declareren van sessievariabelen
$sNaam = 'Kees';
$_SESSION['naam'] = $sNaam;
$_SESSION['leeftijd'] = 42;
?>
```

```php
<?php
// Elke pagina waar we sessies gebruiken, beginnen met met session_start()
session_start();

// Uitlezen van de sessievariabele
echo 'Hoi '.$_SESSION['naam'].' jij bent '.$_SESSION['leeftijd'].' jaar';
?>
```
```
Hoi Kees jij bent 42 jaar
```
Een sessievariabele zal beschikbaar zijn, zolang de sessie nog actief is. Hoe lang dat is, is afhankelijk van de instellingen van de server. Het zou bijvoorbeeld 1 dag kunnen zijn, maar het is ook mogelijk dat de sessie bij het afsluiten van de browser al gesloten wordt.

In het volgende hoofdstuk zal ik dieper ingaan op het gebruik van sessievariabelen en zullen we een eerste loginscriptje schrijven.


## $_REQUEST

De laatste superglobal die ik wil bespreken is ``$_REQUEST``. Deze superglobal bevat een combinatie van de ``$_GET``. ``$_POST`` en ``$_COOKIE`` arrays. In plaats van een voorbeeld te geven, wil ik het gebruik van deze juist variabele afraden. 

Deze variabele heeft totaal geen meerwaarde boven de losse superglobals en kan alleen maar voor verwarring zorgen. Met deze superglobal weet je namelijk niet meer niet meer of een waarde nu uit de ``GET``, ``POST`` of ``COOKIE`` array afkomstig is. Naast onduidelijkheid kan dit ook **een potentieel veiligheidslek** met zich meebrengen. Gewoon niet gebruiken dus.

## Opdrachten
- 