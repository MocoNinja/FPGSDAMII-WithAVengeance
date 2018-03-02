package code.javi.myapplication;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;

import java.util.Random;

/**
 * Created by javier on 1/12/17.
 */

public class Rectangulo extends RectF
{
    private int ancho, alto;
    private int color;
    private int xXML, yXML;
    private int xSpeed, ySpeed;
    Random rand = new Random();

    // Precargo las dimensiones con los valores de mi pantalla para que se vea algo
    // si no se pueden cargar por lo que sea las que le pase luego

    private int anchoPantalla = 1920;
    private int altoPantalla = 1080;

    public Rectangulo()
    {
        super(-100, -100, -100, -100); // Inicializo el rectangulo vacio fuera de la pantalla
        xSpeed = rand.nextInt(9) + 2; // entre 0 + 2 y 8 + 2  -> (2, 10)
        ySpeed = rand.nextInt(9) + 2;

    }

    public void setxXML(int x)
    {
        xXML = x;
    }

    public void setyXML(int y)
    {
        yXML = y;
    }

    public void setAncho(int ancho)
    {
        this.ancho = ancho;
    }

    public void setAlto(int alto)
    {
        this.alto = alto;
    }

    public void setColor(String  hex)
    {

        this.color = Color.parseColor(hex);
    }

    public int getColor()
    {
        return color;
    }

    public void ensamblar()
    {
        left = xXML;
        right = left + ancho;
        top = yXML;
        bottom = top + alto;
    }

    public void mover()
    {
        if (right + xSpeed >= anchoPantalla) xSpeed *= -1; // si se sale de la pantalla, gira
        if (left + xSpeed <= 0) xSpeed *= -1;

        if (top + ySpeed <= 0) ySpeed *= -1;
        if (bottom + ySpeed >= altoPantalla - 200) ySpeed *= -1; // No coge del todo bien el alto

        left += xSpeed;
        right = left + ancho;
        top += ySpeed;
        bottom = top +  alto;

    }

    public void pintar(Canvas canvas, Paint p)
    {
        p.setColor(color);
        canvas.drawRect(this, p);
    }

    public void setDimensionesPantalla(int w, int h)
    {
        anchoPantalla = w;
        altoPantalla = h;
    }

}
