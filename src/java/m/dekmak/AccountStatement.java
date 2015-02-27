/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package m.dekmak;

import java.io.Serializable;
import java.util.Date;
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
@Table(name = "account_statement")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AccountStatement.findAll", query = "SELECT a FROM AccountStatement a"),
    @NamedQuery(name = "AccountStatement.findById", query = "SELECT a FROM AccountStatement a WHERE a.id = :id"),
    @NamedQuery(name = "AccountStatement.findByAccountName", query = "SELECT a FROM AccountStatement a WHERE a.accountName = :accountName"),
    @NamedQuery(name = "AccountStatement.findByCurrency", query = "SELECT a FROM AccountStatement a WHERE a.currency = :currency"),
    @NamedQuery(name = "AccountStatement.findByAccountType", query = "SELECT a FROM AccountStatement a WHERE a.accountType = :accountType"),
    @NamedQuery(name = "AccountStatement.findByDebit", query = "SELECT a FROM AccountStatement a WHERE a.debit = :debit"),
    @NamedQuery(name = "AccountStatement.findByCredit", query = "SELECT a FROM AccountStatement a WHERE a.credit = :credit"),
    @NamedQuery(name = "AccountStatement.findByVoucherType", query = "SELECT a FROM AccountStatement a WHERE a.voucherType = :voucherType"),
    @NamedQuery(name = "AccountStatement.findByRefNum", query = "SELECT a FROM AccountStatement a WHERE a.refNum = :refNum"),
    @NamedQuery(name = "AccountStatement.findByDated", query = "SELECT a FROM AccountStatement a WHERE a.dated = :dated")})
public class AccountStatement implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    private Integer id;
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
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "debit")
    private BigDecimal debit;
    @Column(name = "credit")
    private BigDecimal credit;
    @Size(max = 3)
    @Column(name = "voucherType")
    private String voucherType;
    @Size(max = 15)
    @Column(name = "refNum")
    private String refNum;
    @Column(name = "dated")
    @Temporal(TemporalType.DATE)
    private Date dated;
    @Lob
    @Size(max = 65535)
    @Column(name = "accountDescription")
    private String accountDescription;
    @Lob
    @Size(max = 65535)
    @Column(name = "voucherDescription")
    private String voucherDescription;

    public AccountStatement() {
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

    public BigDecimal getDebit() {
        return debit;
    }

    public void setDebit(BigDecimal debit) {
        this.debit = debit;
    }

    public BigDecimal getCredit() {
        return credit;
    }

    public void setCredit(BigDecimal credit) {
        this.credit = credit;
    }

    public String getVoucherType() {
        return voucherType;
    }

    public void setVoucherType(String voucherType) {
        this.voucherType = voucherType;
    }

    public String getRefNum() {
        return refNum;
    }

    public void setRefNum(String refNum) {
        this.refNum = refNum;
    }

    public Date getDated() {
        return dated;
    }

    public void setDated(Date dated) {
        this.dated = dated;
    }

    public String getAccountDescription() {
        return accountDescription;
    }

    public void setAccountDescription(String accountDescription) {
        this.accountDescription = accountDescription;
    }

    public String getVoucherDescription() {
        return voucherDescription;
    }

    public void setVoucherDescription(String voucherDescription) {
        this.voucherDescription = voucherDescription;
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
        if (!(object instanceof AccountStatement)) {
            return false;
        }
        AccountStatement other = (AccountStatement) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return accountName;
    }
    
}
