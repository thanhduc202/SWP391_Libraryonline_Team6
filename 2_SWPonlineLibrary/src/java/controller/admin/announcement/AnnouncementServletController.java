/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.announcement;

import daoLibrarian.AnnouncementDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import module.Account;
import module.Announcement;
import module.Librarian;

/**
 *
 * @author tient
 */
public class AnnouncementServletController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AnnouncementServletController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AnnouncementServletController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //response.sendRedirect("pages/book_rental/announcement.jsp");
        AnnouncementDAO adao = new AnnouncementDAO();
        ArrayList<Announcement> listAnn = adao.getAnnouncementList();
        request.setAttribute("listAnn", listAnn);
        request.getRequestDispatcher("pages/announcement.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action");
        String title = request.getParameter("title");
        String note = request.getParameter("note");
        HttpSession session = request.getSession();
        Librarian lib = (Librarian) session.getAttribute("librarian"); //Lay ra tai khoan dang su dung
        AnnouncementDAO adao = new AnnouncementDAO();
        
        if(action.equalsIgnoreCase("create")){
            adao.createAnnouncement("L111", title, note);
        } else if (action.equalsIgnoreCase("update")) {
            int aid = Integer.parseInt(request.getParameter("aid"));
            adao.updateAnnoucement(aid, "L111", title, note);
        } else if(action.equalsIgnoreCase("delete")) {
            int aid = Integer.parseInt(request.getParameter("aid"));
            adao.deleteAnnouncement(aid);
        }
        response.sendRedirect("announcement");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
