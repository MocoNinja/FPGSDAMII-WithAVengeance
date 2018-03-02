package com.example.javier.a11acelerometrosimple;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.view.View;

/**
 * Created by javier on 10/11/17.
 */

public class MiSuperVista extends View
{
    private Bitmap doggo;
    private int x, y;

    public MiSuperVista(Context context)
    {
        super(context);
        // getResources() devuelve la objetización del directorio 'res'
        doggo = BitmapFactory.decodeResource(getResources(), R.drawable.sovietdog);
        x = y = 100;
    }

    @Override
    public void draw(Canvas canvas)
    {
        super.draw(canvas);
        canvas.drawBitmap(doggo, x, y, null);
    }

    public void move(int x, int y)
    {
        this.x -= x;
        this.y += y;
        invalidate(); // el repaint();
    }
}
