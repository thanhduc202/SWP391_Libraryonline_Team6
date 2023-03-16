/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.DBContext;
import Model.announcement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author chung
 */
public class announcementDAO extends DBContext{
    public List<announcement> getAllAnnouncement(){
         String sql="select* from Announcement order by AnnouncementID desc";
        List<announcement> ls = new ArrayList<>();
        try {
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (true) {
                if(rs.next()){
                    ls.add(new announcement(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5)));
                }else break;
            }
        } catch (Exception e) {
            System.out.println("Error in get all book");
        }
        
        
        return ls;
        
        
    }
    public announcement getAnnouncementById(int id){
         String sql="select *from Announcement where AnnouncementID=?";
         
        announcement ann = null;
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            
                if(rs.next()){
                    ann=(new announcement(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5)));
                    return ann;
                }
               
            
        } catch (Exception e) {
            System.out.println("Error in get all book");
        }
        
        
        return ann;
        
    }
    
    
    
    
    
    
    
    public static void main(String[] args) {
        announcementDAO ad = new announcementDAO();
//        for(announcement a: ad.getAllAnnouncement()){
//            System.out.println(a.getContent());
//        }
        System.out.println(ad.getAnnouncementById(2).getPublisDate());
        
    }
}
