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
public class Application implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    String intro,appstatus;
    @ManyToOne
    Employee candidate;
    @ManyToOne
    Advertisement advertise;

    public Application(Employee candidate, Advertisement advertise) {
        this.candidate = candidate;
        this.advertise = advertise;
    }

    public Application(String intro, String appstatus, Employee candidate, Advertisement advertise) {
        this.intro = intro;
        this.appstatus = appstatus;
        this.candidate = candidate;
        this.advertise = advertise;
    }


    public Application() {
    }

    public String getAppstatus() {
        return appstatus;
    }

    public void setAppstatus(String appstatus) {
        this.appstatus = appstatus;
    }

    
    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public Employee getCandidate() {
        return candidate;
    }

    public void setCandidate(Employee candidate) {
        this.candidate = candidate;
    }

    public Advertisement getAdvertise() {
        return advertise;
    }

    public void setAdvertise(Advertisement advertise) {
        this.advertise = advertise;
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
        if (!(object instanceof Application)) {
            return false;
        }
        Application other = (Application) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Application[ id=" + id + " ]";
    }
    
}
