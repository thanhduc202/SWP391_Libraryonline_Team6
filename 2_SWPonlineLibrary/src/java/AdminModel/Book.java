/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AdminModel;

/**
 *
 * @author win
 */
public class Book {
    private int bid;
    private String bname;
    private String author;
    private String img;
    private int cid;
    private String language;
    private String description;
    private int status;
    private int quantt;
    private String psher;
    private int pyear;
    private int page;

    public Book() {
    }

    public Book(int bid, String bname, String author, String img, int cid, String language, String description, int status, int quantt, String psher, int pyear, int page) {
        this.bid = bid;
        this.bname = bname;
        this.author = author;
        this.img = img;
        this.cid = cid;
        this.language = language;
        this.description = description;
        this.status = status;
        this.quantt = quantt;
        this.psher = psher;
        this.pyear = pyear;
        this.page = page;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
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

    public int getQuantt() {
        return quantt;
    }

    public void setQuantt(int quantt) {
        this.quantt = quantt;
    }

    public String getPsher() {
        return psher;
    }

    public void setPsher(String psher) {
        this.psher = psher;
    }

    public int getPyear() {
        return pyear;
    }

    public void setPyear(int pyear) {
        this.pyear = pyear;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    @Override
    public String toString() {
        return "Book{" + "bid=" + bid + ", bname=" + bname + ", author=" + author + ", img=" + img + ", cid=" + cid + ", language=" + language + ", description=" + description + ", status=" + status + ", quantt=" + quantt + ", psher=" + psher + ", pyear=" + pyear + ", page=" + page + '}';
    }

   
    
    
}
