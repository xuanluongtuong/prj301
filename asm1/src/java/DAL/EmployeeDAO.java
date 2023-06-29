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
import model.Employee;

/**
 *
 * @author admin
 */
public class EmployeeDAO extends DBContext {

    public List<Employee> getEmListByID(int departID) {
        List<Employee> list = new ArrayList<>();
        String sql = "select MANV, HO_VA_TEN, PHAI, NGAYSINH, DIACHI, SDT, EMAIL, VITRI, TENPB, LUONG, MAQL\n"
                + "  from dbo.PHONGBAN inner join dbo.NHANVIEN \n"
                + "  on dbo.PHONGBAN.MAPB = dbo.NHANVIEN.MAPB where dbo.PHONGBAN.MAPB=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, departID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setMaNV(rs.getInt("MANV"));
                e.setHoVaTen(rs.getString("HO_VA_TEN"));
                e.setGt(rs.getInt("PHAI"));
                e.setNgaySinh(rs.getDate("NGAYSINH"));
                e.setDiaChi(rs.getString("DIACHI"));
                e.setSDT(rs.getString("SDT"));
                e.setEmail(rs.getString("EMAIL"));
                e.setViTri(rs.getString("VITRI"));
                e.setPhongBan(rs.getString("TENPB"));
                e.setLuong(rs.getFloat("LUONG"));
                e.setMaql(rs.getInt("MAQL"));
                list.add(e);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Employee> getlistbypage(List<Employee> list, int start, int end) {
        ArrayList<Employee> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public Employee getEmployeeByID(int manv) {

        try {
            String sql = "select MANV, HO_VA_TEN, PHAI, NGAYSINH, DIACHI, SDT, EMAIL, VITRI, TENPB, LUONG, MAQL \n"
                    + "from dbo.PHONGBAN inner join dbo.NHANVIEN \n"
                    + "on dbo.PHONGBAN.MAPB = dbo.NHANVIEN.MAPB where MANV=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, manv);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Employee em = new Employee();
                em.setMaNV(rs.getInt("MANV"));
                em.setHoVaTen(rs.getString("HO_VA_TEN"));
                em.setGt(rs.getInt("PHAI"));
                em.setNgaySinh(rs.getDate("NGAYSINH"));
                em.setDiaChi(rs.getString("DIACHI"));
                em.setSDT(rs.getString("SDT"));
                em.setEmail(rs.getString("EMAIL"));
                em.setViTri(rs.getString("VITRI"));
                em.setPhongBan(rs.getString("TENPB"));
                em.setLuong(rs.getFloat("LUONG"));
                em.setMaql(rs.getInt("MAQL"));
                return em;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //them 
    public void insertEmployee(Employee em, int mapb) {
        String sql = "INSERT INTO dbo.NHANVIEN (HO_VA_TEN, PHAI, NGAYSINH, DIACHI, SDT, EMAIL, VITRI, MAPB, LUONG)\n"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, em.getHoVaTen());
            st.setInt(2, em.getGt());
            st.setDate(3, em.getNgaySinh());
            st.setString(4, em.getDiaChi());
            st.setString(5, em.getSDT());
            st.setString(6, em.getEmail());
            st.setString(7, em.getViTri());
            st.setInt(8, mapb);
            st.setFloat(9, em.getLuong());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //sua 
    public void editEmployee(Employee em, int mapb) {
        String sql = "UPDATE dbo.NHANVIEN\n"
                + "SET HO_VA_TEN = ?,\n"
                + "    PHAI = ?,\n"
                + "    NGAYSINH = ?,\n"
                + "    DIACHI = ?,\n"
                + "    SDT = ?,\n"
                + "    EMAIL = ?,\n"
                + "    VITRI = ?,\n"
                + "    MAPB = ?,\n"
                + "    LUONG = ?\n"
                + "WHERE MANV = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, em.getHoVaTen());
            st.setInt(2, em.getGt());
            st.setDate(3, em.getNgaySinh());
            st.setString(4, em.getDiaChi());
            st.setString(5, em.getSDT());
            st.setString(6, em.getEmail());
            st.setString(7, em.getViTri());
            st.setInt(8, mapb);
            st.setFloat(9, em.getLuong());
            st.setInt(10, em.getMaNV());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //xoa 
    public void deleteEmployee(int manv) {
        String sql = "delete from dbo.NHANVIEN where MANV=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, manv);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        EmployeeDAO e = new EmployeeDAO();
        List<Employee> list = e.getEmListByID(1);
        Employee em = e.getEmployeeByID(7);
        System.out.println(em.getNgaySinh());
    }
}
