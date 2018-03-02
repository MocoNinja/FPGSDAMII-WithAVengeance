package com.example.asole.holamundo;

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


        final EditText txtNombre = (EditText)findViewById(R.id.TxtNombre);

        final Button boton = (Button)findViewById(R.id.BtnHola);
        boton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Crear un Intent
                Intent intent = new Intent(MainActivity.this, FrmSaludo.class);
                //Crear la información a pasar entre Activities
                Bundle b = new Bundle();
                b.putString("NOMBRE", txtNombre.getText().toString());
                intent.putExtras(b);
                //Iniciamos el nuevo Activity
                startActivity(intent);
            }
        });

    }
}
