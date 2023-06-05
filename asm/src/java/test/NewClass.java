/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import DAL.LoginDAO;

/**
 *
 * @author admin
 */
public class NewClass {
    public static void main(String[] args) {
        LoginDAO d = new LoginDAO();
        System.out.println(d.checkLogin("admin", "123").getUser());
    }
}
