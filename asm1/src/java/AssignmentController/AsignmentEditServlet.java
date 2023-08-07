/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package AssignmentController;

import DAL.AssignmentDAO;
import DAL.DepartmentDAO;
import DAL.ProjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.List;
import model.Assignment;
import model.Department;
import model.Project;

/**
 *
 * @author admin
 */
public class AsignmentEditServlet extends HttpServlet {
   
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
            out.println("<title>Servlet AsignmentEditServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AsignmentEditServlet at " + request.getContextPath () + "</h1>");
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
        String mada = request.getParameter("mada");
        String id = request.getParameter("id");
        
        AssignmentDAO asDAO = new AssignmentDAO();
        Assignment a = asDAO.getASByID(Integer.parseInt(id));
        request.setAttribute("mapb", a.getMapb());
        request.setAttribute("ten", a.getTen());
        request.setAttribute("id", id);
        request.setAttribute("start", a.getStart());
        request.setAttribute("end", a.getEnd());
        request.setAttribute("status", a.getTrangThai());        
        
        ProjectDAO projectDAO = new ProjectDAO();
        Project p = projectDAO.getPJByID(Integer.parseInt(mada));
        request.setAttribute("mada", mada);
        request.setAttribute("tenda", p.getTenDA());
        DepartmentDAO departDAO = new DepartmentDAO();
        
        Department d = departDAO.getDepartByDPID(a.getMapb());
        request.setAttribute("tenpb", d.getTenPB());        
        
        request.getRequestDispatcher("assignmentEdit.jsp").forward(request, response);
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
        String mada = request.getParameter("mada");
        String mapb = request.getParameter("mapb");
        String ten = request.getParameter("ten");
        String id = request.getParameter("id");
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        String status = request.getParameter("status");
        
        
        try {
            AssignmentDAO assignDAO = new AssignmentDAO();
            Assignment a = new Assignment();
            a.setId(Integer.parseInt(id));
            a.setMada(Integer.parseInt(mada));
            a.setMapb(Integer.parseInt(mapb));
            a.setTen(ten);
            a.setStart(Date.valueOf(start));
            a.setEnd(Date.valueOf(end));
            a.setTrangThai(Integer.parseInt(status));
            
            assignDAO.editAssignment(a);
            List<Assignment> list = assignDAO.getASByMada(Integer.parseInt(mada));           
            
            HttpSession session = request.getSession();
            session.setAttribute("list", list);
            
            ProjectDAO projectDAO = new ProjectDAO();
            Project p = projectDAO.getPJByID(Integer.parseInt(mada));
            
            request.setAttribute("project", p);
            
            session.setAttribute("projectinfo", p);
//            request.getRequestDispatcher("assignment").forward(request, response);
            response.sendRedirect("assignmentinfo?mada="+mada);
        } catch (IOException | NumberFormatException e) {
            System.out.println(e);
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
