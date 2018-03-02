package com.example.javier.pescamar;

import android.app.Activity;
import android.content.pm.ActivityInfo;
import android.graphics.Point;
import android.support.constraint.ConstraintLayout;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Display;
import android.view.Window;
import android.view.WindowManager;

// public class MainActivity extends AppCompatActivity
public class MainActivity extends Activity
{
    /**
     * Va a haber peces pequeño y uno grande
     * El grande lo movemos con el dedo
     * Cuando intersecte con el pequeño, se lo come
     */

    int ancho , alto;
    MiVista vi;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);


        // quitar el titulo
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        // pantalla completa
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);

        setContentView(R.layout.activity_main); // nuevaForma

        // apaisado
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);

        // dimensiones de la pantalla
        Display dis = getWindowManager().getDefaultDisplay();
        Point tamanyo = new Point();
        dis.getSize(tamanyo);

        alto = tamanyo.y;
        ancho = tamanyo.x;

       // setContentView(new MiVista(this));



        vi = new MiVista(this, ancho, alto);
        ConstraintLayout pantalla = (ConstraintLayout) findViewById(R.id.pantallita);
        pantalla.addView(vi);

    }
}
