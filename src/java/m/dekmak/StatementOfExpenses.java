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
@Table(name = "statement_of_expenses")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StatementOfExpenses.findAll", query = "SELECT s FROM StatementOfExpenses s"),
    @NamedQuery(name = "StatementOfExpenses.findById", query = "SELECT s FROM StatementOfExpenses s WHERE s.id = :id"),
    @NamedQuery(name = "StatementOfExpenses.findByExpenseCategory", query = "SELECT s FROM StatementOfExpenses s WHERE s.expenseCategory = :expenseCategory"),
    @NamedQuery(name = "StatementOfExpenses.findByExpenseCategoryParent", query = "SELECT s FROM StatementOfExpenses s WHERE s.expenseCategoryParent = :expenseCategoryParent"),
    @NamedQuery(name = "StatementOfExpenses.findByDated", query = "SELECT s FROM StatementOfExpenses s WHERE s.dated = :dated"),
    @NamedQuery(name = "StatementOfExpenses.findByExpenseAccountName", query = "SELECT s FROM StatementOfExpenses s WHERE s.expenseAccountName = :expenseAccountName"),
    @NamedQuery(name = "StatementOfExpenses.findByCurrency", query = "SELECT s FROM StatementOfExpenses s WHERE s.currency = :currency"),
    @NamedQuery(name = "StatementOfExpenses.findByExpenseAccountTypeName", query = "SELECT s FROM StatementOfExpenses s WHERE s.expenseAccountTypeName = :expenseAccountTypeName"),
    @NamedQuery(name = "StatementOfExpenses.findByPaidThroughAccountName", query = "SELECT s FROM StatementOfExpenses s WHERE s.paidThroughAccountName = :paidThroughAccountName"),
    @NamedQuery(name = "StatementOfExpenses.findByPaidThroughAccountTypeName", query = "SELECT s FROM StatementOfExpenses s WHERE s.paidThroughAccountTypeName = :paidThroughAccountTypeName"),
    @NamedQuery(name = "StatementOfExpenses.findByAmount", query = "SELECT s FROM StatementOfExpenses s WHERE s.amount = :amount")})
public class StatementOfExpenses implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Size(max = 15)
    @Column(name = "id")
    private String id;
    @Size(max = 255)
    @Column(name = "expenseCategory")
    private String expenseCategory;
    @Size(max = 255)
    @Column(name = "expenseCategoryParent")
    private String expenseCategoryParent;
    @Column(name = "dated")
    @Temporal(TemporalType.DATE)
    private Date dated;
    @Size(max = 255)
    @Column(name = "expenseAccountName")
    private String expenseAccountName;
    @Size(max = 3)
    @Column(name = "currency")
    private String currency;
    @Size(max = 255)
    @Column(name = "expenseAccountTypeName")
    private String expenseAccountTypeName;
    @Size(max = 255)
    @Column(name = "paidThroughAccountName")
    private String paidThroughAccountName;
    @Size(max = 255)
    @Column(name = "paidThroughAccountTypeName")
    private String paidThroughAccountTypeName;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "amount")
    private BigDecimal amount;

    public StatementOfExpenses() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getExpenseCategory() {
        return expenseCategory;
    }

    public void setExpenseCategory(String expenseCategory) {
        this.expenseCategory = expenseCategory;
    }

    public String getExpenseCategoryParent() {
        return expenseCategoryParent;
    }

    public void setExpenseCategoryParent(String expenseCategoryParent) {
        this.expenseCategoryParent = expenseCategoryParent;
    }

    public Date getDated() {
        return dated;
    }

    public void setDated(Date dated) {
        this.dated = dated;
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

    public String getExpenseAccountTypeName() {
        return expenseAccountTypeName;
    }

    public void setExpenseAccountTypeName(String expenseAccountTypeName) {
        this.expenseAccountTypeName = expenseAccountTypeName;
    }

    public String getPaidThroughAccountName() {
        return paidThroughAccountName;
    }

    public void setPaidThroughAccountName(String paidThroughAccountName) {
        this.paidThroughAccountName = paidThroughAccountName;
    }

    public String getPaidThroughAccountTypeName() {
        return paidThroughAccountTypeName;
    }

    public void setPaidThroughAccountTypeName(String paidThroughAccountTypeName) {
        this.paidThroughAccountTypeName = paidThroughAccountTypeName;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }
    
}
