/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package AdminController;

import AdminDAO.ManageUserDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import AdminModel.Account;

/**
 *
 * @author win
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("examples/login.jsp").forward(request, response);
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountname = request.getParameter("accountname");
        String accountpassword = request.getParameter("accountpassword");
        ManageUserDBContext db = new ManageUserDBContext();
        Account user = db.getAccountByNamePassword(accountname, accountpassword);
        if(user==null){
//            response.getWriter().println("username or password is invalid!");
            request.setAttribute("mess", "Wrong user or pass");
            request.getRequestDispatcher("examples/login.jsp").forward(request, response);
        }else{
            request.getSession().setAttribute("account", user);
            response.sendRedirect("dashboard");
            //response.getWriter().println("Login successful!");
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
