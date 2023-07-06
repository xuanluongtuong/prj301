/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author admin
 */
public class Customer {
    int maKH;
    String tenKH;    
    String DCKH;
    String SDTKH;
    String EmailKH;
    int mada;
    String tenDA;

    public Customer() {
    }

    public int getMaKH() {
        return maKH;
    }

    public void setMaKH(int maKH) {
        this.maKH = maKH;
    }    
    
    public String getTenKH() {
        return tenKH;
    }

    public void setTenKH(String tenKH) {
        this.tenKH = tenKH;
    }
   
    public String getDCKH() {
        return DCKH;
    }

    public void setDCKH(String DCKH) {
        this.DCKH = DCKH;
    }

    public String getSDTKH() {
        return SDTKH;
    }

    public void setSDTKH(String SDTKH) {
        this.SDTKH = SDTKH;
    }

    public String getEmailKH() {
        return EmailKH;
    }

    public void setEmailKH(String EmailKH) {
        this.EmailKH = EmailKH;
    }

    public String getTenDA() {
        return tenDA;
    }

    public void setTenDA(String tenDA) {
        this.tenDA = tenDA;
    }

    public int getMada() {
        return mada;
    }

    public void setMada(int mada) {
        this.mada = mada;
    }    
    
}
