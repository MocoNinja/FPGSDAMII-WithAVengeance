package javi.androidlearn.elementosinicio;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.GridView;
import android.widget.ListView;
import android.widget.Spinner;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ListView lista = (ListView) findViewById(R.id.listica);
        Spinner spinner = (Spinner) findViewById(R.id.spinner);
        GridView gview = (GridView) findViewById(R.id.gridView);
        cargarListaLista(lista);
        cargarSpinnerLista(spinner);
        cargarGridViewLista(gview);
    }

    private void cargarListaString(ListView lista)
    {
        String[] cosas = {"Cosa 1", "Cosa 2", "Cosa 3", "Cosa 4"};
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, R.layout.support_simple_spinner_dropdown_item, cosas);
        lista.setAdapter(adapter);
    }

    private void cargarSpinnerString(Spinner spinner)
    {
        String[] cosas = {"Cosa 1", "Cosa 2", "Cosa 3", "Cosa 4"};
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, R.layout.support_simple_spinner_dropdown_item, cosas);
        spinner.setAdapter(adapter);
    }

    private void cargarGridViewString(GridView gv)
    {
        String[] cosas = {"Cosa 1", "Cosa 2", "Cosa 3", "Cosa 4"};
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, R.layout.support_simple_spinner_dropdown_item, cosas);
        gv.setAdapter(adapter);
    }

    private void cargarListaLista(ListView lista)
    {
        String[] cosas = {"Cosa 1", "Cosa 2", "Cosa 3", "Cosa 4"};
        List<String> elementos = new ArrayList<>();
        for (String string : cosas) elementos.add(string);
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, R.layout.support_simple_spinner_dropdown_item, elementos);
        lista.setAdapter(adapter);
    }

    private void cargarSpinnerLista(Spinner spinner)
    {
        String[] cosas = {"Cosa 1", "Cosa 2", "Cosa 3", "Cosa 4"};
        List<String> elementos = new ArrayList<>();
        for (String string : cosas) elementos.add(string);
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, R.layout.support_simple_spinner_dropdown_item, elementos);
        spinner.setAdapter(adapter);
    }

    private void cargarGridViewLista(GridView gv)
    {
        String[] cosas = {"Cosa 1", "Cosa 2", "Cosa 3", "Cosa 4"};
        List<String> elementos = new ArrayList<>();
        for (String string : cosas) elementos.add(string);
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, R.layout.support_simple_spinner_dropdown_item, elementos);
        gv.setAdapter(adapter);
    }
}
