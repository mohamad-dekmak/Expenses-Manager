/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package m.dekmak;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author mdekmak
 */
@Entity
@Table(name = "expenses")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Expenses.findAll", query = "SELECT e FROM Expenses e"),
    @NamedQuery(name = "Expenses.findById", query = "SELECT e FROM Expenses e WHERE e.id = :id"),
    @NamedQuery(name = "Expenses.findByVoucherId", query = "SELECT e FROM Expenses e WHERE e.voucherId = :voucherId"),
    @NamedQuery(name = "Expenses.findByAmount", query = "SELECT e FROM Expenses e WHERE e.amount = :amount")})
public class Expenses implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "voucher_id")
    private int voucherId;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "amount")
    private BigDecimal amount;
    @JoinColumn(name = "expense_category_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private ExpenseCategories expenseCategoryId;
    @JoinColumn(name = "expense_account", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Accounts expenseAccount;
    @JoinColumn(name = "paid_through", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Accounts paidThrough;

    public Expenses() {
    }

    public Expenses(Integer id) {
        this.id = id;
    }

    public Expenses(Integer id, int voucherId, BigDecimal amount) {
        this.id = id;
        this.voucherId = voucherId;
        this.amount = amount;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(int voucherId) {
        this.voucherId = voucherId;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public ExpenseCategories getExpenseCategoryId() {
        return expenseCategoryId;
    }

    public void setExpenseCategoryId(ExpenseCategories expenseCategoryId) {
        this.expenseCategoryId = expenseCategoryId;
    }

    public Accounts getExpenseAccount() {
        return expenseAccount;
    }

    public void setExpenseAccount(Accounts expenseAccount) {
        this.expenseAccount = expenseAccount;
    }

    public Accounts getPaidThrough() {
        return paidThrough;
    }

    public void setPaidThrough(Accounts paidThrough) {
        this.paidThrough = paidThrough;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Expenses)) {
            return false;
        }
        Expenses other = (Expenses) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "m.dekmak.Expenses[ id=" + id + " ]";
    }
    
}
