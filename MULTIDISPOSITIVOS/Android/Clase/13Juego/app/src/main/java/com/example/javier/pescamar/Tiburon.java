package com.example.javier.pescamar;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.RectF;
import android.view.View;

import java.util.ArrayList;
import java.util.Random;

public class Tiburon extends RectF implements Runnable {

    public static final int LINEA = 0, ARRIBA = 1, ABAJO = -1;
    private int DIRECCION = LINEA;
    private Bitmap[] sprites;
    private View vista;
    private int indiceSpriteActual = 0;
    public int ancho, alto;
    private int screen_w, screen_h;
    private ArrayList<Pez> peces;
    public Tiburon(View vista, int SCREEN_W, int SCREEN_H, ArrayList<Pez> peces)
    {
        super(40, 50, 0, 0); // <-- quedarse bien con estas nuevas variables

        sprites = new Bitmap[3];
        sprites[0] = BitmapFactory.decodeResource(vista.getResources(), R.drawable.fish0);
        sprites[1] = BitmapFactory.decodeResource(vista.getResources(), R.drawable.fish1);
//        sprites[2] = BitmapFactory.decodeResource(vista.getResources(), R.drawable.pez2);

        ancho = sprites[0].getWidth(); // asumimos dimensiones iguales
        alto = sprites[0].getHeight();

        right = left + ancho;
        bottom = top + alto;

        this.vista = vista;

        screen_h = SCREEN_H;
        screen_w = SCREEN_W;
        this.peces = peces;
        new Thread(this).start(); // llama al run y pista
    }

    public void dibujar(Canvas graphics) {
        graphics.drawBitmap(sprites[indiceSpriteActual], left, top, null); // le pasamos null porque la imagen la dibujamos tal cual
    }

    @Override
    public void run()
    {
        while (true) {
            try
            {
                Thread.sleep(200);
                indiceSpriteActual = (indiceSpriteActual + 1) % 2;
                vista.postInvalidate();
            }
            catch (Exception e)
            {

            }
        }
    }

}
