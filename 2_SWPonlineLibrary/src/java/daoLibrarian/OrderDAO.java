/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daoLibrarian;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import module.Account;
import module.Book;
import module.Librarian;
import module.Method;
import module.Order;
import module.OrderDetail;
import module.Penalty;
import module.Renewal;
import module.Status;
import module.Student;

/**
 *
 * @author tient
 */
public class OrderDAO extends DBContext {

    public ArrayList<Method> getMethodCount() {
        ArrayList<Method> list = new ArrayList<>();
        try {
            String sql = "SELECT COUNT([OrderID]),\n"
                    + "        [Method].[MethodID],\n"
                    + "		[Method].[MethodName]\n"
                    + "  FROM [SWP].[dbo].[Order] INNER JOIN [dbo].[Method]\n"
                    + "  ON [Order].[MethodID] = [Method].[MethodID]\n"
                    + "  GROUP by [MethodName], [Method].[MethodID]";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Method m = new Method();
                m.setMethodID(rs.getInt(2));
                m.setMethodName(rs.getString(3));
                m.setCount(rs.getInt(1));
                list.add(m);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Status> getStatusCount() {
        ArrayList<Status> list = new ArrayList<>();
        try {
            String sql = "SELECT COUNT([OrderID])\n"
                    + "                        ,[Status].[StatusID]\n"
                    + "				,[statusName]\n"
                    + "                    FROM [SWP].[dbo].[Order] RIGHT JOIN [Status]\n"
                    + "					ON [Order].[StatusID] = [Status].[StatusID]\n"
                    + "                    GROUP BY [Status].[StatusID], [statusName]";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Status s = new Status(rs.getInt(2), rs.getString(3), rs.getInt(1));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Order> getOrderList(int type) {
        ArrayList<Order> list = new ArrayList<>();
        try {
            String sql = "SELECT o.[OrderID]\n"
                    + "      ,o.[AccountName]\n"
                    + "      ,o.[MethodID]\n"
                    + "      ,o.[LibrarianID]\n"
                    + "      ,o.[OrderDate]\n"
                    + "      ,o.[ScheduledTime]\n"
                    + "      ,o.[StatusID]\n"
                    + "	  ,s.[StudentID]\n"
                    + "      ,s.[Semsester]\n"
                    + "      ,s.[Major]\n"
                    + "      ,a.[FullName]\n"
                    + "      ,a.[Gender]\n"
                    + "      ,a.[PhoneNumber]\n"
                    + "	  ,lib.[LibrarianID]\n"
                    + "      ,lib.[AccountName]\n"
                    + "      ,acc.[FullName]\n"
                    + "      ,acc.[Gender]\n"
                    + "      ,acc.[PhoneNumber]\n"
                    + "	  ,sta.[StatusID]\n"
                    + "      ,sta.[statusName]\n"
                    + "      ,m.[MethodName]\n"
                    + "  FROM [SWP].[dbo].[Order] o INNER JOIN [Student] s\n"
                    + "  ON o.AccountName = s.AccountName INNER JOIN [SWP].[dbo].[Account] a\n"
                    + "  ON a.AccountName = o.AccountName INNER JOIN [SWP].[dbo].[Librarian] lib\n"
                    + "  ON o.LibrarianID = lib.LibrarianID INNER JOIN [SWP].[dbo].[Account] acc\n"
                    + "  ON lib.AccountName = acc.AccountName INNER JOIN [SWP].[dbo].[Status] sta\n"
                    + "  ON sta.StatusID = o.StatusID INNER JOIN [SWP].[dbo].[Method] m\n"
                    + "  ON o.MethodID = m.MethodID";
            if(type == 1) {
                sql += " WHERE o.[StatusID] = 2 OR o.[StatusID] = 4 OR o.[StatusID] = 5";
            }
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Method m = new Method(rs.getInt("MethodID"), rs.getString("MethodName"), 1);
                Status s = new Status(rs.getInt("StatusID"), rs.getString("StatusName"), 0);

                Order o = new Order();
                Account a = new Account();
                a.setAccountName(rs.getString(2));
                a.setFullName(rs.getString(11));
                a.setGender(rs.getBoolean(12));
                a.setPhoneNumber(rs.getInt(13));
                Student student = new Student();
                student.setSid(rs.getString("StudentID"));
                student.setSemester(rs.getInt("Semsester"));
                student.setMajor(rs.getString("Major"));
                student.setAccount(a);
                Account acc = new Account();
                acc.setAccountName(rs.getString(15));
                acc.setFullName(rs.getString(16));
                acc.setGender(rs.getBoolean(17));
                acc.setPhoneNumber(rs.getInt(18));
                Librarian lib = new Librarian();
                lib.setLibrarianID(rs.getString(4));
                lib.setAccount(acc);
                o.setOrderID(rs.getInt("OrderID"));
                o.setOrderDate(rs.getDate("OrderDate"));
                o.setScheduledTime(rs.getDate(6));
                o.setMethod(m);
                o.setStudent(student);
                o.setLibrarian(lib);
                o.setStatus(s);
                ArrayList<OrderDetail> listO = getOrderDetail(rs.getInt("OrderID"));
                o.setListOrderDetail(listO);
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        OrderDAO odao = new OrderDAO();
        //OrderDetail od = odao.getOrderDetailByID(1);
       ArrayList<Order> ls = new ArrayList<Order>();
       ls= odao.getOrderList(1);
        for (Order o : ls) {
            System.out.println(o.getOrderID());
        }
    }

    public void changeStatusOrder(int statusID, int oid) {
        try {
            String sql = "UPDATE [dbo].[Order]\n"
                    + "   SET [StatusID] = ?\n"
                    + " WHERE [OrderID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, statusID);
            st.setInt(2, oid);
            st.executeUpdate();
            if (statusID == 5 || statusID == 2) {
                OrderDetail o = getOrderDetailByID(oid);
                if (statusID == 2) {
                    String sql1 = "UPDATE [dbo].[Book]\n"
                            + "   SET [quantity] = [quantity] - 1\n"
                            + " WHERE BookID = ?";
                    PreparedStatement st1 = connection.prepareStatement(sql1);
                    st1.setInt(1, o.getBook().getBookID());
                    st1.executeUpdate();
                } else if (statusID == 5) {
                    String sql2 = "UPDATE [dbo].[Book]\n"
                            + "   SET [quantity] = [quantity] + 1\n"
                            + " WHERE BookID = ?";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, o.getBook().getBookID());
                    st2.executeUpdate();
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<OrderDetail> getOrderDetail(int oid) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        try {
            String sql = "SELECT [OrderDetailID]\n"
                    + "      ,[OrderID]\n"
                    + "      ,od.[BookID]\n"
                    + "      ,[ReceivedOn]\n"
                    + "      ,[ReturnOn]\n"
                    + "	  ,[Bname]\n"
                    + "      ,[Author]\n"
                    + "      ,[image]\n"
                    + "      ,[Cid]\n"
                    + "      ,[Language]\n"
                    + "      ,[Description]\n"
                    + "      ,b.[Status]\n"
                    + "      ,[quantity]\n"
                    + "      ,[publisher]\n"
                    + "  FROM [SWP].[dbo].[OrderDetails] od INNER JOIN [SWP].[dbo].[Book] b\n"
                    + "  ON od.BookID = b.BookID   WHERE [OrderID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setBookID(rs.getInt("BookID"));
                b.setBname(rs.getString("Bname"));
                b.setAuthor(rs.getString("Author"));
                b.setImage(rs.getString("image"));
                b.setCid(rs.getInt("Cid"));
                b.setLanguage(rs.getString("Language"));
                b.setDescription(rs.getString("Description"));
                b.setStatus(rs.getInt("Status"));
                b.setQuantity(rs.getInt("quantity"));
                b.setPublisher(rs.getString("publisher"));
                OrderDetail o = new OrderDetail();
                o.setOrderDetailID(rs.getInt("OrderDetailID"));
                o.setOrderID(rs.getInt("OrderID"));
                o.setReceivedOn(rs.getString("ReceivedOn"));
                o.setReturnOn(rs.getString("ReturnOn"));
                o.setBook(b);
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public OrderDetail getOrderDetailByID(int oid) {
        try {
            String sql = "SELECT [OrderDetailID]\n"
                    + "      ,[OrderID]\n"
                    + "      ,od.[BookID]\n"
                    + "      ,[ReceivedOn]\n"
                    + "      ,[ReturnOn]\n"
                    + "	  ,[Bname]\n"
                    + "      ,[Author]\n"
                    + "      ,[image]\n"
                    + "      ,[Cid]\n"
                    + "      ,[Language]\n"
                    + "      ,[Description]\n"
                    + "      ,b.[Status]\n"
                    + "      ,[quantity]\n"
                    + "      ,[publisher]\n"
                    + "  FROM [SWP].[dbo].[OrderDetails] od INNER JOIN [SWP].[dbo].[Book] b\n"
                    + "  ON od.BookID = b.BookID WHERE [OrderDetailID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setBookID(rs.getInt("BookID"));
                b.setBname(rs.getString("Bname"));
                b.setAuthor(rs.getString("Author"));
                b.setImage(rs.getString("image"));
                b.setCid(rs.getInt("Cid"));
                b.setLanguage(rs.getString("Language"));
                b.setDescription(rs.getString("Description"));
                b.setStatus(rs.getInt("Status"));
                b.setQuantity(rs.getInt("quantity"));
                b.setPublisher(rs.getString("publisher"));
                OrderDetail o = new OrderDetail();
                o.setOrderDetailID(rs.getInt("OrderDetailID"));
                o.setOrderID(rs.getInt("OrderID"));
                o.setReceivedOn(rs.getString("ReceivedOn"));
                o.setReturnOn(rs.getString("ReturnOn"));
                o.setBook(b);
                return o;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Renewal> getListRenewals() {
        ArrayList<Renewal> list = new ArrayList<>();
        try {
            String sql = "SELECT r.[RenewalID]\n"
                    + "      ,r.[OrderID]\n"
                    + "      ,r.[LibrarianID]\n"
                    + "      ,r.[ExtendDate]\n"
                    + "      ,r.[Reason]\n"
                    + "      ,r.[StatusID]\n"
                    + "	  ,o.[AccountName]\n"
                    + "      ,o.[MethodID]\n"
                    + "      ,o.[LibrarianID]\n"
                    + "      ,o.[OrderDate]\n"
                    + "      ,o.[ScheduledTime]\n"
                    + "      ,o.[StatusID]\n"
                    + "	  ,s.[StudentID]\n"
                    + "      ,s.[Semsester]\n"
                    + "      ,s.[Major]\n"
                    + "      ,a.[FullName]\n"
                    + "      ,a.[Gender]\n"
                    + "      ,a.[PhoneNumber]\n"
                    + "	  ,lib.[LibrarianID]\n"
                    + "      ,lib.[AccountName]\n"
                    + "      ,acc.[FullName]\n"
                    + "      ,acc.[Gender]\n"
                    + "      ,acc.[PhoneNumber]\n"
                    + "	  ,sta.[StatusID]\n"
                    + "      ,sta.[statusName]\n"
                    + "      ,m.[MethodName]\n"
                    + "  FROM [SWP].[dbo].[Renewal] r INNER JOIN [SWP].[dbo].[Order] o\n"
                    + "  ON r.OrderID = o.OrderID INNER JOIN [Student] s\n"
                    + "  ON o.AccountName = s.AccountName INNER JOIN [SWP].[dbo].[Account] a\n"
                    + "  ON a.AccountName = o.AccountName INNER JOIN [SWP].[dbo].[Librarian] lib\n"
                    + "  ON r.LibrarianID = lib.LibrarianID INNER JOIN [SWP].[dbo].[Account] acc\n"
                    + "  ON lib.AccountName = acc.AccountName INNER JOIN [SWP].[dbo].[Status] sta\n"
                    + "  ON sta.StatusID = r.StatusID INNER JOIN [SWP].[dbo].[Method] m\n"
                    + "  ON o.MethodID = m.MethodID";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Status s = new Status(rs.getInt("StatusID"), rs.getString("statusName"), 0);
                Method m = new Method(rs.getInt("MethodID"), rs.getString("MethodName"), 0);
                Account acc = new Account();
                acc.setFullName(rs.getString(21));
                acc.setGender(rs.getBoolean(22));
                acc.setPhoneNumber(rs.getInt(23));
                Librarian lib = new Librarian();
                lib.setAccountName(rs.getString(20));
                lib.setLibrarianID(rs.getString(3));
                lib.setAccount(acc);
                Account a = new Account();
                a.setFullName(rs.getString(16));
                a.setGender(rs.getBoolean(17));
                a.setPhoneNumber(rs.getInt(18));
                Student stu = new Student();
                stu.setSid(rs.getString(13));
                stu.setSemester(rs.getInt(14));
                stu.setMajor(rs.getString(15));
                stu.setAccount(a);
                Order o = new Order();
                o.setOrderID(rs.getInt(2));
                o.setOrderDate(rs.getDate(10));
                o.setScheduledTime(rs.getDate(11));
                o.setStudent(stu);
                Renewal ren = new Renewal();
                ren.setRenewalID(rs.getInt(1));
                ren.setExtendDate(rs.getDate(4));
                ren.setReason(rs.getString(5));
                ren.setStatus(s);
                ren.setLibrarian(lib);
                ren.setOrder(o);
                list.add(ren);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Penalty> getListPenalty() {
        ArrayList<Penalty> list = new ArrayList<>();
        try {
            String sql = "SELECT [PenaltyID]\n"
                    + "                          ,p.[AccountName]\n"
                    + "                          ,p.[OrderID]\n"
                    + "                          ,[Amount]\n"
                    + "                    	  ,DATEDIFF(d, GETDATE(), o.ScheduledTime) as 'DateOver'\n"
                    + "                          ,p.[StatusID]\n"
                    + "                    	  ,[AccountPassword]\n"
                    + "                          ,[FullName]\n"
                    + "                          ,[Gender]\n"
                    + "                          ,[PhoneNumber]\n"
                    + "                          ,[Status]\n"
                    + "                          ,[AccessLevel]\n"
                    + "                    	  ,o.[AccountName]\n"
                    + "                          ,[OrderDate]\n"
                    + "                          ,[ScheduledTime]\n"
                    + "                          ,[statusName]\n"
                    + "						  ,[StudentID]\n"
                    + "						,[Semsester]\n"
                    + "						,[Major]\n"
                    + "                      FROM [SWP].[dbo].[Penalty] p INNER JOIN [Account] a\n"
                    + "                      ON p.AccountName = a.AccountName INNER JOIN [Order] o\n"
                    + "                      ON p.OrderID = o.OrderID INNER JOIN [Status] s\n"
                    + "                      ON s.StatusID = p.StatusID INNER JOIN [Student] stu\n"
                    + "					  ON stu.AccountName = p.AccountName WHERE o.ScheduledTime > GETDATE()";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setAccountName(rs.getString(2));
                a.setAccountPassword(rs.getString("AccountPassword"));
                a.setFullName(rs.getString("FullName"));
                a.setGender(rs.getBoolean("Gender"));
                a.setPhoneNumber(rs.getInt("PhoneNumber"));
                a.setStatus(rs.getInt("Status"));
                a.setAccessLevel(rs.getInt("AccessLevel"));
                Status s = new Status(rs.getInt("StatusID"), rs.getString(16), 0);
                Order o = new Order();
                o.setOrderID(rs.getInt("OrderID"));
                o.setOrderDate(rs.getDate("OrderDate"));
                o.setScheduledTime(rs.getDate("ScheduledTime"));
                Student stu = new Student();
                stu.setSid(rs.getString("StudentID"));
                stu.setSemester(rs.getInt("Semsester"));
                stu.setMajor(rs.getString("Major"));
                stu.setAccount(a);
                Penalty p = new Penalty();
                p.setPenaltyID(rs.getInt(1));
                p.setDateOver(rs.getInt(5));
                p.setAmount(rs.getDouble(4));
                p.setStudent(stu);
                p.setOrder(o);
                p.setStatus(s);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void changeStatusRenewal(int sid, int rid) {
        try {
            String sql = "UPDATE [dbo].[Renewal]\n"
                    + "   SET [StatusID] = ?\n"
                    + " WHERE [RenewalID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sid);
            st.setInt(2, rid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changeStatusPenalty(int sid, int pid) {
        try {
            String sql = "UPDATE [dbo].[Penalty]\n"
                    + "   SET [StatusID] = ?\n"
                    + " WHERE [PenaltyID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sid);
            st.setInt(2, pid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    


}
