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
public class Order {
    private int oid;
    private String accountname;
    private int mid;
    private String lid;
    private Date odate;
    private Date stime;

    public Order() {
    }

    public Order(int oid, String accountname, int mid, String lid, Date odate, Date stime) {
        this.oid = oid;
        this.accountname = accountname;
        this.mid = mid;
        this.lid = lid;
        this.odate = odate;
        this.stime = stime;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getAccountname() {
        return accountname;
    }

    public void setAccountname(String accountname) {
        this.accountname = accountname;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
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

    public Date getStime() {
        return stime;
    }

    public void setStime(Date stime) {
        this.stime = stime;
    }

    @Override
    public String toString() {
        return "Order{" + "oid=" + oid + ", accountname=" + accountname + ", mid=" + mid + ", lid=" + lid + ", odate=" + odate + ", stime=" + stime + '}';
    }
    
    
}
