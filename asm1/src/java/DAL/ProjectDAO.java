/*
 * Click nbfs://nbhost/SystemFileSystem/Tproplates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Tproplates/Classes/Class.java to edit this tproplate
 */
package DAL;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.Project;

/**
 *
 * @author admin
 */
public class ProjectDAO extends DBContext {

    public List<Project> getPJList() {
        List<Project> list = new ArrayList<>();
        String sql = "SELECT dbo.DU_AN.MAKH, TENKH, MADA, TENDA, DIADIEM,NGANSACH, NGAYTHICONG, TRANGTHAI, IMG\n"
                + "FROM dbo.KHACHHANG\n"
                + "INNER JOIN dbo.DU_AN ON dbo.KHACHHANG.MAKH = dbo.DU_AN.MAKH ORDER BY NGAYTHICONG DESC,TRANGTHAI DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Project p = new Project();
                p.setMakh(rs.getInt("MAKH"));
                p.setTenkh(rs.getString("TENKH"));
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

    public List<Project> getlistbypage(List<Project> list, int start, int end) {
        List<Project> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public Project getPJByID(int mada) {

        String sql = "SELECT dbo.DU_AN.MAKH, TENKH, MADA, TENDA, DIADIEM,NGANSACH, NGAYTHICONG, TRANGTHAI, IMG\n"
                + "FROM dbo.KHACHHANG\n"
                + "INNER JOIN dbo.DU_AN ON dbo.KHACHHANG.MAKH = dbo.DU_AN.MAKH where MADA=? ORDER BY NGAYTHICONG DESC,TRANGTHAI DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mada);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Project p = new Project();
                p.setMakh(rs.getInt("MAKH"));
                p.setTenkh(rs.getString("TENKH"));
                p.setMaDA(rs.getInt("MADA"));
                p.setTenDA(rs.getString("TENDA"));
                p.setDiaDiem(rs.getString("DIADIEM"));
                p.setNganSach(rs.getFloat("NGANSACH"));
                p.setNgayThiCong(rs.getDate("NGAYTHICONG"));
                p.setTrangThai(rs.getInt("TRANGTHAI"));
                p.setUrlImg(rs.getString("IMG"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //thpro 
    public void insertProject(Project pro) {
        String sql = "INSERT INTO dbo.DU_AN ( TENDA,MAKH, DIADIEM, NGANSACH, NGAYTHICONG, TRANGTHAI,IMG)VALUES (?, ?, ?, ?, ?, ?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, pro.getTenDA());
            st.setInt(2, pro.getMakh());
            st.setString(3, pro.getDiaDiem());
            st.setFloat(4, pro.getNganSach());
            st.setDate(5, pro.getNgayThiCong());
            st.setInt(6, pro.getTrangThai());
            st.setString(7, pro.getUrlImg());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //sua 
    public void editProject(Project pro) {
        String sql = "UPDATE dbo.DU_AN SET TENDA = ?,MAKH = ?, DIADIEM = ?, NGANSACH = ? , NGAYTHICONG = ?, TRANGTHAI = ?, IMG=? WHERE MADA = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, pro.getTenDA());
            st.setInt(2, pro.getMakh());
            st.setString(3, pro.getDiaDiem());
            st.setFloat(4, pro.getNganSach());
            st.setDate(5, pro.getNgayThiCong());
            st.setInt(6, pro.getTrangThai());
            st.setString(7, pro.getUrlImg());
            st.setInt(8, pro.getMaDA());

            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //xoa 
    public void deleteProject(int mada) {
        String sql = "delete from dbo.DU_AN where MADA=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mada);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Project> getListBySearch(String search) {
        List<Project> list = new ArrayList<>();
        String sql = "SELECT dbo.DU_AN.MAKH, TENKH, MADA, TENDA, DIADIEM,NGANSACH, NGAYTHICONG, TRANGTHAI, IMG\n"
                + "FROM dbo.KHACHHANG\n"
                + "INNER JOIN dbo.DU_AN ON dbo.KHACHHANG.MAKH = dbo.DU_AN.MAKH ORDER BY NGAYTHICONG DESC,TRANGTHAI DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Project p = new Project();
                p.setMakh(rs.getInt("MAKH"));
                p.setTenkh(rs.getString("TENKH"));
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
        if (search.equals("")) {
            return list;
        } else {
            List<Project> list2 = new ArrayList<>();
            for (Project p : list) {
                String newstr = removeAccent(p.getTenDA().toLowerCase());
                String newsearch = removeAccent(search);
                if (newstr.contains(newsearch.toLowerCase()) || String.valueOf(p.getMaDA()).toLowerCase().contains(newsearch.toLowerCase())) {
                    list2.add(p);
                }
            }
            return list2;
        }
    }

    private final char[] SOURCE_CHARACTERS = {'À', 'Á', 'Â', 'Ã', 'È', 'É',
        'Ê', 'Ì', 'Í', 'Ò', 'Ó', 'Ô', 'Õ', 'Ù', 'Ú', 'Ý', 'Ỳ', 'Ỷ', 'Ỹ', 'Ỵ', 'à', 'á', 'â',
        'ã', 'è', 'é', 'ê', 'ì', 'í', 'ò', 'ó', 'ô', 'õ', 'ù', 'ú', 'ý', 'ỳ', 'ỷ', 'ỹ', 'ỵ',
        'Ă', 'ă', 'Đ', 'đ', 'Ĩ', 'ĩ', 'Ũ', 'ũ', 'Ơ', 'ơ', 'Ư', 'ư', 'Ạ',
        'ạ', 'Ả', 'ả', 'Ấ', 'ấ', 'Ầ', 'ầ', 'Ẩ', 'ẩ', 'Ẫ', 'ẫ', 'Ậ', 'ậ',
        'Ắ', 'ắ', 'Ằ', 'ằ', 'Ẳ', 'ẳ', 'Ẵ', 'ẵ', 'Ặ', 'ặ', 'Ẹ', 'ẹ', 'Ẻ',
        'ẻ', 'Ẽ', 'ẽ', 'Ế', 'ế', 'Ề', 'ề', 'Ể', 'ể', 'Ễ', 'ễ', 'Ệ', 'ệ',
        'Ỉ', 'ỉ', 'Ị', 'ị', 'Ọ', 'ọ', 'Ỏ', 'ỏ', 'Ố', 'ố', 'Ồ', 'ồ', 'Ổ',
        'ổ', 'Ỗ', 'ỗ', 'Ộ', 'ộ', 'Ớ', 'ớ', 'Ờ', 'ờ', 'Ở', 'ở', 'Ỡ', 'ỡ',
        'Ợ', 'ợ', 'Ụ', 'ụ', 'Ủ', 'ủ', 'Ứ', 'ứ', 'Ừ', 'ừ', 'Ử', 'ử', 'Ữ',
        'ữ', 'Ự', 'ự',};
    private final char[] DESTINATION_CHARACTERS = {'A', 'A', 'A', 'A', 'E',
        'E', 'E', 'I', 'I', 'O', 'O', 'O', 'O', 'U', 'U', 'Y', 'Y', 'Y', 'Y', 'Y', 'a', 'a',
        'a', 'a', 'e', 'e', 'e', 'i', 'i', 'o', 'o', 'o', 'o', 'u', 'u',
        'y', 'y', 'y', 'y', 'y', 'A', 'a', 'D', 'd', 'I', 'i', 'U', 'u', 'O', 'o', 'U', 'u',
        'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A',
        'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'E', 'e',
        'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E',
        'e', 'I', 'i', 'I', 'i', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o',
        'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O',
        'o', 'O', 'o', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u',
        'U', 'u', 'U', 'u',};

    public char removeAccent(char ch) {
        int index = Arrays.binarySearch(SOURCE_CHARACTERS, ch);
        if (index >= 0) {
            ch = DESTINATION_CHARACTERS[index];
        }
        return ch;
    }

    public String removeAccent(String str) {
        StringBuilder sb = new StringBuilder(str);
        for (int i = 0; i < sb.length(); i++) {
            sb.setCharAt(i, removeAccent(sb.charAt(i)));
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        ProjectDAO project = new ProjectDAO();
        List<Project> list = project.getPJList();
        Project pro = project.getPJByID(7);
        System.out.println(list.get(0).getDiaDiem());
        System.out.println(pro.getDiaDiem());
    }
}
