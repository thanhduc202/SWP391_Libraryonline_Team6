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
public class Borrow {
    private int brid;
    private String sid;
    private String lid;
    private int bid;
    private Date databorrow;
    private Date deadline;
    private int sus;

    public Borrow() {
    }

    public Borrow(int brid, String sid, String lid, int bid, Date databorrow, Date deadline, int sus) {
        this.brid = brid;
        this.sid = sid;
        this.lid = lid;
        this.bid = bid;
        this.databorrow = databorrow;
        this.deadline = deadline;
        this.sus = sus;
    }

    public int getBrid() {
        return brid;
    }

    public void setBrid(int brid) {
        this.brid = brid;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getLid() {
        return lid;
    }

    public void setLid(String lid) {
        this.lid = lid;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public Date getDataborrow() {
        return databorrow;
    }

    public void setDataborrow(Date databorrow) {
        this.databorrow = databorrow;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public int getSus() {
        return sus;
    }

    public void setSus(int sus) {
        this.sus = sus;
    }

    @Override
    public String toString() {
        return "Borrow{" + "brid=" + brid + ", sid=" + sid + ", lid=" + lid + ", bid=" + bid + ", databorrow=" + databorrow + ", deadline=" + deadline + ", sus=" + sus + '}';
    }

    
    
}
