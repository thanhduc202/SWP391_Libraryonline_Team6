/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.DBContext;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import module.Account;

/**
 *
 * @author chung
 */
public class accountDAO extends DBContext{
   
    public Account getAccoutByAccountName(String name){
        Account a ;
        String sql ="select * from Account where AccountName =?";
        try {
            st = connection.prepareCall(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                a= new Account(rs.getString("AccountName"), rs.getString("AccountPassword"), rs.getString("FullName"), rs.getBoolean("Gender"), rs.getLong("PhoneNumber"), rs.getInt("status"), rs.getInt("AccessLevel"));
                return a;
            }
            else{
                return null;
            }
        } catch (Exception e) {
            Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }       
    }
    
    public boolean accountVerificationByNameAndPassword(String name, String password){
        String realPassword = getAccoutByAccountName(name).getAccountPassword();
        return password.equals(realPassword);
             
    }
    
    public boolean accountVerificationByName(String name){
        String realAccountName = getAccoutByAccountName(name).getAccountName();
        return realAccountName.equals(name);
             
    }

    
    
    
    public static void main(String[] args) {
       accountDAO ad = new accountDAO();
       Account a = ad.getAccoutByAccountName("hoang@gmail.com");
        System.out.println(a.getAccessLevel());
//        System.out.println(ad.accountVerificationByNameAndPassword("chungcacbon@gmail.com", "123"));
//        System.out.println(ad.accountVerificationByName("chungcacbon@gmail.com"));
       // System.out.println(ad.getAccoutByAccountName("hoang@gmail.com").getFullName());
      // account expect = new account("chung@gmail.com", "123", "do van chung", true, 123123123, 1, 1);
     
      
    }
    
    
    
}
