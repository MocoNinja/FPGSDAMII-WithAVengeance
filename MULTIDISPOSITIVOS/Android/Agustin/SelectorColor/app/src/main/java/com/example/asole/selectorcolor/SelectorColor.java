package com.example.asole.selectorcolor;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.view.MotionEvent;
import android.view.View;

/**
 * Created by asole on 04/10/2017.
 */

public class SelectorColor extends View{

    int anchura, altura;
    private int colorSeleccionado = Color.BLACK;

    public SelectorColor(Context context){
        super(context);
    }

    @Override
    protected void onMeasure(int anchura, int altura){
        this.anchura = 1000;
        this.altura = 1000;
    }


    @Override
    protected void onDraw(Canvas canvas){
        Paint pRelleno = new Paint();
        pRelleno.setStyle(Paint.Style.FILL);
        pRelleno.setColor(Color.RED);
        canvas.drawRect(0, 0, anchura/4, altura/2, pRelleno);

        pRelleno.setColor(Color.GREEN);
        canvas.drawRect(anchura/4, 0, anchura/2, altura/2, pRelleno);

        pRelleno.setColor(Color.BLUE);
        canvas.drawRect(anchura/2, 0, (3*anchura)/4, altura/2, pRelleno);

        pRelleno.setColor(Color.YELLOW);
        canvas.drawRect((3*anchura)/4, 0, anchura, altura/2,pRelleno);

        pRelleno.setColor(colorSeleccionado);
        canvas.drawRect(0, altura/2, anchura, altura, pRelleno);

    }

    @Override
    public boolean onTouchEvent(MotionEvent event){
        if ((event.getY() > 0) && (event.getY()<(altura/2))){
            if ((event.getX() > 0) && (event.getX() < anchura)){
                if(event.getX() > (3*anchura/4))
                    colorSeleccionado = Color.YELLOW;
                else if(event.getX() > (anchura/2))
                    colorSeleccionado = Color.BLUE;
                else if(event.getX() > (anchura / 4))
                    colorSeleccionado = Color.GREEN;
                else
                    colorSeleccionado = Color.RED;
                //Refrescamos el control
                this.invalidate();
            }
        }

        return true;
    }

}
