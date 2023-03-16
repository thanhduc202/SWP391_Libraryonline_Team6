/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author chung
 */
public class rate{
    private int bookId;
    private String bookName;
    private String author;
    private String image;
    private float rate;
    
     public rate() {
    }
     
    
   
    //select  b.* ,count(f.Star) from Book b inner join FeedBack f on b.BookID=f.BookID group by b.Bname,b.BookID,b.Author,b.image,b.Cid,b.Language,b.Status,b.Description,b.publisher,b.Pages,b.PublishYear,b.quantity

    public rate(int bookId, String bookName, String author, String image, float rate) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.author = author;
        this.image = image;
        this.rate = rate;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

   
    
    
    
    
}
