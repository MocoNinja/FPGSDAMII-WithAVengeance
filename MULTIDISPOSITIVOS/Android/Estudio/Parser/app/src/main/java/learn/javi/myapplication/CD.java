package learn.javi.myapplication;

/**
 * Created by Javier on 30/11/2017.
 */

public class CD
{
    private String titulo, artista, pasis, companyia, precio, anyo;

    public CD (String titulo, String artista, String pais, String companyia, String precio, String anyo)
    {
        this.titulo = titulo;
        this.artista = artista;
        this.pasis = pais;
        this.companyia = companyia;
        this.precio = precio;
        this.anyo = anyo;
    }

    public CD()
    {

    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getArtista() {
        return artista;
    }

    public void setArtista(String artista) {
        this.artista = artista;
    }

    public String getPasis() {
        return pasis;
    }

    public void setPasis(String pasis) {
        this.pasis = pasis;
    }

    public String getCompanyia() {
        return companyia;
    }

    public void setCompanyia(String companyia) {
        this.companyia = companyia;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    public String getAnyo() {
        return anyo;
    }

    public void setAnyo(String anyo) {
        this.anyo = anyo;
    }
}
