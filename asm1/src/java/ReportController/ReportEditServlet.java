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

/**
 *
 * @author admin
 */
public class ReportEditServlet extends HttpServlet {

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
            out.println("<title>Servlet ReportEditServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReportEditServlet at " + request.getContextPath() + "</h1>");
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
        String idpc = request.getParameter("idpc");
        String mada = request.getParameter("mada");
        System.out.println(mada);
        String mapb = request.getParameter("mapb");
        request.setAttribute("idpc", idpc);
        request.setAttribute("mada", mada);
        request.setAttribute("mapb", mapb);
        String id = request.getParameter("id");
        ReportDAO rDAO = new ReportDAO();
        Report r = rDAO.getReportById(Integer.parseInt(id));
        request.setAttribute("report", r);
        request.getRequestDispatcher("reportEdit.jsp").forward(request, response);
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

        String idpc = request.getParameter("idpc");
        String mada = request.getParameter("mada");
        String mapb = request.getParameter("mapb");
        String edit = request.getParameter("edit");
        String id = request.getParameter("id");
        String ten = request.getParameter("ten");
        String noidung = request.getParameter("noidung");
        String chitiet = request.getParameter("chitiet");
        String img = request.getParameter("img");

        LocalDateTime currentTime = LocalDateTime.now();
        java.sql.Date sqlDate = java.sql.Date.valueOf(currentTime.toLocalDate());

        ReportDAO rDAO = new ReportDAO();
        Report r = new Report();

        r.setId(Integer.parseInt(id));
        r.setTen(ten);

        r.setTime(sqlDate);

        r.setNoiDung(noidung);
        r.setChiTiet(chitiet);
        r.setImg(img);
        int i = Integer.parseInt(edit) + 1;
        r.setEdit(i);

        rDAO.editReport(r);

        Report r1 = rDAO.getReportById(Integer.parseInt(id));
        AssignmentDAO aDAO = new AssignmentDAO();
        aDAO.duyetWork(2, r1.getIdcv());

//        request.setAttribute("report", rDAO.getReportById(r.getId()));
//        request.setAttribute("macv", r1.getIdcv());
//        request.setAttribute("idpc", idpc);
//        request.setAttribute("mada", mada);
//        request.setAttribute("mapb", mapb);

//        request.getRequestDispatcher("report.jsp").forward(request, response);
//        request.getRequestDispatcher("report?macv="+r1.getIdcv()+"&mada="+mada+"&mapb="+mapb+"&idpc="+idpc).forward(request, response);
        response.sendRedirect("report?macv="+r1.getIdcv()+"&mada="+mada+"&mapb="+mapb+"&idpc="+idpc);
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
