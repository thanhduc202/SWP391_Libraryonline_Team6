/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.book_rental;

import daoLibrarian.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.ArrayList;
import module.Method;
import module.Order;
import module.Penalty;
import module.Renewal;
import module.Status;

/**
 *
 * @author tient
 */
public class BookRentalServletController extends HttpServlet {

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
            out.println("<title>Servlet BookRentalServletController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookRentalServletController at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        Date dNow = new Date();
        OrderDAO odao = new OrderDAO();
        
        ArrayList<Order> listOrder = new ArrayList<>();
        if(action.equalsIgnoreCase("order")) {
            listOrder = odao.getOrderList(0);
        } else if (action.equalsIgnoreCase("return")) {
            listOrder = odao.getOrderList(1);
        }
        ArrayList<Method> listMethod = odao.getMethodCount();
        ArrayList<Status> listStatus = odao.getStatusCount();
        ArrayList<Renewal> listRenewal = odao.getListRenewals();
        switch (action) {
            case "order":
                request.setAttribute("listOrder", listOrder);
                request.setAttribute("listMethod", listMethod);
                request.setAttribute("listStatus", listStatus);
                request.getRequestDispatcher("pages/book_rental/orders.jsp").forward(request, response);
                break;
            case "penalty":
                ArrayList<Penalty> listPen = odao.getListPenalty();
                request.setAttribute("listPen", listPen);
                request.getRequestDispatcher("pages/book_rental/penalties.jsp").forward(request, response);
                break;
            case "renewal":
                request.setAttribute("listRenewal", listRenewal);
                request.getRequestDispatcher("pages/book_rental/renewals.jsp").forward(request, response);
                break;
            case "return":
                request.setAttribute("listOrder", listOrder);
                request.setAttribute("listMethod", listMethod);
                request.setAttribute("listStatus", listStatus);
                request.setAttribute("dateNow", dNow);
                request.getRequestDispatcher("pages/book_rental/returns.jsp").forward(request, response);
                break;
        }
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
        String action = request.getParameter("action");
        OrderDAO odao = new OrderDAO();
        switch (action) {
            case "order":
                String sid = request.getParameter("sid");
                String oid = request.getParameter("oid");
                odao.changeStatusOrder(Integer.parseInt(sid), Integer.parseInt(oid));
                response.sendRedirect("book_rental?action=order");
                break;
            case "penalty":
                String pid = request.getParameter("pid");
                String sid4 = request.getParameter("sid");
                odao.changeStatusPenalty(Integer.parseInt(sid4), Integer.parseInt(pid));
                response.sendRedirect("book_rental?action=penalty");
                break;
            case "renewal":
                String sid2 = request.getParameter("sid");
                String oid2 = request.getParameter("rid");
                odao.changeStatusRenewal(Integer.parseInt(sid2), Integer.parseInt(oid2));
                response.sendRedirect("book_rental?action=renewal");
                break;
            case "return":
                String sid1 = request.getParameter("sid");
                String oid1 = request.getParameter("oid");
                odao.changeStatusOrder(Integer.parseInt(sid1), Integer.parseInt(oid1));
                response.sendRedirect("book_rental?action=return");
                break;
        }
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
