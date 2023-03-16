/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AdminDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import AdminModel.Account;
import AdminModel.Borrowbook;
import AdminModel.Librarian;

/**
 *
 * @author win
 */
public class ManageUserDBContext extends DBContext {

    public List<Account> getmanageAccount() {
        List<Account> list = new ArrayList<>();
        try {
            String sql = "select * from Account";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setAid(rs.getInt("AccountID"));
                a.setName(rs.getString("AccountName"));
                a.setPassword(rs.getString("AccountPassword"));
                a.setFullname(rs.getString("FullName"));
                a.setGender(rs.getInt("Gender"));
                a.setPhonenumber(rs.getInt("PhoneNumber"));
                a.setStatus(rs.getInt("Status"));
                a.setAccesslevel(rs.getInt("AccessLevel"));

                list.add(a);
            }

        } catch (Exception e) {

        }

        return list;
    }

    public void insertUser(String name, String pass, String fullname, String gender,
            String phone, String status, String accessLevel) {
        try {
            String sql = "insert into Account\n"
                    + "values(?,?,?,?,?,?,?)";
            PreparedStatement sql_insert = connection.prepareStatement(sql);
            sql_insert.setString(1, name);
            sql_insert.setString(2, pass);
            sql_insert.setString(3, fullname);
            sql_insert.setString(4, gender);
            sql_insert.setString(5, phone);
            sql_insert.setString(6, status);
            sql_insert.setString(7, accessLevel);
            sql_insert.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void EditUser(String name, String password, String fullname, String gender,
            String phone, String status, String accesslevel, String id) {
        try {
            String sql = "update Account\n"
                    + "                    set AccountName = ?,\n"
                    + "                    AccountPassword = ?,\n"
                    + "                    FullName = ?,\n"
                    + "                    Gender = ?,\n"
                    + "                    PhoneNumber = ?,\n"
                    + "                    [Status] = ?,\n"
                    + "                    AccessLevel = ?\n"
                    + "                    where AccountID = ?";
            PreparedStatement sql_edit = connection.prepareStatement(sql);
            sql_edit.setString(1, name);
            sql_edit.setString(2, password);
            sql_edit.setString(3, fullname);
            sql_edit.setString(4, gender);
            sql_edit.setString(5, phone);
            sql_edit.setString(6, status);
            sql_edit.setString(7, accesslevel);
            sql_edit.setString(8, id);
            sql_edit.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Account getAccountByNamePassword(String AccountName, String AccountPassword) {
        try {
            String sql = "SELECT * FROM Account\n"
                    + "WHERE AccountName  = ?  AND AccountPassword  = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, AccountName);
            stm.setString(2, AccountPassword);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Account user = new Account();
                user.setName(rs.getString("AccountName"));
                user.setPassword(rs.getString("AccountPassword"));
                user.setFullname(rs.getString("FullName"));
                user.setGender(rs.getInt("Gender"));
                user.setPhonenumber(rs.getInt("PhoneNumber"));
                user.setStatus(rs.getInt("Status"));
                user.setAccesslevel(rs.getInt("AccessLevel"));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManageUserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account getAccountByID(String id) {
        try {
            String sql = "select * from Account\n"
                    + "where AccountID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
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
                a.setAid(rs.getInt("AccountID"));
                return a;
            }

        } catch (Exception e) {

        }
        return null;
    }

    public void deleteAccount(String id) {
        try {
            String sql = "delete from Account\n"
                    + "where AccountID = ?";
            PreparedStatement sql_delete = connection.prepareStatement(sql);
            sql_delete.setString(1, id);
            sql_delete.executeUpdate();

        } catch (Exception e) {
        }
    }

    public List<Librarian> getlibrarian() {
        List<Librarian> list = new ArrayList<>();
        try {
            String sql = "select * from Librarian";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Librarian l = new Librarian();
                l.setAccountname(rs.getString("AccountName"));
                list.add(l);
            }

        } catch (Exception e) {

        }

        return list;
    }

    public void EditstatusUser(String status, String id) {
        try {
            String sql = "update Account\n"
                    + "set [Status] = ?\n"
                    + "where AccountID = ?";
            PreparedStatement sql_edit = connection.prepareStatement(sql);
            sql_edit.setString(1, status);
            sql_edit.setString(2, id);
            sql_edit.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        ManageUserDBContext dao = new ManageUserDBContext();
        // List<Account> o = dao.getAccountByNamePassword("chung@gmail.com", "123");
//for (Account list : o) {
//            System.out.println(list.getFullname());
//        }

        System.out.println(dao.getAccountByNamePassword("chung@gmail.com", "123").getFullname());

    }

}
