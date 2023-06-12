/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Department;

/**
 *
 * @author admin
 */
public class DepartmentDAO extends DBContext{
    public List<Department> getList() {
        List<Department> list = new ArrayList<>();
        String sql="select * from dbo.PHONGBAN";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
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
}
