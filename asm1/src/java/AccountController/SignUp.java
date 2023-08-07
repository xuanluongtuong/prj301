/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package AccountController;

import DAL.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import utils.NumberToEnum.UserRole;

/**
 *
 * @author admin
 */
public class SignUp extends HttpServlet {
   
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
            out.println("<title>Servlet SignUp</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUp at " + request.getContextPath () + "</h1>");
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
//        response.sendRedirect("signup.jsp");
        request.getRequestDispatcher("signup.jsp").forward(request, response);
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
//        HttpSession session = request.getSession();

        // get data from form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");        
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
//        String checkbox = request.getParameter("checkbox");
        
        
        
        // validate data
        if (name.isEmpty() || email.isEmpty() || phone.isEmpty() || password.isEmpty() || repassword.isEmpty()) {
            request.setAttribute("error", "Please fill all the fields.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
//        else if(checkbox==null){
//            request.setAttribute("error", "You have to accept the Terms of service.");
//            request.getRequestDispatcher("signup.jsp").forward(request, response);
//        }
        else if (!password.equals(repassword)) {
            request.setAttribute("error", "Password and Re-Password must be same.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } 
        else {
            Account account = new Account(email, password, name, phone, UserRole.USER.getValue());
            AccountDAO accountDAO = new AccountDAO();
            if (accountDAO.getAccountIDByEmail(email) != 0) {
                request.setAttribute("error", "Email already exists!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
             
            else {
                accountDAO.createAccount(account);                
                request.getRequestDispatcher("home.jsp").forward(request, response);
            }

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
