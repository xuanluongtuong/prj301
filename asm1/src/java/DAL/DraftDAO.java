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
import model.Draft;

/**
 *
 * @author admin
 */
public class DraftDAO extends DBContext{
    public List<Draft> getDRList() {
        List<Draft> list = new ArrayList<>();
        String sql = "select * from dbo.BANVE";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Draft d = new Draft();
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

    public List<Draft> getlistbypage(List<Draft> list, int start, int end) {
        List<Draft> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public Draft getDRByID(int ma) {

        String sql = "select * from dbo.BANVE where MA = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ma);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Draft d = new Draft();
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
    public void insertDraft(Draft d) {
        String sql = "INSERT INTO dbo.BANVE (TEN, ANH)VALUES (?, ?)";
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
    public void editDraft(Draft d) {
        String sql = "UPDATE dbo.BANVE SET TEN = ?, ANH = ? WHERE MA = ?";
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
    public void deleteDraft(int ma) {
        String sql = "delete from dbo.BANVE where MA=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ma);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
