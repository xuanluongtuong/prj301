/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package AssignmentController;

import DAL.AssignmentDAO;
import DAL.DepartmentDAO;
import DAL.ProjectDAO;
import DAL.ReportDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Assignment;
import model.Department;
import model.Project;
import model.Work;

/**
 *
 * @author admin
 */
public class WorkServlet extends HttpServlet {
   
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
            out.println("<title>Servlet WorkServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WorkServlet at " + request.getContextPath () + "</h1>");
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
        String idpc = request.getParameter("idpc");
        String mada = request.getParameter("mada");
        String mapb = request.getParameter("mapb");
        
        request.setAttribute("idpc", idpc);
        request.setAttribute("mada", mada);
        request.setAttribute("mapb", mapb);
        
        DepartmentDAO departDAO = new DepartmentDAO();
        Department d = departDAO.getDepartByDPID(Integer.parseInt(mapb));
        request.setAttribute("depart", d);
        request.setAttribute("tenpb", d.getTenPB());
        
        ProjectDAO projectDAO = new ProjectDAO();
        Project p = projectDAO.getPJByID(Integer.parseInt(mada));
        request.setAttribute("tenda", p.getTenDA());
        
        AssignmentDAO assignDAO = new AssignmentDAO();
        Assignment a = assignDAO.getASByID(Integer.parseInt(idpc));
        
        request.setAttribute("tenpc", a.getTen());
        
        ReportDAO rDAO = new ReportDAO();
        request.setAttribute("rDAO", rDAO);
        
        List<Work> list = assignDAO.getWorkByIdpcMapb(Integer.parseInt(idpc), Integer.parseInt(mapb));
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
        List<Work> listperpage =  assignDAO.getlistWorkbypage(list, start, end);
        request.setAttribute("list", listperpage);
        request.setAttribute("num", num);
        request.setAttribute("page", page); 
        request.getRequestDispatcher("work.jsp").forward(request, response);
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
