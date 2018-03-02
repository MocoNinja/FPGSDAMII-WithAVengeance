package com.example.javier.pescamar;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.view.MotionEvent;
import android.view.View;

import java.util.ArrayList;

/**
 * lo que el año pasado era el applet
 */

public class MiVista extends View
{
    private Pez pesesito;
    private Tiburon tiburon;
    private Bitmap fondo;
    private final int MAXPECES = 5;
    private ArrayList<Pez> PECES;

    public MiVista(Context context, int ancho, int alto)
    {
        super(context);
        PECES = new ArrayList<>();
        for (int i = 0; i < MAXPECES; i++)
        {
            pesesito = new Pez(this, ancho, alto);
            PECES.add(pesesito);
        }
        tiburon = new Tiburon(this, ancho, alto, PECES);
        fondo = BitmapFactory.decodeResource(this.getResources(), R.drawable.background);
    }

    @Override
    protected void onDraw(Canvas gambas)
    {
        super.onDraw(gambas);
        this.setBackgroundResource(R.drawable.background);
        //pesesito.dibujar(gambas);
        tiburon.dibujar(gambas);
        for (Pez pez : PECES) pez.dibujar(gambas);
        //invalidate();
    }

    // Ojo que no es un listener y no un override

    public boolean onTouchEvent(MotionEvent evento)
    {
        // El evento va a ser tocar la pantlla con el dedd -> se crea el evento que hemos llamado evento
        // Tiene atributos, de los que nos interesan x e y
        if (tiburon.contains(evento.getX(), evento.getY()))
        {
            tiburon.left = evento.getX() - tiburon.ancho / 2;
            tiburon.top = evento.getY() - tiburon.alto / 2;
            tiburon.right = tiburon.left + tiburon.ancho;
            tiburon.bottom = tiburon.top + tiburon.alto;
            // tiburon.set(... ) // todo de golpe
            invalidate(); // aqui se usa el invalidate. EL post invalidate se usa cuando la clase NO es la vista
        }
       return true;
    }
}
