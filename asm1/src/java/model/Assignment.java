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
public class Assignment {  
    int id;
    int mada;
    int mapb;
    String tenda;
    String tenpb;
    String ten;
    Date start;
    Date end;
    int trangThai;

    public Assignment() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    

    public int getMada() {
        return mada;
    }

    public void setMada(int mada) {
        this.mada = mada;
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

    public void setTenda(String tenda) {
        this.tenda = tenda;
    }

    public String getTenpb() {
        return tenpb;
    }

    public void setTenpb(String tenpb) {
        this.tenpb = tenpb;
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
    
}
