package learn.javi.grafico;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Point;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;

/**
 * Created by Javier on 30/11/2017.
 */

public class Game extends View
{
    private final int WIDTH, HEIGTH;
    private Paint pintar;
    private Player p;
    private Food f;
    public Game(Context context, Point dimensiones)
    {
        super(context);
        WIDTH = dimensiones.x;
        HEIGTH = dimensiones.y;
        pintar = new Paint();
        pintar.setStyle(Paint.Style.FILL);
        p = new Player();
        f = new Food(WIDTH, HEIGTH);
    }

    @Override
    protected void onDraw(Canvas canvas)
    {
        super.onDraw(canvas);
        pintar.setColor(Color.BLACK);
        canvas.drawRect(0, 0, WIDTH, HEIGTH, pintar);
        p.dibujar(canvas);
        f.dibujar(canvas);
    }

    public boolean onTouchEvent(MotionEvent evento)
    {
        if (p.contains(evento.getX(), evento.getY()))
        {
            p.left = evento.getX() - 50;
            p.right = p.left + p.getWIDTH();
            p.top = evento.getY() - 50;
            p.bottom = p.top + p.getHEIGTH();
            if (p.intersect(f)){
                f.relocate();
            }
            invalidate();
        }
        return true;
    }
}
