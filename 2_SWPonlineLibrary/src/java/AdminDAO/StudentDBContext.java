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
import AdminModel.Student;
import AdminModel.quantitystudent;

/**
 *
 * @author win
 */
public class StudentDBContext extends DBContext {

    public List<Student> getstudent() {
        List<Student> list = new ArrayList<>();
        try {
            String sql = "select * from Student";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student a = new Student();
                a.setSid(rs.getString("StudentID"));
                a.setAccountname(rs.getString("AccountName"));
                a.setSemsester(rs.getInt("Semsester"));
                a.setMajor(rs.getString("Major"));
                a.setNote(rs.getString("note"));
                list.add(a);
            }

        } catch (Exception e) {

        }
        return list;
    }
    
    public List<quantitystudent> getquantitystudent() {
        List<quantitystudent> list = new ArrayList<>();
        try {
            String sql = "select COUNT(AccountName) as quantity from Student";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                quantitystudent a = new quantitystudent();
                a.setQuantity(rs.getInt("Quantity"));
                list.add(a);
            }

        } catch (Exception e) {

        }
        return list;
    }
    public static void main(String[] args) {
        StudentDBContext dao = new StudentDBContext();
        List<quantitystudent> list = dao.getquantitystudent();
        for (quantitystudent o : list) {
            System.out.println(o);
        }
    }
}
