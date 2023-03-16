/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package AdminController;

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
import java.util.ArrayList;
import AdminModel.Account;
import AdminDAO.UserprofileDBContext;
import AdminDAO.ViewFeedbackDBContext;
import java.util.List;
import AdminModel.abc;
/**
 *
 * @author win
 */
public class UserprofileController extends HttpServlet {

    
private boolean isLoggedIn(HttpServletRequest request) {
        return request.getSession().getAttribute("account") != null;
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
       if(isLoggedIn(request)){       
       UserprofileDBContext dao = new UserprofileDBContext();
       ArrayList<Account> listA = dao.getAllAccount();
       request.setAttribute("listA", listA);
       request.getRequestDispatcher("/jsp/Userprofile.jsp").forward(request, response);
    }else{
            response.getWriter().println("access denied!");
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
