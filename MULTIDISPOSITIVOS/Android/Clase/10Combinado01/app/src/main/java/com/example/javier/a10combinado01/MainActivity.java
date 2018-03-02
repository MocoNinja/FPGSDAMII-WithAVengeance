package com.example.javier.a10combinado01;

import android.app.Activity;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ListView;

import org.xml.sax.SAXException;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import javax.xml.parsers.ParserConfigurationException;

public class MainActivity extends AppCompatActivity
{
    List<Menu> noticias;
    ListView opciones;
    Activity main;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        main = this;
        setContentView(R.layout.activity_main);
        opciones = (ListView) findViewById(R.id.lista);
        String URL = "http://www.europapress.es/rss/rss.aspx";
        new miTarea().execute(URL); // llama al doInBackground
    }

    class miTarea extends AsyncTask<String, Float, Integer>
    {
        @Override
        protected Integer doInBackground(String... strings)
        {
            XMLReader lista = null;
            try {
                lista = new XMLReader(strings[0]);
            } catch (MalformedURLException e) {
                e.printStackTrace();
            }
            try {
                noticias = lista.parseDatos();
            } catch (ParserConfigurationException e) {
                e.printStackTrace();
            } catch (SAXException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

            publishProgress(250f); // el update por asi decirlo

            return null;


        }

        @Override
        protected void onProgressUpdate(Float... values)
        {
            super.onProgressUpdate(values);
            JaviAdapter adaptador = new JaviAdapter(main, noticias);
            opciones.setAdapter(adaptador);
        }
    }
}
