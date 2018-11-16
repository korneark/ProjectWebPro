/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Jpa;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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
 * @author INT303
 */
@Entity
@Table(name = "REGISTER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Register.findAll", query = "SELECT r FROM Register r")
    , @NamedQuery(name = "Register.findByUsername", query = "SELECT r FROM Register r WHERE r.username = :username")
    , @NamedQuery(name = "Register.findByPassword", query = "SELECT r FROM Register r WHERE r.password = :password")
    , @NamedQuery(name = "Register.findByFname", query = "SELECT r FROM Register r WHERE r.fname = :fname")
    , @NamedQuery(name = "Register.findByLname", query = "SELECT r FROM Register r WHERE r.lname = :lname")
    , @NamedQuery(name = "Register.findByEmail", query = "SELECT r FROM Register r WHERE r.email = :email")
    , @NamedQuery(name = "Register.findByAddress", query = "SELECT r FROM Register r WHERE r.address = :address")
    , @NamedQuery(name = "Register.findByTelno", query = "SELECT r FROM Register r WHERE r.telno = :telno")
    , @NamedQuery(name = "Register.findByCreditcard", query = "SELECT r FROM Register r WHERE r.creditcard = :creditcard")
    , @NamedQuery(name = "Register.findByRegisterdate", query = "SELECT r FROM Register r WHERE r.registerdate = :registerdate")})
public class Register implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "USERNAME")
    private String username;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "PASSWORD")
    private String password;
    @Size(max = 30)
    @Column(name = "FNAME")
    private String fname;
    @Size(max = 30)
    @Column(name = "LNAME")
    private String lname;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 30)
    @Column(name = "EMAIL")
    private String email;
    @Size(max = 500)
    @Column(name = "ADDRESS")
    private String address;
    @Column(name = "TELNO")
    private Integer telno;
    @Column(name = "CREDITCARD")
    private Integer creditcard;
    @Column(name = "REGISTERDATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date registerdate;

    public Register() {
    }

    public Register(String username) {
        this.username = username;
    }

    public Register(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public Register(String username, String password, String fName, String lName, String email, String address, Integer valueOf, Integer valueOf0) {
        this.username = username;
        this.password = password;
        this.fname = fName;
        this.lname = lName;
        this.email = email;
        this.address = address;
        this.telno = valueOf;
        this.creditcard = valueOf0;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getTelno() {
        return telno;
    }

    public void setTelno(Integer telno) {
        this.telno = telno;
    }

    public Integer getCreditcard() {
        return creditcard;
    }

    public void setCreditcard(Integer creditcard) {
        this.creditcard = creditcard;
    }

    public Date getRegisterdate() {
        return registerdate;
    }

    public void setRegisterdate(Date registerdate) {
        this.registerdate = registerdate;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (username != null ? username.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Register)) {
            return false;
        }
        Register other = (Register) object;
        if ((this.username == null && other.username != null) || (this.username != null && !this.username.equals(other.username))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Jpa.Register[ username=" + username + " ]";
    }
    
}
