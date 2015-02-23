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
public class ExpenseCategoriesFacade extends AbstractFacade<ExpenseCategories> {
    @PersistenceContext(unitName = "ExpensesManagerPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ExpenseCategoriesFacade() {
        super(ExpenseCategories.class);
    }

    public List<ExpenseCategories> getCategoryByName() {
        List<ExpenseCategories> ExpCat;
        ExpCat = em.createNamedQuery("ExpenseCategories.findByName").setParameter("name", "Rent").getResultList();
        return ExpCat;
    }
    
}
