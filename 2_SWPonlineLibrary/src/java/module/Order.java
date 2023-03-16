/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package module;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author tient
 */
public class Order {
    private int orderID;
    private Date orderDate;
    private Date scheduledTime;
    private Method method;
    private Librarian librarian;
    private Student student;
    private Status status;
    private ArrayList<OrderDetail> listOrderDetail;

    public Order() {
    }

    public Order(int orderID, Date orderDate, Date scheduledTime, Method method, Librarian librarian, Student student, Status status, ArrayList<OrderDetail> listOrderDetail) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.scheduledTime = scheduledTime;
        this.method = method;
        this.librarian = librarian;
        this.student = student;
        this.status = status;
        this.listOrderDetail = listOrderDetail;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    

    public ArrayList<OrderDetail> getListOrderDetail() {
        return listOrderDetail;
    }

    public void setListOrderDetail(ArrayList<OrderDetail> listOrder) {
        this.listOrderDetail = listOrder;
    }
    
    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }


    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getScheduledTime() {
        return scheduledTime;
    }

    public void setScheduledTime(Date scheduledTime) {
        this.scheduledTime = scheduledTime;
    }

    public Method getMethod() {
        return method;
    }

    public void setMethod(Method method) {
        this.method = method;
    }

    public Librarian getLibrarian() {
        return librarian;
    }

    public void setLibrarian(Librarian librarian) {
        this.librarian = librarian;
    }
    
    
}
