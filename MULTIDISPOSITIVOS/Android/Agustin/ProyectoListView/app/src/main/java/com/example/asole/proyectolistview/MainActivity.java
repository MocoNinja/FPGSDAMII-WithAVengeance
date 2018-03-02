package com.example.asole.proyectolistview;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ListView;

public class MainActivity extends AppCompatActivity {

    private Libro[] libros = {new Libro("El Quijote", "Cervantes"),
                            new Libro("Cien años de soledad", "García Márquez"),
                            new Libro("Platero y yo", "J.J. Jiménez"),
                            new Libro("La ciudad y los perros", "Vargas Llosa"),
                            new Libro("El obsceno pájaro de la noche", "José Donoso")};

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ListView opciones = (ListView)findViewById(R.id.lstOpciones);
        AdaptadorLibros adaptador = new AdaptadorLibros(this, libros);
        opciones.setAdapter(adaptador);

    }
}
