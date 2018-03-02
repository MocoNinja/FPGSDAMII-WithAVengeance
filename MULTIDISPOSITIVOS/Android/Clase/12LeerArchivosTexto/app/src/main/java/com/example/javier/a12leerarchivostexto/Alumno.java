package com.example.javier.a12leerarchivostexto;

public class Alumno
{
    private String nombre, rutaFoto, rutaAudio;

    public Alumno(String nombre, String rutaFoto, String rutaAudio) {
        this.nombre = nombre;
        this.rutaFoto = rutaFoto;
        this.rutaAudio = rutaAudio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRutaFoto() {
        return rutaFoto;
    }

    public void setRutaFoto(String rutaFoto) {
        this.rutaFoto = rutaFoto;
    }

    public String getRutaAudio() {
        return rutaAudio;
    }

    public void setRutaAudio(String rutaAudio) {
        this.rutaAudio = rutaAudio;
    }
}
