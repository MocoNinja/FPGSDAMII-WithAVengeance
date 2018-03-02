package com.example.javier.sqlite;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity
{
    @Override
    protected void onCreate (Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        UsuariosSQLite u = new UsuariosSQLite(this, "MACARRONES", null, 1);

        // Las bases de datos de SQLite puede abrirse en modo lectura O ESCRITURA

        SQLiteDatabase db = u.getWritableDatabase();
        db.execSQL("DELETE FROM Usuarios"); // esto es para limpiar la base en cada ejecucion
        insertarDatos(db);
        List<String> elementos = getUsuarios(db);
        ListView listica = (ListView) findViewById(R.id.listica);

        // /*
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(
                this, R.layout.support_simple_spinner_dropdown_item,
                elementos);
        // */

        /*
         // No me rula
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(
                this, android.R.layout.activity_list_item,
                elementos);
        */

        listica.setAdapter(adapter);
    }

    private void insertarDatos(SQLiteDatabase db)
    {
        final String[] nombres = {
                "Pepe", "Juan", "Jorge", "María", "Josefa", "Asunción",
                "Agustín", "Dolores"
        };

        for (int i = 0; i < nombres.length; i++)
        {
            String insercion = "INSERT INTO Usuarios (codigo, nombre) VALUES ("
                    + (i + 1) + ",'" + nombres[i] +
                    "')";
            System.err.println(insercion);
            db.execSQL(insercion);
        }
        // db.close();
    }

    private List<String> getUsuarios(SQLiteDatabase db)
    {
        /*
        * ** NOTA **
        * Esto te lo estoy explicando yo con lo que está diciendo agus
        * **
        *
        * Muchos objetos están formados por un número indeterminado de objetos
        * Por ejemplo, en una base de datos en una tabla que tenga nombre y apellidos
        * Pues al ejecutar una consulta, vas a tener un número variable de filas, con nombres y apellidos
        * En estos casos, se tiene un puntero que apunta a cada fila
        * Lo que yo hago en java con la base de datos es guardas esas filas en un rs
        * rs.next() mueve el puntero a la siguiente fila si existe
        * por cada fila, puedes rescatar con rs.get("nombres") y rs.get("apellidos")
        *
        * Eso es con java puro. En android supongo que la idea esa la misma, pero de otra manera
        * Aquí vamos a dar el cursor, que es el puntero
        *
        * ** Ha sacado lo de resultSet y dice que eso es el cursor
        * Dice que estan los punteros BOF y EOF [beging y end of file]
        * Parece ser ue en cursor inicia en BOF así que se intenta mover al primero
        * ** Ahora ha explicado una cosa que no se si está bien de que un objeto apuntando a null es falsop
        * y otro con un puntero distinto de null es true
        * Lo importante que creo que no ha visto el es que los metodos devuelven un boolean
        * si existe el registro, devuelve true
        * por eso se usan en las condiciones estos movimientos
        *
        * Lo que si que esta diciendo explicitaente es que el ResultSet apunta al primer registro
        * y este cursor al BOF
        * por eso yo en el curro uso while(cursor.next())
        * y por eso aqui hay que hacer esto del if con el do while
        *
        * Lo de siempre. Sin rallarse que es muy facil. Si lo lees y no te enteras, vuelve a leertelo con un dibujo
        *
        */

        // Cursor cursor = db.rawQuery("SELECT * FROM Usuarios", null);
        // Nuevo metodo: explicado mas abajo (funciona)
        // Cursor cursor = db.query("Usuarios", new String[] {"codigo", "nombre"}, null, null, null, null, null);

        // Esta forma es con los argumentos para condicionar (con el where)
        Cursor cursor = db.query("Usuarios", new String[] {"codigo", "nombre"}, "codigo=? or codigo=?", new String[] {"3", "5"}, null, null, null);
        List<String> usuarios = new ArrayList<String>();

        if (cursor.moveToFirst()) {
            do {

                String nombre = "";
                nombre += cursor.getInt(0);
                nombre += "-";
                // nombre += cursor.getColumnIndex("nombre"); // aquí no rula
                nombre += cursor.getString(1);
                usuarios.add(nombre);
            } while (cursor.moveToNext());
        }

        cursor.close();

        /*
        * Otra forma de hacer consultas
        * Es con lo que antes se conocía como una macro (como una gran instruccion con subinstrucciones)
        * Es como una funcion a la que se le pasan parametros y construye el sql con esos paremetros
        * Son consultas de SELECCION
        * La sintaxis es db.Query("nombreTabla", vectorConCampos);
        */
        /*
        String[] campos = new String[] {"codigo", "nombre"};
        Cursor cursor2 = db.query("Usuarios", new String[] {"codigo", "nombre"}, null, null, null, null, null);
        */

        return usuarios;
    }
}
