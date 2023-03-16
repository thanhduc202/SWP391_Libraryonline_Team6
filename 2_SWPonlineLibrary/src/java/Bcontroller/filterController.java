/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Bcontroller;

import DAO.bookDAO;
import Model.bookRate;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author chung
 */
public class filterController extends HttpServlet {
   
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
            out.println("<title>Servlet filterController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet filterController at " + request.getContextPath () + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("id"));
        bookDAO bd = new bookDAO();
        switch (id) {
            case 1:
                 request.setAttribute("bookFound", bd.getProductByCategory(1));
        request.getRequestDispatcher("bookPage.jsp").forward(request, response);
               
                break;
           case 2:
                request.setAttribute("bookFound", bd.getProductByCategory(2));
        request.getRequestDispatcher("bookPage.jsp").forward(request, response);
                
                break;
           case 8:
               request.setAttribute("bookFound", bd.getProductByCategory(8));
        request.getRequestDispatcher("bookPage.jsp").forward(request, response);
                
                break;
           case 6:
                request.setAttribute("bookFound", bd.getProductByCategory(6));
        request.getRequestDispatcher("bookPage.jsp").forward(request, response);
                
                break;
        
    } 
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
        bookDAO bd = new bookDAO();
        PrintWriter out = response.getWriter();
        String type = request.getParameter("type");
        List<bookRate> ls = new ArrayList<bookRate>();
        String json ;
        switch (type) {
            case "0-0":
                 ls = bd.getAllBookASC();
                json = new Gson().toJson(ls);
                out.print(json);
                break;
           case "0-1":
                 ls = bd.getAllBookDESC();
                json = new Gson().toJson(ls);
                out.print(json);
                break;
           case "1-0":
                ls=bd.getProductByCategory(1);
                json = new Gson().toJson(ls);
                out.print(json);
                break;
           case "1-1":
                ls=bd.getProductByCategory(2);
                json = new Gson().toJson(ls);
                out.print(json);
                break;
           case "1-2":
                ls=bd.getProductByCategory(3);
                json = new Gson().toJson(ls);
                out.print(json);
                break;
           case "1-3":
                ls=bd.getProductByCategory(4);
                json = new Gson().toJson(ls);
                out.print(json);
                break;
           case "1-4":
                ls=bd.getProductByCategory(5);
                json = new Gson().toJson(ls);
                out.print(json);
                break;
           case "1-5":
                ls=bd.getProductByCategory(6);
                json = new Gson().toJson(ls);
                out.print(json);
                break;
           case "1-6":
                ls=bd.getProductByCategory(7);
                json = new Gson().toJson(ls);
                out.print(json);
                break;
           case "1-7":
                ls=bd.getProductByCategory(8);
                json = new Gson().toJson(ls);
                out.print(json);
                break;
           case "1-8":
                ls=bd.getProductByCategory(9);
                json = new Gson().toJson(ls);
                out.print(json);
                break;
           case "2-0":
                ls=bd.getProductByCategory(10);
                json = new Gson().toJson(ls);
                out.print(json);
                break;
           case "3-0":
                ls=bd.getProductByCategory(11);
                json = new Gson().toJson(ls);
                out.print(json);
                break;
           default:
               out.print("error");
        }
        
        
        
        
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
