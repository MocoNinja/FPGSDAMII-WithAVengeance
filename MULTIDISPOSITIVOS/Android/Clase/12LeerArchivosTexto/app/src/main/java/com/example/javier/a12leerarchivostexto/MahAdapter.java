package com.example.javier.a12leerarchivostexto;

import android.app.Activity;
import android.media.MediaPlayer;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.List;

/**
 * Created by javier on 2/11/17.
 */

public class MahAdapter extends ArrayAdapter
{
    Activity context;
    LayoutInflater inflater;

    public MahAdapter(Activity context, List<Alumno> alumnos)
    {
        super(context, R.layout.activity_alumno, alumnos);
        this.context = context;
        inflater = context.getLayoutInflater();
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent)
    {
        View vistica = inflater.inflate(R.layout.activity_alumno, null);

        TextView nombre = (TextView) vistica.findViewById(R.id.alumno);
        ImageView foto = (ImageView) vistica.findViewById(R.id.afoto);
        Button audio = (Button) vistica.findViewById(R.id.pulsaneitor);

        final Alumno alumnito = (Alumno) getItem(position);
        nombre.setText(alumnito.getNombre());
        foto.setImageResource(vistica.getResources().getIdentifier(alumnito.getRutaFoto(), "drawable", context.getPackageName()));
        audio.setOnClickListener(new View.OnClickListener() {
            public MediaPlayer mp;
            @Override
            public void onClick(View vistica) {
                mp = MediaPlayer.create(context, context.getResources().getIdentifier(alumnito.getRutaAudio(), "raw", context.getPackageName()));
                mp.start();
            }
        });
        return vistica;
    }
}
