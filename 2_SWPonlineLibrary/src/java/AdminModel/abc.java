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
public class abc {
    private String studentID;
    private String bname;
    private String content;
    private int star;
    private Date date;
    
    public abc() {
    }

    public abc(String studentID, String bname, String content, int star, Date date) {
        this.studentID = studentID;
        this.bname = bname;
        this.content = content;
        this.star = star;
        this.date = date;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "abc{" + "studentID=" + studentID + ", bname=" + bname + ", content=" + content + ", star=" + star + ", date=" + date + '}';
    }

    
}