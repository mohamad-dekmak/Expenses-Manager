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
@Table(name = "journals")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Journals.findAll", query = "SELECT j FROM Journals j"),
    @NamedQuery(name = "Journals.findById", query = "SELECT j FROM Journals j WHERE j.id = :id"),
    @NamedQuery(name = "Journals.findByAmount", query = "SELECT j FROM Journals j WHERE j.amount = :amount"),
    @NamedQuery(name = "Journals.findByDated", query = "SELECT j FROM Journals j WHERE j.dated = :dated"),
    @NamedQuery(name = "Journals.findByCreatedOn", query = "SELECT j FROM Journals j WHERE j.createdOn = :createdOn")})
public class Journals implements Serializable {
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
    @Basic(optional = false)
    @NotNull
    @Column(name = "createdOn")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdOn;
    @JoinColumn(name = "from_account", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Accounts fromAccount;
    @JoinColumn(name = "to_account", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Accounts toAccount;
    @JoinColumn(name = "createdBy", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Users createdBy;

    public Journals() {
    }

    public Journals(Integer id) {
        this.id = id;
    }

    public Journals(Integer id, BigDecimal amount, Date dated, Date createdOn) {
        this.id = id;
        this.amount = amount;
        this.dated = dated;
        this.createdOn = createdOn;
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

    public Accounts getFromAccount() {
        return fromAccount;
    }

    public void setFromAccount(Accounts fromAccount) {
        this.fromAccount = fromAccount;
    }

    public Accounts getToAccount() {
        return toAccount;
    }

    public void setToAccount(Accounts toAccount) {
        this.toAccount = toAccount;
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
        if (!(object instanceof Journals)) {
            return false;
        }
        Journals other = (Journals) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "m.dekmak.Journals[ id=" + id + " ]";
    }
    
}
