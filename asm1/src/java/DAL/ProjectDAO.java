/*
 * Click nbfs://nbhost/SystemFileSystem/Tproplates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Tproplates/Classes/Class.java to edit this tproplate
 */
package DAL;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Project;
import model.Project;

/**
 *
 * @author admin
 */
public class ProjectDAO extends DBContext {

    public List<Project> getPJList() {
        List<Project> list = new ArrayList<>();
        String sql = "select * from dbo.DU_AN ORDER BY NGAYTHICONG DESC,TRANGTHAI DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Project p = new Project();
                p.setTenKH(rs.getString("TENKH"));
                p.setMaDA(rs.getInt("MADA"));
                p.setTenDA(rs.getString("TENDA"));
                p.setDiaDiem(rs.getString("DIADIEM"));
                p.setNganSach(rs.getFloat("NGANSACH"));
                p.setNgayThiCong(rs.getDate("NGAYTHICONG"));
                p.setTrangThai(rs.getInt("TRANGTHAI"));
                p.setUrlImg(rs.getString("IMG"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Project> getlistbypage(List<Project> list, int start, int end) {
        List<Project> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public Project getPJByID(int mada) {

        String sql = "select * from dbo.DU_AN where MADA=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mada);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Project p = new Project();
                p.setTenKH(rs.getString("TENKH"));
                p.setMaDA(rs.getInt("MADA"));
                p.setTenDA(rs.getString("TENDA"));
                p.setDiaDiem(rs.getString("DIADIEM"));
                p.setNganSach(rs.getFloat("NGANSACH"));
                p.setNgayThiCong(rs.getDate("NGAYTHICONG"));
                p.setTrangThai(rs.getInt("TRANGTHAI"));
                p.setUrlImg(rs.getString("IMG"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //thpro 
    public void insertProject(Project pro) {
        String sql = "INSERT INTO dbo.DU_AN (TENKH, TENDA, DIADIEM, NGANSACH, NGAYTHICONG, TRANGTHAI,IMG)VALUES (?, ?, ?, ?, ?, ?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pro.getTenKH());
            st.setString(2, pro.getTenDA());
            st.setString(3, pro.getDiaDiem());
            st.setFloat(4, pro.getNganSach());
            st.setDate(5, pro.getNgayThiCong());
            st.setInt(6, pro.getTrangThai());
            st.setString(7, pro.getUrlImg());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //sua 
    public void editProject(Project pro) {
        String sql = "UPDATE dbo.DU_AN SET TENKH = ?, TENDA = ?, DIADIEM = ?, NGANSACH = ? , NGAYTHICONG = ?, TRANGTHAI = ?, IMG=? WHERE MADA = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pro.getTenKH());
            st.setString(2, pro.getTenDA());
            st.setString(3, pro.getDiaDiem());
            st.setFloat(4, pro.getNganSach());
            st.setDate(5, pro.getNgayThiCong());
            st.setInt(6, pro.getTrangThai());
            st.setString(7, pro.getUrlImg());
            st.setInt(8, pro.getMaDA());

            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //xoa 
    public void deleteProject(int mada) {
        String sql = "delete from dbo.DU_AN where MADA=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mada);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

//    public static void main(String[] args) {
//        ProjectDAO project = new ProjectDAO();
//        
//        Project pro = project.getProjectByID(7);
//        System.out.println(pro.getNgaySinh());
//    }
}
