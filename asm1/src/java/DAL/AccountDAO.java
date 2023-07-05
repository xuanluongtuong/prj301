/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;

/**
 *
 * @author admin
 */
public class AccountDAO extends DBContext {

    public Account checkAccount(String email, String password) {
        String sql = "SELECT * FROM ACCOUNT WHERE email = ? AND password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setAccountID(rs.getInt("accountID"));
                account.setEmail(rs.getString("email"));
                account.setPassword(rs.getString("password"));
                account.setName(rs.getString("username"));
                account.setPhone(rs.getString("phone"));
                account.setRole(rs.getInt("role"));
                return account;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public int getMapbByEmail(String email) {
        String sql = "SELECT p.MAPB\n"
                + "FROM dbo.ACCOUNT AS a\n"
                + "INNER JOIN dbo.NHANVIEN AS n ON a.email = n.EMAIL\n"
                + "INNER JOIN dbo.PHONGBAN AS p ON n.MAPB = p.MAPB\n"
                + "WHERE n.email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int mapb = rs.getInt("MAPB");                
                return mapb;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return 0;
    }
    
    public int getManvByEmail(String email) {
        String sql = "SELECT n.MANV\n"
                + "FROM dbo.ACCOUNT AS a\n"
                + "INNER JOIN dbo.NHANVIEN AS n ON a.email = n.EMAIL\n"
                + "INNER JOIN dbo.PHONGBAN AS p ON n.MAPB = p.MAPB\n"
                + "WHERE n.email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int manv = rs.getInt("MANV");                
                return manv;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return 0;
    }

    public Account getAccountByEmail(String email) {
        String sql = "SELECT * FROM Account WHERE email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setAccountID(rs.getInt("accountID"));
                account.setEmail(rs.getString("email"));
                account.setName(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setPhone(rs.getString("phone"));
                account.setRole(rs.getInt("role"));
                return account;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public Account getAccountByID(int accountID) {
        String sql = "SELECT * FROM Account WHERE accountID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, accountID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setAccountID(rs.getInt("accountID"));
                account.setEmail(rs.getString("email"));
                account.setName(rs.getString("username"));
                account.setPhone(rs.getString("phone"));
                return account;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public int getAccountIDByEmail(String email) {
        String sql = "SELECT accountID FROM ACCOUNT WHERE email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("accountID");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return 0;
    }

    public void createAccount(Account account) {
        String sql = "INSERT INTO ACCOUNT(email, password, username, phone, role) VALUES(?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, account.getEmail());
            ps.setString(2, account.getPassword());
            ps.setString(3, account.getName());
            ps.setString(4, account.getPhone());
            ps.setInt(5, account.getRole());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }
    

    public boolean changePassword(String email, String newPassword) {
        String sql = "UPDATE ACCOUNT SET password = ? WHERE email = ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, email);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public boolean updateInfo(String email, String name, String phone, String address) {
        String sql = "UPDATE ACCOUNT SET username = ?, phone = ? WHERE email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }
    
    public static void main(String[] args) {
        AccountDAO accDAO = new AccountDAO();
        Account a = accDAO.getAccountByEmail("nhandq@gmail.com");
        System.out.println(a.getPassword());
    }
}
