package com.example.javier.a12leerarchivostexto;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class AlumnosSQLiteHelper extends SQLiteOpenHelper
{
    String sqlCreate = "CREATE TABLE alumnos(nom_alumno TEXT, foto TEXT, sonido TEXT)";

    public AlumnosSQLiteHelper(Context context, String name, SQLiteDatabase.CursorFactory factory, int version)
    {
        super(context, name, factory, version);
    }

    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase)
    {
        sqLiteDatabase.execSQL(sqlCreate);
    }

    @Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1)
    {
        sqLiteDatabase.execSQL("DROP TABLE IF EXISTS alumnos");
        sqLiteDatabase.execSQL(sqlCreate);
    }
}
