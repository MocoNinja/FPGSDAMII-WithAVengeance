package com.example.javier.a10combinado01;

import android.app.Activity;
import android.widget.ArrayAdapter;
import android.support.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import java.util.List;

public class JaviAdapter extends ArrayAdapter {

    Activity contexto;

    public JaviAdapter(@NonNull Activity contexto, List<Menu> noticias) {
        super(contexto, R.layout.menu_view, noticias);
        this.contexto = contexto;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {

        // inflar el xml

        LayoutInflater inflater = contexto.getLayoutInflater();
        View item = inflater.inflate(R.layout.menu_view, null);

        // Cargar los destinos

        final TextView destinoID= (TextView) item.findViewById(R.id.textoID);
        final TextView destinoPlato1 = (TextView) item.findViewById(R.id.Plato_1);
        final TextView destinoPlato2 = (TextView) item.findViewById(R.id.Plato_2);
        final TextView destinoPostre = (TextView) item.findViewById(R.id.Postre);
        final TextView destinoFecha= (TextView) item.findViewById(R.id.Fecha);


        // Cargar los datos de la noticia
        Menu menu = (Menu) super.getItem(position);

        Integer titulo = menu.getId();
        String plato1 = menu.getPlato_1();
        String plato2 = menu.getPlato_2();
        String fecha = menu.getFecha();
        String postre = menu.getPostre();

        // Poner estos datos en los destinos

        if (destinoID != null) destinoID.setText(titulo);
        if (destinoPlato1 != null) destinoPlato1.setText(plato1);
        if (destinoPlato2 != null) destinoPlato2.setText(plato2);
        if (destinoFecha != null) destinoFecha.setText(fecha);
        if (destinoPostre != null) destinoPostre.setText(postre);

        return item;
    }

}