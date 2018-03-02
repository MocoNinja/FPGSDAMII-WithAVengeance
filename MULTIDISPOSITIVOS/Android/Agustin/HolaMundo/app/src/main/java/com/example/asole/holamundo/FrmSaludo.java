package com.example.asole.holamundo;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class FrmSaludo extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.frmsaludo);

        TextView txtSaludo = (TextView)findViewById(R.id.TxtSaludo);

        Bundle bundle = this.getIntent().getExtras();

        txtSaludo.setText("Hola " + bundle.getString("NOMBRE"));
    }
}
