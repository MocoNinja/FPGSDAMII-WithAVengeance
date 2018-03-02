package com.example.asole.menubasico;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.SubMenu;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    TextView mensaje;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mensaje = (TextView)findViewById(R.id.lblMensaje);

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu){
        //Alternativa 1.  Inflar el documento XML

        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu_principal, menu);


        //Alternativa 2. Manipulamos el menu que recibe el método
/*        menu.add(Menu.NONE, Menu.NONE, Menu.NONE, "Opción 1");
        menu.add(Menu.NONE, Menu.NONE, Menu.NONE, "Opción 2");

        SubMenu subMenu = menu.addSubMenu(Menu.NONE, Menu.NONE, Menu.NONE, "Opción 3");
        subMenu.add(Menu.NONE, Menu.NONE, Menu.NONE, "Opción 3.1");
        subMenu.add(Menu.NONE, Menu.NONE, Menu.NONE, "Opción 3.2");
*/
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()){
            case R.id.MenuOpc1:
               mensaje.setText("Opción 1 pulsada!!!");
               return true;
            case R.id.MenuOpc2:
                mensaje.setText("Opción 2 pulsada!!!");
                return true;
            case R.id.SubMenuOpc1:
                mensaje.setText("Opción 3.1 pulsada!!!");
                return true;
            case R.id.SubMenuOpc2:
                mensaje.setText("Opción 3.2 pulsada!!!");
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }

    }
}
