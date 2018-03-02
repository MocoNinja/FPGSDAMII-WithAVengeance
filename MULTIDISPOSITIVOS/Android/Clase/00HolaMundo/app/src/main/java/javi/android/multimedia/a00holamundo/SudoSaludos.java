package javi.android.multimedia.a00holamundo;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class SudoSaludos extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.sudo_saludos);

        final TextView textito = (TextView) findViewById(R.id.alienText);
        Bundle bundle = getIntent().getExtras();
        String texto = bundle.getString("nombre");
        if (texto == null || texto.equals("")){
            texto = "Aprende a poner tu nombre, webón";
        }
        textito.setText("Hola, " + texto);
    }
}
