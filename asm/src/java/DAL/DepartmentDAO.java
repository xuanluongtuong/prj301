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
import model.Department;
import model.Employee;

/**
 *
 * @author admin
 */
public class DepartmentDAO extends DBContext {

    public List<Department> getList() {
        List<Department> list = new ArrayList<>();
        String sql = "select * from dbo.PHONGBAN";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Department dp = new Department();
                dp.setMaPB(rs.getInt("MAPB"));
                dp.setTenPB(rs.getString("TENPB"));
                dp.setMaQL(rs.getString("MAQL"));
                dp.setDiaDiem(rs.getString("DIADIEM"));
                list.add(dp);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public String getDepartByID(int mapb) {
        String sql = "select * from dbo.PHONGBAN where MAPB = ?";
        String str;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mapb);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                str = rs.getString("TENPB");
                return str;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return "";
    }

    public Employee getManager(int mapb) {

        try {
            String sql = "select * from dbo.NHANVIEN \n"
                    + "	where MANV=MAQL AND MAPB = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mapb);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Employee em = new Employee();
                em.setMaNV(rs.getInt("MANV"));
                em.setHoVaTen(rs.getString("HO_VA_TEN"));
                em.setTen(rs.getString("TEN"));
                em.setGt(rs.getInt("PHAI"));
                em.setNgaySinh(rs.getDate("NGAYSINH"));
                em.setDiaChi(rs.getString("DIACHI"));
                em.setSDT(rs.getString("SDT"));
                em.setEmail(rs.getString("EMAIL"));
                em.setViTri(rs.getString("VITRI"));
                em.setMaQL(rs.getInt("MAQL"));
                em.setPhongBan(rs.getString("PHONGBAN"));
                em.setMaPB(rs.getInt("MAPB"));
                em.setLuong(rs.getFloat("LUONG"));
                return em;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public static void main(String[] args) {
        DepartmentDAO dp = new DepartmentDAO();
        Employee e = dp.getManager(1);
        System.out.println(e.getMaNV());
    }
}
