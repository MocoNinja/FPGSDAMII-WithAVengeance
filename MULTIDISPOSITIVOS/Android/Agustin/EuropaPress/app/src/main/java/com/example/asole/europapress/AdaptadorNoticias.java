package com.example.asole.europapress;

import android.app.Activity;
import android.content.Context;
import android.support.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.List;

/**
 * Created by asole on 25/10/2017.
 */

public class AdaptadorNoticias extends ArrayAdapter {
    Activity activity;
    List<Noticia> lista;
    public AdaptadorNoticias(Activity context, List<Noticia> lista) {
        super(context, R.layout.distribucion, lista);
        activity = context;
        this.lista = lista;
    }

    @NonNull
    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = activity.getLayoutInflater();
        View view = inflater.inflate(R.layout.distribucion, null);

        TextView etiqTitulo = (TextView)view.findViewById(R.id.lblTitulo);
        etiqTitulo.setText(lista.get(position).getTitulo());

        TextView etiqDescripcion = (TextView)view.findViewById(R.id.lblDescripcion);
        etiqDescripcion.setText(lista.get(position).getDescripcion());

        return view;
    }
}
