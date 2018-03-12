/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author tan
 */
@Stateless
public class NetworkFacade extends AbstractFacade<Network> {

    @PersistenceContext(unitName = "ANTES-FYP-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public NetworkFacade() {
        super(Network.class);
    }
    
}
