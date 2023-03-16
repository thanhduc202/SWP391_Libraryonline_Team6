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
import AdminModel.quantitybook;

/**
 *
 * @author win
 */
public class BookDBContext extends DBContext {

    public List<quantitybook> getquantitybook() {
        List<quantitybook> list = new ArrayList<>();
        try {
            String sql = "SELECT SUM (quantity) as quantity  FROM Book  WHERE quantity>=0";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                quantitybook b = new quantitybook();
                b.setQuantity(rs.getInt("quantity"));
                list.add(b);
            }

        } catch (Exception e) {

        }
        return list;
    }

    public List<Book> getbook() {
        List<Book> list = new ArrayList<>();
        try {
            String sql = "select * from Book";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setBid(rs.getInt("BookID"));
                b.setBname(rs.getString("Bname"));
                b.setAuthor(rs.getString("Author"));
                b.setImg(rs.getString("image"));
                b.setCid(rs.getInt("Cid"));
                b.setLanguage(rs.getString("Language"));
                b.setDescription(rs.getString("Description"));
                b.setStatus(rs.getInt("Status"));
                b.setQuantt(rs.getInt("quantity"));
                b.setPsher(rs.getString("publisher"));
                b.setPyear(rs.getInt("publishYear"));
                b.setPage(rs.getInt("pages"));
                list.add(b);
            }

        } catch (Exception e) {

        }
        return list;
    }

    public void EditBook(String bname, String author, String image, String cate,
            String language, String description, String status, String quantity, String publisher,String publishyear,String page, String id) {
        try {
            String sql = "update Book\n"
                    + "set Bname = ?,\n"
                    + "Author = ?,\n"
                    + "[image] = ?,\n"
                    + "Cid = ?,\n"
                    + "[Language] = ?,\n"
                    + "[Description] = ?,\n"
                    + "[Status] = ?,\n"
                    + "quantity = ?,\n"
                    + "publisher = ?,\n"
                    + "publishYear = ?,\n"
                    + "pages = ?\n"
                    + "where BookID = ?";
            PreparedStatement sql_insert = connection.prepareStatement(sql);
            sql_insert.setString(1, bname);
            sql_insert.setString(2, author);
            sql_insert.setString(3, image);
            sql_insert.setString(4, cate);
            sql_insert.setString(5, language);
            sql_insert.setString(6, description);
            sql_insert.setString(7, status);
            sql_insert.setString(8, quantity);
            sql_insert.setString(9, publisher);
            sql_insert.setString(10, publishyear);
            sql_insert.setString(11, page);
            sql_insert.setString(12, id);
            sql_insert.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void insertBook(String bname, String author, String image, String cate,
            String language, String description, String status, String quantity, String publisher, String publishyear, String page) {
        try {
            String sql = "insert into Book\n"
                    + "              values(?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement sql_insert = connection.prepareStatement(sql);
            sql_insert.setString(1, bname);
            sql_insert.setString(2, author);
            sql_insert.setString(3, image);
            sql_insert.setString(4, cate);
            sql_insert.setString(5, language);
            sql_insert.setString(6, description);
            sql_insert.setString(7, status);
            sql_insert.setString(8, quantity);
            sql_insert.setString(9, publisher);
            sql_insert.setString(10, publishyear);
            sql_insert.setString(11, page);
            sql_insert.executeUpdate();

        } catch (Exception e) {
        }
    }

    public Book getBookByID(String id) {
        try {
            String sql = "select * from Book\n"
                    + "where BookID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setBname(rs.getString("Bname"));
                b.setAuthor(rs.getString("Author"));
                b.setImg(rs.getString("image"));
                b.setCid(rs.getInt("Cid"));
                b.setLanguage(rs.getString("Language"));
                b.setDescription(rs.getString("Description"));
                b.setStatus(rs.getInt("Status"));
                b.setQuantt(rs.getInt("quantity"));
                b.setPsher(rs.getString("publisher"));
                b.setPyear(rs.getInt("publishYear"));
                b.setPage(rs.getInt("pages"));
                b.setBid(rs.getInt("BookID"));
                return b;
            }

        } catch (Exception e) {

        }
        return null;
    }

    public void deletebook(String id) {
        try {
            String sql = "delete from Book\n"
                    + "where BookID = ?";
            PreparedStatement sql_delete = connection.prepareStatement(sql);
            sql_delete.setString(1, id);
            sql_delete.executeUpdate();

        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        BookDBContext dao = new BookDBContext();
        Book list = dao.getBookByID("5");
        System.out.println(list);

    }
}
