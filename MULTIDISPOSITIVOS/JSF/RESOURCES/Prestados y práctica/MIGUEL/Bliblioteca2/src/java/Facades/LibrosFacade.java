/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Facades;

import Entidades.Autores;
import Entidades.Libros;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Miguel
 */
@Stateless
public class LibrosFacade extends AbstractFacade<Libros> {

    @PersistenceContext(unitName = "Bliblioteca2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public LibrosFacade() {
        super(Libros.class);
    }
    //metodos que hagan consultas a la base de datos, a la tabla de libros
    public List<Libros> librosAutor(Autores autor){
        em=getEntityManager();
        Query q;
        if(autor != null){
            q=em.createNamedQuery("Libros.librosPorAutor").setParameter("elAutor", autor);
            return q.getResultList();
        }   
        return null;
    }
}
