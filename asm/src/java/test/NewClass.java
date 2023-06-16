/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import DAL.*;
import java.util.List;
import model.Project;


/**
 *
 * @author admin
 */
public class NewClass {
    public static void main(String[] args) {
        ProjectDAO d = new ProjectDAO();
        List<Project> list = d.getPJList();
        System.out.println(list.get(0).getMaDA());
    }
}
