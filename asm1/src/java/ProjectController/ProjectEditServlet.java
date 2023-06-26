/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController;

import DAL.ProjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
public class ProjectEditServlet extends HttpServlet {

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
            out.println("<title>Servlet ProjectEditServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProjectEditServlet at " + request.getContextPath() + "</h1>");
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
        int mada = Integer.parseInt(request.getParameter("id"));
        ProjectDAO project = new ProjectDAO();
        Project pro = project.getPJByID(mada);
        request.setAttribute("project", pro);
        request.getRequestDispatcher("projectEdit.jsp").forward(request, response);
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
        String mada = request.getParameter("MADA");
        String tenkh = request.getParameter("TENKH");
        String tenda = request.getParameter("TENDA");
        String diaDiem = request.getParameter("DIADIEM");
        String nganSach = request.getParameter("NGANSACH");
        String ngayThiCong = request.getParameter("NGAYTHICONG");
        String trangThai = request.getParameter("TRANGTHAI");
        String imgUrl = request.getParameter("IMG");
        String uploadDirectory = "D:\\PRJ301\\Assignment\\asm1\\web\\img";
        Part filePart = request.getPart("file");
        String originalFileName = getFileName(filePart);
        
        if (filePart!=null) {
            // Tạo tên file mới
            String newFileName = mada.trim() + tenda.trim() + ".png";
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
               
                out.close();
                
                
                fileContent.close();
                
                
                imgUrl = "img/" + newFileName.trim();
                
            } catch (FileNotFoundException fne) {
                writer.println("You either did not specify a file to upload or are trying to upload a file to a protected or nonexistent location.");
                writer.println("<br/> ERROR: " + fne.getMessage());
            }
        }else{
            imgUrl = request.getParameter("IMG");
        }

        try {
            ProjectDAO project = new ProjectDAO();
            Project pro = new Project();
            pro.setMaDA(Integer.parseInt(mada));
            pro.setTenKH(tenkh);
            pro.setTenDA(tenda);
            pro.setDiaDiem(diaDiem);
            pro.setNganSach(Float.parseFloat(nganSach));
            pro.setNgayThiCong(Date.valueOf(ngayThiCong));
            pro.setTrangThai(Integer.parseInt(trangThai));
            pro.setUrlImg(imgUrl);

            HttpSession session = request.getSession(); 
            session.setAttribute("proimg", imgUrl);
            session.setAttribute("projectinfo", pro);

            project.editProject(pro);
//            request.getRequestDispatcher("projectInfo.jsp").forward(request, response);
            response.sendRedirect("projectInfo.jsp");
        } catch (IOException | NumberFormatException e) {
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
