
package bean;

import java.io.Serializable;


public class Candidate implements Serializable {
    private String firstname;
    private String lastname;
    private String dateofbirth;
    private String phone;
    private String email;
    private String gender;
    private String homeaddress;
    private String city;
    private String state; 
    private String position;
    private String candidateid;

    public Candidate(String firstname, String lastname, String dateofbirth, String phone, String email, String gender, String homeaddress, String city, String state, String position, String candidateid) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.dateofbirth = dateofbirth;
        this.phone = phone;
        this.email = email;
        this.gender = gender;
        this.homeaddress = homeaddress;
        this.city = city;
        this.state = state;
        this.position = position;
        this.candidateid = candidateid;
    }

    public Candidate() {
        this.firstname ="";
        this.lastname = "";
        this.dateofbirth = "";
        this.phone = "";
        this.email = "";
        this.gender = "";
        this.homeaddress ="";
        this.city = "";
        this.state = "";
        this.position = "";
        this.candidateid = "";
    }

    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public String getDateofbirth() {
        return dateofbirth;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public String getGender() {
        return gender;
    }

    public String getHomeaddress() {
        return homeaddress;
    }

    public String getCity() {
        return city;
    }

    public String getState() {
        return state;
    }

    public String getPosition() {
        return position;
    }

    public String getCandidateid() {
        return candidateid;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public void setDateofbirth(String dateofbirth) {
        this.dateofbirth = dateofbirth;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setHomeaddress(String homeaddress) {
        this.homeaddress = homeaddress;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public void setCandidateid(String candidateid) {
        this.candidateid = candidateid;
    }
    
}

