/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Account;

/**
 *
 * @author admin
 */
public class SignDAO extends DBContext {

    public Account getAccount(String user) {
        try {
            String sql = "select * from dbo.ACCOUNT where username=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account();
                a.setUser(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                return a;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertAccount(Account a) {
        String sql = "insert into dbo.ACCOUNT (username, password) values (?, ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUser());
            st.setString(2, a.getPassword());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
//    public static void main(String[] args) {
//        SignDAO s = new SignDAO();
//        Account a = s.getAccount("admin");
//        System.out.println(a.getPassword());
//    }
}
