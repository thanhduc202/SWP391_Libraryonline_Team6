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
public class OrderDetail {
    private int id;
    private int oid;
    private int bid;
    private String receivedon;
    private Date returnon;

    public OrderDetail() {
    }

    public OrderDetail(int id, int oid, int bid, String receivedon, Date returnon) {
        this.id = id;
        this.oid = oid;
        this.bid = bid;
        this.receivedon = receivedon;
        this.returnon = returnon;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getReceivedon() {
        return receivedon;
    }

    public void setReceivedon(String receivedon) {
        this.receivedon = receivedon;
    }

    public Date getReturnon() {
        return returnon;
    }

    public void setReturnon(Date returnon) {
        this.returnon = returnon;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "id=" + id + ", oid=" + oid + ", bid=" + bid + ", receivedon=" + receivedon + ", returnon=" + returnon + '}';
    }
    
    
    
}
