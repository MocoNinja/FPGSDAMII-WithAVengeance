/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Facades;

import Entidades.Premios;
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
public class PremiosFacade extends AbstractFacade<Premios> {

    @PersistenceContext(unitName = "BibiotecaRepasoPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PremiosFacade() {
        super(Premios.class);
    }
    
    public List<Premios> findAllDeLibros() {
        em = getEntityManager();
        Query q;
        q = em.createNamedQuery("Premios.findByTipo").setParameter("tipo", 'L');
        return q.getResultList();
    }
    
}
