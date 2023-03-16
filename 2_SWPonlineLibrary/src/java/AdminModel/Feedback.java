/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AdminModel;

/**
 *
 * @author win
 */
public class Feedback {
     private String sid;
     private int bid;
     private String content;
     private int star;

    public Feedback() {
    }

    public Feedback(String sid, int bid, String content, int star) {
        this.sid = sid;
        this.bid = bid;
        this.content = content;
        this.star = star;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    @Override
    public String toString() {
        return "Feedback{" + "sid=" + sid + ", bid=" + bid + ", content=" + content + ", star=" + star + '}';
    }

    
     
}
