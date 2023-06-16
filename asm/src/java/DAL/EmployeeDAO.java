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

    public List<Employee> getEmList(int departID) {
        List<Employee> list = new ArrayList<>();
        String sql = "select * from dbo.NHANVIEN where MAPB=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, departID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setMaNV(rs.getInt("MANV"));
                e.setHoVaTen(rs.getString("HO_VA_TEN"));
                e.setTen(rs.getString("TEN"));
                e.setGt(rs.getInt("PHAI"));
                e.setNgaySinh(rs.getDate("NGAYSINH"));
                e.setDiaChi(rs.getString("DIACHI"));
                e.setSDT(rs.getString("SDT"));
                e.setEmail(rs.getString("EMAIL"));
                e.setViTri(rs.getString("VITRI"));
                e.setMaQL(rs.getInt("MAQL"));
                e.setLuong(rs.getFloat("LUONG"));
                list.add(e);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Employee getEmployeeByID(int manv) {

        try {
            String sql = "select * from dbo.NHANVIEN where MANV=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, manv);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Employee em = new Employee();
                em.setMaNV(manv);
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

    //them 
    public void insertEmployee(Employee em) {
        String sql = "insert into NHANVIEN(HO_VA_TEN,TEN,PHAI,NGAYSINH,DIACHI,SDT,EMAIL,VITRI,MAQL,PHONGBAN,MAPB,LUONG) values(?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);            
            st.setString(1, em.getHoVaTen());
            st.setString(2, em.getTen());
            st.setInt(3, em.getGt());
            st.setDate(4, em.getNgaySinh());
            st.setString(5, em.getDiaChi());
            st.setString(6, em.getSDT());
            st.setString(7, em.getEmail());
            st.setString(8, em.getViTri());
            st.setInt(9, em.getMaQL());
            st.setString(10,em.getPhongBan());
            st.setInt(11, em.getMaPB());
            st.setFloat(12, em.getLuong());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //sua 
    public void editEmployee(Employee em) {
        String sql = "UPDATE dbo.NHANVIEN\n" +
                    "SET HO_VA_TEN = ?,\n" +
                    "    TEN = ?,\n" +
                    "    PHAI = ?,\n" +
                    "    NGAYSINH = ?,\n" +
                    "    DIACHI = ?,\n" +
                    "    SDT = ?,\n" +
                    "    EMAIL = ?,\n" +
                    "    VITRI = ?,\n" +
                    "    MAQL = ?,\n" +
                    "    PHONGBAN = ?,\n" +
                    "    MAPB = ?,\n" +
                    "    LUONG = ?\n" +
                    "WHERE MANV = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, em.getHoVaTen());
            st.setString(2, em.getTen());
            st.setInt(3, em.getGt());
            st.setDate(4, em.getNgaySinh());
            st.setString(5, em.getDiaChi());
            st.setString(6, em.getSDT());
            st.setString(7, em.getEmail());
            st.setString(8, em.getViTri());
            st.setInt(9, em.getMaQL());
            st.setString(10, em.getPhongBan());
            st.setInt(11, em.getMaPB());
            st.setFloat(12, em.getLuong());
            st.setInt(13, em.getMaNV());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    //xoa 
    public void deleteEmployee(int manv){
        String sql="delete from dbo.NHANVIEN where MANV=?";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, manv);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

//    public static void main(String[] args) {
//        EmployeeDAO e = new EmployeeDAO();
//        List<Employee> list = e.getEmList(1);
//        Employee em = e.getEmployeeByID(7);
//        System.out.println(em.getNgaySinh());
//    }
}
