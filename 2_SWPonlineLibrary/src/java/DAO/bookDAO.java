/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.DBContext;
import Model.book;
import Model.bookRate;
import Model.rate;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import java.sql.Array;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jdk.nashorn.internal.ir.BreakNode;
import module.OrderHistory;

/**
 *
 * @author chung
 */
public class bookDAO extends DBContext {

    public List<book> getBookByPartialName(String pn) {
        List<book> ls = new ArrayList<book>();

        try {
            st = connection.prepareStatement("select *from Book where Bname like ?");
            st.setString(1, "%" + pn + "%");
            ResultSet rs = st.executeQuery();
            while (true) {
                if (rs.next()) {
                    ls.add(new book(rs.getInt("BookID"), rs.getString("Bname"), rs.getString("Author"), rs.getString("image"), rs.getInt("Cid"), rs.getString("Language"), rs.getString("Description"), rs.getInt("Status"), rs.getInt("quantity"), rs.getString("publisher"), rs.getInt("Pages"), rs.getInt("PublishYear")));

                } else {
                    break;
                }
            }

        } catch (Exception e) {
            System.out.println("Error in get book");
        }
        return ls;

    }

    public book getBookByBookId(int id) {
        book b = null;

        try {
            st = connection.prepareStatement("select *from Book where BookID= ?");
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                b = (new book(rs.getInt("BookID"), rs.getString("Bname"), rs.getString("Author"), rs.getString("image"), rs.getInt("Cid"), rs.getString("Language"), rs.getString("Description"), rs.getInt("Status"), rs.getInt("quantity"), rs.getString("publisher"), rs.getInt("Pages"), rs.getInt("PublishYear")));

            }

        } catch (Exception e) {
            System.out.println("Error in get book");
        }
        return b;

    }

    public List<book> getAllBook() {
        String sql = "select * from Book";
        List<book> ls = new ArrayList<>();
        try {
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (true) {
                if (rs.next()) {
                    ls.add(new book(rs.getInt("BookID"), rs.getString("Bname"), rs.getString("Author"), rs.getString("image"), rs.getInt("Cid"), rs.getString("Language"), rs.getString("Description"), rs.getInt("Status"), rs.getInt("quantity"), rs.getString("publisher"), rs.getInt("Pages"), rs.getInt("PublishYear")));
                } else {
                    break;
                }
            }
        } catch (Exception e) {
            System.out.println("Error in get all book");
        }

        return ls;
    }

    public List<book> getBookWithOffset(int id) {
        int offset = id;
        int fetch = 12;
        List<book> ls = new ArrayList<book>();
        String query = "select * from Book order by BookID OFFSET ? ROWS \n"
                + "FETCH NEXT ? ROWS ONLY";
        try {
            st = connection.prepareStatement(query);
            st.setInt(1, offset);
            st.setInt(2, fetch);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ls.add(new book(rs.getInt("BookID"), rs.getString("Bname"), rs.getString("Author"), rs.getString("image"), rs.getInt("Cid"), rs.getString("Language"), rs.getString("Description"), rs.getInt("Status"), rs.getInt("quantity"), rs.getString("publisher"), rs.getInt("Pages"), rs.getInt("PublishYear")));

            }

        } catch (Exception e) {
        }
        return ls;

    }

    public List<bookRate> getAllBookRateWithOffset(int id) {
        int offset = id;
        int fetch = 12;
        String sql = "select b.*, r.AvgRate from (select * from Book)b left join (select  b.BookID,b.Bname,b.image,b.Author ,\n"
                + "AVG(CAST(f.Star as FLOAT))as 'AvgRate' from Book b inner join FeedBack f on b.BookID=f.BookID group by b.BookID,b.Bname,b.image,b.Author )r\n"
                + "on b.BookID = r.BookID order by b.BookID offset ? Rows fetch next ? rows only";

        List<bookRate> ls = new ArrayList<>();
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, offset);
            st.setInt(2, fetch);
            ResultSet rs = st.executeQuery();
            while (true) {
                if (rs.next()) {
                    ls.add(new bookRate(rs.getFloat("AvgRate"), rs.getInt("BookID"), rs.getString("Bname"), rs.getString("Author"), rs.getString("image"), rs.getInt("Cid"), rs.getString("Language"), rs.getString("Description"), rs.getInt("Status"), rs.getInt("quantity"), rs.getString("publisher"), rs.getInt("Pages"), rs.getInt("PublishYear")));
                } else {
                    break;
                }
            }
        } catch (Exception e) {
            System.out.println("Error in get all book");
        }

        return ls;

    }

    public List<bookRate> getAllBookASC() {
//        int offset=id;
//        int fetch=2;
        String sql = "select b.*, r.AvgRate from (select * from Book)b left join (select  b.BookID,b.Bname,b.image,b.Author ,\n"
                + "AVG(CAST(f.Star as FLOAT))as 'AvgRate' from Book b inner join FeedBack f on b.BookID=f.BookID\n"
                + "group by b.BookID,b.Bname,b.image,b.Author )r\n"
                + "on b.BookID = r.BookID order by b.Bname ";

        List<bookRate> ls = new ArrayList<>();
        try {
            st = connection.prepareStatement(sql);
//            st.setInt(1, offset);
//            st.setInt(2, fetch);
            ResultSet rs = st.executeQuery();
            while (true) {
                if (rs.next()) {
                    ls.add(new bookRate(rs.getFloat("AvgRate"), rs.getInt("BookID"), rs.getString("Bname"), rs.getString("Author"), rs.getString("image"), rs.getInt("Cid"), rs.getString("Language"), rs.getString("Description"), rs.getInt("Status"), rs.getInt("quantity"), rs.getString("publisher"), rs.getInt("Pages"), rs.getInt("PublishYear")));
                } else {
                    break;
                }
            }
        } catch (Exception e) {
            System.out.println("Error in get all book");
        }

        return ls;

    }

    public List<bookRate> getAllBookDESC() {
//        int offset=id;
//        int fetch=2;
        String sql = "select b.*, r.AvgRate from (select * from Book)b left join (select  b.BookID,b.Bname,b.image,b.Author ,\n"
                + "AVG(CAST(f.Star as FLOAT))as 'AvgRate' from Book b inner join FeedBack f on b.BookID=f.BookID\n"
                + "group by b.BookID,b.Bname,b.image,b.Author )r\n"
                + "on b.BookID = r.BookID order by b.Bname DESC";

        List<bookRate> ls = new ArrayList<>();
        try {
            st = connection.prepareStatement(sql);
//            st.setInt(1, offset);
//            st.setInt(2, fetch);
            ResultSet rs = st.executeQuery();
            while (true) {
                if (rs.next()) {
                    ls.add(new bookRate(rs.getFloat("AvgRate"), rs.getInt("BookID"), rs.getString("Bname"), rs.getString("Author"), rs.getString("image"), rs.getInt("Cid"), rs.getString("Language"), rs.getString("Description"), rs.getInt("Status"), rs.getInt("quantity"), rs.getString("publisher"), rs.getInt("Pages"), rs.getInt("PublishYear")));
                } else {
                    break;
                }
            }
        } catch (Exception e) {
            System.out.println("Error in get all book");
        }

        return ls;

    }

    public List<bookRate> getBookRateByPatialName(String s) {
        String sql = "select b.*, r.AvgRate from (select * from Book)b left join (select  b.BookID,b.Bname,b.image,b.Author ,\n"
                + "AVG(CAST(f.Star as FLOAT))as 'AvgRate' from Book b inner join FeedBack f on b.BookID=f.BookID\n"
                + "group by b.BookID,b.Bname,b.image,b.Author )r\n"
                + "on b.BookID = r.BookID where b.Bname like ?";

        List<bookRate> ls = new ArrayList<bookRate>();
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, "%" + s + "%");
            ResultSet rs = st.executeQuery();
            while (true) {
                if (rs.next()) {
                    ls.add(new bookRate(rs.getFloat("AvgRate"), rs.getInt("BookID"), rs.getString("Bname"), rs.getString("Author"), rs.getString("image"), rs.getInt("Cid"), rs.getString("Language"), rs.getString("Description"), rs.getInt("Status"), rs.getInt("quantity"), rs.getString("publisher"), rs.getInt("Pages"), rs.getInt("PublishYear")));
                } else {
                    break;
                }
            }
        } catch (Exception e) {
            System.out.println("Error in get book");
        }

        return ls;

    }

    public List<bookRate> getProductByCategory(int id) {
        String query = "select b.*, r.AvgRate from (select * from Book)b left join (select  b.BookID,b.Bname,b.image,b.Author ,\n"
                + "                AVG(CAST(f.Star as FLOAT))as 'AvgRate' from Book b inner join FeedBack f on b.BookID=f.BookID\n"
                + "                group by b.BookID,b.Bname,b.image,b.Author )r\n"
                + "                on b.BookID = r.BookID where b.Cid=?";
        List<bookRate> ls = new ArrayList<bookRate>();
        try {
            st = connection.prepareCall(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ls.add(new bookRate(rs.getFloat("AvgRate"), rs.getInt("BookID"), rs.getString("Bname"), rs.getString("Author"), rs.getString("image"), rs.getInt("Cid"), rs.getString("Language"), rs.getString("Description"), rs.getInt("Status"), rs.getInt("quantity"), rs.getString("publisher"), rs.getInt("Pages"), rs.getInt("PublishYear")));
            }
        } catch (Exception e) {
            System.out.println("Error to get book by cid");
        }
        return ls;
    }

    public List<book> getTopBook(int num) {
        String query = "select top " + num + " * from Book order by BookID DESC";
        List<book> ls = new ArrayList<book>();
        try {
            st = connection.prepareStatement(query);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ls.add(new book(rs.getInt("BookID"), rs.getString("Bname"), rs.getString("Author"), rs.getString("image"), rs.getInt("Cid"), rs.getString("Language"), rs.getString("Description"), rs.getInt("Status"), rs.getInt("quantity"), rs.getString("publisher"), rs.getInt("Pages"), rs.getInt("PublishYear")));
            }
        } catch (Exception e) {
            System.out.println("Error to get top");
        }
        return ls;

    }

    public List<book> getBookRandom() {
        String query = "SELECT TOP 4 * FROM Book\n"
                + "ORDER BY NEWID()";
        List<book> ls = new ArrayList<book>();
        try {
            st = connection.prepareStatement(query);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ls.add(new book(rs.getInt("BookID"), rs.getString("Bname"), rs.getString("Author"), rs.getString("image"), rs.getInt("Cid"), rs.getString("Language"), rs.getString("Description"), rs.getInt("Status"), rs.getInt("quantity"), rs.getString("publisher"), rs.getInt("Pages"), rs.getInt("PublishYear")));
            }
        } catch (Exception e) {
            System.out.println("Error to get random");
        }
        return ls;

    }

    public List getAllListWait(int bookID) {
        List<book> list = new ArrayList<>();
        String sql = "select *from Book\n"
                + "where BookID = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                book b = new book();
                b.setBookId(rs.getInt("bookID"));
                b.setBookName(rs.getString("bName"));
                b.setAuthor(rs.getString("author"));
                b.setImage(rs.getString("image"));
                b.setcId(rs.getInt("cid"));
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

    public List getAllOrderHistory(String accountName) {
        List<OrderHistory> list = new ArrayList<>();
        String sql = "select o.AccountName,o.OrderDate,o.ScheduledTime,b.Bname,b.BookID,b.image,s.statusName from\n"
                + "(select * from [Order]) o inner join OrderDetails od on o.OrderID=od.OrderID inner "
                + "join Book b on od.BookID=b.BookID inner join [Status] s on o.StatusID=s.StatusID "
                + "where o.AccountName = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, accountName);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderHistory o = new OrderHistory();
                o.setAccountName(rs.getString("accountName"));
                o.setOrderDate(rs.getString("orderDate"));
                o.setScheduledTime(rs.getString("scheduledTime"));
                o.setbName(rs.getString("bName"));
                o.setBookID(rs.getInt("bookID"));
                o.setImage(rs.getString("image"));
                o.setStatusName(rs.getString("statusName"));
                list.add(o);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteOrderDetails(int orderID) {
        String sql = "  delete from [OrderDetails] where OrderID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteOrder(int orderID) {
        String sql = "  delete from [Order] where OrderID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

//    public int getOrderIDByAccountName(String accountName){
//        String sql = "select OrderID from [Order] where AccountName = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, accountName); 
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//            //    Order o = new Order();
//               return rs.getInt("OrderID");
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return -1;
//    }
//    public int getBookIDByOrderID(int orderID){
//        String sql =" select BookID from [OrderDetails] where OrderID = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, orderID); 
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//            //    Order o = new Order();
//               return rs.getInt("BookID");
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return -1;
//    }
    public String getStudentIDByAccountName(String accountName) {

        String sql = "select studentID from Student where AccountName = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, accountName);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                //    Order o = new Order();
                return rs.getString("StudentID");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getOrderIDbyBookID(int bookID, String accountName) {
        String sql = "  select o.OrderID from [Order]o inner join [OrderDetails] od "
                + "on o.OrderID = od.OrderID where od.BookID=? and o.AccountName=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookID);
            st.setString(2, accountName);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                //    Order o = new Order();
                return rs.getInt("OrderID");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;

    }

    public void insertComment(String studentID, int bookID, String content, int star, String date) {
        String sql = "insert into FeedBack(StudentID, BookID, Content, Star, Date)\n"
                + "  values(?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, studentID);
            st.setInt(2, bookID);
            st.setString(3, content);
            st.setInt(4, star);
            st.setString(5, date);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertRenewal(int orderID, String extenDate, String reason, int status) {
        String sql = "  insert into Renewal(OrderID, ExtendDate, Reason, StatusID)\n"
                + "  values(?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            st.setString(2, extenDate);
            st.setString(3, reason);
            st.setInt(4, status);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Not success");
        }
    }

    public static void main(String[] args) {
        bookDAO bd = new bookDAO();
        System.out.println(bd.getBookByBookId(1).getPages());
//        for (book b : bd.getBookRandom()) {
//            System.out.println(b.toString());
//        }
        //System.out.println(Math.ceil((float)bd.getAllBook().size()/2));
        //book b=bd.getBookByPartialName("lazy");
        //List<book> ls = bd.getBookWithOffset(2);
        //List<String> j= new ArrayList<String>();
        //  String json = new Gson().toJson(ls);
//            for(book i:ls){
//               
//            }
        // System.out.println(json);
        //System.out.println(bd.getBookByBookId(1).getBookName());
        //System.out.println(i.getBookName());

    }
}
