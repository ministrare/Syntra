# AJAX: Music Search

### Overzicht
Het leerdoel van de oefening is om gebruik te maken van AJAX (asynchrone javascript) om gegevens op te halen en weer te geven en je maakt een eenvoudige youtube kloon met gegevens uit deze [API](https://musicdemons.com/api).

### Doelstellingen
Er zijn **twee belangrijke user stories** bij deze app:

* Een gebruiker kan zoeken naar artiesten op naam en deze worden weergegeven als een lijst, zodat de gebruiker het zoekresultaat kan zien.
* Een gebruiker kan op een zoekresultaat item klikken en het toont een lijst van gerelateerde youtube video's voor de gebruiker om te bekijken/luisteren


### Zoeken met autocomplete
Maak een zoekveld waarmee de gebruikers naar een artiest kunnen zoeken. De gebruiker ziet autoaanvullen suggesties op basis van zijn input.

* Neem een kijkje op de [API](https://musicdemons.com/api) en zoek naar de **autocomplete method**.
* Gebruik de gebruikers [input](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/search) om de autocomplete opties op te halen. Probeer de resultaten op uw console te loggen wanneer de gebruiker op enter drukt in het invoerveld.
* Geef vervolgens de opgehaalde gegevens weer in een klikbare lijst onder het zoekveld.

![search-feature](https://i.gyazo.com/c082c4ba5eb929a45ead06890554a24c.gif)

#### Selecteer een Artist
Nadat u een artiest uit de suggestielijst hebt geselecteerd, geeft u een lijst met video's van de geselecteerde artiest weer

* Vind de juiste methode om de nummers van een geselecteerde artiest op te halen in het [API](https://musicdemons.com/api).
* Probeer de gegevens van de geselecteerde artiest op de console te loggen.
* Maak dynamisch de lijst met video's.

![search-feature](https://i.gyazo.com/476d5da034d8b3ce8b108e9e3a2dae07.gif)

#### Online voorbeeld
[Example using fetch](https://thijs-lambert.github.io/AJAX-music-search/)


### Checklist

- [ ] Maak een autocomplete zoekopdracht met uw AJAX-kennis
- [ ] Toon de autoaanvullen opties in een aanklikbare lijst
- [ ] De gebruiker de mogelijkheid bieden om een artiest te selecteren
- [ ] De beschikbare youtube-video's van de geselecteerde artiest opvragen en weergeven
- [ ] Optioneel: met behulp van de YouTube-speler API toont u de tekst van het nummer dat wordt afgespeeld.

