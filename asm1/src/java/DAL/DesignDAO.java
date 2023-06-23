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
import model.Design;

/**
 *
 * @author admin
 */
public class DesignDAO extends DBContext{
    public List<Design> getDSList() {
        List<Design> list = new ArrayList<>();
        String sql = "select * from dbo.THIETKE";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Design d = new Design();
                d.setId(rs.getInt("MA"));
                d.setName(rs.getNString("TEN"));
                d.setImg(rs.getString("ANH"));
                list.add(d);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Design> getlistbypage(List<Design> list, int start, int end) {
        List<Design> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public Design getDSByID(int ma) {

        String sql = "select * from dbo.THIETKE where MA = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ma);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Design d = new Design();
                d.setId(rs.getInt("MA"));
                d.setName(rs.getString("TEN"));
                d.setImg(rs.getString("ANH"));
                return d;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //thpro 
    public void insertDesign(Design d) {
        String sql = "INSERT INTO dbo.THIETKE (TEN, ANH)VALUES (?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getName());
            st.setString(2, d.getImg());            
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //sua 
    public void editDesign(Design d) {
        String sql = "UPDATE dbo.THIETKE SET TEN = ?, ANH = ? WHERE MA = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getName());
            st.setString(2, d.getImg());
            st.setInt(3, d.getId());            

            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //xoa 
    public void deleteDesign(int ma) {
        String sql = "delete from dbo.THIETKE where MA=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ma);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public static void main(String[] args) {
        DesignDAO d = new DesignDAO();
        Design ds = d.getDSByID(5);
        System.out.println(ds.getId());
        System.out.println(ds.getName());
    }
}
