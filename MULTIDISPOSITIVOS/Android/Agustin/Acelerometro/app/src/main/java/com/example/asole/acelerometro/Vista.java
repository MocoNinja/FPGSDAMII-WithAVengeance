package com.example.asole.acelerometro;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.view.View;


/**
 * Created by asole on 10/11/2017.
 */

public class Vista extends View {
    Bitmap imagen;
    int posx, posy;
    public Vista(Context context){
        super(context);
        imagen = BitmapFactory.decodeResource(getResources(), R.drawable.puig);
        posx = posy = 100;
    }
    public void draw(Canvas canvas){
        canvas.drawBitmap(imagen, posx, posy, null);
    }
    public void mover(int x, int y){
        posx -= x;
        posy += y;
        invalidate();
    }
}
