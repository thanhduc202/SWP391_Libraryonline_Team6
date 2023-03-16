/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package AdminController;

import AdminDAO.BookDBContext;
import AdminDAO.DashboardDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import AdminModel.Book;
import AdminModel.category;
import java.util.List;

/**
 *
 * @author win
 */
public class LoadBook extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoadBook</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoadBook at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("Bid");
        BookDBContext dao = new BookDBContext();
        Book b = dao.getBookByID(id);
        DashboardDBContext db = new DashboardDBContext();
         List<category> list = db.getcate();
        
        request.setAttribute("lb", b);
        request.setAttribute("listc", list);
        request.getRequestDispatcher("Editbook.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("bid");
        String bname = request.getParameter("bookname");
        String bauthor = request.getParameter("author");
        String bimage = request.getParameter("image");
        String bcate = request.getParameter("cate");
        String blanguage = request.getParameter("language");
        String bdescription = request.getParameter("description");
        String bstatus = request.getParameter("status");
        String bquantity = request.getParameter("quantity");
        String bpublisher = request.getParameter("publisher");
        String bpublishyear = request.getParameter("publishyear");
        String bpage = request.getParameter("page");
        
        BookDBContext db = new BookDBContext();
        db.EditBook(bname, bauthor, bimage, bcate, blanguage, bdescription, bstatus, bquantity, bpublisher, bpublishyear, bpage, id);
        response.sendRedirect("Managebook");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
