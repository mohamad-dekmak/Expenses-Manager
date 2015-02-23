/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package m.dekmak;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author mdekmak
 */
@Stateless
public class JournalsFacade extends AbstractFacade<Journals> {
    @PersistenceContext(unitName = "ExpensesManagerPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public JournalsFacade() {
        super(Journals.class);
    }
    
}
