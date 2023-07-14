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
public class ChangeManagerServlet extends HttpServlet {

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
            out.println("<title>Servlet ChangeManagerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeManagerServlet at " + request.getContextPath() + "</h1>");
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
        String manv = request.getParameter("id");
        EmployeeDAO emDAO = new EmployeeDAO();
        Employee e = emDAO.getEmployeeByID(Integer.parseInt(manv));

        DepartmentDAO dpDAO = new DepartmentDAO();
        Department d = dpDAO.getDepartByID(Integer.parseInt(manv));

        request.setAttribute("manv", e.getMaNV());
        request.setAttribute("mapb", d.getMaPB());
        request.setAttribute("tenpb", d.getTenPB());

        request.getRequestDispatcher("changeManager.jsp").forward(request, response);
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
        String oldId = request.getParameter("oldId");
        String newId = request.getParameter("newId");

        String mapb = request.getParameter("mapb");

        EmployeeDAO emDAO = new EmployeeDAO();
        Employee e1 = emDAO.getEmployeeByID(Integer.parseInt(oldId));
        Employee e2 = emDAO.getEmployeeByID(Integer.parseInt(newId));

        DepartmentDAO dpDAO = new DepartmentDAO();
        Department d = dpDAO.getDepartByID(Integer.parseInt(newId));
        int newMapb = d.getMaPB();

        if (emDAO.getManagerIdByDepartmentId(newMapb) == Integer.parseInt(newId)) {
            emDAO.changeDepartmentAndManagerId(newMapb, Integer.parseInt(oldId));

            emDAO.changeDepartmentAndManagerId(Integer.parseInt(mapb), Integer.parseInt(newId));

            emDAO.changePosition(Integer.parseInt(oldId), e2.getViTri());
            emDAO.changePosition(Integer.parseInt(newId), e1.getViTri());

            emDAO.changeSalary(Integer.parseInt(oldId), e2.getLuong());
            emDAO.changeSalary(Integer.parseInt(newId), e1.getLuong());
        }else{
            emDAO.changePosition(Integer.parseInt(oldId), e2.getViTri());
            emDAO.changePosition(Integer.parseInt(newId), e1.getViTri());

            emDAO.changeSalary(Integer.parseInt(oldId), e2.getLuong());
            emDAO.changeSalary(Integer.parseInt(newId), e1.getLuong());
            
            emDAO.changeRole(3, e1.getEmail());
            emDAO.changeRole(2, e2.getEmail());
            
            emDAO.changeDepartmentID(newMapb, Integer.parseInt(oldId), Integer.parseInt(mapb), Integer.parseInt(newId));
            
        }

        List<Employee> list = emDAO.getEmListByID(Integer.parseInt(mapb));
        HttpSession session = request.getSession();

        DepartmentDAO department = new DepartmentDAO();
        Employee mn = department.getManager(Integer.parseInt(newId));
        Department dp = department.getDepartByID(Integer.parseInt(mapb));
        request.setAttribute("department", dp);
        request.setAttribute("emql", mn);

        request.removeAttribute("list");
        request.setAttribute("list", list);
//        response.sendRedirect("EmList.jsp");
        request.getRequestDispatcher("EmList.jsp").forward(request, response);
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
