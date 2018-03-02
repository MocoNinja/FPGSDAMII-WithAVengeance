package learn.javi.grafico;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Javier on 30/11/2017.
 */

public class Player extends RectF
{
    private final int WIDTH = 100, HEIGTH = 100;
    private Paint paint;
    List<RectF> piezas;

    public Player()
    {
        super(10, 10, 110, 110);
        piezas = new ArrayList<>();
        paint = new Paint();
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(Color.CYAN);
        piezas.add(this);
    }

    public void dibujar(Canvas canvas)
    {
        canvas.drawRect(this, paint);
    }

    public int getWIDTH(){
        return WIDTH;
    }

    public int getHEIGTH()
    {
        return HEIGTH;
    }

    public void addPieza()
    {
        RectF ultima = piezas.get(piezas.size() - 1);
        RectF nuevo = new RectF(ultima.left - WIDTH, ultima.top, ultima.left, ultima.bottom); // por la dcha

        piezas.add(nuevo);
    }
}
