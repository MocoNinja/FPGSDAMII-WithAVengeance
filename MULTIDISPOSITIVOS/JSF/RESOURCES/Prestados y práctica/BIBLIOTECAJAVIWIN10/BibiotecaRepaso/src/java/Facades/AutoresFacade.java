/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Facades;

import Entidades.Autores;
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
public class AutoresFacade extends AbstractFacade<Autores> {

    @PersistenceContext(unitName = "BibiotecaRepasoPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AutoresFacade() {
        super(Autores.class);
    }
    
    public List<Autores> findAllOrdenados() {
        em = getEntityManager();
        Query q;
        q = em.createNamedQuery("Autores.findAllOrdenados");
        return q.getResultList();
    }
    
}
