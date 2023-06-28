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
import model.Department;
import model.Employee;

/**
 *
 * @author admin
 */
public class AssignmentDAO extends DBContext {

    public List<Assignment> getAssignList() {
        List<Assignment> list = new ArrayList<>();
        String sql = "SELECT PC.MADA,TENDA,PC.MAPB, TENPB, TEN_HANG_MUC\n"
                + "FROM dbo.PHANCONG AS PC\n"
                + "INNER JOIN dbo.DU_AN AS DA ON DA.MADA = PC.MADA\n"
                + "INNER JOIN dbo.PHONGBAN AS PB ON PB.MAPB = PC.MAPB;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Assignment as = new Assignment();
                as.setMada(rs.getInt("MADA"));
                as.setTenda(rs.getString("TENDA"));
                as.setMapb(rs.getInt("MAPB"));
                as.setTenpb(rs.getString("TENPB"));
                as.setTen(rs.getString("TEN_HANG_MUC"));
                list.add(as);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Assignment> getlistbypage(List<Assignment> list, int start, int end) {
        List<Assignment> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }    
}
