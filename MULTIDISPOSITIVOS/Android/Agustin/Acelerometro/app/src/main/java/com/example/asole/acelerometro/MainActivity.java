package com.example.asole.acelerometro;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;

public class MainActivity extends AppCompatActivity  implements SensorEventListener {
    Vista miVista;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        SensorManager miSensorManager = (SensorManager)getSystemService(Context.SENSOR_SERVICE);
        Sensor miSensor = miSensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        miSensorManager.registerListener(this, miSensor, SensorManager.SENSOR_DELAY_FASTEST);

        miVista = new Vista(this);
        setContentView(miVista);
    }

    @Override
    public void onSensorChanged(SensorEvent event) {
        int x = (int) event.values[0];
        int y = (int) event.values[1];
        int z = (int) event.values[2]; //No sé el uso
        Log.i("Sensor: ", "x=" + x + " y=" + y);
        miVista.mover(x, y);
    }

    @Override
    public void onAccuracyChanged(Sensor sensor, int accuracy) {

    }
}
