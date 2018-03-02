package com.example.asole.androidspinner;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Spinner sp = (Spinner)findViewById(R.id.opciones);

        final String[] datos = {"Elemento1", "Elemento2", "Elemento3", "Elemento4", "Elemento5"};

        ArrayAdapter<String> adaptador = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, datos);

        sp.setAdapter(adaptador);
    }
}
