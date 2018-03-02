package com.salesianos.alejandro.proyectolistview;

import android.app.Activity;
import android.content.Context;
import android.support.annotation.LayoutRes;
import android.support.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import android.widget.ListView;

import java.util.List;

/**
 * Created by alejandro on 27/9/17.
 */

public class MyArrayAdapter extends ArrayAdapter {
    Activity context;
    //Libros[] books;


    public MyArrayAdapter(@NonNull Activity context, Libros[] books) {
        super(context, R.layout.list_item_libro, books);
        //this.books = books;
        this.context = context;
    }

    /*
     * Formando parte del CV del ArrayAdapter está el método getView que se
     * ejecutará automáticamente tantas veces como elementos tenga el 3º
     * parámetro del método constructor.
     */

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = context.getLayoutInflater();
        View view = inflater.inflate(R.layout.list_item_libro, null);

        final TextView lblTitle = (TextView) view.findViewById(R.id.lblTitle);
        final TextView lblAuthor = (TextView) view.findViewById(R.id.lblAuthor);

        Libros b = (Libros) super.getItem(position);
        lblTitle.setText(b.getTitle());
        lblAuthor.setText(b.getAuthor());

        return view;
    }

}
