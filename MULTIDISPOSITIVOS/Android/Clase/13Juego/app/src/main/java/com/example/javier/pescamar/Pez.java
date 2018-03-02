package com.example.javier.pescamar;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.View;

import java.util.Random;

/**
 * La superclase es el análogo al Rectangle que usábamos el año pasado
 * La diferencia clave es que aqui no se pasa ancho ni alto, sino que se define con los cuatro puntos
 *
 * El runnable es el de java
 * Aquñi cada pez es un thread
 */

public class Pez extends RectF implements Runnable
{
    public static final int LINEA = 0, ARRIBA = 1, ABAJO = -1;
    private int DIRECCION = LINEA;
    private Bitmap[] sprites;
    private View vista;
    private int indiceSpriteActual = 0;
    private int ancho, alto;
    private int screen_w, screen_h;

    public Pez(View vista, int SCREEN_W, int SCREEN_H)
    {
        super(-100, -100, 0, 0); // <-- quedarse bien con estas nuevas variables

        sprites = new Bitmap[3];
        sprites[0] = BitmapFactory.decodeResource(vista.getResources(), R.drawable.pez0);
        sprites[1] = BitmapFactory.decodeResource(vista.getResources(), R.drawable.pez1);
        sprites[2] = BitmapFactory.decodeResource(vista.getResources(), R.drawable.pez2);

        ancho = sprites[0].getWidth(); // asumimos dimensiones iguales
        alto  = sprites[0].getHeight();

        right = left + ancho;
        bottom = top + alto;

        this.vista = vista;

        screen_h = SCREEN_H;
        screen_w = SCREEN_W;

        generateRandomStartPosition();
        new Thread(this).start(); // llama al run y pista
    }

    public void dibujar(Canvas graphics)
    {
        graphics.drawBitmap(sprites[indiceSpriteActual], left, top, null); // le pasamos null porque la imagen la dibujamos tal cual
    }

    @Override
    public void run()
    {
        while(true)
        {
            try
            {
                Thread.sleep(200);
                indiceSpriteActual = (indiceSpriteActual + 1) % 3;
                actualizarPosicion();
                vista.postInvalidate();
            }
            catch (Exception e)
            {

            }
        }
    }

    private void actualizarPosicion()
    {
        double r1 = Math.random(); // 0 <= r1 <= 1
        double r2 = Math.random();
        int speed = (int) (10 + Math.random() * 10);

        switch (DIRECCION)
        {
            case ARRIBA:
                if (r1 > 0.75) {
                    DIRECCION = LINEA;
                }
                break;

            case ABAJO:
                if (r1 > 0.75) {
                    DIRECCION = LINEA;
                }
                break;

            case LINEA:
            default:
                if (r1 > 0.75) {
                    if (r2 > 0.5) {
                        DIRECCION = ARRIBA;

                    } else {
                        DIRECCION = ABAJO;
                    }
                }
                break;
        }

        switch (DIRECCION)
        {
            case ARRIBA:
                top -= speed;
                bottom -= speed; // Porque si no, se irá haciendo más grande el rect
                break;
            case ABAJO:
                top += speed;
                bottom += speed; // Porque si no, se irá haciendo más grande el rect
                break;
        }
        left -= speed;
        right -= speed; // Porque si no, el rectangulo se ira haciendo cada vez as grande

    }
    private void generateRandomStartPosition()
    {
        Random rand = new Random();
        int posX = rand.nextInt(screen_w);
        int posY = rand.nextInt(screen_h);
        top = posY;
        left = screen_w + (int) Math.random() * 100 * 5 + (int) Math.random() * 100 * 2;
    }
}
