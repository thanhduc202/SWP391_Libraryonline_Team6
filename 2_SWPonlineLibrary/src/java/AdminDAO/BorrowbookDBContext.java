/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AdminDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import AdminModel.Borrowbook;
import AdminModel.abc;
import AdminModel.quantityorderbook;
import AdminModel.quantitystudent;

/**
 *
 * @author win
 */
public class BorrowbookDBContext extends DBContext {

    public List<Borrowbook> getborrowbook() {
        List<Borrowbook> ls = new ArrayList<Borrowbook>();
        try {
            String sql = "select o.AccountName,b.Bname,s.statusName,o.LibrarianID,o.OrderDate from [Order] o\n"
                    + "inner join OrderDetails od on o.OrderID=od.OrderID\n"
                    + "inner join Book b on b.BookID = od.BookID\n"
                    + "inner join [Status] s on o.StatusID = s.StatusID";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Borrowbook b = new Borrowbook();
                b.setAname(rs.getString("AccountName"));
                b.setBname(rs.getString("Bname"));
                b.setStatusname(rs.getString("statusName"));
                b.setLid(rs.getString("LibrarianID"));
                b.setOdate(rs.getDate("OrderDate"));
                ls.add(b);

            }

        } catch (Exception e) {

        }
        return ls;
    }

    public List<quantityorderbook> getquantityorderbook() {
        List<quantityorderbook> list = new ArrayList<>();
        try {
            String sql = "SELECT COUNT(*) as Quantity\n"
                    + "  FROM [Order]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                quantityorderbook a = new quantityorderbook();
                a.setQuantity(rs.getInt("Quantity"));
                list.add(a);
            }

        } catch (Exception e) {

        }
        return list;
    }

    public static void main(String[] args) {
        BorrowbookDBContext dao = new BorrowbookDBContext();
        List<Borrowbook> b = dao.getborrowbook();
        for (Borrowbook o : b) {
            System.out.println(o);
        }

    }
}
