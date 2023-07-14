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
public class Work {
    int id;
    int idpc;
    int mada;
    int manv;
    int mapb;
    String tenda;
    String tennv;
    String ten;
    Date start;
    Date end;
    int trangThai;
    int duyet;

    public Work() {
    }    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdpc() {
        return idpc;
    }

    public void setIdpc(int idpc) {
        this.idpc = idpc;
    }
    
    

    public int getMada() {
        return mada;
    }

    public void setMada(int mada) {
        this.mada = mada;
    }

    public int getManv() {
        return manv;
    }

    public void setManv(int manv) {
        this.manv = manv;
    }

    public String getTennv() {
        return tennv;
    }

    public void setTennv(String tennv) {
        this.tennv = tennv;
    }

   

    public void setTenda(String tenda) {
        this.tenda = tenda;
    }

    public int getMapb() {
        return mapb;
    }

    public void setMapb(int mapb) {
        this.mapb = mapb;
    }   

    public String getTenda() {
        return tenda;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public int getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(int trangThai) {
        this.trangThai = trangThai;
    }

    public int getDuyet() {
        return duyet;
    }

    public void setDuyet(int duyet) {
        this.duyet = duyet;
    }
    
}
