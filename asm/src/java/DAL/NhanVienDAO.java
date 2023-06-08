/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.NhanVien;

/**
 *
 * @author admin
 */
public class NhanVienDAO extends DBContext{
    public List<NhanVien> getList() {
        List<NhanVien> list = new ArrayList<>();
        String sql="select * from dbo.NHANVIEN";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                NhanVien nv = new NhanVien();
                nv.setMaNV(rs.getString("MANV"));
                nv.setHoVaTen(rs.getString("HO_VA_TEN"));
                nv.setTen(rs.getString("TEN"));
                nv.setGt(rs.getInt("PHAI"));
                nv.setNgaySinh(rs.getDate("NGAYSINH"));
                nv.setDiaChi(rs.getString("DIACHI"));
                nv.setSDT(rs.getString("SDT"));
                nv.setEmail(rs.getString("EMAIL"));
                nv.setViTri(rs.getString("VITRI"));
                nv.setMaQL(rs.getString("MAQL"));
                nv.setPhongBan(rs.getString("PHONGBAN"));
                nv.setMaPB(rs.getInt("MAPB"));
                nv.setLuong(rs.getFloat("LUONG"));
                list.add(nv);                
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
