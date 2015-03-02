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
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author mdekmak
 */
@Entity
@Table(name = "statement_of_expenses_per_user")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StatementOfExpensesPerUser.findAll", query = "SELECT s FROM StatementOfExpensesPerUser s"),
    @NamedQuery(name = "StatementOfExpensesPerUser.findById", query = "SELECT s FROM StatementOfExpensesPerUser s WHERE s.id = :id"),
    @NamedQuery(name = "StatementOfExpensesPerUser.findByUser", query = "SELECT s FROM StatementOfExpensesPerUser s WHERE s.user = :user"),
    @NamedQuery(name = "StatementOfExpensesPerUser.findByAmount", query = "SELECT s FROM StatementOfExpensesPerUser s WHERE s.amount = :amount"),
    @NamedQuery(name = "StatementOfExpensesPerUser.findByDated", query = "SELECT s FROM StatementOfExpensesPerUser s WHERE s.dated = :dated"),
    @NamedQuery(name = "StatementOfExpensesPerUser.findByExpenseCategory", query = "SELECT s FROM StatementOfExpensesPerUser s WHERE s.expenseCategory = :expenseCategory"),
    @NamedQuery(name = "StatementOfExpensesPerUser.findByExpenseAccountName", query = "SELECT s FROM StatementOfExpensesPerUser s WHERE s.expenseAccountName = :expenseAccountName"),
    @NamedQuery(name = "StatementOfExpensesPerUser.findByCurrency", query = "SELECT s FROM StatementOfExpensesPerUser s WHERE s.currency = :currency"),
    @NamedQuery(name = "StatementOfExpensesPerUser.findByPaidThroughAccountName", query = "SELECT s FROM StatementOfExpensesPerUser s WHERE s.paidThroughAccountName = :paidThroughAccountName")})
public class StatementOfExpensesPerUser implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Size(max = 15)
    @Column(name = "id")
    private String id;
    @Size(max = 255)
    @Column(name = "user")
    private String user;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "amount")
    private BigDecimal amount;
    @Column(name = "dated")
    @Temporal(TemporalType.DATE)
    private Date dated;
    @Size(max = 255)
    @Column(name = "expenseCategory")
    private String expenseCategory;
    @Size(max = 255)
    @Column(name = "expenseAccountName")
    private String expenseAccountName;
    @Size(max = 3)
    @Column(name = "currency")
    private String currency;
    @Size(max = 255)
    @Column(name = "paidThroughAccountName")
    private String paidThroughAccountName;

    public StatementOfExpensesPerUser() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
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

    public String getExpenseCategory() {
        return expenseCategory;
    }

    public void setExpenseCategory(String expenseCategory) {
        this.expenseCategory = expenseCategory;
    }

    public String getExpenseAccountName() {
        return expenseAccountName;
    }

    public void setExpenseAccountName(String expenseAccountName) {
        this.expenseAccountName = expenseAccountName;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public String getPaidThroughAccountName() {
        return paidThroughAccountName;
    }

    public void setPaidThroughAccountName(String paidThroughAccountName) {
        this.paidThroughAccountName = paidThroughAccountName;
    }
    
}
