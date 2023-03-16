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
import AdminModel.Book;
import AdminModel.Borrow;
import AdminModel.Feedback;
import AdminModel.Student;
import AdminModel.abc;
import AdminModel.quantityfeedback;
import AdminModel.quantityorderbook;

/**
 *
 * @author win
 */
public class ViewFeedbackDBContext extends DBContext {

    public List<Feedback> getfeedback() {
        List<Feedback> ls = new ArrayList<Feedback>();
        try {
            String sql = "select * from Feedback";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback();
                f.setSid(rs.getString("StudentID"));
                f.setBid(rs.getInt("BookID"));
                f.setContent(rs.getString("Content"));
                f.setStar(rs.getInt("Star"));
                ls.add(f);
            }

        } catch (Exception e) {

        }
        return ls;
    }

    public List<abc> getfb() {
        List<abc> ls = new ArrayList<abc>();
        try {
            String sql = "select f.StudentID,b.Bname,f.Content,f.Star,f.Date from FeedBack f\n"
                    + "                    inner join Book b on f.BookID=b.BookID";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                abc a = new abc();
                a.setStudentID(rs.getString("StudentID"));
                a.setBname(rs.getString("Bname"));
                a.setContent(rs.getString("Content"));
                a.setStar(rs.getInt("Star"));
                a.setDate(rs.getDate("Date"));
                ls.add(a);

            }

        } catch (Exception e) {

        }
        return ls;
    }

    public List<quantityfeedback> getquantityfeedback() {
        List<quantityfeedback> list = new ArrayList<>();
        try {
            String sql = "SELECT COUNT(*) as Quantity\n"
                    + "  FROM FeedBack";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                quantityfeedback a = new quantityfeedback();
                a.setQuantity(rs.getInt("Quantity"));
                list.add(a);
            }

        } catch (Exception e) {

        }
        return list;
    }

    public void deletefeedback(String id) {
        try {
            String sql = "delete from FeedBack\n"
                    + "where StudentID = ?";
            PreparedStatement sql_delete = connection.prepareStatement(sql);
            sql_delete.setString(1, id);
            sql_delete.executeUpdate();

        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        ViewFeedbackDBContext dao = new ViewFeedbackDBContext();
        List<Feedback> a = dao.getfeedback();
        for (Feedback o : a) {
            System.out.println(o);
        }

    }

}
