/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AdminModel;

/**
 *
 * @author win
 */
public class penalty {
    private int id;
    private String aname;
    private int oid;
    private float amount;
    private int sid;

    public penalty() {
    }

    public penalty(int id, String aname, int oid, float amount, int sid) {
        this.id = id;
        this.aname = aname;
        this.oid = oid;
        this.amount = amount;
        this.sid = sid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    @Override
    public String toString() {
        return "penalty{" + "id=" + id + ", aname=" + aname + ", oid=" + oid + ", amount=" + amount + ", sid=" + sid + '}';
    }
    
    
}
