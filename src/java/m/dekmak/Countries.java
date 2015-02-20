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
@Table(name = "countries")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Countries.findAll", query = "SELECT c FROM Countries c"),
    @NamedQuery(name = "Countries.findById", query = "SELECT c FROM Countries c WHERE c.id = :id"),
    @NamedQuery(name = "Countries.findByCountryCode", query = "SELECT c FROM Countries c WHERE c.countryCode = :countryCode"),
    @NamedQuery(name = "Countries.findByCountryName", query = "SELECT c FROM Countries c WHERE c.countryName = :countryName"),
    @NamedQuery(name = "Countries.findByCurrencyCode", query = "SELECT c FROM Countries c WHERE c.currencyCode = :currencyCode"),
    @NamedQuery(name = "Countries.findByCurrencyName", query = "SELECT c FROM Countries c WHERE c.currencyName = :currencyName"),
    @NamedQuery(name = "Countries.findByIsoNumeric", query = "SELECT c FROM Countries c WHERE c.isoNumeric = :isoNumeric"),
    @NamedQuery(name = "Countries.findByLanguages", query = "SELECT c FROM Countries c WHERE c.languages = :languages")})
public class Countries implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "countryCode")
    private String countryCode;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "countryName")
    private String countryName;
    @Size(max = 3)
    @Column(name = "currencyCode")
    private String currencyCode;
    @Size(max = 255)
    @Column(name = "currencyName")
    private String currencyName;
    @Size(max = 4)
    @Column(name = "isoNumeric")
    private String isoNumeric;
    @Size(max = 30)
    @Column(name = "languages")
    private String languages;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "currencyId")
    private Collection<Accounts> accountsCollection;

    public Countries() {
    }

    public Countries(Integer id) {
        this.id = id;
    }

    public Countries(Integer id, String countryCode, String countryName) {
        this.id = id;
        this.countryCode = countryCode;
        this.countryName = countryName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public String getCurrencyCode() {
        return currencyCode;
    }

    public void setCurrencyCode(String currencyCode) {
        this.currencyCode = currencyCode;
    }

    public String getCurrencyName() {
        return currencyName;
    }

    public void setCurrencyName(String currencyName) {
        this.currencyName = currencyName;
    }

    public String getIsoNumeric() {
        return isoNumeric;
    }

    public void setIsoNumeric(String isoNumeric) {
        this.isoNumeric = isoNumeric;
    }

    public String getLanguages() {
        return languages;
    }

    public void setLanguages(String languages) {
        this.languages = languages;
    }

    @XmlTransient
    public Collection<Accounts> getAccountsCollection() {
        return accountsCollection;
    }

    public void setAccountsCollection(Collection<Accounts> accountsCollection) {
        this.accountsCollection = accountsCollection;
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
        if (!(object instanceof Countries)) {
            return false;
        }
        Countries other = (Countries) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return currencyCode;
    }
    
}
