package com.example.asole.datossqlite;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        UsuariosSQLite usuariosSQLite = new UsuariosSQLite(this, "DBUsuarios", null, 1);

        SQLiteDatabase db = usuariosSQLite.getWritableDatabase();

        db.execSQL("DELETE FROM Usuarios");

        for (int i=0; i<5; i++)
            db.execSQL("INSERT INTO Usuarios (codigo, nombre) VALUES (" + i +", 'Usuario" + i + "')");


        Cursor cursor = db.rawQuery("select * from Usuarios", null);

        List<String> personas = new ArrayList<String>();


        if(cursor.moveToFirst()) {
            do {
                String usuario = "";
                usuario += cursor.getInt(0) + " - ";
                usuario += cursor.getString(1);
                personas.add(usuario);
            } while (cursor.moveToNext());
        }

        String[] campos = new String[] {"codigo", "nombre"};
        String[] argumentos = new String[] {"2", "4"};
        Cursor cursor2 = db.query("Usuarios", campos, "codigo=? or codigo=?", argumentos, null, null, null);

        if(cursor2.moveToFirst()) {
            do {
                String usuario = "";
                usuario += cursor2.getInt(0) + " - ";
                usuario += cursor2.getString(1);
                personas.add(usuario);
            } while (cursor2.moveToNext());
        }

        ListView listView = (ListView)findViewById(R.id.lista);

        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, personas);

        listView.setAdapter(adapter);

        db.close();

    }
}
