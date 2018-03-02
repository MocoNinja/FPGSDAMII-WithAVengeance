package com.example.asole.europapress;

import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.GridView;
import android.widget.ListView;

import java.util.List;

public class MainActivity extends AppCompatActivity {
    ListView lista;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        lista = (ListView) findViewById(R.id.lista);

        new miTarea().execute("http://212.170.237.10/rss/rss.aspx");
    }


    public class miTarea extends AsyncTask<String, Float, Integer>{
        List<Noticia> noticias;

        @Override
        protected Integer doInBackground(String... params){
            RssParserSax sax = new RssParserSax(params[0]);

            noticias = sax.parse();

            publishProgress(250f);

            return null;
        }

        @Override
        protected void onProgressUpdate(Float... values) {
            AdaptadorNoticias adaptador = new AdaptadorNoticias(MainActivity.this, noticias);
            lista.setAdapter(adaptador);
        }
    }



}
