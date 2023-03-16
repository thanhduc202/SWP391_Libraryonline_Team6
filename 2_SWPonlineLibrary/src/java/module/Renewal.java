/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package module;

import java.sql.Date;

/**
 *
 * @author tient
 */
public class Renewal {
    private int renewalID;
    private Date extendDate;
    private String reason;
    private Order order;
    private Librarian librarian;
    private Status status;

    public Renewal() {
    }

    public Renewal(int renewalID, Date extendDate, String reason, Order order, Librarian librarian, Status status) {
        this.renewalID = renewalID;
        this.extendDate = extendDate;
        this.reason = reason;
        this.order = order;
        this.librarian = librarian;
        this.status = status;
    }

    public int getRenewalID() {
        return renewalID;
    }

    public void setRenewalID(int renewalID) {
        this.renewalID = renewalID;
    }

    public Date getExtendDate() {
        return extendDate;
    }

    public void setExtendDate(Date extendDate) {
        this.extendDate = extendDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Librarian getLibrarian() {
        return librarian;
    }

    public void setLibrarian(Librarian librarian) {
        this.librarian = librarian;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
    
    
}
