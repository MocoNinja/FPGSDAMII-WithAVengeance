package com.salesianos.alejandro.proyectolistview;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class MainActivity extends AppCompatActivity {
    private Libros[] libros = {new Libros("El Quijote", "Cervantes"),
            new Libros("Cien años de soledad", "García Márquez"),
            new Libros("La metamorfosis", "Franz Kafka")};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ListView lvOpciones = (ListView) this.findViewById(R.id.lvOpciones);
        MyArrayAdapter myArrayAdapter = new MyArrayAdapter(this, libros);
        lvOpciones.setAdapter(myArrayAdapter);
    }
}
