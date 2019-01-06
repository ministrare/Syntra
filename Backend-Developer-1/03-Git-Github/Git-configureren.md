# Git configureren

## Inhoud
 - [Git: Configureren](#Git-Configureren)
   - [SSH-Key](#SSH-Key)
     - [Genereren voor Windows](#Genereren-voor-Windows)
     - [Genereren voor Mac](#Genereren-voor-Mac)
     - [Genereren voor Linux](#Genereren-voor-Linux)
   - [Globale User Instellingen](#Globale-User-Instellingen)
 

## Git: Configureren
### SSH-Key
Een SSH-key kan je vergelijken met een vinger afdruk van uw computer. Die vingerafdruk kan gebruikt worden om via de terminal of commandline automatisch herkent te worden en zo niet telkens opnieuw uw login gegevens van Github te moeten ingeven elke keer als u uw data wilt opslaan op Github.

#### Genereren voor Windows

1. Open je Terminal/cmd.
1. Kopieer en plak de onderstaande tekst in je terminal. \
   Wijzig **“your_email@example.com”** naar het e-mailadres van je GitHub-account en druk op Enter. \
   Deze commando maakt een SSH-key aan die gelinkt is aan je e-mailadres.
   ```windows
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com" 
   ```
1. Wanneer u wordt gevraagd om “Enter a file in which to save the key”, drukt u op Enter. \
Hiermee accepteert u de standaard bestandslocatie.
1. Bij de melding: Enter a file in which to save the key (/c/Users/user_name/.ssh/id_rsa): [Laat dit veld leeg en druk op Enter]
1. Bij de melding: Enter passphrase (empty for no passphrase): [Laat dit veld leeg en druk op Enter]
1. Bij de melding: Enter same passphrase again: [Laat dit veld leeg en druk op Enter]
1. Zoek via de explorer naar de verborgen .ssh-map, open het bestand in uw favoriete teksteditor en kopieer de inhoud.
1. In de browser, op de website van github Klikt u in de rechterbovenhoek van elke pagina op uw profielfoto en klik vervolgens op Settings.
1. Klik in de zijbalk met gebruikersinstellingen op de SSH- en GPG keys.
1. Klik op de button: New SSH Key of Add SSH key.
1. Voeg in het veld “Title” een beschrijvend label toe voor de nieuwe sleutel.
1. Als je bijvoorbeeld een Mac gebruikt, kun je deze “Personal MacBook Air” noemen.
1. Plak je sleutel in het veld “Key”.
1. Klik Add SSH key.
1. Indien gevraagd word geeft u uw Github wachtwoord in en u bent klaar!

#### Genereren voor Mac
1. Open je Terminal.
1. Kopieer en plak de onderstaande tekst in je terminal. \
   Wijzig **“your_email@example.com”** naar het e-mailadres van je GitHub-account en druk op Enter. \
   Deze commando maakt een SSH-key aan die gelinkt is aan je e-mailadres.
   ```
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com" 
   ```
1. Wanneer u wordt gevraagd om “Enter a file in which to save the key”, drukt u op Enter. \
Hiermee accepteert u de standaard bestandslocatie.
1. Bij de melding: Enter a file in which to save the key (/c/Users/user_name/.ssh/id_rsa): [Laat dit veld leeg en druk op Enter]
1. Bij de melding: Enter passphrase (empty for no passphrase): [Laat dit veld leeg en druk op Enter]
1. Bij de melding: Enter same passphrase again: [Laat dit veld leeg en druk op Enter]
1. Kopieer en plak de onderstaande tekst in je terminal. Deze commando kopieert de inhoud van het id_rsa.pub bestand naar uw klembord
   ```
   pbcopy < ~/.ssh/id_rsa.pub 
   ```
1. In de browser, op de website van github Klikt u in de rechterbovenhoek van elke pagina op uw profielfoto en klik vervolgens op **Settings**.
1. Klik in de zijbalk met gebruikersinstellingen op de **SSH- en GPG keys**.
1. Klik op de button: **New SSH Key** of **Add SSH key**.
1. Voeg in het veld “Title” een beschrijvend label toe voor de nieuwe sleutel. \
Als je bijvoorbeeld een Mac gebruikt, kun je deze “Personal MacBook Air” noemen.
1. Plak je sleutel in het veld “Key”.
1. Klik **Add SSH key**.
1. Indien gevraagd word geeft u uw Github wachtwoord in en u bent klaar!

#### Genereren voor Linux
1. Open je Terminal.
1. Kopieer en plak de onderstaande tekst in je terminal. \
Wijzig “your_email@example.com” naar het e-mailadres van je GitHub-account en druk op Enter. \
Deze commando maakt een SSH-key aan die gelinkt is aan je e-mailadres.
   ```
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com" 
   ```
1. Wanneer u wordt gevraagd om “Enter a file in which to save the key”, drukt u op Enter. Hiermee accepteert u de standaard bestandslocatie.
1. Bij de melding: Enter a file in which to save the key (/c/Users/user_name/.ssh/id_rsa): [Laat dit veld leeg en druk op Enter]
1. Bij de melding: Enter passphrase (empty for no passphrase): [Laat dit veld leeg en druk op Enter]
1. Bij de melding: Enter same passphrase again: [Laat dit veld leeg en druk op Enter]
1. Installeer xclip via de volgende commando:
   ```
   sudo apt-get install xclip 
   ```
1. Kopieer en plak de onderstaande tekst in je terminal. \
Deze commando kopieert de inhoud van het id_rsa.pub bestand naar uw klembord
   ```
   xclip -sel clip < ~/.ssh/id_rsa.pub 
   ```
1. In de browser, op de website van github Klikt u in de rechterbovenhoek van elke pagina op uw profielfoto en klik vervolgens op **Settings**.
1. Klik in de zijbalk met gebruikersinstellingen op de **SSH- en GPG keys**.
1. Klik op de button: **New SSH Key** of **Add SSH key**.
1. Voeg in het veld “Title” een beschrijvend label toe voor de nieuwe sleutel. \
Als je bijvoorbeeld een Mac gebruikt, kun je deze “Personal MacBook Air” noemen.
1. Plak je sleutel in het veld “Key”.
1. Klik Add **SSH key**.
1. Indien gevraagd word geeft u uw Github wachtwoord in en u bent klaar!

### Globale User Instellingen
Om er voor te zorgen dat u zowel lokaal als online juist geindentificeerd kan worden is het belangrijk om uw globale instellingen aan te passen voordat uw git volledig kan gebruiken. Dit kunt u in uw terminal of CMD doen via de volgende 2 commando`s. Vergeet niet de naam en email adres aan te passen met uw volledige naam en de email adres die u gebruikt heeft tijdens het aanmaken van uw Github account voordat u op enter drukt.

```terminal
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```