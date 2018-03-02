package com.example.javier.a12leerarchivostexto;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
package com.example.javier.a12leerarchivostexto;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.widget.GridView;
import android.widget.ListView;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity
{
    /**
     * Los archivos generales se guardan en assets
     * Vamos a tener un archivo de texto
     * Cada línea será una sentencia Insert de SQL
     * Iremos leyendo y ejecutando línea a línea
     * Objetos: Foto, audio y nombre
     */

    // InputStream -> lo queremos para LEER
    InputStream flujoArchivillo;
    AlumnosSQLiteHelper bbdd;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        bbdd = new AlumnosSQLiteHelper(this, "DBalumnos", null, 1);
        SQLiteDatabase bd = bbdd.getWritableDatabase();
        List<Alumno> alumnos = new ArrayList<>();
        bd.execSQL("DELETE FROM Alumnos");
        try {

            // getAssets(); // Devuelve lo que hay dentro de los assets que hemos creado
            flujoArchivillo = getAssets().open("SentenciasSQL.txt");

            // Usamos esto porque la siguiente clase espera recibir un objeto de este tipo
            InputStreamReader conversor = new InputStreamReader(flujoArchivillo);

            // Queremos esta clase para tener el metodo readline
            BufferedReader lector = new BufferedReader(conversor);

            // Vamos a ir leyendo

            String lineaLeida = lector.readLine();
            while (!TextUtils.isEmpty(lineaLeida)){
                bd.execSQL(lineaLeida);
                lineaLeida = lector.readLine();
            }
            bd.close();
            bd = bbdd.getReadableDatabase();
            cargarAlumnos(bd, alumnos);
            MahAdapter adapter = new MahAdapter(this, alumnos);
            GridView listaLibracos = (GridView) findViewById(R.id.view);
            listaLibracos.setAdapter(adapter);
            bd.close();

        } catch (Exception e) {
            System.err.println("Me cago en la leche, Merche");
        }
    }

    private void cargarAlumnos(SQLiteDatabase db, List<Alumno> alumnos)
    {
        Cursor cursor = db.rawQuery("SELECT * FROM alumnos", null);
        if (cursor.moveToFirst()) {
            do {
                String nombre = "";
                String foto = "";
                String audio = "";
                nombre = cursor.getString(0);
                foto = cursor.getString(1);
                audio = cursor.getString(2);
                Alumno a = new Alumno(nombre, foto, audio);
                alumnos.add(a);
            } while (cursor.moveToNext());
        }

        cursor.close();
    }

    private void cargarAlumnosAGUSTIN(SQLiteDatabase db, Alumno[] alumnos)
    {
        Cursor cursor = db.rawQuery("SELECT * FROM alumnos", null);
        alumnos = new Alumno[cursor.getCount()];
        int indice = 0;
        if (cursor.moveToFirst()) {
            do {
                String nombre = "";
                String foto = "";
                String audio = "";
                nombre = cursor.getString(0);
                foto = cursor.getString(1);
                audio = cursor.getString(2);
                Alumno a = new Alumno(nombre, foto, audio);
                alumnos[indice++] = a;
            } while (cursor.moveToNext());
        }


        cursor.close();
    }
}
