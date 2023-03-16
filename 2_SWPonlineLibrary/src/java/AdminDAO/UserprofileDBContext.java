/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AdminDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import AdminModel.Account;

/**
 *
 * @author win
 */
public class UserprofileDBContext extends DBContext {

    public ArrayList<Account> getAllAccount() {
        ArrayList<Account> list = new ArrayList<>();
        try {
            String sql = "select * from Account";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setName(rs.getString("AccountName"));
                a.setPassword(rs.getString("AccountPassword"));
                a.setFullname(rs.getString("FullName"));
                a.setGender(rs.getInt("Gender"));
                a.setPhonenumber(rs.getInt("PhoneNumber"));
                a.setStatus(rs.getInt("Status"));
                a.setAccesslevel(rs.getInt("AccessLevel"));
                list.add(a);
            }
            return list;
        } catch (Exception e) {

        }

        return list;
    }
    
    

}
