package com.example.javier.a07largo1;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.util.ArrayList;
import java.util.List;

/**
 * Objetivo de la clase: cargar una serie de noticias en una lista
 *
 * Leer el xml ->
 * Crear un objeto noticia de ese xml ->
 * Meterlo en la lista ->
 * Repeat
 */

public class RSSHandler extends DefaultHandler
{
    private List<Noticia> noticias;
    private Noticia noticiaActual;
    private StringBuilder subTexto; // Esta clase permite crear Strings 'mejorados'. Investigar si interesa
    // Aunque agustín no lo ha explicado así, piensa en ellas como Strings que pueden crecer dinámicamente,
    // que algo sí que he leído, pero no worries

    // Este método se ejecuta una sóla vez
    @Override
    public void startDocument () throws SAXException
    {
        super.startDocument();
        noticias = new ArrayList<>();
        subTexto = new StringBuilder();
    }

    // Este método se ejecuta una vez por cada elemento (cada vez que vea una marca de *apertura*)

    // el localName que se le pasa es el nombre del tag;
    // En nuestro xml, cada noticia está englobada en <item></item>

    @Override
    public void startElement (String uri, String localName, String qName, Attributes attributes) throws SAXException
    {
        super.startElement(uri, localName, qName, attributes);

        if(localName.equals("item")) {
            noticiaActual = new Noticia();
        }
    }

    // Este método es el que lee el texto *dentro* de las tags -> se ejecuta después del método anterior

    @Override
    public void characters (char[] ch, int start, int length) throws SAXException
    {
        super.characters(ch, start, length);
        // ch -> lo que se lee. Está en un vector de carácteres en vez de en otro tipo de dato
        // porque lo hicieron asi. Es lo que necesita el Stringbuilder, así que all pepino
        // start -> donde empieza
        // length -> hasta donde ocupa
        // es decir, creamos un String con el contenido de la marca. Y .
        if (noticiaActual != null) subTexto.append(ch, start, length);
    }

    // Este método se ejecuta una vez por cada elemento (cada vez que vea la marca de *cierre*)

    @Override
    public void endElement (String uri, String localName, String qName) throws SAXException {
        super.endElement(uri, localName, qName);

        if (noticiaActual != null){

            // Si se ejecuta esto, es que estamos en la marca item o en una de sus internas

            /**
             **************** LÓGICA DEL PROCESO ****************
             *
             * Si estamos aquí, es que acaba de leer una marca de las que nos interesa
             * (titulo, descripcion, ...)
             * Entonces, el método anterior ha cargado en el StringBuilder lo que había en la marca
             * Así que a la noticia que estamos haciendo, le metemos la información
             * y plás.
             *
             * Nota: no olvidarse del toString() porque un StringBuilder NO es un String y
             * nuestra clase tiene como atributos Strigs !!
             *
             */

            if (localName.equals("title")) noticiaActual.setTitulo(subTexto.toString());
            else if (localName.equals("description")) noticiaActual.setTitulo(subTexto.toString());
            else if (localName.equals("pubdate")) noticiaActual.setFecha(subTexto.toString());
            else if (localName.equals("category")) noticiaActual.setCategoria(subTexto.toString());

            // Esto puede que esté mal *diseñado* porque a veces hay varias categorías. Dice que se la pela.
            // Esto guardará la última.
            // Y pravo.

            // No olvidar detectar el fin de la noticia !!
            else if (localName.equals("item")) noticias.add(noticiaActual);

            subTexto.setLength(0); // Esto vacía el texto cada vez que se lee para que se cargue
                            // el siguiente sin problemas, para que no lo acumule en cada ciclo
        }
    }

    public List<Noticia> getNoticias()
    {
        return noticias;
    }
}
