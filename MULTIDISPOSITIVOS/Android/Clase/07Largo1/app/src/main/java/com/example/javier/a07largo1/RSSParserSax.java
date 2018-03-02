package com.example.javier.a07largo1;

import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

/**
 * Sax es un método de lectura de xml de los que existen. Lo llamamos así porque da la gana,
 * pero por saberlo
 *
 * Los datos del Handler va a haber que leerlos
 * Esta clase va a leer el xml que queremos convertir en objetos noticias
 *
 */

public class RSSParserSax
{
    private URL rssUrl;

    public RSSParserSax(String rssUrl)
    {
        // Hay que leer url que puede estar caída, meterse mal, etc...
        // Se *exige* tratamiento de excepciones

        try {
            this.rssUrl = new URL(rssUrl);
        }
        catch (MalformedURLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Noticia> parse()
    {
        // Hay que coger el archivo y convertirlo en un objeto de java para jugar con él

        // Rollo raro de Java
        SAXParserFactory factory = SAXParserFactory.newInstance();

        try{
            // El parser digamos que es lo que realmente lee el archivo
            SAXParser parser = factory.newSAXParser();
            // Mientras que esto que hemos creado es más o menos el *cómo* leer el archivo
            RSSHandler handler = new RSSHandler();
            // Para que inicie el ciclo de vida de nuestro RSSHandler es necesario
            // que este parser lo parsee con el InputStream que creamos en nuestro método
            InputStream a = abrirParaLectura();
            parser.parse(a, handler);
            return handler.getNoticias();
        }
        catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    private InputStream abrirParaLectura() {

        // Este método lo creamos para conectarse a la dirección que le pasamos
        // Y coge el flujo de lectura para poder leer de él el archivo
        // ~~ "ABRE EL ARCHIVO PARA LECTURA"

        try{
            return rssUrl.openConnection().getInputStream();
        }
        catch (Exception e){
            throw new RuntimeException(e);
        }
    }
}
