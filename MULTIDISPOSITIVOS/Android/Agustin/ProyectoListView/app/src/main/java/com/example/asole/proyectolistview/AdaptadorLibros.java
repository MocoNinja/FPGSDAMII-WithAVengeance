package com.example.asole.proyectolistview;

import android.app.Activity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

/**
 * Created by asole on 27/09/2017.
 */

public class AdaptadorLibros extends ArrayAdapter{
    Activity contexto;
    Libro datos[];
    AdaptadorLibros(Activity context, Libro datos[]){
        super(context, R.layout.listitem_libro, datos);
        contexto = context;
        this.datos = datos;
    }

    public View getView(int position, View convertView, ViewGroup parent){

        LayoutInflater inflater = contexto.getLayoutInflater();
        View item = inflater.inflate(R.layout.listitem_libro, null);

        TextView lblTitulo = (TextView) item.findViewById(R.id.lblTitulo);
        TextView lblAutor = (TextView) item.findViewById(R.id.lblAutor);

        lblTitulo.setText(datos[position].getTitulo());
        lblAutor.setText(datos[position].getAutor());

        return item;
    }


}
