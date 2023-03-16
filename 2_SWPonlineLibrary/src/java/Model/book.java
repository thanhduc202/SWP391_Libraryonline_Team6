/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author chung
 */
public class book {
    private int bookId;
    private String bookName;
    private String author;
    private String image;
    private int cId;
    private String language;
    private String description;
    private int status;
    private int quantity;
    private String publisher;
    private int pages;
    private int publishYear;

    public book() {
    }

    public book(int bookId, String bookName, String author, String image, int cId, String language, String description, int status, int quantity, String publisher, int pages, int publishYear) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.author = author;
        this.image = image;
        this.cId = cId;
        this.language = language;
        this.description = description;
        this.status = status;
        this.quantity = quantity;
        this.publisher = publisher;
        this.pages = pages;
        this.publishYear = publishYear;
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

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public int getPublishYear() {
        return publishYear;
    }

    public void setPublishYear(int publishYear) {
        this.publishYear = publishYear;
    }

    @Override
    public String toString() {
        return "book{" + "bookId=" + bookId + ", bookName=" + bookName + ", author=" + author + ", image=" + image + ", cId=" + cId + ", language=" + language + ", description=" + description + ", status=" + status + ", quantity=" + quantity + ", publisher=" + publisher + ", pages=" + pages + ", publishYear=" + publishYear + '}';
    }

    
    
}
