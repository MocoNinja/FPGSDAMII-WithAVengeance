
package com.example.javier.a07largo1;

import android.app.Activity;
import android.support.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.List;

public class JaviAdapter extends ArrayAdapter {

    Activity contexto;

    public JaviAdapter(@NonNull Activity contexto, List<Noticia> noticias) {
        super(contexto, R.layout.noticia_layout, noticias);
        this.contexto = contexto;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {

        // inflar el xml

        LayoutInflater inflater = contexto.getLayoutInflater();
        View item = inflater.inflate(R.layout.noticia_layout, null);

        // Cargar los destinos

        final TextView destinoTitulo = (TextView) contexto.findViewById(R.id.titulo);
        final TextView destinoDescripcion= (TextView) contexto.findViewById(R.id.descripcion);
        final TextView destinoFecha= (TextView) contexto.findViewById(R.id.fecha);
        final TextView destinoCategoria= (TextView) contexto.findViewById(R.id.categoria);

        // Cargar los datos de la noticia
        Noticia noticia = (Noticia) super.getItem(position);

        String titulo = noticia.getTitulo();
        String descripcion = noticia.getDescripcion();
        String fecha = noticia.getFecha();
        String categoria = noticia.getCategoria();

        // Poner estos datos en los destinos

        destinoTitulo.setText(titulo);
        destinoDescripcion.setText(descripcion);
        destinoFecha.setText(fecha);
        destinoCategoria.setText(categoria);

        return item;
    }

}