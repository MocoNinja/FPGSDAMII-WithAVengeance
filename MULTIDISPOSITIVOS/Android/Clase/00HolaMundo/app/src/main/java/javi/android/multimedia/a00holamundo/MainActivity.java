package javi.android.multimedia.a00holamundo;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        /*
        * Hemos añadido objetos mediante las marcas del a vista
        * Ahora en el controlador vamos a asignar estos objetos a unos objetos de esas clases
        */

        // Ojo: aqui final es una variable global (~ static)

        final EditText txtNombre = (EditText) findViewById(R.id.txtNombre);
        final Button txtBoton = (Button) findViewById(R.id.btnNombre);

        txtBoton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                // La clase Intent abre otras ventanas y poder pasarle parámetros
                // Es una especie de puente, relaciona dos Activities
                // Para pasar las variables hay que crear un Bundle
                // Por eso al intent se le carga el objeto Bundle

                Intent ventanita666 = new Intent(MainActivity.this, SudoSaludos.class);
                Bundle b = new Bundle();
                b.putString("nombre", txtNombre.getText().toString());
                // Hay que usar el toString porque devuelve texto enriquecido (texto + marcas)
                System.out.println(b.get("nombre"));
                ventanita666.putExtras(b);
                startActivity(ventanita666);
            }
        });
    }
}
