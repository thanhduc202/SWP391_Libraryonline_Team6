/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AdminDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import AdminModel.Announcement;
import AdminModel.OrderDetail;
import AdminModel.category;
import AdminModel.penalty;
import AdminModel.renewal;

/**
 *
 * @author win
 */
public class DashboardDBContext extends DBContext{
    
    public List<Announcement> getannouncement() {
        List<Announcement> list = new ArrayList<Announcement>();
        try {
            String sql = "select * from Announcement";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Announcement a = new Announcement();
                a.setId(rs.getInt("AnnouncementID"));
                a.setLibrarianid(rs.getString("LibrarianID"));
                a.setPublicdate(rs.getDate("PublishDate"));
                a.setTitle(rs.getString("Title"));
                a.setNote(rs.getString("Note"));
                list.add(a);
            }

        } catch (Exception e) {

        }
        return list;
    }
    public List<OrderDetail> getorderdetail() {
        List<OrderDetail> list = new ArrayList<OrderDetail>();
        try {
            String sql = "select * from OrderDetails";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OrderDetail o = new OrderDetail();
                o.setId(rs.getInt("OrderDetailID"));
                o.setOid(rs.getInt("OrderID"));
                o.setBid(rs.getInt("BookID"));
                o.setReceivedon(rs.getString("ReceivedOn"));
                o.setReturnon(rs.getDate("ReturnOn"));
                list.add(o);
            }

        } catch (Exception e) {

        }
        return list;
    }
    
    public List<penalty> getpenalty() {
        List<penalty> list = new ArrayList<penalty>();
        try {
            String sql = "select * from Penalty";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                penalty p = new penalty();
                p.setId(rs.getInt("PenaltyID"));
                p.setAname(rs.getString("AccountName"));
                p.setOid(rs.getInt("OrderID"));
                p.setAmount(rs.getFloat("Amount"));
                p.setSid(rs.getInt("StatusID"));
                list.add(p);
            }

        } catch (Exception e) {

        }
        return list;
    }
    public List<renewal> getrenewal() {
        List<renewal> list = new ArrayList<renewal>();
        try {
            String sql = "select * from Renewal";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                renewal r = new renewal();
                r.setRid(rs.getInt("RenewalID"));
                r.setOid(rs.getInt("OrderID"));
                r.setLid(rs.getString("LibrarianID"));
                r.setEdate(rs.getDate("ExtendDate"));
                r.setReason(rs.getString("Reason"));
                r.setSid(rs.getInt("StatusID"));
                list.add(r);
            }

        } catch (Exception e) {

        }
        return list;
    }
    
    public List<category> getcate() {
        List<category> list = new ArrayList<category>();
        try {
            String sql = "select * from Category";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                category c = new category();
               c.setCid(rs.getInt("CID"));
               c.setCname(rs.getString("CName"));
                list.add(c);
            }

        } catch (Exception e) {

        }
        return list;
    }
    
        public static void main(String[] args) {
        DashboardDBContext dao = new DashboardDBContext();
        List<category> a = dao.getcate();
        for (category o : a) {
            System.out.println(o);
        }

    }
}
