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
import javax.persistence.Lob;
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
@Table(name = "accounts")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Accounts.findAll", query = "SELECT a FROM Accounts a"),
    @NamedQuery(name = "Accounts.findById", query = "SELECT a FROM Accounts a WHERE a.id = :id"),
    @NamedQuery(name = "Accounts.findByName", query = "SELECT a FROM Accounts a WHERE a.name = :name"),
    @NamedQuery(name = "Accounts.findByAccountTypeName", query = "SELECT a FROM Accounts a WHERE a.accountTypeId.name = :accountTypeName")})
public class Accounts implements Serializable {
    @OneToMany(mappedBy = "accountId")
    private Collection<ExpenseCategories> expenseCategoriesCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "paidThrough")
    private Collection<Expenses> expensesCollection1;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fromAccount")
    private Collection<Journals> journalsCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "toAccount")
    private Collection<Journals> journalsCollection1;
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
    @Lob
    @Size(max = 65535)
    @Column(name = "description")
    private String description;
    @JoinColumn(name = "currency_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Countries currencyId;
    @JoinColumn(name = "account_type_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private AccountTypes accountTypeId;

    public Accounts() {
    }

    public Accounts(Integer id) {
        this.id = id;
    }

    public Accounts(Integer id, String name) {
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Countries getCurrencyId() {
        return currencyId;
    }

    public void setCurrencyId(Countries currencyId) {
        this.currencyId = currencyId;
    }

    public AccountTypes getAccountTypeId() {
        return accountTypeId;
    }

    public void setAccountTypeId(AccountTypes accountTypeId) {
        this.accountTypeId = accountTypeId;
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
        if (!(object instanceof Accounts)) {
            return false;
        }
        Accounts other = (Accounts) object;
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
    public Collection<Journals> getJournalsCollection() {
        return journalsCollection;
    }

    public void setJournalsCollection(Collection<Journals> journalsCollection) {
        this.journalsCollection = journalsCollection;
    }

    @XmlTransient
    public Collection<Journals> getJournalsCollection1() {
        return journalsCollection1;
    }

    public void setJournalsCollection1(Collection<Journals> journalsCollection1) {
        this.journalsCollection1 = journalsCollection1;
    }

    @XmlTransient
    public Collection<ExpenseCategories> getExpenseCategoriesCollection() {
        return expenseCategoriesCollection;
    }

    public void setExpenseCategoriesCollection(Collection<ExpenseCategories> expenseCategoriesCollection) {
        this.expenseCategoriesCollection = expenseCategoriesCollection;
    }

    @XmlTransient
    public Collection<Expenses> getExpensesCollection1() {
        return expensesCollection1;
    }

    public void setExpensesCollection1(Collection<Expenses> expensesCollection1) {
        this.expensesCollection1 = expensesCollection1;
    }
    
}
