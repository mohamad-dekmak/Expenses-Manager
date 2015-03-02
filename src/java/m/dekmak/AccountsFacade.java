/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package m.dekmak;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author mdekmak
 */
@Stateless
public class AccountsFacade extends AbstractFacade<Accounts> {

    @PersistenceContext(unitName = "ExpensesManagerPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AccountsFacade() {
        super(Accounts.class);
    }

    public List<Accounts> getAccountsAssets() {
        List<Accounts> Assets;
        Assets = em.createNamedQuery("Accounts.findByAccountTypeName").setParameter("accountTypeName", "Asset / Cash").getResultList();
        return Assets;
    }
    
    public List<Accounts> getAccountsExpenses() {
        List<Accounts> Expenses;
        Expenses = em.createNamedQuery("Accounts.findByAccountTypeName").setParameter("accountTypeName", "Expense").getResultList();
        return Expenses;
    }
}
