package com.example.javier.a05selectorcolor;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Point;
import android.support.constraint.solver.widgets.Rectangle;
import android.view.MotionEvent;
import android.view.View;

/**
 * Created by javier on 4/10/17.
 */

public class JaviVistaPro extends View {

    private int anchura, altura;
    private int colorSeleccionado = Color.BLACK;
    public JaviVistaPro(Context contexto){
        super(contexto);
    }

    @Override
    protected void onDraw(Canvas canvas){
        Paint content = new Paint(); // Da carecterísticas al relleno

        content.setStyle(Paint.Style.FILL);
        content.setColor(Color.BLACK);
        canvas.drawRect(0, 0, anchura, altura, content);
        int[] colores =  {Color.RED, Color.GREEN, Color.BLUE, Color.YELLOW};
        int ancho = anchura / 4;

        for (int i = 0; i < colores.length; i++){

            content.setColor(colores[i]);
            canvas.drawRect(i * ancho, 0, ancho * (i + 1), altura / 2, content);
        }

        content.setColor(colorSeleccionado);
        canvas.drawRect(0, altura / 2, anchura, altura, content);
    }

    @Override
    protected void onMeasure(int anchura, int altura){
        super.onMeasure(anchura, altura); // Si no pones eso, parece que no funciona
        // si haces esto, parece que no coge la misma unidad que los paint, que parece que son px
        //this.anchura = anchura;
        //this.altura = altura;
        // Los están metiendo hardcoded
        this.anchura = 1000;
        this.altura = 500;
    }

    @Override
    public boolean onTouchEvent(MotionEvent e){
        float x = e.getX();
        float y = e.getY();
        if (y > 0 && y < altura / 2){
            if (x > 0 && x < anchura){
                if (x > (3 * anchura / 4)) colorSeleccionado = Color.YELLOW;
                else if (x > (anchura / 2)) colorSeleccionado = Color.BLUE;
                else if (x > anchura / 4) colorSeleccionado = Color.GREEN;
                else colorSeleccionado = Color.RED;
                this.invalidate(); // Refresca el control
            }
        }
        return true;
    }
}
