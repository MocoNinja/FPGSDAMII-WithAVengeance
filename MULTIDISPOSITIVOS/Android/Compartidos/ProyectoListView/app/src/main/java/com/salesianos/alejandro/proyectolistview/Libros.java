package com.salesianos.alejandro.proyectolistview;

/**
 * Created by alejandro on 22/9/17.
 */

public class Libros {

    private String author;
    private String title;


    public Libros(String title, String author) {
        this.title = title;
        this.author = author;
    }

    public String getTitle() {
        return title;
    }

    public String getAuthor() {
        return author;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
}
