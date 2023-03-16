/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package module;

/**
 *
 * @author tient
 */
public class OrderDetail {
    private int orderDetailID;
    private int orderID;
    private String receivedOn;
    private String returnOn;
    private Book book;

    public OrderDetail() {
    }

    public OrderDetail(int orderDetailID, int orderID, String receivedOn, String returnOn, Book book) {
        this.orderDetailID = orderDetailID;
        this.orderID = orderID;
        this.receivedOn = receivedOn;
        this.returnOn = returnOn;
        this.book = book;
    }

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getReceivedOn() {
        return receivedOn;
    }

    public void setReceivedOn(String receivedOn) {
        this.receivedOn = receivedOn;
    }

    public String getReturnOn() {
        return returnOn;
    }

    public void setReturnOn(String returnOn) {
        this.returnOn = returnOn;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }
    
       
}
