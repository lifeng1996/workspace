/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import static java.sql.JDBCType.BLOB;
import static java.sql.Types.BLOB;
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
public class Employer implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    String companyname;
    String address, email, intro,contact;
    byte[] profilepic;
    @Id
    @OneToOne
    UserAccount uid;
    @OneToMany(mappedBy = "employer")
    private List<Advertisement> advertisements;
    @OneToMany(mappedBy = "employer_id")
    private List<Network> networks;

    public List<Network> getNetworks() {
        return networks;
    }

    public void setNetworks(List<Network> networks) {
        this.networks = networks;
    }

    public Employer() {
    }

    public Employer(String companyname, String address, String email, String intro, String contact, byte[] profilepic) {
        this.companyname = companyname;
        this.address = address;
        this.email = email;
        this.intro = intro;
        this.contact = contact;
        this.profilepic = profilepic;
    }

    public Employer(UserAccount uid) {
        this.uid = uid;
    }

    public Employer(String companyname, String address, String email, String intro, String contact, byte[] profilepic, UserAccount uid) {
        this.companyname = companyname;
        this.address = address;
        this.email = email;
        this.intro = intro;
        this.contact = contact;
        this.profilepic = profilepic;
        this.uid = uid;
    }

    public String getCompanyname() {
        return companyname;
    }

    public void setCompanyname(String companyname) {
        this.companyname = companyname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public byte[] getProfilepic() {
        return profilepic;
    }

    public void setProfilepic(byte[] profilepic) {
        this.profilepic = profilepic;
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

    public List<Advertisement> getAdvertisements() {
        return advertisements;
    }

    public void setAdvertisements(List<Advertisement> advertisements) {
        this.advertisements = advertisements;
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
        if (!(object instanceof Employer)) {
            return false;
        }
        Employer other = (Employer) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Employer[ id=" + id + " ]";
    }
    
}
