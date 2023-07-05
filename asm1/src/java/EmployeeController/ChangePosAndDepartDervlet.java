/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package EmployeeController;

import DAL.DepartmentDAO;
import DAL.EmployeeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Department;
import model.Employee;

/**
 *
 * @author admin
 */
public class ChangePosAndDepartDervlet extends HttpServlet {
   
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
            out.println("<title>Servlet ChangePosAndDepartDervlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePosAndDepartDervlet at " + request.getContextPath () + "</h1>");
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
        String manv = request.getParameter("id");
        
        request.setAttribute("manv", manv);
        
        EmployeeDAO eDAO = new EmployeeDAO();
        Employee e = eDAO.getEmployeeByID(Integer.parseInt(manv));
        request.setAttribute("tennv", e.getHoVaTen());
        request.setAttribute("oldVitri", e.getViTri());
        
        DepartmentDAO dpDAO = new DepartmentDAO();
        Department d = dpDAO.getDepartByID(Integer.parseInt(manv));
        request.setAttribute("oldMapb", d.getMaPB());
        request.setAttribute("tenpb", d.getTenPB());
        
        request.getRequestDispatcher("changePosAndDepart.jsp").forward(request, response);
        
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
        String manv = request.getParameter("manv");
        String newMapb = request.getParameter("newMapb");
        String newVitri = request.getParameter("newVitri");
        
        EmployeeDAO nv = new EmployeeDAO();
        
        nv.changePosition(Integer.parseInt(manv), newVitri);
        nv.changeDepartment(Integer.parseInt(manv), Integer.parseInt(newMapb));
        
        DepartmentDAO dpDAO = new DepartmentDAO();
        Department d = dpDAO.getDepartByDPID(Integer.parseInt(newMapb));        
        
        List<Employee> list = nv.getEmListByID(Integer.parseInt(newMapb));        
        
        HttpSession session = request.getSession();
        session.setAttribute("list", list);
        session.setAttribute("mapb", newMapb);
        session.setAttribute("tenPb", d.getTenPB());
        session.setAttribute("maql", d.getMaQL());        
        
        Employee mn = dpDAO.getManager(d.getMaQL());
                
        session.setAttribute("department", d);
        session.setAttribute("emql", mn);

        response.sendRedirect("EmList.jsp");        
        
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
