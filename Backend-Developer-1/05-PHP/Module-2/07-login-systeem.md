# Login Systeem

## Inhoudsopgaven
- [Overzicht](#overzicht)
= [Doelstellingen](#doelstellingen)
= [Opdracht 1](#opdracht-1)
= [De Php](#de-php)

## Overzicht
Aan het einde van de les ben je in staat om een login systeem te maken waarbij de gebruikersnaam en wachtwoord eerst worden vergeleken met variables, om in een latere les dit login systeem te koppelen met een database.

## Doelstellingen
 - Een formulier controleren aan de hand van vooropgemaakte variabelen.
 - Voorbereiding voor een login systeem aan de hand van een database.

## Opdracht

- Maak een HTML pagina bestaand uit een form met minimaal 2 labels en invoer velden voor het login systeem. Denk hierbij aan een email adres en wachtwoord.
Voorzie ook een submoit button

- Maak een welkom pagina, die alleen mag getoond mag worden zodra de gebruiker is ingelogd.

- Pas eventueel Boostrap toe voor de opmaak.

## De Php

Voeg aan de index.php, nog voor de html begint, het volgende toe:

...
<?php

session_start();

$error = isset($_SESSION['error']) ? $_SESSION['error'] : false;

session_destroy();

?>
```php

Hiermee sluiten we onze php sessie af, zodra we ons uitloggen of er tijdens het inloggen iets fout gaat. De ``$error`` dient om in de toekomst een foutmelding te kunnen weergeven zodra onze inlog systeem een fout registreerd.