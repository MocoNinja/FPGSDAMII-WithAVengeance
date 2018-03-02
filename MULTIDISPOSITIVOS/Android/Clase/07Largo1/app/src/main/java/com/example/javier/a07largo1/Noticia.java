package com.example.javier.a07largo1;

public class Noticia
{
    private String titulo, descripcion, fecha, categoria;

    public String getTitulo () {
        return titulo;
    }

    public void setTitulo (String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion () {
        return descripcion;
    }

    public void setDescripcion (String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFecha () {
        return fecha;
    }

    public void setFecha (String fecha) {
        this.fecha = fecha;
    }

    public String getCategoria () {
        return categoria;
    }

    public void setCategoria (String categoria) {
        this.categoria = categoria;
    }

    @Override
    public String toString () {
        return "Noticia{" +
                "titulo='" + titulo + '\'' +
                ", descripcion='" + descripcion + '\'' +
                ", fecha='" + fecha + '\'' +
                ", categoria='" + categoria + '\'' +
                '}';
    }
}
