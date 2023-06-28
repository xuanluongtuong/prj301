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
public class AssignmentDAO extends DBContext{
    public List<Employee> getEmListByID(int departID) {
        List<Employee> list = new ArrayList<>();
        String sql = "select MANV, HO_VA_TEN, PHAI, NGAYSINH, DIACHI, SDT, EMAIL, VITRI, TENPB, LUONG, MAQL\n" +
                    "  from dbo.PHONGBAN inner join dbo.NHANVIEN \n" +
                    "  on dbo.PHONGBAN.MAPB = dbo.NHANVIEN.MAPB where dbo.PHONGBAN.MAPB=?";
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
}
