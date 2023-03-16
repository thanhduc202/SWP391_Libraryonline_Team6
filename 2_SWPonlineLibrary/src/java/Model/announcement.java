
package Model;
import java.sql.Date;
/**
 *
 * @author chung
 */
public class announcement {
    private int announcementID;
    private String librarionID;
    private Date publishDate;
    private String title;
    private String content;
    
    

    public announcement() {
    }

    public announcement(int announcementID, String librarionID, Date publishDate, String title, String content) {
        this.announcementID = announcementID;
        this.librarionID = librarionID;
        this.publishDate = publishDate;
        this.title = title;
        this.content = content;
    }

    public int getAnnouncementID() {
        return announcementID;
    }

    public void setAnnouncementID(int announcementID) {
        this.announcementID = announcementID;
    }

    public String getLibrarionID() {
        return librarionID;
    }

    public void setLibrarionID(String librarionID) {
        this.librarionID = librarionID;
    }

    public Date getPublisDate() {
        return publishDate;
    }

    public void setPublisDate(Date publisDate) {
        this.publishDate = publisDate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    
    

    
   
}
