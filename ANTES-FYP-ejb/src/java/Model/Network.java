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
import javax.persistence.ManyToOne;

/**
 *
 * @author tan
 */
@Entity
public class Network implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    String comments,status;
    @ManyToOne
    Employee employee_id;
    @ManyToOne
    Employer employer_id;

    public Network(String status, Employee employee_id, Employer employer_id) {
        this.status = status;
        this.employee_id = employee_id;
        this.employer_id = employer_id;
    }

    public Network(String comments, String status, Employee employee_id, Employer employer_id) {
        this.comments = comments;
        this.status = status;
        this.employee_id = employee_id;
        this.employer_id = employer_id;
    }

    public Network() {
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Employee getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(Employee employee_id) {
        this.employee_id = employee_id;
    }

    public Employer getEmployer_id() {
        return employer_id;
    }

    public void setEmployer_id(Employer employer_id) {
        this.employer_id = employer_id;
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
        if (!(object instanceof Network)) {
            return false;
        }
        Network other = (Network) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Network[ id=" + id + " ]";
    }
    
}
