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
public class ChartOfAccountsFacade extends AbstractFacade<ChartOfAccounts> {
    @PersistenceContext(unitName = "JasperReportsPU")
    private EntityManager em;

    protected EntityManager getEntityManager() {
        return em;
    }

    public ChartOfAccountsFacade() {
        super(ChartOfAccounts.class);
    }
    
}
