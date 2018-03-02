package com.example.javier.a10combinado01;

import org.xml.sax.SAXException;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

/**
 * Created by javier on 9/11/17.
 */

public class XMLReader
{
    private URL url;

    public XMLReader(String url) throws MalformedURLException
    {
        this.url = new URL(url);
    }

    private InputStream getFlujoDatos() throws IOException
    {
        return url.openConnection().getInputStream();
    }

    public List<Menu> parseDatos() throws RuntimeException, ParserConfigurationException, SAXException, IOException
    {
        SAXParserFactory factory = SAXParserFactory.newInstance();
        SAXParser parser = factory.newSAXParser();
        XMLDecoder decoder = new XMLDecoder();
        InputStream flujo = getFlujoDatos();
        parser.parse(flujo, decoder);
        return decoder.getMenusLeidos();
    }
}
