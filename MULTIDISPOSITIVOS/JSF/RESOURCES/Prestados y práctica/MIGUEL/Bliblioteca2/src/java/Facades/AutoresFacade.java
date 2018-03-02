/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Facades;

import Entidades.AutorPremio;
import Entidades.Autores;
import Entidades.Premios;
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
public class AutoresFacade extends AbstractFacade<Autores> {

    @PersistenceContext(unitName = "Bliblioteca2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AutoresFacade() {
        super(Autores.class);
    }
    
    public List<Autores> autoresOrdenados(){
        em=getEntityManager();
        Query q;
        q=em.createNamedQuery("Autores.findAll");
        return q.getResultList();
    }
    
    public List<AutorPremio> AutoresPremio(Premios premio){
        em=getEntityManager();
        Query q;
        if(premio != null){
            q=em.createNamedQuery("AutorPremio.findByCodPremio").setParameter("codPremio", premio.getCodPremio());
            return q.getResultList();
        }   
        return null;
    }
}
