/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Assignment;
import model.Project;
import model.Work;

/**
 *
 * @author admin
 */
public class AssignmentDAO extends DBContext {

    public List<Project> getPJ_Working_List() {
        List<Project> list = new ArrayList<>();
        String sql = "select * from dbo.DU_AN where TRANGTHAI=2";
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

    public List<Assignment> getASByID(int mada) {
        List<Assignment> list = new ArrayList<>();
        String sql = "SELECT PC.MADA, PC.MAPB, TENPB, TEN_HANG_MUC \n"
                + "FROM dbo.PHONGBAN AS PB\n"
                + "INNER JOIN dbo.PHANCONG AS PC ON PB.MAPB = PC.MAPB\n"
                + "INNER JOIN dbo.DU_AN AS DA ON PC.MADA = DA.MADA WHERE PC.MADA= ? \n"
                + "ORDER BY PC.MAPB";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mada);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Assignment a = new Assignment();
                a.setMada(mada);
                a.setMada(rs.getInt("MADA"));
                a.setMapb(rs.getInt("MAPB"));
                a.setTenpb(rs.getString("TENPB"));
                a.setTen(rs.getString("TEN_HANG_MUC"));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertAssignment(Assignment a) {
        String sql = "INSERT INTO dbo.PHANCONG (MADA, MAPB, TEN_HANG_MUC)\n"
                + "VALUES (?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getMada());
            st.setInt(2, a.getMapb());
            st.setString(3, a.getTen());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Work> getWorkByID(int mada,int mapb) {
        List<Work> list = new ArrayList<>();
        String sql = "SELECT CV.MADA, TENDA, CV.MANV, HO_VA_TEN, TEN_CONG_VIEC, MAPB\n"
                + "FROM dbo.CONGVIEC AS CV\n"
                + "INNER JOIN dbo.NHANVIEN AS NV ON CV.MANV = NV.MANV\n"
                + "INNER JOIN dbo.DU_AN AS DA ON CV.MADA = DA.MADA\n"
                + "WHERE CV.MADA=? AND MAPB=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mada);
            st.setInt(2, mapb);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Work a = new Work();
                a.setMada(mada);
                a.setMada(rs.getInt("MADA"));
                a.setManv(rs.getInt("MAPB"));
                a.setTennv(rs.getString("HO_VA_TEN"));
                a.setTen(rs.getString("TEN_CONG_VIEC"));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Work> getlistWorkbypage(List<Work> list, int start, int end) {
        List<Work> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
//    public static void main(String[] args) {
//        AssignmentDAO assDAO = new AssignmentDAO();
//        List<Project> pro = assDAO.getPJ_Working_List();
//        System.out.println(pro.get(3).getDiaDiem());
//    }
}
