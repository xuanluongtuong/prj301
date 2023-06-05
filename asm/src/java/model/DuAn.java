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
public class DuAn {
    String maDA;
    String tenDA;
    String diaDiem;
    float nganSach;
    float loiNhuan;
    Date ngayThiCong;
    Date ngayKetThuc;
    String theLoai;
    String maKH;

    public DuAn() {
    }

    public DuAn(String maDA, String tenDA, String diaDiem, float nganSach, float loiNhuan, Date ngayThiCong, Date ngayKetThuc, String theLoai, String maKH) {
        this.maDA = maDA;
        this.tenDA = tenDA;
        this.diaDiem = diaDiem;
        this.nganSach = nganSach;
        this.loiNhuan = loiNhuan;
        this.ngayThiCong = ngayThiCong;
        this.ngayKetThuc = ngayKetThuc;
        this.theLoai = theLoai;
        this.maKH = maKH;
    }

    public String getMaDA() {
        return maDA;
    }

    public void setMaDA(String maDA) {
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

    public float getLoiNhuan() {
        return loiNhuan;
    }

    public void setLoiNhuan(float loiNhuan) {
        this.loiNhuan = loiNhuan;
    }

    public Date getNgayThiCong() {
        return ngayThiCong;
    }

    public void setNgayThiCong(Date ngayThiCong) {
        this.ngayThiCong = ngayThiCong;
    }

    public Date getNgayKetThuc() {
        return ngayKetThuc;
    }

    public void setNgayKetThuc(Date ngayKetThuc) {
        this.ngayKetThuc = ngayKetThuc;
    }

    public String getTheLoai() {
        return theLoai;
    }

    public void setTheLoai(String theLoai) {
        this.theLoai = theLoai;
    }

    public String getMaKH() {
        return maKH;
    }

    public void setMaKH(String maKH) {
        this.maKH = maKH;
    }

       
}