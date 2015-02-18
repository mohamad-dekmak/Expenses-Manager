/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package m.dekmak;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author mdekmak
 */
@Entity
@Table(name = "expense_categories")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ExpenseCategories.findAll", query = "SELECT e FROM ExpenseCategories e"),
    @NamedQuery(name = "ExpenseCategories.findById", query = "SELECT e FROM ExpenseCategories e WHERE e.id = :id"),
    @NamedQuery(name = "ExpenseCategories.findByName", query = "SELECT e FROM ExpenseCategories e WHERE e.name = :name")})
public class ExpenseCategories implements Serializable {
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "expenseCategoryId")
    private Collection<Expenses> expensesCollection;
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "name")
    private String name;
    @JoinColumn(name = "account_id", referencedColumnName = "id")
    @ManyToOne
    private Accounts accountId;
    @OneToMany(mappedBy = "expenseCategoryId")
    private Collection<ExpenseCategories> expenseCategoriesCollection;
    @JoinColumn(name = "expense_category_id", referencedColumnName = "id")
    @ManyToOne
    private ExpenseCategories expenseCategoryId;

    public ExpenseCategories() {
    }

    public ExpenseCategories(Integer id) {
        this.id = id;
    }

    public ExpenseCategories(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Accounts getAccountId() {
        return accountId;
    }

    public void setAccountId(Accounts accountId) {
        this.accountId = accountId;
    }

    @XmlTransient
    public Collection<ExpenseCategories> getExpenseCategoriesCollection() {
        return expenseCategoriesCollection;
    }

    public void setExpenseCategoriesCollection(Collection<ExpenseCategories> expenseCategoriesCollection) {
        this.expenseCategoriesCollection = expenseCategoriesCollection;
    }

    public ExpenseCategories getExpenseCategoryId() {
        return expenseCategoryId;
    }

    public void setExpenseCategoryId(ExpenseCategories expenseCategoryId) {
        this.expenseCategoryId = expenseCategoryId;
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
        if (!(object instanceof ExpenseCategories)) {
            return false;
        }
        ExpenseCategories other = (ExpenseCategories) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return name;
    }

    @XmlTransient
    public Collection<Expenses> getExpensesCollection() {
        return expensesCollection;
    }

    public void setExpensesCollection(Collection<Expenses> expensesCollection) {
        this.expensesCollection = expensesCollection;
    }
    
}
