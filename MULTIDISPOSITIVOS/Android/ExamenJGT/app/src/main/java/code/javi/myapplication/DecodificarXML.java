package code.javi.myapplication;

import android.graphics.Color;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by javier on 1/12/17.
 */

public class DecodificarXML extends DefaultHandler
{
    List<Rectangulo> rectangulos;
    Rectangulo puntero;
    private StringBuilder texto;
    private final String startTag = "Rectangulo";

    @Override
    public void startDocument() throws SAXException
    {
        super.startDocument();
        rectangulos = new ArrayList<>();
        texto = new StringBuilder();
        puntero = null;
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes)
            throws SAXException
    {
        super.startElement(uri, localName, qName, attributes);
        if (localName.equals(startTag)) puntero = new Rectangulo();
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException
    {
        super.characters(ch, start, length);
        if (puntero != null)
        {
            texto.append(ch, start, length);
        }
    }

    @Override
    public void endElement(String uri, String localName, String qName)
            throws SAXException
    {
        super.endElement(uri, localName, qName);
        if (puntero != null)
        {
            switch (localName)
            {
                // OJO: necesito usar.trim() para quitar el whitespace que parece que tiene el
                // archivo xml original porque me está dando error al parsear el dato si no lo uso!!
                case "posx":
                    Integer x = Integer.parseInt(texto.toString().trim());
                    puntero.setxXML(x);
                    break;
                case "posy":
                    Integer y = Integer.parseInt(texto.toString().trim());
                    puntero.setyXML(y);
                    break;
                case "ancho":
                    Integer ancho = Integer.parseInt(texto.toString().trim());
                    puntero.setAncho(ancho);
                    break;
                case "alto":
                    Integer alto = Integer.parseInt(texto.toString().trim());
                    puntero.setAlto(alto);
                    break;
                case "color":
                    String color = texto.toString().trim();
                    puntero.setColor(color);
                    break;
                // Terminar el rectangulo
                case startTag:
                    puntero.ensamblar();
                    rectangulos.add(puntero);
            }
            texto.setLength(0);
        }
    }

    public List<Rectangulo> getRekt()
    {
        return rectangulos;
    }
}
