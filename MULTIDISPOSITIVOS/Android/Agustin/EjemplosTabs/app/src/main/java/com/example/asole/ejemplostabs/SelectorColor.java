package com.example.asole.ejemplostabs;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.view.View;

/**
 * Created by asole on 28/09/2017.
 */

public class SelectorColor extends View{


    @Override
    protected void onDraw(Canvas canvas){
        Paint relleno = new Paint();
        relleno.setStyle(Paint.Style.FILL);
        relleno.setColor(Color.RED);
        canvas.drawRect(0, 0, 100, 100, relleno);
    }
}
