/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package m.dekmak;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author mdekmak
 */
@Entity
@Table(name = "voucher_headers")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "VoucherHeaders.findAll", query = "SELECT v FROM VoucherHeaders v"),
    @NamedQuery(name = "VoucherHeaders.findById", query = "SELECT v FROM VoucherHeaders v WHERE v.id = :id"),
    @NamedQuery(name = "VoucherHeaders.findByDated", query = "SELECT v FROM VoucherHeaders v WHERE v.dated = :dated"),
    @NamedQuery(name = "VoucherHeaders.findByVoucherType", query = "SELECT v FROM VoucherHeaders v WHERE v.voucherType = :voucherType"),
    @NamedQuery(name = "VoucherHeaders.findByReferenceNum", query = "SELECT v FROM VoucherHeaders v WHERE v.referenceNum = :referenceNum"),
    @NamedQuery(name = "VoucherHeaders.findByCreatedOn", query = "SELECT v FROM VoucherHeaders v WHERE v.createdOn = :createdOn"),
    @NamedQuery(name = "VoucherHeaders.findByCreatedBy", query = "SELECT v FROM VoucherHeaders v WHERE v.createdBy = :createdBy")})
public class VoucherHeaders implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "dated")
    @Temporal(TemporalType.DATE)
    private Date dated;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 3)
    @Column(name = "voucherType")
    private String voucherType;
    @Size(max = 255)
    @Column(name = "referenceNum")
    private String referenceNum;
    @Lob
    @Size(max = 65535)
    @Column(name = "description")
    private String description;
    @Basic(optional = false)
    @NotNull
    @Column(name = "createdOn")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdOn;
    @Basic(optional = false)
    @NotNull
    @Column(name = "createdBy")
    private int createdBy;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "voucherHeaderId")
    private Collection<VoucherDetails> voucherDetailsCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "voucherHeaderId")
    private Collection<Expenses> expensesCollection;

    public VoucherHeaders() {
    }

    public VoucherHeaders(Integer id) {
        this.id = id;
    }

    public VoucherHeaders(Integer id, Date dated, String voucherType, Date createdOn, int createdBy) {
        this.id = id;
        this.dated = dated;
        this.voucherType = voucherType;
        this.createdOn = createdOn;
        this.createdBy = createdBy;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDated() {
        return dated;
    }

    public void setDated(Date dated) {
        this.dated = dated;
    }

    public String getVoucherType() {
        return voucherType;
    }

    public void setVoucherType(String voucherType) {
        this.voucherType = voucherType;
    }

    public String getReferenceNum() {
        return referenceNum;
    }

    public void setReferenceNum(String referenceNum) {
        this.referenceNum = referenceNum;
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

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    @XmlTransient
    public Collection<VoucherDetails> getVoucherDetailsCollection() {
        return voucherDetailsCollection;
    }

    public void setVoucherDetailsCollection(Collection<VoucherDetails> voucherDetailsCollection) {
        this.voucherDetailsCollection = voucherDetailsCollection;
    }

    @XmlTransient
    public Collection<Expenses> getExpensesCollection() {
        return expensesCollection;
    }

    public void setExpensesCollection(Collection<Expenses> expensesCollection) {
        this.expensesCollection = expensesCollection;
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
        if (!(object instanceof VoucherHeaders)) {
            return false;
        }
        VoucherHeaders other = (VoucherHeaders) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "m.dekmak.VoucherHeaders[ id=" + id + " ]";
    }
    
}
