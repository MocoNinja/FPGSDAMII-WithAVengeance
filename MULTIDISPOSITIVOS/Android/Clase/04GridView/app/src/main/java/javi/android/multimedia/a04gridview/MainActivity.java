package javi.android.multimedia.a04gridview;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.GridView;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    private String[] datos = new String[25];

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        for (int i = 1; i < datos.length; i++){
            datos[i - 1] = "Dato: " + i;
        }

        final GridView gridOpciones = (GridView) this.findViewById(R.id.gridOpciones);
        final TextView texto = (TextView) this.findViewById(R.id.lblMensaje);

        gridOpciones.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int position, long l) {
                texto.setText("Seleccionado: " + datos[position]);
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {

            }
        });
        ArrayAdapter<String> a =  new ArrayAdapter<String>(this, R.layout.support_simple_spinner_dropdown_item, datos);
        gridOpciones.setAdapter(a);
    }
}
