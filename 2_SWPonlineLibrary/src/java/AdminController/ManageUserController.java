/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package AdminController;

import AdminDAO.BookDBContext;
import AdminDAO.BorrowbookDBContext;
import AdminDAO.ManageUserDBContext;
import AdminDAO.StudentDBContext;
import AdminDAO.UserprofileDBContext;
import AdminDAO.ViewFeedbackDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import AdminModel.Account;
import AdminModel.quantitybook;
import AdminModel.quantityfeedback;
import AdminModel.quantityorderbook;
import AdminModel.quantitystudent;

/**
 *
 * @author win
 */
public class ManageUserController extends HttpServlet {

    
private boolean isLoggedIn(HttpServletRequest request) {
        return request.getSession().getAttribute("account") != null;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        if(isLoggedIn(request)){       
       //get data
        ManageUserDBContext dao = new ManageUserDBContext();
        List<Account> list = dao.getmanageAccount();
        
            BookDBContext daob = new BookDBContext();
            List<quantitybook> listb = daob.getquantitybook();
            
             //quantitystudent
            StudentDBContext daos = new StudentDBContext();
            List<quantitystudent> lists = daos.getquantitystudent();
            
            //quantityorderbook
            BorrowbookDBContext daoo = new BorrowbookDBContext();

            List<quantityorderbook> listo = daoo.getquantityorderbook();
            //quantityfeedback
            ViewFeedbackDBContext daof = new ViewFeedbackDBContext();
            List<quantityfeedback> listf = daof.getquantityfeedback();
            
        //set data
        request.setAttribute("listA", list);
        request.setAttribute("ListB", listb);
        request.setAttribute("ListS", lists);
        request.setAttribute("ListO", listo);
        request.setAttribute("ListF", listf);
        request.getRequestDispatcher("examples/manageuser.jsp").forward(request, response);
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
