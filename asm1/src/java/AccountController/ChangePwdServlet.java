/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package AccountController;

import DAL.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import utils.NumberToEnum;

/**
 *
 * @author admin
 */
public class ChangePwdServlet extends HttpServlet {

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
            out.println("<title>Servlet ChangePwdServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePwdServlet at " + request.getContextPath() + "</h1>");
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
        response.sendRedirect("changePwd.jsp");
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
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String oldpwd = request.getParameter("oldPassword");
        String newpwd = request.getParameter("newPassword");
        String renewpwd = request.getParameter("reNewPassword");

        AccountDAO accountDAO = new AccountDAO();
        Account a = accountDAO.getAccountByEmail(email);

        // validate data
        if ( oldpwd.isEmpty() || newpwd.isEmpty() || renewpwd.isEmpty()) {
            request.setAttribute("error", "Please fill all the fields.");
            request.getRequestDispatcher("changePwd.jsp").forward(request, response);
        } 
        else if (!oldpwd.equals(a.getPassword())) {
            request.setAttribute("error", "Old password is incorrect.");
            request.getRequestDispatcher("changePwd.jsp").forward(request, response);
        } 
        else if (oldpwd.equals(newpwd)) {
            request.setAttribute("error", "Please Enter new Password.");
            request.getRequestDispatcher("changePwd.jsp").forward(request, response);
        } 
        else if (!newpwd.equals(renewpwd)) {
            request.setAttribute("error", "New Password and Re-Enter New Password must be same");
            request.getRequestDispatcher("changePwd.jsp").forward(request, response);
        } 
        else {
            accountDAO.changePassword(email, newpwd);   
            session.removeAttribute("email");
            session.removeAttribute("role");
            session.removeAttribute("username");
            session.removeAttribute("password");
            response.sendRedirect("login");
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
