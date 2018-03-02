package learn.javi.grafico;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;

import java.util.Random;

/**
 * Created by Javier on 30/11/2017.
 */

public class Food extends RectF implements Runnable
{
    private final int a = 10, w = 10;
    private final int W, H;
    private Paint paint;
    private Random rand = new Random();
    Thread thread = new Thread(this);

    public Food(int W, int H)
    {
        super(0, 0, 0, 0);
        this.W = W;
        this.H = H;
        relocate();
        paint = new Paint();
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(Color.RED);
        thread.start();
    }

    public void dibujar(Canvas canvas)
    {
        canvas.drawRect(this, paint);
    }

    @Override
    public void run()
    {
        while(true)
        {
            try {
                Thread.sleep(1500);
                relocate();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    public void relocate()
    {
        left = rand.nextInt(W / 2) + 100;
        right = left + a;
        top = rand.nextInt(H / 2) + 100;
        bottom = top + w;
    }
}
