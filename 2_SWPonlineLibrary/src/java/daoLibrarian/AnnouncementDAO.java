/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daoLibrarian;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import module.Account;
import module.Announcement;
import module.Librarian;

/**
 *
 * @author tient
 */
public class AnnouncementDAO extends DBContext {

    public ArrayList<Announcement> getAnnouncementList() {
        ArrayList<Announcement> list = new ArrayList<>();
        try {
            String sql = "SELECT a.[AnnouncementID]\n"
                    + "      ,a.[LibrarianID]\n"
                    + "     ,a.[PublishDate]"
                    + "      ,a.[Title]\n"
                    + "      ,a.[Note]\n"
                    + "	  ,l.[AccountName]\n"
                    + "      ,l.[Shift]\n"
                    + "	  ,acc.[FullName]\n"
                    + "      ,acc.[Gender]\n"
                    + "      ,acc.[PhoneNumber]\n"
                    + "      ,acc.[AccessLevel]\n"
                    + "  FROM [SWP].[dbo].[Announcement] a INNER JOIN [Librarian] l\n"
                    + "  ON a.LibrarianID = l.LibrarianID INNER JOIN Account acc\n"
                    + "  ON l.AccountName = acc.AccountName";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setAccountName(rs.getString("AccountName"));
                a.setFullName(rs.getString("FullName"));
                a.setGender(rs.getBoolean("Gender"));
                a.setPhoneNumber(rs.getInt("PhoneNumber"));
                a.setAccessLevel(rs.getInt("AccessLevel"));
                Librarian l = new Librarian();
                l.setLibrarianID(rs.getString("LibrarianID"));
                l.setAccountName(rs.getString("AccountName"));
                l.setShift(rs.getString("Shift"));
                Announcement an = new Announcement();
                an.setAnnouncementID(rs.getInt("AnnouncementID"));
                an.setPublishDate(rs.getDate("PublishDate"));
                an.setTitle(rs.getString("Title"));
                an.setNote(rs.getString("Note"));
                an.setAccount(a);
                an.setLibrarian(l);
                list.add(an);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void createAnnouncement(String lib, String title, String note) {
        try {
            String sql = "INSERT INTO [dbo].[Announcement]\n"
                    + "           ([LibrarianID]\n"
                    + "           ,[Title]\n"
                    + "           ,[Note])\n"
                    + "     VALUES\n"
                    + "           (?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, lib);
            st.setString(2, title);
            st.setString(3, note);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateAnnoucement(int aid, String lib, String title, String note) {
        try {
            String sql = "UPDATE [dbo].[Announcement]\n"
                    + "   SET [LibrarianID] = ?\n"
                    + "      ,[Title] = ?\n"
                    + "      ,[PublishDate] = GETDATE()"
                    + "      ,[Note] = ?\n"
                    + " WHERE [AnnouncementID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, lib);
            st.setString(2, title);
            st.setString(3, note);
            st.setInt(4, aid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteAnnouncement(int aid) {
        try {
            String sql = "DELETE FROM [dbo].[Announcement]\n"
                    + "      WHERE [Announcement].AnnouncementID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public static void main(String[] args) {
        AnnouncementDAO ad = new AnnouncementDAO();
                ArrayList<Announcement> arr = ad.getAnnouncementList();
                for(Announcement a:arr){
                    System.out.println(a.getNote());
                    ;
                }
                
    }
}
