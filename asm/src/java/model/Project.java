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
public class Project {
    String tenKH;
    int maDA;
    String tenDA;
    String diaDiem;
    float nganSach;    
    Date ngayThiCong;
    int trangThai;
    
    public Project() {
    }

    public String getTenKH() {
        return tenKH;
    }

    public void setTenKH(String tenKH) {
        this.tenKH = tenKH;
    }

    public int getMaDA() {
        return maDA;
    }

    public void setMaDA(int maDA) {
        this.maDA = maDA;
    }

    public String getTenDA() {
        return tenDA;
    }

    public void setTenDA(String tenDA) {
        this.tenDA = tenDA;
    }

    public String getDiaDiem() {
        return diaDiem;
    }

    public void setDiaDiem(String diaDiem) {
        this.diaDiem = diaDiem;
    }

    public float getNganSach() {
        return nganSach;
    }

    public void setNganSach(float nganSach) {
        this.nganSach = nganSach;
    }

    public Date getNgayThiCong() {
        return ngayThiCong;
    }

    public void setNgayThiCong(Date ngayThiCong) {
        this.ngayThiCong = ngayThiCong;
    }

    public int getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(int trangThai) {
        this.trangThai = trangThai;
    }
       
}
