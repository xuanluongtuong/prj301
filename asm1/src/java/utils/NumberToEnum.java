/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

/**
 *
 * @author admin
 */
public class NumberToEnum {
    public enum UserRole {
        ADMIN(1), USER(3), MANAGER(2);
 
        private final int value;
 
        private UserRole(int value) {
            this.value = value;
        }
        
        public int getValue() {
            return value;
        }
    }
}
