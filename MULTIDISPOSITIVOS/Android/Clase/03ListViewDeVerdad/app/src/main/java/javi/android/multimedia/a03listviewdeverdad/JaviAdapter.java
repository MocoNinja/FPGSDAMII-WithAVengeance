package javi.android.multimedia.a03listviewdeverdad;

import android.app.Activity;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

/**
 * Created by javier on 27/09/17.
 */

public class JaviAdapter extends ArrayAdapter {

    Activity contexto;
    // private Libro[] libros; // gitGud n00b

    public JaviAdapter(@NonNull Activity contexto, Libro[] libros) {
        super(contexto, R.layout.listitem_libraco, libros);
        this.contexto = contexto;
        // this.libros = libros;
    }

    // Hay un método del ciclo de vida del ArrayAdapter que se ejecuta sólo tantas veces como elementos tenga el tercer parámetro
    // del constructor -> El método es: getView()

    ;

    /*
     * @position: el elemento iterado del vector de libros, en este caso
     * @convertView: no lo vamos a utilizar
     * @parent: Tampoco lo vamos a utilizar
     * Me se han creado los @NonNull y @Nullable al autollamar al método
     * https://developer.android.com/reference/android/support/annotation/NonNull.html
     * https://developer.android.com/reference/android/support/annotation/Nullable.html
     * Resumen:
     * @NonNull -> No dejar que sea null
     * @Nullable -> Dejar que sea null
     */

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {

        // Hay que cargar esto en un View, que debe crearse a partir de nuestro xml
        // Necesitamos convertir ese archivo de texto a un objeto
        // Esto se denomina 'inflar'

        LayoutInflater inflater = contexto.getLayoutInflater(); // Creamos el inflador
        View item = inflater.inflate(R.layout.listitem_libraco, null); // Pasamos null porque no necesitamos el segundo parámetro
        // Con esto hemos conseguido que el xml sea un objeto de Java/Android de la clase Vista

        final TextView destinoTitulo = (TextView) contexto.findViewById(R.id.rabo);
        final TextView destinoAutor = (TextView) contexto.findViewById(R.id.rabo2);

        Libro libro = (Libro) super.getItem(position);
        String titulo = libro.getAutor();
        String autor = libro.getTitulo();

        destinoAutor.setText(autor);
        destinoTitulo.setText(titulo);
        return item;
    }

}