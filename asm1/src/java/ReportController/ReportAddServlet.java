/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ReportController;

import DAL.AssignmentDAO;
import DAL.ReportDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import model.Report;
import model.Work;

/**
 *
 * @author admin
 */
public class ReportAddServlet extends HttpServlet {

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
            out.println("<title>Servlet ReportAddServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReportAddServlet at " + request.getContextPath() + "</h1>");
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
        String macv = request.getParameter("macv");
        request.setAttribute("macv", macv);
        
        AssignmentDAO aDAO = new AssignmentDAO();
        Work w = aDAO.getWorkByID(Integer.parseInt(macv));
        
        request.setAttribute("tencv", w.getTen());
//        response.sendRedirect("reportAdd.jsp");
        request.getRequestDispatcher("reportAdd.jsp").forward(request, response);
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
        String macv = request.getParameter("macv");
        String ten = request.getParameter("ten");
        String noidung = request.getParameter("noidung");
        String chitiet = request.getParameter("chitiet");
        String img = request.getParameter("img");

        LocalDateTime currentTime = LocalDateTime.now();
        java.sql.Date sqlDate = java.sql.Date.valueOf(currentTime.toLocalDate());
        
        
        ReportDAO rDAO = new ReportDAO();
        Report r = new Report();
        r.setIdcv(Integer.parseInt(macv));
        r.setTen(ten);
        
        r.setTime(sqlDate);

        r.setNoiDung(noidung);
        r.setChiTiet(chitiet);
        r.setImg(img);
        
        AssignmentDAO aDAO = new AssignmentDAO();
        aDAO.duyetWork(2,Integer.parseInt(macv));
        
        rDAO.insertReport(r);

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        response.sendRedirect("workemployee?email=" + email);

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
