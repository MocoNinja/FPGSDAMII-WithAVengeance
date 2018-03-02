package com.example.javier.sqlite;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

/**
 * Created by javier on 26/10/17.
 */

public class UsuariosSQLite extends SQLiteOpenHelper
{
    private String creacionDB = "CREATE TABLE Usuarios (codigo INTEGER, nombre TEXT)";;
    private String destruccionDB = "DROP TABLE IF EXISTS Usuarios";

    public UsuariosSQLite (
            Context context, String name, SQLiteDatabase.CursorFactory factory, int version)
    {
        super(context, name, factory, version);
    }

    // Este método se ejecuta cuando se crear el objeto -> sólo una vez
    @Override
    public void onCreate (SQLiteDatabase db)
    {
        db.execSQL(creacionDB);
    }

    // Este método se ejecuta las siguientes veces, cuando la base de datos experimenta alguna
    // modificación (en su estructura, no en sus campos)
    @Override
    public void onUpgrade (SQLiteDatabase db, int oldVersion, int newVersion)
    {
        db.execSQL(destruccionDB);
        db.execSQL(creacionDB);
    }
}
