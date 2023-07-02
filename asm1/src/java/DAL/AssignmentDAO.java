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

    public List<Assignment> getASByMada(int mada) {
        List<Assignment> list = new ArrayList<>();
        String sql = "SELECT PC.ID, PC.MADA, PC.MAPB, TENPB, TEN_HANG_MUC, PC.TRANGTHAI \n"
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
                a.setId(rs.getInt("ID"));
                a.setMada(rs.getInt("MADA"));
                a.setMapb(rs.getInt("MAPB"));
                a.setTenpb(rs.getString("TENPB"));
                a.setTen(rs.getString("TEN_HANG_MUC"));
                a.setTrangThai(rs.getInt("TRANGTHAI"));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Assignment> getASByMapb(int mapb) {
        List<Assignment> list = new ArrayList<>();
        String sql = "SELECT PC.ID, PC.MADA,TENDA, PC.MAPB, TENPB, TEN_HANG_MUC, PC.TRANGTHAI \n"
                + "FROM dbo.PHONGBAN AS PB\n"
                + "INNER JOIN dbo.PHANCONG AS PC ON PB.MAPB = PC.MAPB\n"
                + "INNER JOIN dbo.DU_AN AS DA ON PC.MADA = DA.MADA WHERE PC.MAPB = ? \n"
                + "ORDER BY PC.MADA";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mapb);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Assignment a = new Assignment();
                a.setId(rs.getInt("ID"));
                a.setMada(rs.getInt("MADA"));
                a.setTenda(rs.getString("TENDA"));
                a.setMapb(rs.getInt("MAPB"));
                a.setTenpb(rs.getString("TENPB"));
                a.setTen(rs.getString("TEN_HANG_MUC"));
                a.setTrangThai(rs.getInt("TRANGTHAI"));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertAssignment(Assignment a) {
        String sql = "INSERT INTO dbo.PHANCONG (MADA, MAPB, TEN_HANG_MUC, TRANGTHAI)\n"
                + "VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getMada());
            st.setInt(2, a.getMapb());
            st.setString(3, a.getTen());
            st.setInt(4, a.getTrangThai());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteAssignment(int id) {
        String sql = "DELETE FROM dbo.PHANCONG\n"
                + "WHERE ID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Assignment getASByID(int id) {
        Assignment a = new Assignment();
        String sql = "select * from dbo.PHANCONG where ID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                a.setId(rs.getInt("ID"));
                a.setMada(rs.getInt("MADA"));
                a.setMapb(rs.getInt("MAPB"));
                a.setTen(rs.getString("TEN_HANG_MUC"));
                a.setTrangThai(rs.getInt("TRANGTHAI"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return a;
    }

    //sua 
    public void editAssignment(Assignment a) {
        String sql = "UPDATE dbo.PHANCONG SET MAPB = ?, TEN_HANG_MUC = ?, TRANGTHAI = ? WHERE ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, a.getMapb());
            st.setString(2, a.getTen());
            st.setInt(3, a.getTrangThai());
            st.setInt(4, a.getId());

            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Work> getWorkByIdpcMapb(int idpc, int mapb) {
        List<Work> list = new ArrayList<>();
        String sql = "SELECT CV.ID,CV.IDPC, MADA, PC.MAPB, HO_VA_TEN, CV.MANV, TEN_CONG_VIEC, CV.TRANGTHAI\n"
                + "FROM dbo.PHANCONG AS PC\n"
                + "INNER JOIN dbo.CONGVIEC AS CV ON PC.ID = CV.IDPC\n"
                + "INNER JOIN dbo.NHANVIEN AS NV ON CV.MANV = NV.MANV\n"
                + "WHERE CV.IDPC=? AND PC.MAPB=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, idpc);
            st.setInt(2, mapb);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Work w = new Work();
                w.setId(rs.getInt("ID"));
                w.setIdpc(rs.getInt("IDPC"));
                w.setMada(rs.getInt("MADA"));
                w.setManv(rs.getInt("MAPB"));
                w.setTennv(rs.getString("HO_VA_TEN"));
                w.setTen(rs.getString("TEN_CONG_VIEC"));
                w.setTrangThai(rs.getInt("TRANGTHAI"));
                list.add(w);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Work> getWorkByManv(int manv) {
        List<Work> list = new ArrayList<>();
        String sql = "SELECT CV.ID,CV.IDPC, PC.MADA,TENDA, PC.MAPB, HO_VA_TEN, CV.MANV, TEN_CONG_VIEC, CV.TRANGTHAI\n"
                + "FROM dbo.PHANCONG AS PC\n"
                + "INNER JOIN dbo.CONGVIEC AS CV ON PC.ID = CV.IDPC\n"
                + "INNER JOIN dbo.NHANVIEN AS NV ON CV.MANV = NV.MANV\n"
                + "INNER JOIN dbo.DU_AN AS DA ON PC.MADA = DA.MADA\n"
                + "WHERE CV.MANV=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, manv);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Work w = new Work();
                w.setId(rs.getInt("ID"));
                w.setIdpc(rs.getInt("IDPC"));
                w.setMada(rs.getInt("MADA"));
                w.setTenda(rs.getString("TENDA"));
                w.setManv(rs.getInt("MAPB"));
                w.setTennv(rs.getString("HO_VA_TEN"));
                w.setTen(rs.getString("TEN_CONG_VIEC"));
                w.setTrangThai(rs.getInt("TRANGTHAI"));
                list.add(w);
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
        String sql = "select TEN_CONG_VIEC from dbo.CONGVIEC where MANV=? and TRANGTHAI = 2";

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
                    if (list.isEmpty()) {
                        em.setStatus("Doing no Task");
                    } else {
                        String s = "Doing " + list.size() + " Task";
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

    public void insertWork(Work w) {
        String sql = "INSERT INTO dbo.CONGVIEC (IDPC, MANV, TEN_CONG_VIEC, TRANGTHAI)\n"
                + "VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, w.getIdpc());
            st.setInt(2, w.getManv());
            st.setString(3, w.getTen());
            st.setInt(4, w.getTrangThai());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteWork(int id) {
        String sql = "DELETE FROM dbo.CONGVIEC\n"
                + "WHERE ID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Work getWorkByID(int id) {
        Work w = new Work();
        String sql = "select * from dbo.CONGVIEC where ID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                w.setId(rs.getInt("ID"));
                w.setIdpc(rs.getInt("IDPC"));
                w.setManv(rs.getInt("MANV"));
                w.setTen(rs.getString("TEN_CONG_VIEC"));
                w.setTrangThai(rs.getInt("TRANGTHAI"));
                return w;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //sua 
    public void editWork(Work w) {
        String sql = "UPDATE dbo.CONGVIEC SET MANV = ?, TEN_CONG_VIEC = ?, TRANGTHAI = ? WHERE ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, w.getManv());
            st.setString(2, w.getTen());
            st.setInt(3, w.getTrangThai());
            st.setInt(4, w.getId());
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        AssignmentDAO assDAO = new AssignmentDAO();
//        List<Work> pro = assDAO.getWorkByIdpcMapb(1, 2);
//        System.out.println(pro.get(0).getIdpc());

        List<Assignment> pro = assDAO.getASByMapb(1);
        System.out.println(pro.get(2).getMada());
    }
}
