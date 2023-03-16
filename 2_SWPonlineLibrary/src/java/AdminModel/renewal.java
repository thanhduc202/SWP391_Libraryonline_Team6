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
public class renewal {
    private int rid;
    private int oid;
    private String lid;
    private Date edate;
    private String reason;
    private int sid;

    public renewal() {
    }

    public renewal(int rid, int oid, String lid, Date edate, String reason, int sid) {
        this.rid = rid;
        this.oid = oid;
        this.lid = lid;
        this.edate = edate;
        this.reason = reason;
        this.sid = sid;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getLid() {
        return lid;
    }

    public void setLid(String lid) {
        this.lid = lid;
    }

    public Date getEdate() {
        return edate;
    }

    public void setEdate(Date edate) {
        this.edate = edate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    @Override
    public String toString() {
        return "renewal{" + "rid=" + rid + ", oid=" + oid + ", lid=" + lid + ", edate=" + edate + ", reason=" + reason + ", sid=" + sid + '}';
    }
    
    
}
