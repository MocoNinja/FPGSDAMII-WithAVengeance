package learn.javi.myapplication;

import android.app.Activity;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.List;



public class CDAdapter extends ArrayAdapter
{
    Activity context;
    LayoutInflater inflater;

    TextView titulo, companyia, pais, artista, anyo, precio;

    public CDAdapter (Activity context, List<CD> CDs)
    {
        super(context, R.layout.cdview_layout, CDs);
        this.context = context;
        inflater = context.getLayoutInflater();
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent)
    {
        View libroView = inflater.inflate(R.layout.cdview_layout, null);

        titulo = (TextView) libroView.findViewById(R.id.titulo);
        companyia = (TextView) libroView.findViewById(R.id.companyia);
        pais = (TextView) libroView.findViewById(R.id.pais);
        artista = (TextView) libroView.findViewById(R.id.artista);
        anyo = (TextView) libroView.findViewById(R.id.anyo);
        precio = (TextView) libroView.findViewById(R.id.precio);


        CD pintar = (CD) getItem(position);
        titulo.setText(pintar.getTitulo());
        companyia.setText(pintar.getCompanyia());
        pais.setText(pintar.getPasis());
        artista.setText(pintar.getArtista());
        anyo.setText(pintar.getAnyo());
        precio.setText(pintar.getPrecio());

        return libroView;
    }
}
