package javi.android.multimedia.a03listviewdeverdad;

/**
 * Created by javier on 22/09/17.
 */

public class Libro {

    private String
            autor,
            titulo;

    public Libro(String titulo, String autor) {
        setTitulo(titulo);
        setAutor(autor);
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

}
