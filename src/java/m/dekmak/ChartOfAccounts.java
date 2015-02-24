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
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author mdekmak
 */
@Entity
@Table(name = "chart_of_accounts")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ChartOfAccounts.findAll", query = "SELECT c FROM ChartOfAccounts c"),
    @NamedQuery(name = "ChartOfAccounts.findById", query = "SELECT c FROM ChartOfAccounts c WHERE c.id = :id"),
    @NamedQuery(name = "ChartOfAccounts.findByAccountName", query = "SELECT c FROM ChartOfAccounts c WHERE c.accountName = :accountName"),
    @NamedQuery(name = "ChartOfAccounts.findByCurrency", query = "SELECT c FROM ChartOfAccounts c WHERE c.currency = :currency"),
    @NamedQuery(name = "ChartOfAccounts.findByAccountType", query = "SELECT c FROM ChartOfAccounts c WHERE c.accountType = :accountType"),
    @NamedQuery(name = "ChartOfAccounts.findByBalance", query = "SELECT c FROM ChartOfAccounts c WHERE c.balance = :balance"),
    @NamedQuery(name = "ChartOfAccounts.findByTotalDebit", query = "SELECT c FROM ChartOfAccounts c WHERE c.totalDebit = :totalDebit"),
    @NamedQuery(name = "ChartOfAccounts.findByTotalCredit", query = "SELECT c FROM ChartOfAccounts c WHERE c.totalCredit = :totalCredit")})
public class ChartOfAccounts implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    private int id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "accountName")
    private String accountName;
    @Size(max = 3)
    @Column(name = "currency")
    private String currency;
    @Size(max = 255)
    @Column(name = "accountType")
    private String accountType;
    @Lob
    @Size(max = 65535)
    @Column(name = "description")
    private String description;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "balance")
    private BigDecimal balance;
    @Column(name = "totalDebit")
    private BigDecimal totalDebit;
    @Column(name = "totalCredit")
    private BigDecimal totalCredit;

    public ChartOfAccounts() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public BigDecimal getTotalDebit() {
        return totalDebit;
    }

    public void setTotalDebit(BigDecimal totalDebit) {
        this.totalDebit = totalDebit;
    }

    public BigDecimal getTotalCredit() {
        return totalCredit;
    }

    public void setTotalCredit(BigDecimal totalCredit) {
        this.totalCredit = totalCredit;
    }
    
}
