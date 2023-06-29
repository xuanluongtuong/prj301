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
        String sql = "SELECT PB.MAPB, TENPB, TEN_HANG_MUC \n"
                + "FROM dbo.PHONGBAN AS PB\n"
                + "INNER JOIN dbo.PHANCONG AS PC ON PB.MAPB = PC.MAPB\n"
                + "INNER JOIN dbo.DU_AN AS DA ON PC.MADA = DA.MADA WHERE PC.MADA=?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mada);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Assignment a = new Assignment();
                a.setMada(mada);
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

//    public static void main(String[] args) {
//        AssignmentDAO assDAO = new AssignmentDAO();
//        List<Project> pro = assDAO.getPJ_Working_List();
//        System.out.println(pro.get(3).getDiaDiem());
//    }
}
