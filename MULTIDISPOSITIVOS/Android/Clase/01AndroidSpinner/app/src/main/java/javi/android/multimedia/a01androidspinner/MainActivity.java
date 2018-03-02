package javi.android.multimedia.a01androidspinner;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Spinner spin = (Spinner) findViewById(R.id.desplegable);
        String[] palabrones = {"Salpichón", "Sandía", "Melacotones", "Fresones de Sri Lanka",
                "Nintendo Power Glove", "Elemento 4", "Bombero", "Ataque terrorista",
                "Tirar una cabra desde un campanario", "Fidget Spinner", "Caramelo"};

        List<String> listaPalabrones = new ArrayList();

        // Lista para los elementos del spinner
        ArrayAdapter<String> adapter;

        for (String string : palabrones){
            listaPalabrones.add(string);
        }
            // en stack overflow en vez de this, ponia getContext() o algo asi
        adapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, listaPalabrones);
        // adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spin.setAdapter(adapter);
    }
}
