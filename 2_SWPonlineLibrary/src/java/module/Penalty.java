/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package module;

/**
 *
 * @author tient
 */
public class Penalty {
    private int penaltyID;
    private double amount;
    private int dateOver;
    private Student student;
    private Order order;
    private Status status;

    public Penalty() {
    }

    public Penalty(int penaltyID, double amount, int dateOver, Student student, Order order, Status status) {
        this.penaltyID = penaltyID;
        this.amount = amount;
        this.dateOver = dateOver;
        this.student = student;
        this.order = order;
        this.status = status;
    }

    public int getDateOver() {
        return dateOver;
    }

    public void setDateOver(int dateOver) {
        this.dateOver = dateOver;
    }

    
    
    public int getPenaltyID() {
        return penaltyID;
    }

    public void setPenaltyID(int penaltyID) {
        this.penaltyID = penaltyID;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
    
    public double getTotalAmount(){
        return this.amount * this.dateOver;
    }
}
