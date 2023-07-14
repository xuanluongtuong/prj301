/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.Report;

/**
 *
 * @author admin
 */
public class ReportDAO extends DBContext {

    public List<Report> getReportListByManv(int manv) {
        List<Report> list = new ArrayList<>();
        String sql = "SELECT BC.ID,BC.IDCV, BC.TEN, CV.TEN_CONG_VIEC, HO_VA_TEN, PB.TENPB, BC.NGAYNOP, BC.NOIDUNG, BC.CHITIET, BC.IMG, BC.EDIT\n"
                + "FROM dbo.NHANVIEN AS NV\n"
                + "INNER JOIN dbo.CONGVIEC AS CV ON NV.MANV = CV.MANV\n"
                + "INNER JOIN dbo.BAOCAO AS BC ON CV.ID = BC.IDCV\n"
                + "INNER JOIN dbo.PHONGBAN AS PB ON NV.MAPB=PB.MAPB\n"
                + "WHERE NV.MANV=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, manv);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Report r = new Report();
                r.setId(rs.getInt("ID"));
                r.setIdcv(rs.getInt("IDCV"));
                r.setTen(rs.getNString("TEN"));
                r.setTencv(rs.getNString("TEN_CONG_VIEC"));
                r.setTennv(rs.getNString("HO_VA_TEN"));
                r.setTenpb(rs.getNString("TENPB"));
                r.setTime(rs.getDate("NGAYNOP"));
                r.setNoiDung(rs.getNString("NOIDUNG"));
                r.setChiTiet(rs.getNString("CHITIET"));
                r.setImg(rs.getNString("IMG"));
                r.setEdit(rs.getInt("EDIT"));
                list.add(r);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Report getReportByMacv(int id) {

        String sql = "SELECT BC.ID,BC.IDCV, BC.TEN, CV.TEN_CONG_VIEC, HO_VA_TEN, PB.TENPB, BC.NGAYNOP, BC.NOIDUNG, BC.CHITIET, BC.IMG, BC.EDIT\n"
                + "FROM dbo.NHANVIEN AS NV\n"
                + "INNER JOIN dbo.CONGVIEC AS CV ON NV.MANV = CV.MANV\n"
                + "INNER JOIN dbo.BAOCAO AS BC ON CV.ID = BC.IDCV\n"
                + "INNER JOIN dbo.PHONGBAN AS PB ON NV.MAPB=PB.MAPB\n"
                + "WHERE BC.IDCV=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Report r = new Report();
                r.setId(rs.getInt("ID"));
                r.setIdcv(rs.getInt("IDCV"));
                r.setTen(rs.getNString("TEN"));
                r.setTencv(rs.getNString("TEN_CONG_VIEC"));
                r.setTennv(rs.getNString("HO_VA_TEN"));
                r.setTenpb(rs.getNString("TENPB"));
                r.setTime(rs.getDate("NGAYNOP"));
                r.setNoiDung(rs.getNString("NOIDUNG"));
                r.setChiTiet(rs.getNString("CHITIET"));
                r.setImg(rs.getNString("IMG"));
                r.setEdit(rs.getInt("EDIT"));
                return r;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public Report getReportById(int id) {

        String sql = "SELECT BC.ID,BC.IDCV, BC.TEN, CV.TEN_CONG_VIEC, HO_VA_TEN, PB.TENPB, BC.NGAYNOP, BC.NOIDUNG, BC.CHITIET, BC.IMG, BC.EDIT\n"
                + "FROM dbo.NHANVIEN AS NV\n"
                + "INNER JOIN dbo.CONGVIEC AS CV ON NV.MANV = CV.MANV\n"
                + "INNER JOIN dbo.BAOCAO AS BC ON CV.ID = BC.IDCV\n"
                + "INNER JOIN dbo.PHONGBAN AS PB ON NV.MAPB=PB.MAPB\n"
                + "WHERE BC.ID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Report r = new Report();
                r.setId(rs.getInt("ID"));
                r.setIdcv(rs.getInt("IDCV"));
                r.setTen(rs.getNString("TEN"));
                r.setTencv(rs.getNString("TEN_CONG_VIEC"));
                r.setTennv(rs.getNString("HO_VA_TEN"));
                r.setTenpb(rs.getNString("TENPB"));
                r.setTime(rs.getDate("NGAYNOP"));
                r.setNoiDung(rs.getNString("NOIDUNG"));
                r.setChiTiet(rs.getNString("CHITIET"));
                r.setImg(rs.getNString("IMG"));
                r.setEdit(rs.getInt("EDIT"));
                return r;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //them 
    public void insertReport(Report r) {
        String sql = "INSERT INTO dbo.BAOCAO (IDCV, TEN, NGAYNOP, NOIDUNG, CHITIET, IMG, EDIT)\n"
                + "VALUES (?, ?, ?, ?, ?, ?, 0);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, r.getIdcv());
            st.setString(2, r.getTen());
            st.setDate(3, r.getTime());
            st.setString(4, r.getNoiDung());
            st.setString(5, r.getChiTiet());
            st.setString(6, r.getImg());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editReport(Report r) {
        String sql = "UPDATE dbo.BAOCAO\n"
                + "SET TEN = ?, NGAYNOP = ?, NOIDUNG = ?, CHITIET= ?, IMG = ?, EDIT = ?\n"
                + "WHERE ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, r.getTen());
            st.setDate(2, r.getTime());
            st.setString(3, r.getNoiDung());
            st.setString(4, r.getChiTiet());
            st.setString(5, r.getImg());
            st.setInt(6, r.getEdit());
            st.setInt(7, r.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteReport(int id) {
        String sql = "DELETE FROM dbo.BAOCAO\n"
                + "WHERE ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        // Lấy thời gian thực hiện tại
        LocalDateTime currentTime = LocalDateTime.now();

        // Định dạng ngày tháng năm
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        // Chuyển đổi và hiển thị thời gian thực dưới định dạng đã định
        String formattedTime = currentTime.format(formatter);
        System.out.println("Thời gian thực hiện tại: " + formattedTime);

        ReportDAO rDAO = new ReportDAO();
        Report r = rDAO.getReportByMacv(1);
        if (r == null) {
            System.out.println("null");
        } else {
            System.out.println(r.getId());

        }
    }
}
