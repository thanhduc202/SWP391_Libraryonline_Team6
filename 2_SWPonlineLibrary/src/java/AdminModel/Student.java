/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AdminModel;

/**
 *
 * @author win
 */
public class Student {
    private String sid;
    private String accountname;
    private int semsester;
    private String major;
    private String Note;

    public Student() {
    }

    public Student(String sid, String accountname, int semsester, String major, String Note) {
        this.sid = sid;
        this.accountname = accountname;
        this.semsester = semsester;
        this.major = major;
        this.Note = Note;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getAccountname() {
        return accountname;
    }

    public void setAccountname(String accountname) {
        this.accountname = accountname;
    }

    public int getSemsester() {
        return semsester;
    }

    public void setSemsester(int semsester) {
        this.semsester = semsester;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getNote() {
        return Note;
    }

    public void setNote(String Note) {
        this.Note = Note;
    }

    @Override
    public String toString() {
        return "Student{" + "sid=" + sid + ", accountname=" + accountname + ", semsester=" + semsester + ", major=" + major + ", Note=" + Note + '}';
    }
    
    
}
