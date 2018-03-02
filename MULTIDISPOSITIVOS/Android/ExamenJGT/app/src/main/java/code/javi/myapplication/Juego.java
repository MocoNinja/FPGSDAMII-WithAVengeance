package code.javi.myapplication;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Point;
import android.view.MotionEvent;
import android.view.View;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by javier on 1/12/17.
 */

public class Juego extends View implements Runnable
{
    private List<Rectangulo> rekts;
    private Paint pintar;
    private final int SC_W, SC_H;
    private int puntuacion = 0;
    private Context context;

    private Thread thread = new Thread(this);


    private final int MAX_SECONDS = 15;
    private int curr_seconds = 0;
    private final int SLEEP = 100;
    private final int STEP_PER_SECOND = 1000 / SLEEP; // 10 ciclos := 1 segundo
    private int ciclos = 0;

    public Juego(Context context, Point dimensiones)
    {
        super(context);
        this.context = context;
        pintar = new Paint();
        pintar.setStyle(Paint.Style.FILL);
        SC_W = dimensiones.x;
        SC_H = dimensiones.y;
        thread.start();
    }

    @Override
    protected void onDraw(Canvas canvas)
    {
        super.onDraw(canvas);
        // FONDO
        pintar.setColor(Color.BLACK);
        canvas.drawRect(0, 0, SC_W, SC_H, pintar);
        for (Rectangulo r : rekts) r.pintar(canvas, pintar);
    }

    public void getPlayers(List<Rectangulo> rekts)
    {
        this.rekts = rekts;
        for (Rectangulo r : rekts) r.setDimensionesPantalla(SC_W, SC_H);
    }

    @Override
    public void run()
    {
        while(gameContinue())
        {
            try
            {
                Thread.sleep(SLEEP);
                ciclos++;
                for (Rectangulo r : rekts) r.mover();
                postInvalidate();
                if (ciclos == STEP_PER_SECOND){
                    ciclos = 0;
                    curr_seconds++;
                }
            } catch (InterruptedException e)
            {
                e.printStackTrace();
            }
        }
        insertarBaseDatos();
    }

    public boolean gameContinue()
    {
        return (rekts.size() == 0 || curr_seconds <= MAX_SECONDS);
    }


    @Override
    public boolean onTouchEvent(MotionEvent e)
    {
        float x = e.getX();
        float y = e.getY();

        for (Rectangulo r : rekts)
        {
            if (r.contains(x, y))
            {
                puntuacion ++;
                // r.setColor("#FFFFFF".trim()); // prueba para ver que rula
                rekts.remove(r);
                postInvalidate();
                return true;
            }
        }

        return true;
    }


    private void insertarBaseDatos()
    {
        Date fecha = new Date();
        SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String fechaFormateadaBD = formatoFecha.format(fecha);
        //String sql = String.format("INSERT INTO Records (score, fecha) VALUES (%d, '%s')", puntuacion, fechaFormateadaBD);

        DataBase BD = new DataBase(context, "MACARRONES", null, 1);
        SQLiteDatabase BDReal = BD.getWritableDatabase();
        //BDReal.execSQL(sql);
        BDReal.execSQL("INSERT INTO Records (score, fecha) VALUES (" + puntuacion + ",'" + fechaFormateadaBD + "')");

        // He probado de las dos formas porque parece que al acabar la aplicacion se ejecuta dos veces, una
        // con el valor inicial de puntuacion y otra con el valor final
        // Cambiar la forma de hacer las consultas no ha arreglado nada, asi que supongo que será por
        // algo del asincronismo
        // porque tambien he extraido esta funcion en el main activiy
        // y vuelve a crear dos registros con el valor que le he pasado
    }
}
