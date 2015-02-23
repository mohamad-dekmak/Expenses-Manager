/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package m.dekmak;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
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
    @NamedQuery(name = "Expenses.findByAmount", query = "SELECT e FROM Expenses e WHERE e.amount = :amount"),
    @NamedQuery(name = "Expenses.findByDated", query = "SELECT e FROM Expenses e WHERE e.dated = :dated"),
    @NamedQuery(name = "Expenses.findByCreatedOn", query = "SELECT e FROM Expenses e WHERE e.createdOn = :createdOn")})
public class Expenses implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "amount")
    private BigDecimal amount;
    @Basic(optional = false)
    @NotNull
    @Column(name = "dated")
    @Temporal(TemporalType.DATE)
    private Date dated;
    @Lob
    @Size(max = 65535)
    @Column(name = "description")
    private String description;
    @Column(name = "createdOn")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdOn;
    @JoinColumn(name = "expense_category_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private ExpenseCategories expenseCategoryId;
    @JoinColumn(name = "paid_through", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Accounts paidThrough;
    @JoinColumn(name = "createdBy", referencedColumnName = "id")
    @ManyToOne
    private Users createdBy;

    public Expenses() {
    }

    public Expenses(Integer id) {
        this.id = id;
    }

    public Expenses(Integer id, BigDecimal amount, Date dated) {
        this.id = id;
        this.amount = amount;
        this.dated = dated;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Date getDated() {
        return dated;
    }

    public void setDated(Date dated) {
        this.dated = dated;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
    }

    public ExpenseCategories getExpenseCategoryId() {
        return expenseCategoryId;
    }

    public void setExpenseCategoryId(ExpenseCategories expenseCategoryId) {
        this.expenseCategoryId = expenseCategoryId;
    }

    public Accounts getPaidThrough() {
        return paidThrough;
    }

    public void setPaidThrough(Accounts paidThrough) {
        this.paidThrough = paidThrough;
    }

    public Users getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Users createdBy) {
        this.createdBy = createdBy;
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
