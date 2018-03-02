package com.example.javier.a07largo1;

import android.app.Activity;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ListView;

import java.util.List;

/**
 *  El programa va a leer datos de un xml de internet y a mostrarlo en la app con el formato adecuado
 *
 *  Las páginas webs tienen un archivo (generalmente llamado rss), que realmente es un xml
 *  La gracia del xml es crear nuestras propias marcas, pero el problema es que otro debe saber
 *  interpretarlas -> el otro la debe poder entender
 *  Para esto, debe haber una comunicacion previa emisor -> receptor para que este sepa leer las marcas
 *  y hacer lo que le salga
 *
 *  Ej.
 *  Se meten datos en texto plano
 *  La web lee estos datos
 *  Periódicamente se actualiza el texto -> la web se va actualizando
 *
 *  El texto plano va organizado con marcas que inventamos
 *  Creamos un programa que sepa leer nuestras marcas para que se muestre tó ahí bien pepino
 *
 *  Ej. real
 *  view-source:http://www.europapress.es/rss/rss.aspx
 *  Vemos las marcas -> podemos juankearlo para hacer nuestas movidas
 *
 *  Nuesto ejercicio -> mostrar las noticias de esta página
 *
 *  Vamos a usar el MVC
 *      -> Vamos a crear el modelo noticia, correspondiente a cada item
 *              ** Clase noticias con atributos correspondientes
 *      -> Vamos a crear una clase para que lea esto y vaya creando objetos de Noticia
 *              ** Esta clase extendera a una clase que ya existe: DefaultHandler
 *              ** RSSHandler manipula el RSS; tiene el ciclo de vida y tal, y blá blá blá
 *              ** Reimplementando sus métodos, leeremos y procesaremos el RSS
 *      -> Se mostrarán estos objetos por pantalla
 *
 *
 ****   PROGRAMACIÓN
 *
 *  Esta aplicación va a requerir permisos para leer la red
 *  Estos permisos están en AndroidManifest.xml
 *  Notar la línea añadida  (la 5)
 *
 **** PROGRAMACION CONCURRENTE
 *
 * Assembly, registers, toda la mandanga
 * Varios procesos pueden sobrescribir el mismo registro -> hay que evitar que se lien
 * Exclusion mutua -> ejecutar los procesos de uno en uno
 * Android -> CLASES ASÍNCRONAS: NO PERMITEN QUE VARIOS PROCESOS TOMEN A LA  VEZ LA CPU
 * La toma uno y para el otro
 *
 * Se exigen en el tratamiento de datos. Si no es asíncrono no funciona
 */

public class MainActivity extends AppCompatActivity
{
    List<Noticia> noticias;
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
        String URL2 = "http://212.170.237.10/rss/rss.aspx";
        new miTarea().execute(URL); // llama al doInBackground

    }


// vamos a crear una clase asincrona para tratar lo relacionado con datos
// mientras  se este ejecutando bloquea la cpu para el

    class miTarea extends AsyncTask<String, Float, Integer>
    {
        @Override
        protected Integer doInBackground(String... strings)
        {
            RSSParserSax lista = new RSSParserSax(strings[0]);
            noticias = lista.parse();

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
