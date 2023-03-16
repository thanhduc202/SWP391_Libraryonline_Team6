/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package module;

/**
 *
 * @author thanh
 */
public class OrderHistory {
    private String accountName, orderDate, scheduledTime, bName, image, statusName;
    private int bookID;

    public OrderHistory() {
    }

    public OrderHistory(String accountName, String orderDate, String scheduledTime, String bName, String image, String statusName, int bookID) {
        this.accountName = accountName;
        this.orderDate = orderDate;
        this.scheduledTime = scheduledTime;
        this.bName = bName;
        this.image = image;
        this.statusName = statusName;
        this.bookID = bookID;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getScheduledTime() {
        return scheduledTime;
    }

    public void setScheduledTime(String scheduledTime) {
        this.scheduledTime = scheduledTime;
    }

    public String getbName() {
        return bName;
    }

    public void setbName(String bName) {
        this.bName = bName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }
    
    
    
}