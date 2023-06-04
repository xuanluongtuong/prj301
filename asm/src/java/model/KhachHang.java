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
public class KhachHang {
    String maKH;
    String tenKH;
    Date ngaySinh;
    int phai;
    String DCKH;
    String SDTKH;
    String EmailKH;

    public KhachHang() {
    }

    public KhachHang(String maKH, String tenKH, Date ngaySinh, int phai, String DCKH, String SDTKH, String EmailKH) {
        this.maKH = maKH;
        this.tenKH = tenKH;
        this.ngaySinh = ngaySinh;
        this.phai = phai;
        this.DCKH = DCKH;
        this.SDTKH = SDTKH;
        this.EmailKH = EmailKH;
    }

    public String getMaKH() {
        return maKH;
    }

    public void setMaKH(String maKH) {
        this.maKH = maKH;
    }

    public String getTenKH() {
        return tenKH;
    }

    public void setTenKH(String tenKH) {
        this.tenKH = tenKH;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public int getPhai() {
        return phai;
    }

    public void setPhai(int phai) {
        this.phai = phai;
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
    
    
}
