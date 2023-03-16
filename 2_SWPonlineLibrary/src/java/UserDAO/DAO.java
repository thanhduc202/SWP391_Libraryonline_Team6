/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package UserDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import module.Account;
import module.Book;
import Model.feedback;
import module.Order;
import Model.DBContext;

/**
 *
 * @author thanh
 */
public class DAO extends DBContext {

//    public Account login(String user, String pass) {
//        String sql = "select *from Account where username=? and password=?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, user);
//            st.setString(2, pass);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Account a = new Account();  
//                a.setAccountName(rs.getString(1));
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getInt(4),
//                        rs.getInt(5));
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return null;
//    }
    public List getAllListWait(String bookID) {
        List<Book> list = new ArrayList<>();
        String sql = "select *from Book\n"
                + "where BookID = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, bookID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setBookID(rs.getInt("bookID"));
                b.setBname(rs.getString("bName"));
                b.setAuthor(rs.getString("author"));
                b.setImage(rs.getString("image"));
                b.setCid(rs.getInt("cid"));
                b.setLanguage(rs.getString("language"));
                b.setDescription(rs.getString("description"));
                b.setStatus(rs.getInt("status"));
                b.setQuantity(rs.getInt("quantity"));
                b.setPublisher(rs.getString("publisher"));
                list.add(b);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Book> getAllBook() {
        List<Book> list = new ArrayList<>();
        String sql = "select * from Book";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Book b = new Book();
                b.setBookID(rs.getInt("bookID"));
                b.setBname(rs.getString("bName"));
                b.setAuthor(rs.getString("author"));
                b.setImage(rs.getString("image"));
                b.setCid(rs.getInt("cid"));
                b.setLanguage(rs.getString("language"));
                b.setDescription(rs.getString("description"));
                b.setStatus(rs.getInt("status"));
                b.setQuantity(rs.getInt("quantity"));
                b.setPublisher(rs.getString("publisher"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    

    public void insertComment(String studentID, String bookID, String content, String star) {
        String sql = "insert into FeedBack(StudentID, BookID, Content, Star)\n"
                + "  values(?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, studentID);
            st.setString(2, bookID);
            st.setString(3, content);
            st.setString(4, star);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertOrder(String AccountName, int MethodID, String OrderDate, String ScheduledTime) {
        String sql = "insert into [Order](AccountName, MethodID, OrderDate, ScheduledTime)\n"
                + "values(?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, AccountName);
            st.setInt(2, MethodID);
            st.setString(3, OrderDate);
            st.setString(4, ScheduledTime);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public void insertOrderDetails(int orderID, int bookID) {
        String sql = "insert into [OrderDetails](OrderID, bookID)\n"
                + "  values(?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);   
            st.setInt(2, bookID);     
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public int getOrderID(){
        String sql="select TOP 1 OrderID from [Order] order by OrderID desc";
         try {
            PreparedStatement st = connection.prepareStatement(sql);
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
            //    Order o = new Order();
               return rs.getInt("orderID");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

//    public List<Order> getOrderList(String accountName) {
//        List<Order> list = new ArrayList<>();
//        String sql = "select * from [Order] where AccountName like ? ";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, accountName);
//            ResultSet rs = st.executeQuery();
//
//            while (rs.next()) {
//                Order o = new Order();
//                o.setAcc (rs.getString("accountName"));
//                o.setMethodID(rs.getInt("methodID"));
//                o.setOrderDate(rs.getString("orderDate"));
//                o.setScheduledTime(rs.getString("scheduledTime"));
//
//                list.add(o);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//    }

//    public List<FeedBack> getFeedBack() {
//        List<FeedBack> list = new ArrayList<>();
//        String sql = "select * from FeedBack ";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//
//            while (rs.next()) {
//                FeedBack f = new FeedBack();
//                f.setStudentID(rs.getString("studentID"));
//                f.setBookID(rs.getInt("bookID"));
//                f.setContent(rs.getString("content"));
//                f.setStar(rs.getInt("star"));
//
//                list.add(f);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//    }

    public static void main(String[] args) {
        DAO d = new DAO();
        Book b = new Book();
       int a = d.getOrderID();
        System.out.println(a);

        //d.insertOrder(accountName, methodID, orderDate, scheduledTime);
        //System.out.println(d.getOrderList(accountName));
        //d.insertComment(studentID, bookID, content, star);

        //List<FeedBack> list = d.getFeedBack();
        //System.out.println(list);
    }
}
