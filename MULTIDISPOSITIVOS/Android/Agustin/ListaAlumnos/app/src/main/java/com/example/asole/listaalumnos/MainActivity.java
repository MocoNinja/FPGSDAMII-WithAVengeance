package com.example.asole.listaalumnos;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class MainActivity extends AppCompatActivity {
    InputStream is = null;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        try {
            is = this.getAssets().open("sentenciasSQL.txt");
        } catch (IOException e) {
            e.printStackTrace();
        }


        BufferedReader lector = new BufferedReader(new InputStreamReader(is));

        try {
            String linea = lector.readLine();
            while (!TextUtils.isEmpty(linea)){

                linea = lector.readLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
