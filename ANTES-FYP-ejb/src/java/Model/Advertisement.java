/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

/**
 *
 * @author tan
 */
@Entity
public class Advertisement implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    String title, category, jobdesc, requirement, workinghour, dresscode, spokenlanguage, uploaddate, jobsalary;
    @ManyToOne
    Employer employer;
    @OneToMany(mappedBy = "advertise")
    private List<Application> applications;

    public List<Application> getApplications() {
        return applications;
    }

    public void setApplications(List<Application> applications) {
        this.applications = applications;
    }

    public Advertisement() {
    }

    public Advertisement(String title, String category, String jobdesc, String requirement, String workinghour, String dresscode, String spokenlanguage, String uploaddate, String jobsalary, Employer employer) {
        this.title = title;
        this.category = category;
        this.jobdesc = jobdesc;
        this.requirement = requirement;
        this.workinghour = workinghour;
        this.dresscode = dresscode;
        this.spokenlanguage = spokenlanguage;
        this.uploaddate = uploaddate;
        this.jobsalary = jobsalary;
        this.employer = employer;
    }
    

    public String getUploaddate() {
        return uploaddate;
    }

    public void setUploaddate(String uploaddate) {
        this.uploaddate = uploaddate;
    }

    public String getJobsalary() {
        return jobsalary;
    }

    public void setJobsalary(String jobsalary) {
        this.jobsalary = jobsalary;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getJobdesc() {
        return jobdesc;
    }

    public void setJobdesc(String jobdesc) {
        this.jobdesc = jobdesc;
    }

    public String getRequirement() {
        return requirement;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }

    public String getWorkinghour() {
        return workinghour;
    }

    public void setWorkinghour(String workinghour) {
        this.workinghour = workinghour;
    }

    public String getDresscode() {
        return dresscode;
    }

    public void setDresscode(String dresscode) {
        this.dresscode = dresscode;
    }

    public String getSpokenlanguage() {
        return spokenlanguage;
    }

    public void setSpokenlanguage(String spokenlanguage) {
        this.spokenlanguage = spokenlanguage;
    }

    public Employer getEmployer() {
        return employer;
    }

    public void setEmployer(Employer employer) {
        this.employer = employer;
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
        if (!(object instanceof Advertisement)) {
            return false;
        }
        Advertisement other = (Advertisement) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Advertisement[ id=" + id + " ]";
    }

}
