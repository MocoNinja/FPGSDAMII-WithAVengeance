package com.example.javier.a11acelerometrosimple;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;

public class MainActivity extends AppCompatActivity implements SensorEventListener
{
    private MiSuperVista miVista;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        // setContentView(R.layout.activity_main); // Vamos a generar nuestra propia Vista

        SensorManager sensoneitor = (SensorManager) getSystemService(Context.SENSOR_SERVICE);
        Sensor acelerometro = sensoneitor.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        sensoneitor.registerListener(this, acelerometro, SensorManager.SENSOR_DELAY_FASTEST); // Para lentificarlo un poco
        miVista = new MiSuperVista(this.getApplicationContext()); // funciona tambien si le pasas solo this
        setContentView(miVista);
    }

    @Override
    public void onSensorChanged(SensorEvent sensorEvent)
    {
        int x = (int) sensorEvent.values[0];
        int y = (int) sensorEvent.values[1];
        int z = (int) sensorEvent.values[2]; // No la vamos a usar, pero la dejo aqui para acordarme de que guarda la z ahi
        Log.i("Sensor: ", "x = " + x + ", y = " + y + ", z = " + z);
        miVista.move(x, y);
    }

    @Override
    public void onAccuracyChanged(Sensor sensor, int i)
    {

    }
}
