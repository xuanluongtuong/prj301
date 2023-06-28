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
                dp.setDiaDiem(rs.getString("DIADIEM"));
                dp.setMaQL(rs.getInt("MAQL"));                
                list.add(dp);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }    

    public Department getDepartByID(int manv) {
        String sql = "select dbo.PHONGBAN.MAPB, TENPB, DIADIEM, MAQL \n" +
                    " from dbo.PHONGBAN inner join dbo.NHANVIEN \n" +
                    " on dbo.PHONGBAN.MAPB = dbo.NHANVIEN.MAPB where dbo.NHANVIEN.MANV=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, manv);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Department dp = new Department();
                dp.setMaPB(rs.getInt("MAPB"));
                dp.setTenPB(rs.getString("TENPB"));
                dp.setMaQL(rs.getInt("MAQL"));
                dp.setDiaDiem(rs.getString("DIADIEM"));
                return dp;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Employee getManager(int maql){
         try {
            String sql = " select MANV, HO_VA_TEN, PHAI, NGAYSINH, DIACHI, SDT, EMAIL, VITRI, TENPB, LUONG, MAQL \n" +
                        "  from dbo.PHONGBAN inner join dbo.NHANVIEN \n" +
                        "  on dbo.PHONGBAN.MAPB = dbo.NHANVIEN.MAPB where MANV=MAQL and MANV=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, maql);
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

    public static void main(String[] args) {
        DepartmentDAO dp = new DepartmentDAO();
        Department d = dp.getDepartByID(4);
        System.out.println(d.getDiaDiem());
    }
}
