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
import model.*;

/**
 *
 * @author admin
 */
public class CustomerDAO extends DBContext{
    public List<Customer> getCustomerList() {
        List<Customer> list = new ArrayList<>();
        String sql = "select * from dbo.KHACHHANG";
        try {
            PreparedStatement st = connection.prepareStatement(sql);            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setMaKH(rs.getInt("MAKH"));
                c.setTenKH(rs.getString("TENKH"));
                c.setDCKH(rs.getString("DCKH"));
                c.setSDTKH(rs.getString("SDTKH"));
                c.setEmailKH(rs.getString("EMAILKH"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public Customer getCustomerByID(int makh) {

        try {
            String sql = "select * from dbo.KHACHHANG where MAKH=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, makh);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Customer cus = new Customer();                                
                cus.setMaKH(makh);
                cus.setTenKH(rs.getString("TENKH"));                
                cus.setDCKH(rs.getString("DCKH"));                
                cus.setSDTKH(rs.getString("SDTKH"));
                cus.setEmailKH(rs.getString("EMAILKH"));
                return cus;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //thcus 
    public void insertCustomer(Customer cus) {
        String sql = "INSERT INTO dbo.KHACHHANG (TENKH, DCKH, SDTKH, EMAILKH) VALUES (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);            
            st.setString(1, cus.getTenKH());
            st.setString(2, cus.getDCKH());
            st.setString(3, cus.getSDTKH());
            st.setString(4, cus.getEmailKH());            
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //sua 
    public void editCustomer(Customer cus) {
        String sql = "UPDATE dbo.KHACHHANGSET TENKH = ?, DCKH = ?, SDTKH = ?, EMAILKH = ?' WHERE MAKH = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cus.getTenKH());
            st.setString(2, cus.getDCKH());
            st.setString(3, cus.getSDTKH());
            st.setString(4, cus.getEmailKH());
            st.setInt(5, cus.getMaKH());            
            st.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    //xoa 
    public void deleteCustomer(int makh){
        String sql="delete from dbo.KHACHHANG where MAKH=?";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, makh);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
