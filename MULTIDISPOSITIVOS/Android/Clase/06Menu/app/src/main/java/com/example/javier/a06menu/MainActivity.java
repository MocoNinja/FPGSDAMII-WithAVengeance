package com.example.javier.a06menu;

import android.app.usage.UsageEvents;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.view.menu.SubMenuBuilder;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.SubMenu;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }

    // Al igual que un Applet tenía una graphics que se referenciaba con su paint,
    // Los activities tienen un menú

    @Override
    public boolean onCreateOptionsMenu(Menu menu){

        // Este menu ya esta instanciado: vamos a meterle el menu que inflemos con el layout
        // que hemos creado
        // OJO
        // inflado != instanciado !!

        /*
        // 1ª Manera: haciendo esto con nuestro xml

        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu_principal, menu);
        return true;
        */

        // 2ª Manera: a través del menú, meterle los items a pezuña

        for (int i = 1; i <= 3; i++){
            menu.add(Menu.NONE, Menu.NONE, Menu.NONE, "Opción " + i);
        }
        menu.getItem(2).setTitle("BAITEAO");

        SubMenu s = menu.addSubMenu(Menu.NONE, Menu.NONE, Menu.NONE, "asas");
        for (int i = 1; i <= 3; i++){
            s.add(Menu.NONE, Menu.NONE, Menu.NONE, "SubOpción " + i);
        }
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        TextView textito = (TextView) findViewById(R.id.lblMensaje);
        String mensaje = item.getTitle().toString();
        textito.setText(mensaje);
        return super.onOptionsItemSelected(item);
    }
}
