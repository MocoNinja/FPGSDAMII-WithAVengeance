package com.example.javier.a10combinado01;

/**
 * Created by javier on 9/11/17.
 */

public class Menu
{
    private int id;
    private String Plato_1, Plato_2, Postre;
    private String fecha;

    public Menu(){}

    public Menu(int id, String plato_1, String plato_2, String postre, String fecha) {
        this.id = id;
        Plato_1 = plato_1;
        Plato_2 = plato_2;
        Postre = postre;
        this.fecha = fecha;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPlato_1() {
        return Plato_1;
    }

    public void setPlato_1(String plato_1) {
        Plato_1 = plato_1;
    }

    public String getPlato_2() {
        return Plato_2;
    }

    public void setPlato_2(String plato_2) {
        Plato_2 = plato_2;
    }

    public String getPostre() {
        return Postre;
    }

    public void setPostre(String postre) {
        Postre = postre;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
}
