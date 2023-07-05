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

    public void changeDepartmentAndManagerId(int mapb, int manv) {
        String sql1 = "update dbo.NHANVIEN set MAPB=?  where MANV=?";
        String sql2 = "update dbo.PHONGBAN set MAQL=? where MAPB=?";

        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, mapb);
            st1.setInt(2, manv);
            st1.executeUpdate();
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, manv);
            st2.setInt(2, mapb);
            st2.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changeDepartmentID(int newMapb, int maql, int oldMapb, int manv) {
        String sql1 = "update dbo.NHANVIEN set MAPB=? where MANV=?\n"
                
                + "update dbo.NHANVIEN set MAPB=? where MANV=?\n"
                
                + "update dbo.PHONGBAN set MAQL=? where MAPB=?\n"
                ;

        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, newMapb);
            st1.setInt(2, maql);
            st1.setInt(3, oldMapb);
            st1.setInt(4, manv);
            st1.setInt(5, manv);
            st1.setInt(6, oldMapb);
            st1.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changeManagerID(int maql, int mapb) {

        String sql3 = "update dbo.PHONGBAN set MAQL=? where MAPB=?";

        try {
            PreparedStatement st3 = connection.prepareStatement(sql3);
            st3.setInt(1, maql);
            st3.setInt(2, mapb);
            st3.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changePosition(int manv, String pos) {
        String sql = "update dbo.NHANVIEN set VITRI=?  where MANV=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pos);
            st.setInt(2, manv);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getManagerIdByDepartmentId(int mapb) {
        String sql = "select MAQL from dbo.PHONGBAN where MAPB=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mapb);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int i = rs.getInt("MAQL");
                return i;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void changeSalary(int manv, float salary) {
        String sql = "update dbo.NHANVIEN set LUONG=?  where MANV=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setFloat(1, salary);
            st.setInt(2, manv);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void changeDepartment(int manv, int mapb) {
        String sql = "update dbo.NHANVIEN set MAPB=?  where MANV=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setFloat(1, mapb);
            st.setInt(2, manv);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        EmployeeDAO e = new EmployeeDAO();
        List<Employee> list = e.getEmListByID(1);
        Employee em = e.getEmployeeByID(7);
        System.out.println(e.getManagerIdByDepartmentId(10));
    }
}
