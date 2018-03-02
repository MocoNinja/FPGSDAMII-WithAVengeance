package learn.javi.myapplication;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Javier on 30/11/2017.
 */

public class DecodificarCDXML extends DefaultHandler
{
    List<CD> CDs;
    CD puntero;
    private StringBuilder texto;
    private final String startTag = "CD";

    @Override
    public void startDocument() throws SAXException
    {
        super.startDocument();
        CDs = new ArrayList<>();
        texto = new StringBuilder();
        puntero = null;
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
        super.startElement(uri, localName, qName, attributes);

        if (localName.equals(startTag)) puntero = new CD();
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        super.characters(ch, start, length);
        if (puntero != null)
        {
            texto.append(ch, start, length);
        }
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        super.endElement(uri, localName, qName);
        if (puntero != null)
        {
            switch (localName){
                case "TITLE":
                    puntero.setTitulo(texto.toString());
                    break;
                case "ARTIST":
                    puntero.setArtista(texto.toString());
                    break;
                case "COUNTRY":
                    puntero.setPasis(texto.toString());
                    break;
                case "PRICE":
                    puntero.setPrecio(texto.toString());
                    break;
                case "YEAR":
                    puntero.setAnyo(texto.toString());
                    break;
                case "COMPANY":
                    puntero.setCompanyia(texto.toString());
                    break;
                case startTag:
                    CDs.add(puntero);
            }
            texto.setLength(0);
        }
    }

    public List<CD> getCDs()
    {
        return CDs;
    }
}
