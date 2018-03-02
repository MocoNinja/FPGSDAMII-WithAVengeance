package code.javi.myapplication;

import android.app.Activity;
import android.content.pm.ActivityInfo;
import android.graphics.Point;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Display;
import android.view.WindowManager;

import java.util.List;

public class MainActivity extends AppCompatActivity
{
    List<Rectangulo> rectangulos;
    Activity main;
    Juego juego;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        main = this;
        iniciarCargarXML();
    }

    private void iniciarCargarXML()
    {
        String URL = "http://www.informaticasalesianoszgz.org.es/rectangulos.xml";
        new miTarea().execute(URL);
    }

    private void setupJuego()
    {
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
        Display dis = getWindowManager().getDefaultDisplay();
        Point dimensiones = new Point();
        dis.getSize(dimensiones);
        juego = new Juego(this, dimensiones);
        juego.getPlayers(rectangulos);
        setContentView(juego);
    }

    class miTarea extends AsyncTask<String, Float, Integer>
    {
        @Override
        protected Integer doInBackground(String... strings)
        {
            LeerOnlineXML lista = new LeerOnlineXML(strings[0]);
            rectangulos = lista.parse();

            publishProgress(250f); // el update por asi decirlo

            return null;

        }

        @Override
        protected void onProgressUpdate(Float... values)
        {
            super.onProgressUpdate(values);
            // jugar
            setupJuego();
        }
    }
}
