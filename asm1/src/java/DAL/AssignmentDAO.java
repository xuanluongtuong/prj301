/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Assignment;
import model.Employee;
import model.Project;
import model.Work;

/**
 *
 * @author admin
 */
public class AssignmentDAO extends DBContext {

    public List<Project> getPJ_Working_List() {
        List<Project> list = new ArrayList<>();
        String sql = "select * from dbo.DU_AN where TRANGTHAI=2";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Project p = new Project();
                p.setTenKH(rs.getString("TENKH"));
                p.setMaDA(rs.getInt("MADA"));
                p.setTenDA(rs.getString("TENDA"));
                p.setDiaDiem(rs.getString("DIADIEM"));
                p.setNganSach(rs.getFloat("NGANSACH"));
                p.setNgayThiCong(rs.getDate("NGAYTHICONG"));
                p.setTrangThai(rs.getInt("TRANGTHAI"));
                p.setUrlImg(rs.getString("IMG"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Assignment> getASByID(int mada) {
        List<Assignment> list = new ArrayList<>();
        String sql = "SELECT PC.MADA, PC.MAPB, TENPB, TEN_HANG_MUC \n"
                + "FROM dbo.PHONGBAN AS PB\n"
                + "INNER JOIN dbo.PHANCONG AS PC ON PB.MAPB = PC.MAPB\n"
                + "INNER JOIN dbo.DU_AN AS DA ON PC.MADA = DA.MADA WHERE PC.MADA= ? \n"
                + "ORDER BY PC.MAPB";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mada);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Assignment a = new Assignment();
                a.setMada(mada);
                a.setMada(rs.getInt("MADA"));
                a.setMapb(rs.getInt("MAPB"));
                a.setTenpb(rs.getString("TENPB"));
                a.setTen(rs.getString("TEN_HANG_MUC"));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertAssignment(Assignment a) {
        String sql = "INSERT INTO dbo.PHANCONG (MADA, MAPB, TEN_HANG_MUC)\n"
                + "VALUES (?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getMada());
            st.setInt(2, a.getMapb());
            st.setString(3, a.getTen());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Work> getWorkByID(int mada, int mapb) {
        List<Work> list = new ArrayList<>();
        String sql = "SELECT CV.MADA, TENDA, CV.MANV, HO_VA_TEN, TEN_CONG_VIEC, MAPB\n"
                + "FROM dbo.CONGVIEC AS CV\n"
                + "INNER JOIN dbo.NHANVIEN AS NV ON CV.MANV = NV.MANV\n"
                + "INNER JOIN dbo.DU_AN AS DA ON CV.MADA = DA.MADA\n"
                + "WHERE CV.MADA=? AND MAPB=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mada);
            st.setInt(2, mapb);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Work a = new Work();
                a.setMada(mada);
                a.setMada(rs.getInt("MADA"));
                a.setManv(rs.getInt("MAPB"));
                a.setTennv(rs.getString("HO_VA_TEN"));
                a.setTen(rs.getString("TEN_CONG_VIEC"));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Work> getlistWorkbypage(List<Work> list, int start, int end) {
        List<Work> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<String> checkWork(int id) {
        List<String> list = new ArrayList<>();
        String sql = "select TEN_CONG_VIEC from dbo.CONGVIEC where MANV=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String manv = rs.getString("TEN_CONG_VIEC");
                list.add(manv);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Employee> getEmListByWork(int departID) {
        List<Employee> emList = new ArrayList<>();
        String sql = "select MANV, HO_VA_TEN, PHAI, NGAYSINH, DIACHI, SDT, EMAIL, VITRI, TENPB, LUONG, MAQL\n"
                + "  from dbo.PHONGBAN inner join dbo.NHANVIEN \n"
                + "  on dbo.PHONGBAN.MAPB = dbo.NHANVIEN.MAPB where dbo.PHONGBAN.MAPB=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, departID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee em = new Employee();
                em.setMaNV(rs.getInt("MANV"));
                em.setHoVaTen(rs.getString("HO_VA_TEN"));
                em.setGt(rs.getInt("PHAI"));
                em.setNgaySinh(rs.getDate("NGAYSINH"));
                em.setDiaChi(rs.getString("DIACHI"));
                em.setSDT(rs.getString("SDT"));
                em.setEmail(rs.getString("EMAIL"));
                em.setViTri(rs.getString("VITRI"));
                em.setPhongBan(rs.getString("TENPB"));
                em.setLuong(rs.getFloat("LUONG"));
                em.setMaql(rs.getInt("MAQL"));
                List<String> list = checkWork(em.getMaNV());
                if (list == null) {
                    em.setStatus("Doing no Task");
                } else {
                    if (list.size() == 0) {
                        em.setStatus("Doing no Task");
                    } else {
                        String s = "Doing" + list.size() + "Task";
                        em.setStatus(s);
                    }
                }
                emList.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return emList;
    }

    public void insertWork(Work a) {
        String sql = "INSERT INTO dbo.CONGVIEC ( MADA, MANV, TEN_CONG_VIEC)\n"
                + "VALUES (?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getMada());
            st.setInt(2, a.getManv());
            st.setString(3, a.getTen());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

//    public static void main(String[] args) {
//        AssignmentDAO assDAO = new AssignmentDAO();
//        List<Project> pro = assDAO.getPJ_Working_List();
//        System.out.println(pro.get(3).getDiaDiem());
//    }
}
