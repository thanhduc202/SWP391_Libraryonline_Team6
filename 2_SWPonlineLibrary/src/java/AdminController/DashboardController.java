/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package AdminController;


import AdminDAO.BookDBContext;
import AdminDAO.BorrowbookDBContext;
import AdminDAO.DashboardDBContext;
import AdminDAO.ManageUserDBContext;
import AdminDAO.StudentDBContext;
import AdminDAO.ViewFeedbackDBContext;
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
import java.util.List;
import AdminModel.Announcement;
import AdminModel.Librarian;
import AdminModel.OrderDetail;
import AdminModel.Student;
import AdminModel.category;
import AdminModel.penalty;
import AdminModel.quantitybook;
import AdminModel.quantityfeedback;
import AdminModel.quantityorderbook;
import AdminModel.quantitystudent;
import AdminModel.renewal;

/**
 *
 * @author win
 */
public class DashboardController extends HttpServlet {

    private boolean isLoggedIn(HttpServletRequest request) {
        return request.getSession().getAttribute("account") != null;
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if(isLoggedIn(request)){    
            
            
            //quantitybook
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
            
            //Annoumncement
            DashboardDBContext dao1 = new DashboardDBContext();
            List<Announcement> list1 = dao1.getannouncement();
            //orderdetail
             DashboardDBContext dao2 = new DashboardDBContext();
             List<OrderDetail> list2 = dao2.getorderdetail();
             //penalty
             DashboardDBContext dao3 = new DashboardDBContext();
             List<penalty> list3 = dao3.getpenalty();
             //renewal
             DashboardDBContext dao4 = new DashboardDBContext();
             List<renewal> list4 = dao4.getrenewal();
             //cate
             DashboardDBContext dao5 = new DashboardDBContext();
             List<category> list5 = dao5.getcate();
             
             //librarian
             ManageUserDBContext db = new ManageUserDBContext();
             List<Librarian> listl = db.getlibrarian();
             //student 
             List<Student> lists1 = daos.getstudent();
             
            //set data
            request.setAttribute("ListB", listb);
        request.setAttribute("ListS", lists);
        request.setAttribute("ListO", listo);
        request.setAttribute("Listf", listf);
        request.setAttribute("ListA", list1);
        request.setAttribute("List2", list2);
        request.setAttribute("List3", list3);
        request.setAttribute("List4", list4);
        request.setAttribute("List5", list5);
        request.setAttribute("ListL", listl);
        request.setAttribute("ListS1", lists1);
        request.getRequestDispatcher("examples/dashboard.jsp").forward(request, response);
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
