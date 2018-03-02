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
 * @author Javier
 */
@Stateless
public class LibrosFacade extends AbstractFacade<Libros> {

    @PersistenceContext(unitName = "BibiotecaRepasoPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public LibrosFacade() {
        super(Libros.class);
    }
    
    public List<Libros> findLibrosPorAutor(Autores elAutor) {
        em = getEntityManager();
        Query q;
        if (elAutor == null) {
            return null;
        } else {
            q = em.createNamedQuery("Libros.findByAutor").setParameter("elAutor", elAutor);
            return q.getResultList();
        }
    }
 }
