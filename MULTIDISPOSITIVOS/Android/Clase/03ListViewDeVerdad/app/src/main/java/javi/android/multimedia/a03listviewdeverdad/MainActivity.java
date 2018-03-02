package javi.android.multimedia.a03listviewdeverdad;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ListView;


public class MainActivity extends AppCompatActivity {

    private Libro[] libros = {
            new Libro("Teo va al parque", "Anónimo"),
            new Libro("Cocina para 100 personas", "Alien"),
            new Libro("Cómo hacer pinchitos morunos", "Mimadre"),
            new Libro("Patatas", "patatamán"),
            new Libro("How to program a coffee machine", "unrusoaleatorio")
    };

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ListView opciones = (ListView) this.findViewById(R.id.lista);
        JaviAdapter adaptador = new JaviAdapter(this, libros);
        opciones.setAdapter(adaptador);
    }

}