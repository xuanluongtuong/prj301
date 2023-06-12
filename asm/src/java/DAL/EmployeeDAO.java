/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Employee;

/**
 *
 * @author admin
 */
public class EmployeeDAO extends DBContext{
    public List<Employee> getList(int departID) {
        List<Employee> list = new ArrayList<>();
        String sql="select * from dbo.NHANVIEN where MAPB=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);            
            st.setInt(1,departID);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Employee nv = new Employee();
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
                nv.setLuong(rs.getFloat("LUONG"));
                list.add(nv);                
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public static void main(String[] args) {
        EmployeeDAO e = new EmployeeDAO();
        List<Employee> list = e.getList(1);
        System.out.println(list.get(0).getHoVaTen());
    }
}
