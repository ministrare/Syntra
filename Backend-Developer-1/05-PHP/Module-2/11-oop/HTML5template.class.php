<?php

class HTML5template
{
    protected $sCharset = 'UTF-8';
    protected $sLanguage = 'nl-NL';

    private $sPageTitle = 'Example.com';

    public function __construct($titel = null)
    {
        //Pagina titel aanpassen indien meegegeven
        if(isset($titel)){
            $this->sPageTitle = $titel;
        }

        // HTTP-compressie aanzetten voor snelheid verhoging
        ob_start('ob_gzhandler');
        // HTTP-header voor de taal van de content
        header('Content-Language: '. $this->sLanguage);
        // HTTP-header voor HTML plus de karakterset
        header('Content-Type: text/html; charset='. $this->sCharset);

        // Begin van de HTMLCode
        echo '<!DOCTYPE html>'."\n\r";
        echo '<html lang="'.$this->sLanguage.'">'."\n\r";
        // Begin van de head container
        echo '<head>'."\n\r";
        echo '<meta charset="'.$this->sCharset.'">'."\n\r";
        echo '<meta http-equiv="Content-Language" content="'.$this->sLanguage.'">'."\n\r";
        echo '<meta http-equiv="Content-Type" content="text/html; charset='.$this->sCharset.'">'."\n\r";
        echo '<meta name="viewport" content="width=device-width, initial-scale=1.0">'."\n\r";

        echo '<title>'.$this->sPageTitle.'</title>'."\n\r";

        echo '<meta name="robots" content="index,follow">'."\n\r";
        echo '<link href="css/main.css" rel="stylesheet" type="text/css">'."\n\r";
        echo '</head>'."\n\r";
        echo '<body lang="'.$this->sLanguage.'">'."\n\r";

        // Responsebuffers flushen
        ob_flush();
        flush();
    }


    public function __destruct()
    {
        // begin van het einde
        echo '<script src="scripts/main.js" type="text/javascript"></script>'."\n\r";

        echo '</body>'."\n\r";
        echo '</html>'."\n\r";

        // Responsebuffers flushen
        ob_flush();
        flush();
    }
}