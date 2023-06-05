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
public class LoginDAO extends DBContext{
    public Account checkLogin(String user, String pass){
        
        try {
            String sql="select * from dbo.ACCOUNT where username =? and password =?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,user);            
            st.setString(2, pass);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                Account ac = new Account(rs.getString("username"),rs.getString("password"));                
                return ac;
            }       
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }   
   
}
