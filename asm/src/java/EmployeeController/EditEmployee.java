/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package EmployeeController;

import DAL.EmployeeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.List;
import model.Employee;

/**
 *
 * @author admin
 */
public class EditEmployee extends HttpServlet {

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
            out.println("<title>Servlet EditEmployee</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditEmployee at " + request.getContextPath() + "</h1>");
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
        int manv = Integer.parseInt(request.getParameter("id"));
        EmployeeDAO employ = new EmployeeDAO();
        Employee em = employ.getEmployeeByID(manv);
        request.setAttribute("employee", em);
        request.getRequestDispatcher("editEm.jsp").forward(request, response);

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
        String manv = request.getParameter("MANV");
        String hoVaTen = request.getParameter("HOVATEN");
        String ten = request.getParameter("TEN");
        String phai = request.getParameter("PHAI");
        String ngaySinh = request.getParameter("NGAYSINH");
        String diaChi = request.getParameter("DIACHI");
        String SDT = request.getParameter("SDT");
        String Email = request.getParameter("EMAIL");
        String viTri = request.getParameter("VITRI");
        String maql = request.getParameter("MAQL");
        String phongban = request.getParameter("PHONGBAN");
        String mapb = request.getParameter("MAPB");
        String luong = request.getParameter("LUONG");

        try {
            EmployeeDAO employ = new EmployeeDAO();
            Employee em = new Employee();

            em.setMaNV(Integer.parseInt(manv));
            em.setHoVaTen(hoVaTen);
            em.setTen(ten);
            em.setGt(Integer.parseInt(phai));
            em.setNgaySinh(Date.valueOf(ngaySinh));
            em.setDiaChi(diaChi);
            em.setSDT(SDT);
            em.setEmail(Email);
            em.setViTri(viTri);
            em.setMaQL(Integer.parseInt(maql));
            em.setPhongBan(phongban);
            em.setMaPB(Integer.parseInt(mapb));
            em.setLuong(Float.parseFloat(luong));
            
            employ.editEmployee(em);
            List<Employee> list = employ.getEmList(Integer.parseInt(mapb));
            HttpSession session = request.getSession();
            session.setAttribute("list", list);
            response.sendRedirect("EmList.jsp");
        } catch (Exception e) {
            System.out.println(e);
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
