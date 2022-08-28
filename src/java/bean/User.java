/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;

/**
 *
 * @author USER
 */
public class User implements Serializable{
    private String name;
    private String phone;
    private String email;
    private String idnumber;
    private String otp;

    public User() {
        this.name = "";
        this.phone =  "";
        this.email =  "";
        this.idnumber =  "";
        this.otp =  "";
    }

    public String getName() {
        return name;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public String getIdnumber() {
        return idnumber;
    }

    public String getOtp() {
        return otp;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setIdnumber(String idnumber) {
        this.idnumber = idnumber;
    }

    public void setOtp(String otp) {
        this.otp = otp;
    }
    
    
}
