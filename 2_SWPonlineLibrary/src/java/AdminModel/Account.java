/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AdminModel;



/**
 *
 * @author win
 */
public class Account {
    private int aid;
    private String name;
    private String password;
    private String fullname;
    private int gender;
    private int phonenumber;
    private int status;
    private int accesslevel;
    

    public Account() {
    }

    public Account(int aid, String name, String password, String fullname, int gender, int phonenumber, int status, int accesslevel) {
        this.aid = aid;
        this.name = name;
        this.password = password;
        this.fullname = fullname;
        this.gender = gender;
        this.phonenumber = phonenumber;
        this.status = status;
        this.accesslevel = accesslevel;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public int getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(int phonenumber) {
        this.phonenumber = phonenumber;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getAccesslevel() {
        return accesslevel;
    }

    public void setAccesslevel(int accesslevel) {
        this.accesslevel = accesslevel;
    }

    @Override
    public String toString() {
        return "Account{" + "aid=" + aid + ", name=" + name + ", password=" + password + ", fullname=" + fullname + ", gender=" + gender + ", phonenumber=" + phonenumber + ", status=" + status + ", accesslevel=" + accesslevel + '}';
    }

    
}
