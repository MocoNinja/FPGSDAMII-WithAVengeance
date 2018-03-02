package com.example.javier.a10combinado01;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by javier on 9/11/17.
 */

public class XMLDecoder extends DefaultHandler
{
    private List<Menu> menusLeidos;
    private Menu punteroMenu;
    private StringBuilder texto;
    private final String TAG = "Dia";

    public List<Menu> getMenusLeidos() {
        return menusLeidos;
    }

    @Override
    public void startDocument() throws SAXException {
        super.startDocument();
        menusLeidos = new ArrayList<>();
        texto = new StringBuilder();
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
        super.startElement(uri, localName, qName, attributes);
        if (localName.equals(TAG)) punteroMenu = new Menu();
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        super.characters(ch, start, length);
        if (punteroMenu != null) texto.append(ch, start, length);
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        super.endElement(uri, localName, qName);
        if (punteroMenu != null){
            switch (localName){
                case "id":
                    punteroMenu.setId(Integer.parseInt(texto.toString()));
                    break;
                case "Plato_1":
                    punteroMenu.setPlato_1(texto.toString());
                    break;
                case "Plato_2":
                    punteroMenu.setPlato_2(texto.toString());
                    break;
                case "Postre":
                    punteroMenu.setPostre(texto.toString());
                    break;
                case "Fecha":
                    punteroMenu.setFecha(texto.toString());
                    break;
                case TAG:
                    menusLeidos.add(punteroMenu);
                    break;
                default:
            }
            texto.setLength(0);
        }
    }
}
