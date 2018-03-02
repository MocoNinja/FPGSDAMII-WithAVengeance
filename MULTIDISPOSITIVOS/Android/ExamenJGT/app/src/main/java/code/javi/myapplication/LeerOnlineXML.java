package code.javi.myapplication;

import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

/**
 * Created by javier on 1/12/17.
 */

public class LeerOnlineXML
{
    private URL rssUrl;

    public LeerOnlineXML(String rssUrl)
    {
        try
        {
            this.rssUrl = new URL(rssUrl);
        }
        catch (MalformedURLException e)
        {
            throw new RuntimeException(e);
        }
    }

    public List<Rectangulo> parse()
    {
        SAXParserFactory factory = SAXParserFactory.newInstance();

        try
        {
            SAXParser parser = factory.newSAXParser();
            DecodificarXML handler = new DecodificarXML();
            InputStream a = abrirParaLectura();
            parser.parse(a, handler);
            return handler.getRekt();
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    private InputStream abrirParaLectura()
    {
        try
        {
            return rssUrl.openConnection().getInputStream();
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }
}
