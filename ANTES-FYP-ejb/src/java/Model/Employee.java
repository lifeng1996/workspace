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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

/**
 *
 * @author tan
 */
@Entity
public class Employee implements Serializable {

    private static final long serialVersionUID = 1L;
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    String fname, lname, phoneno, intro,address,gender,email,dateofbirth,nationality;
    byte[] profilepic;
    byte[] resume;
    @Id
    @OneToOne
    UserAccount uid;
    @OneToMany(mappedBy = "candidate")
    private List<Application> applications;
    @OneToMany(mappedBy = "employee_id")
    private List<WorkHistory> workHistorys;
    @OneToMany(mappedBy = "employee_id")
    private List<Network> networks;

    public List<Network> getNetworks() {
        return networks;
    }

    public void setNetworks(List<Network> networks) {
        this.networks = networks;
    }

    public List<Application> getApplications() {
        return applications;
    }

    public void setApplications(List<Application> applications) {
        this.applications = applications;
    }

    public List<WorkHistory> getWorkHistorys() {
        return workHistorys;
    }

    public void setWorkHistorys(List<WorkHistory> workHistorys) {
        this.workHistorys = workHistorys;
    }

    public Employee(String fname, String lname, String phoneno, String intro, String address, String gender, String email, String dateofbirth, String nationality, byte[] profilepic, byte[] resume) {
        this.fname = fname;
        this.lname = lname;
        this.phoneno = phoneno;
        this.intro = intro;
        this.address = address;
        this.gender = gender;
        this.email = email;
        this.dateofbirth = dateofbirth;
        this.nationality = nationality;
        this.profilepic = profilepic;
        this.resume = resume;
    }

    public Employee(byte[] resume) {
        this.resume = resume;
    }

    public Employee(UserAccount uid) {
        this.uid = uid;
    }

    public Employee() {
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

    public String getPhoneno() {
        return phoneno;
    }

    public void setPhoneno(String phoneno) {
        this.phoneno = phoneno;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDateofbirth() {
        return dateofbirth;
    }

    public void setDateofbirth(String dateofbirth) {
        this.dateofbirth = dateofbirth;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public byte[] getProfilepic() {
        return profilepic;
    }

    public void setProfilepic(byte[] profilepic) {
        this.profilepic = profilepic;
    }

    public byte[] getResume() {
        return resume;
    }

    public void setResume(byte[] resume) {
        this.resume = resume;
    }

    public UserAccount getUid() {
        return uid;
    }

    public void setUid(UserAccount uid) {
        this.uid = uid;
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
        if (!(object instanceof Employee)) {
            return false;
        }
        Employee other = (Employee) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Employee[ id=" + id + " ]";
    }
    
}
