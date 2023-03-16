/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author chung
 */
public class bookRate extends book{
    private float rate;

    public bookRate() {
    }

    public bookRate(float rate, int bookId, String bookName, String author, String image, int cId, String language, String description, int status, int quantity, String publisher, int pages, int publishYear) {
        super(bookId, bookName, author, image, cId, language, description, status, quantity, publisher, pages, publishYear);
        this.rate = rate;
    }

    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

    @Override
    public String toString() {
        return super.toString()+" bookRate{" + "rate=" + rate + '}';
    }
    
    
}
