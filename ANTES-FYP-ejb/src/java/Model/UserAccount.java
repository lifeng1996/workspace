/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

/**
 *
 * @author tan
 */
@Entity
public class UserAccount implements Serializable {

    private static final long serialVersionUID = 1L;
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Id
    String name;
    String pass;
    char iden;
    @OneToOne(mappedBy = "uid")
    private Employer employer;
    @OneToOne(mappedBy = "uid")
    private Employee employee;

    public UserAccount(String name, String pass, char iden, Employer employer) {
        this.name = name;
        this.pass = pass;
        this.iden = iden;
        this.employer = employer;
    }

    public UserAccount(String name, String pass, char iden, Employee employee) {
        this.name = name;
        this.pass = pass;
        this.iden = iden;
        this.employee = employee;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Employer getEmployer() {
        return employer;
    }

    public void setEmployer(Employer employer) {
        this.employer = employer;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public char getIden() {
        return iden;
    }

    public void setIden(char iden) {
        this.iden = iden;
    }

    public UserAccount(String name, String pass, char iden) {
        this.name = name;
        this.pass = pass;
        this.iden = iden;
    }

    public UserAccount() {
    }
    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
        if (!(object instanceof UserAccount)) {
            return false;
        }
        UserAccount other = (UserAccount) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.UserAccount[ id=" + id + " ]";
    }
    
}
