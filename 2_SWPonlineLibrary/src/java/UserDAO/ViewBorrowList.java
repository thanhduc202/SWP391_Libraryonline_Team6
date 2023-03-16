/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package UserDAO;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import Model.book;
import module.Order;
import DAO.bookDAO;
import java.util.ArrayList;

/**
 *
 * @author thanh
 */
@WebServlet(name = "ViewBorrowList", urlPatterns = {"/viewBorrowList"})
public class ViewBorrowList extends HttpServlet {

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
            out.println("<title>Servlet ViewBorrowList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewBorrowList at " + request.getContextPath() + "</h1>");
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
//        PrintWriter out = response.getWriter();
//        bookDAO d = new bookDAO();
//        int bookId = Integer.parseInt(request.getParameter("id"));     
//        book b = d.getBookByBookId(bookId);
//        HttpSession session = request.getSession();
//    //     session.setAttribute("bo", b);
////        //List<book> list = (List) session.getAttribute("book");  
//////        if(list == null){
//////            list = new ArrayList<book>();
//////        }  
////       
////        
//////        
////        //session.setAttribute("book", list);
////        
//        request.setAttribute("book", b);
//        session.setAttribute("book", b);
//        request.getRequestDispatcher("BorrowList.jsp").forward(request, response);
    
        PrintWriter out = response.getWriter();
        bookDAO d = new bookDAO();
        int bookId = Integer.parseInt(request.getParameter("id"));
        book b = d.getBookByBookId(bookId);
        HttpSession session = request.getSession();
        //       session.setAttribute("bo", b);
        //List<book> list = (List) session.getAttribute("book");  
//        if(list == null){
//            list = new ArrayList<book>();
//        }
       
        List<book> ls = new ArrayList<book>();
        if (session.getAttribute("bookWait") == null) {
            session.setAttribute("bookWait", ls);

        } else {            
            ls = (List<book>) session.getAttribute("bookWait");
            for (book bo : ls) {
                if(bo.getBookId()==b.getBookId()){
                    response.sendRedirect("BorrowList.jsp");
                    return;
                }
            }
            ls.add(b);
            session.setAttribute("bookWait", ls);
        }
//        
        //session.setAttribute("book", list);

//        request.setAttribute("book", ls);
//        session.setAttribute("book", b);
        request.getRequestDispatcher("BorrowList.jsp").forward(request, response);

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
        response.setContentType("text/html;charset=UTF-8");

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
