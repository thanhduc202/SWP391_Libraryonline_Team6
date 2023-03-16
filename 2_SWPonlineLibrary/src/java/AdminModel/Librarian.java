/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AdminModel;

/**
 *
 * @author win
 */
public class Librarian {
    private String lid;
    private String accountname;
    private String shift;
    private String note;

    public Librarian() {
    }

    public Librarian(String lid, String accountname, String shift, String note) {
        this.lid = lid;
        this.accountname = accountname;
        this.shift = shift;
        this.note = note;
    }

    public String getLid() {
        return lid;
    }

    public void setLid(String lid) {
        this.lid = lid;
    }

    public String getAccountname() {
        return accountname;
    }

    public void setAccountname(String accountname) {
        this.accountname = accountname;
    }

    public String getShift() {
        return shift;
    }

    public void setShift(String shift) {
        this.shift = shift;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "Librarian{" + "lid=" + lid + ", accountname=" + accountname + ", shift=" + shift + ", note=" + note + '}';
    }
    
    
}
