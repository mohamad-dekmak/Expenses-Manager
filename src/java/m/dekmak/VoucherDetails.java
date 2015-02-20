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
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
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
@Table(name = "voucher_details")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "VoucherDetails.findAll", query = "SELECT v FROM VoucherDetails v"),
    @NamedQuery(name = "VoucherDetails.findById", query = "SELECT v FROM VoucherDetails v WHERE v.id = :id"),
    @NamedQuery(name = "VoucherDetails.findByDrCr", query = "SELECT v FROM VoucherDetails v WHERE v.drCr = :drCr"),
    @NamedQuery(name = "VoucherDetails.findByAmount", query = "SELECT v FROM VoucherDetails v WHERE v.amount = :amount")})
public class VoucherDetails implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "drCr")
    private Character drCr;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "amount")
    private BigDecimal amount;
    @Lob
    @Size(max = 65535)
    @Column(name = "description")
    private String description;
    @JoinColumn(name = "account_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Accounts accountId;
    @JoinColumn(name = "voucher_header_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private VoucherHeaders voucherHeaderId;

    public VoucherDetails() {
    }

    public VoucherDetails(Integer id) {
        this.id = id;
    }

    public VoucherDetails(Integer id, Character drCr, BigDecimal amount) {
        this.id = id;
        this.drCr = drCr;
        this.amount = amount;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Character getDrCr() {
        return drCr;
    }

    public void setDrCr(Character drCr) {
        this.drCr = drCr;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Accounts getAccountId() {
        return accountId;
    }

    public void setAccountId(Accounts accountId) {
        this.accountId = accountId;
    }

    public VoucherHeaders getVoucherHeaderId() {
        return voucherHeaderId;
    }

    public void setVoucherHeaderId(VoucherHeaders voucherHeaderId) {
        this.voucherHeaderId = voucherHeaderId;
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
        if (!(object instanceof VoucherDetails)) {
            return false;
        }
        VoucherDetails other = (VoucherDetails) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "m.dekmak.VoucherDetails[ id=" + id + " ]";
    }
    
}
