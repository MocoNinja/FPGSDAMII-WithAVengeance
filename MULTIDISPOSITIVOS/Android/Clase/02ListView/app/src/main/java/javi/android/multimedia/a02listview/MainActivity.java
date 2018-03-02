package javi.android.multimedia.a02listview;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        final String[] palabricas = {
                "Melocotón",
                "Ciruelas",
                "Jamón Serrano",
                "Tornillos",
                "Fusil de asalto semiautomático",
                "la lu li le lo",
                "Son los patriots"
        };

        ListView lista = (ListView) findViewById(R.id.listica);
        ArrayAdapter<String> a = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_activated_1, palabricas);
        lista.setAdapter(a);
    }
}
