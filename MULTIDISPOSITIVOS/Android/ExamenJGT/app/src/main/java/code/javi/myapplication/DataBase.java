package code.javi.myapplication;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

/**
 * Created by javier on 1/12/17.
 */

public class DataBase extends SQLiteOpenHelper
{
    // He buscado y SQlite no tiene ningún tipo de dato propio para fecha, así que lo guardo como texto
    // https://sqlite.org/datatype3.html

    private String creacionDB = "CREATE TABLE Records (score INTEGER, fecha TEXT)";
    private String destruccionDB = "DROP TABLE IF EXISTS Records";

    public DataBase (
            Context context, String name, SQLiteDatabase.CursorFactory factory, int version)
    {
        super(context, name, factory, version);
    }

    @Override
    public void onCreate (SQLiteDatabase db)
    {
        db.execSQL(creacionDB);
    }

    @Override
    public void onUpgrade (SQLiteDatabase db, int oldVersion, int newVersion)
    {
        db.execSQL(destruccionDB);
        db.execSQL(creacionDB);
    }
}
