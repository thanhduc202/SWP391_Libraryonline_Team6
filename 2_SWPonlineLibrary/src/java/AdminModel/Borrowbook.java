/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AdminModel;

import java.sql.Date;

/**
 *
 * @author win
 */
public class Borrowbook {
    private String aname;
    private String bname;
    private String statusname;
    private String lid;
    private Date odate;

    public Borrowbook() {
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getStatusname() {
        return statusname;
    }

    public void setStatusname(String statusname) {
        this.statusname = statusname;
    }

    public String getLid() {
        return lid;
    }

    public void setLid(String lid) {
        this.lid = lid;
    }

    public Date getOdate() {
        return odate;
    }

    public void setOdate(Date odate) {
        this.odate = odate;
    }

    @Override
    public String toString() {
        return "Borrowbook{" + "aname=" + aname + ", bname=" + bname + ", statusname=" + statusname + ", lid=" + lid + ", odate=" + odate + '}';
    }

    
}
