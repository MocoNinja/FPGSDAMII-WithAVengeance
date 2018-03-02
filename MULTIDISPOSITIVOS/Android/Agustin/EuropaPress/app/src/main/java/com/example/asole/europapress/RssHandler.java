package com.example.asole.europapress;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by asole on 18/10/2017.
 */

public class RssHandler extends DefaultHandler {
    private List<Noticia> noticias;
    private Noticia noticiaActual;
    private StringBuilder sbTexto;

    public List<Noticia> getNoticias() {
        return noticias;
    }

    @Override
    public void startDocument() throws SAXException {
        super.startDocument();
        noticias = new ArrayList<Noticia>();
        sbTexto = new StringBuilder();
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
        super.startElement(uri, localName, qName, attributes);
        if(localName.equals("item"))
            noticiaActual = new Noticia();
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        super.characters(ch, start, length);

        if(noticiaActual != null)
            sbTexto.append(ch, start, length);

    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        super.endElement(uri, localName, qName);

        if(noticiaActual != null){
            if(localName.equals("title"))
                noticiaActual.setTitulo(sbTexto.toString());
            else if(localName.equals("description"))
                noticiaActual.setDescripcion(sbTexto.toString());
            else if (localName.equals("pubdate"))
                noticiaActual.setFecha(sbTexto.toString());
            else if(localName.equals("category"))
                noticiaActual.setCategoria(sbTexto.toString());
            else if(localName.equals("item"))
                noticias.add(noticiaActual);

            sbTexto.setLength(0);
        }


    }
}
