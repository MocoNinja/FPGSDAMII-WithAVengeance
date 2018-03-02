/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Facades;

import Entidades.Paises;
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
public class PaisesFacade extends AbstractFacade<Paises> {

    @PersistenceContext(unitName = "Bliblioteca2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PaisesFacade() {
        super(Paises.class);
    }

    public List<Paises> paises_ordenados() {
        em=getEntityManager();
        Query q;
        q=em.createNamedQuery("Paises.findAllOrden");
        return q.getResultList();
    }
    
}
