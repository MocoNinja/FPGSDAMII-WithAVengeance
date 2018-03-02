package javi.androidlearn.customadaapter;

import android.app.Activity;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.List;

/**
 * Created by javier on 2/11/17.
 */

public class MahAdapter extends ArrayAdapter
{
    Activity context;
    TextView campoTitulo, campoAutor;
    LayoutInflater inflater;

    public MahAdapter(Activity context, List<Libro> libros)
    {
        super(context, R.layout.mahlibro, libros);
        this.context = context;
        inflater = context.getLayoutInflater();
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent)
    {
        View libroView = inflater.inflate(R.layout.mahlibro, null);

        campoAutor = (TextView) libroView.findViewById(R.id.autor);
        campoTitulo = (TextView) libroView.findViewById(R.id.titulo);

        Libro libroMostrar = (Libro) getItem(position);
        campoTitulo.setText(libroMostrar.getTitulo());
        campoAutor.setText(libroMostrar.getAutor());

        return libroView;
    }
}
