/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.DBContext;
import Model.feedback;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import sun.security.mscapi.CKeyPairGenerator;

/**
 *
 * @author chung
 */
public class feedbackDAO extends DBContext{
    
    public List<feedback> getFeedBackById(int id){
         String query="select f.*,s.AccountName from FeedBack f inner join Student s on f.StudentID = s.StudentID where f.BookID=?";
         List<feedback> ls = new ArrayList<feedback>();
         try {
            st= connection.prepareStatement(query);
            st.setInt(1, id);
             ResultSet rs = st.executeQuery();
             while(rs.next()){
                 ls.add(new feedback(rs.getString("AccountName"), rs.getString("Content"), rs.getInt("Star"), rs.getDate("Date")));
             }
             
        } catch (Exception e) {
             System.out.println("error to get feed back"+ e.getMessage());
        }
         
         return ls;
    
    }
    
    public static void main(String[] args) {
        feedbackDAO fd = new feedbackDAO();
        for(feedback f: fd.getFeedBackById(1)){
            System.out.println(f.getAccountName());
        }
        
    }
    
    
    
}
