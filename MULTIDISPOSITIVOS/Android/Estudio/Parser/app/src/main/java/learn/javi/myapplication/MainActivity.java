package learn.javi.myapplication;

import android.app.Activity;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.GridView;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {


    List<CD> cds;
    Activity main;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        main = this;
        String URL = "https://www.w3schools.com/xml/cd_catalog.xml";
        new miTarea().execute(URL); // llama al doInBackground
    }


    private List<CD> generarCDsAleatorios()
    {
        List<CD> CDs = new ArrayList<>();
        String[] titulos = {"CD1", "CD2", "CD3", "CD4", "CD5"};
        String [] artistas = {"ar1", "ar2", "ar3", "ar4", "ar5"};
        String [] paises = {"España", "UK", "USA", "Rusia", "Japón"};
        String [] companyia = {"c1", "c2", "c3", "c4", "c5"};
        String [] precios = {"69", "68", "78", "23", "12"};
        String [] anyos = {"1212", "9183", "1230", "3947", "2372"};

        for (int i = 0; i < titulos.length; i++)
            CDs.add(new CD(titulos[i], artistas[i], paises[i], companyia[i], precios[i], anyos[i]));
        return CDs;
    }


    class miTarea extends AsyncTask<String, Float, Integer>
    {
        @Override
        protected Integer doInBackground(String... strings)
        {
            LeerOnlineXML lista = new LeerOnlineXML(strings[0]);
            cds = lista.parse();

            publishProgress(250f); // el update por asi decirlo

            return null;

        }

        @Override
        protected void onProgressUpdate(Float... values)
        {
            super.onProgressUpdate(values);
            CDAdapter adaptador = new CDAdapter(main, cds);
            GridView l = findViewById(R.id.listilla);
            l.setAdapter(adaptador);
        }
    }

}

