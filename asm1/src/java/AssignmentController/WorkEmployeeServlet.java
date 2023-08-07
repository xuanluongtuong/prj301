/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package AssignmentController;

import DAL.AccountDAO;
import DAL.AssignmentDAO;
import DAL.DepartmentDAO;
import DAL.ReportDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Department;
import model.Work;

/**
 *
 * @author admin
 */
public class WorkEmployeeServlet extends HttpServlet {
   
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
            out.println("<title>Servlet WorkEmployeeServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WorkEmployeeServlet at " + request.getContextPath () + "</h1>");
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
        String email = request.getParameter("email");        
        
        AccountDAO accDAO = new AccountDAO();        
        int manv = accDAO.getManvByEmail(email);
        HttpSession session = request.getSession();        
        AssignmentDAO assDAO = new AssignmentDAO();
        
        DepartmentDAO departDAO = new DepartmentDAO();
        int mapb = departDAO.getDepartIDByEmail(email);
        
        Department d = departDAO.getDepartByDPID(mapb);
        request.setAttribute("tenpb", d.getTenPB());
        
        ReportDAO rDAO = new ReportDAO();
        request.setAttribute("rDAO", rDAO);
        
        List<Work> list = assDAO.getWorkByManv(manv);        
        int page, numperpage = 4;
        int size = list.size();
        int num = (size%numperpage==0?(size/numperpage):((size/numperpage)+1));
        String pages = request.getParameter("page");
        if (pages == null) {
            page = 1;
        } else {
            page = Integer.parseInt(pages);
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);
        List<Work> listperpage =  assDAO.getlistWorkbypage(list, start, end);
        request.setAttribute("list", listperpage);
        request.setAttribute("num", num);
        request.setAttribute("page", page);
        
        request.setAttribute("email", email);
        session.setAttribute("email", email);
        request.getRequestDispatcher("userHome.jsp").forward(request, response);
//        response.sendRedirect("userHome.jsp");
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
        processRequest(request, response);
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