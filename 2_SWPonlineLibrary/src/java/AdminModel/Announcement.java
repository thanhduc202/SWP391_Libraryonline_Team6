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
public class Announcement {
    private int id;
    private String librarianid;
    private Date publicdate;
    private String title;
    private String note;

    public Announcement() {
    }

    public Announcement(int id, String librarianid, Date publicdate, String title, String note) {
        this.id = id;
        this.librarianid = librarianid;
        this.publicdate = publicdate;
        this.title = title;
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLibrarianid() {
        return librarianid;
    }

    public void setLibrarianid(String librarianid) {
        this.librarianid = librarianid;
    }

    public Date getPublicdate() {
        return publicdate;
    }

    public void setPublicdate(Date publicdate) {
        this.publicdate = publicdate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "Announcement{" + "id=" + id + ", librarianid=" + librarianid + ", publicdate=" + publicdate + ", title=" + title + ", note=" + note + '}';
    }
    
    
}
