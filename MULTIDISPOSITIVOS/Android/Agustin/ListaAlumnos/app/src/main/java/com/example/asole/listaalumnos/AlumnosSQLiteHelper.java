package com.example.asole.listaalumnos;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

/**
 * Created by asole on 15/11/2017.
 */

public class AlumnosSQLiteHelper extends SQLiteOpenHelper {
    String sqlCreate = "CREATE TABLE alumnos(nom_alumno TEXT, foto TEXT, sonido TEXT)";
    public AlumnosSQLiteHelper(Context context, String nombre, SQLiteDatabase.CursorFactory factory, int version){
        super(context, nombre, factory, version);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(sqlCreate);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS alumnos");
        db.execSQL(sqlCreate);
    }
}
