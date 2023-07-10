/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController;

import DAL.ProjectDAO;
import static ProjectController.ProjectEditServlet.replaceWhitespace;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import model.Project;

/**
 *
 * @author admin
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class ProjectAddServlet extends HttpServlet {

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
            out.println("<title>Servlet ProjectAddServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProjectAddServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("projectAdd.jsp").forward(request, response);
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
        String tenkh = request.getParameter("TENKH");
        String tenda = request.getParameter("TENDA");
        String diaDiem = request.getParameter("DIADIEM");
        String nganSach = request.getParameter("NGANSACH");
        String ngayThiCong = request.getParameter("NGAYTHICONG");
        String trangThai = request.getParameter("TRANGTHAI");
        String imgUrl = request.getParameter("IMG");

        //        String uploadDirectory = getServletContext().getRealPath("/img");
        String uploadDirectory = "D:\\PRJ301\\Assignment\\asm1\\web\\img";
        Part filePart = request.getPart("file");
        String originalFileName = getFileName(filePart);

        ProjectDAO project = new ProjectDAO();
        Project pro = new Project();

        // Tạo tên file mới
        if (filePart != null) {
            if (originalFileName != null && !originalFileName.equals("")) {
                String newFileName = tenda + ".png";
                newFileName = replaceWhitespace(newFileName);

                String filePath = uploadDirectory + File.separator + newFileName;
                File file = new File(filePath);

                // Kiểm tra nếu file đã tồn tại
                if (file.exists()) {
                    // Xóa file cũ trước khi lưu file mới
                    file.delete();
                }

                // Lưu file mới lên server
                OutputStream out = null;
                InputStream fileContent = null;
                final PrintWriter writer = response.getWriter();

                try {
                    out = new FileOutputStream(file);
                    fileContent = filePart.getInputStream();

                    int read;
                    final byte[] bytes = new byte[1024];

                    while ((read = fileContent.read(bytes)) != -1) {
                        out.write(bytes, 0, read);
                    }

                    imgUrl = "img/" + newFileName;

                } catch (FileNotFoundException fne) {
                    request.setAttribute("mes", "Upload fail!");
                    response.sendRedirect("projectInfo.jsp");
                } finally {
                    if (out != null) {
                        out.close();
                    }
                    if (fileContent != null) {
                        fileContent.close();
                    }

                }
            }
        }
        try {
            pro.setTenKH(tenkh);
            pro.setTenDA(tenda);
            pro.setDiaDiem(diaDiem);
            pro.setNganSach(Float.parseFloat(nganSach));
            pro.setNgayThiCong(Date.valueOf(ngayThiCong));
            pro.setTrangThai(Integer.parseInt(trangThai));
            pro.setUrlImg(imgUrl);
            project.insertProject(pro);
            response.sendRedirect("project");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : partHeader.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    public static String replaceWhitespace(String input) {
        return input.replace(" ", "_");
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
