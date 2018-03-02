package javi.androidlearn.customadaapter;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity
{

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        MahAdapter adapter = new MahAdapter(this, createLibros());
        ListView listaLibracos = (ListView) findViewById(R.id.listaLibracos);
        listaLibracos.setAdapter(adapter);
    }

    private List<Libro> createLibros()
    {
        String[] autores = {"Autor 1", "Autor 2"};
        String[] titulos = {"Título 1", "Título 2"};
        List<Libro> libros = new ArrayList<>();
        for (int i = 0; i < autores.length; i++){
            libros.add(new Libro(autores[i], titulos[i]));
        }
        return libros;
    }
}
