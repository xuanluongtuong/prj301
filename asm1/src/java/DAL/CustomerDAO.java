/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
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
    
    public List<Customer> getCustomerListBySearch(String search) {
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
        if (search.equals("")) {
            return list;
        } else {
            List<Customer> list2 = new ArrayList<>();
            for (Customer c : list) {
                String newstr = removeAccent(c.getTenKH().toLowerCase());
                String newsearch = removeAccent(search);
                if (newstr.contains(newsearch.toLowerCase()) || String.valueOf(c.getMaKH()).toLowerCase().contains(newsearch.toLowerCase())) {
                    list2.add(c);
                }
            }
            return list2;
        }
    }
    
    private final char[] SOURCE_CHARACTERS = {'À', 'Á', 'Â', 'Ã', 'È', 'É',
        'Ê', 'Ì', 'Í', 'Ò', 'Ó', 'Ô', 'Õ', 'Ù', 'Ú', 'Ý', 'Ỳ', 'Ỷ', 'Ỹ', 'Ỵ', 'à', 'á', 'â',
        'ã', 'è', 'é', 'ê', 'ì', 'í', 'ò', 'ó', 'ô', 'õ', 'ù', 'ú', 'ý', 'ỳ', 'ỷ', 'ỹ', 'ỵ',
        'Ă', 'ă', 'Đ', 'đ', 'Ĩ', 'ĩ', 'Ũ', 'ũ', 'Ơ', 'ơ', 'Ư', 'ư', 'Ạ',
        'ạ', 'Ả', 'ả', 'Ấ', 'ấ', 'Ầ', 'ầ', 'Ẩ', 'ẩ', 'Ẫ', 'ẫ', 'Ậ', 'ậ',
        'Ắ', 'ắ', 'Ằ', 'ằ', 'Ẳ', 'ẳ', 'Ẵ', 'ẵ', 'Ặ', 'ặ', 'Ẹ', 'ẹ', 'Ẻ',
        'ẻ', 'Ẽ', 'ẽ', 'Ế', 'ế', 'Ề', 'ề', 'Ể', 'ể', 'Ễ', 'ễ', 'Ệ', 'ệ',
        'Ỉ', 'ỉ', 'Ị', 'ị', 'Ọ', 'ọ', 'Ỏ', 'ỏ', 'Ố', 'ố', 'Ồ', 'ồ', 'Ổ',
        'ổ', 'Ỗ', 'ỗ', 'Ộ', 'ộ', 'Ớ', 'ớ', 'Ờ', 'ờ', 'Ở', 'ở', 'Ỡ', 'ỡ',
        'Ợ', 'ợ', 'Ụ', 'ụ', 'Ủ', 'ủ', 'Ứ', 'ứ', 'Ừ', 'ừ', 'Ử', 'ử', 'Ữ',
        'ữ', 'Ự', 'ự',};
    private final char[] DESTINATION_CHARACTERS = {'A', 'A', 'A', 'A', 'E',
        'E', 'E', 'I', 'I', 'O', 'O', 'O', 'O', 'U', 'U', 'Y', 'Y', 'Y', 'Y', 'Y', 'a', 'a',
        'a', 'a', 'e', 'e', 'e', 'i', 'i', 'o', 'o', 'o', 'o', 'u', 'u',
        'y', 'y', 'y', 'y', 'y', 'A', 'a', 'D', 'd', 'I', 'i', 'U', 'u', 'O', 'o', 'U', 'u',
        'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A',
        'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'E', 'e',
        'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E',
        'e', 'I', 'i', 'I', 'i', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o',
        'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O',
        'o', 'O', 'o', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u',
        'U', 'u', 'U', 'u',};

    public char removeAccent(char ch) {
        int index = Arrays.binarySearch(SOURCE_CHARACTERS, ch);
        if (index >= 0) {
            ch = DESTINATION_CHARACTERS[index];
        }
        return ch;
    }

    public String removeAccent(String str) {
        StringBuilder sb = new StringBuilder(str);
        for (int i = 0; i < sb.length(); i++) {
            sb.setCharAt(i, removeAccent(sb.charAt(i)));
        }
        return sb.toString();
    }
    
    public List<Customer> getlistbypage(List<Customer> list, int start, int end) {
        List<Customer> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
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
        String sql = "UPDATE dbo.KHACHHANG SET TENKH = ?, DCKH = ?, SDTKH = ?, EMAILKH = ? WHERE MAKH = ?";
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
