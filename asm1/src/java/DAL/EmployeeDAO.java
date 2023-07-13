/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.Employee;

/**
 *
 * @author admin
 */
public class EmployeeDAO extends DBContext {

    public List<Employee> getEmListByID(int departID) {
        List<Employee> list = new ArrayList<>();
        String sql = "select MANV, HO_VA_TEN, PHAI, NGAYSINH, DIACHI, SDT, EMAIL, VITRI, TENPB, LUONG, MAQL\n"
                + "  from dbo.PHONGBAN inner join dbo.NHANVIEN \n"
                + "  on dbo.PHONGBAN.MAPB = dbo.NHANVIEN.MAPB where dbo.PHONGBAN.MAPB=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, departID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setMaNV(rs.getInt("MANV"));
                e.setHoVaTen(rs.getString("HO_VA_TEN"));
                e.setGt(rs.getInt("PHAI"));
                e.setNgaySinh(rs.getDate("NGAYSINH"));
                e.setDiaChi(rs.getString("DIACHI"));
                e.setSDT(rs.getString("SDT"));
                e.setEmail(rs.getString("EMAIL"));
                e.setViTri(rs.getString("VITRI"));
                e.setPhongBan(rs.getString("TENPB"));
                e.setLuong(rs.getFloat("LUONG"));
                e.setMaql(rs.getInt("MAQL"));
                list.add(e);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Employee> getEmListBySearch(int departID, String search) {
        List<Employee> list = new ArrayList<>();
        String sql = "select MANV, HO_VA_TEN, PHAI, NGAYSINH, DIACHI, SDT, EMAIL, VITRI, TENPB, LUONG, MAQL\n"
                + "  from dbo.PHONGBAN inner join dbo.NHANVIEN \n"
                + "  on dbo.PHONGBAN.MAPB = dbo.NHANVIEN.MAPB where dbo.PHONGBAN.MAPB=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, departID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setMaNV(rs.getInt("MANV"));
                e.setHoVaTen(rs.getString("HO_VA_TEN"));
                e.setGt(rs.getInt("PHAI"));
                e.setNgaySinh(rs.getDate("NGAYSINH"));
                e.setDiaChi(rs.getString("DIACHI"));
                e.setSDT(rs.getString("SDT"));
                e.setEmail(rs.getString("EMAIL"));
                e.setViTri(rs.getString("VITRI"));
                e.setPhongBan(rs.getString("TENPB"));
                e.setLuong(rs.getFloat("LUONG"));
                e.setMaql(rs.getInt("MAQL"));
                list.add(e);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        if (search.equals("")) {
            return list;
        } else {
            List<Employee> list2 = new ArrayList<>();
            for (Employee e : list) {
                String newstr = removeAccent(e.getHoVaTen().toLowerCase());
                String newsearch = removeAccent(search);
                if (newstr.contains(newsearch.toLowerCase()) || String.valueOf(e.getMaNV()).toLowerCase().contains(newsearch.toLowerCase())) {
                    list2.add(e);
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

    public List<Employee> getlistbypage(List<Employee> list, int start, int end) {
        ArrayList<Employee> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public Employee getEmployeeByID(int manv) {

        try {
            String sql = "select MANV, HO_VA_TEN, PHAI, NGAYSINH, DIACHI, SDT, EMAIL, VITRI, TENPB, LUONG, MAQL \n"
                    + "from dbo.PHONGBAN inner join dbo.NHANVIEN \n"
                    + "on dbo.PHONGBAN.MAPB = dbo.NHANVIEN.MAPB where MANV=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, manv);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
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
                return em;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public Employee getEmployeeByEmail(String mail) {

        try {
            String sql = "select MANV, HO_VA_TEN, PHAI, NGAYSINH, DIACHI, SDT, EMAIL, VITRI, TENPB, LUONG, MAQL \n"
                    + "from dbo.PHONGBAN inner join dbo.NHANVIEN \n"
                    + "on dbo.PHONGBAN.MAPB = dbo.NHANVIEN.MAPB where EMAIL=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, mail);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
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
                return em;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //them 
    public void insertEmployee(Employee em, int mapb) {
        String sql = "INSERT INTO dbo.NHANVIEN (HO_VA_TEN, PHAI, NGAYSINH, DIACHI, SDT, EMAIL, VITRI, MAPB, LUONG)\n"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, em.getHoVaTen());
            st.setInt(2, em.getGt());
            st.setDate(3, em.getNgaySinh());
            st.setString(4, em.getDiaChi());
            st.setString(5, em.getSDT());
            st.setString(6, em.getEmail());
            st.setString(7, em.getViTri());
            st.setInt(8, mapb);
            st.setFloat(9, em.getLuong());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //sua 
    public void editEmployee(Employee em, int mapb) {
        String sql = "UPDATE dbo.NHANVIEN\n"
                + "SET HO_VA_TEN = ?,\n"
                + "    PHAI = ?,\n"
                + "    NGAYSINH = ?,\n"
                + "    DIACHI = ?,\n"
                + "    SDT = ?,\n"
                + "    EMAIL = ?,\n"
                + "    VITRI = ?,\n"
                + "    MAPB = ?,\n"
                + "    LUONG = ?\n"
                + "WHERE MANV = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, em.getHoVaTen());
            st.setInt(2, em.getGt());
            st.setDate(3, em.getNgaySinh());
            st.setString(4, em.getDiaChi());
            st.setString(5, em.getSDT());
            st.setString(6, em.getEmail());
            st.setString(7, em.getViTri());
            st.setInt(8, mapb);
            st.setFloat(9, em.getLuong());
            st.setInt(10, em.getMaNV());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //xoa 
    public void deleteEmployee(int manv) {
        String sql = "delete from dbo.NHANVIEN where MANV=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, manv);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changeDepartmentAndManagerId(int mapb, int manv) {
        String sql1 = "update dbo.NHANVIEN set MAPB=?  where MANV=?";
        String sql2 = "update dbo.PHONGBAN set MAQL=? where MAPB=?";

        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, mapb);
            st1.setInt(2, manv);
            st1.executeUpdate();
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, manv);
            st2.setInt(2, mapb);
            st2.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changeDepartmentID(int newMapb, int maql, int oldMapb, int manv) {
        String sql1 = "update dbo.NHANVIEN set MAPB=? where MANV=?\n"
                
                + "update dbo.NHANVIEN set MAPB=? where MANV=?\n"
                
                + "update dbo.PHONGBAN set MAQL=? where MAPB=?\n"
                ;

        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, newMapb);
            st1.setInt(2, maql);
            st1.setInt(3, oldMapb);
            st1.setInt(4, manv);
            st1.setInt(5, manv);
            st1.setInt(6, oldMapb);
            st1.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changeManagerID(int maql, int mapb) {

        String sql3 = "update dbo.PHONGBAN set MAQL=? where MAPB=?";

        try {
            PreparedStatement st3 = connection.prepareStatement(sql3);
            st3.setInt(1, maql);
            st3.setInt(2, mapb);
            st3.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changePosition(int manv, String pos) {
        String sql = "update dbo.NHANVIEN set VITRI=?  where MANV=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pos);
            st.setInt(2, manv);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getManagerIdByDepartmentId(int mapb) {
        String sql = "select MAQL from dbo.PHONGBAN where MAPB=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mapb);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int i = rs.getInt("MAQL");
                return i;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void changeSalary(int manv, float salary) {
        String sql = "update dbo.NHANVIEN set LUONG=?  where MANV=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setFloat(1, salary);
            st.setInt(2, manv);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void changeDepartment(int manv, int mapb) {
        String sql = "update dbo.NHANVIEN set MAPB=?  where MANV=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setFloat(1, mapb);
            st.setInt(2, manv);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void changeRole(int role,String email){
        String sql = "UPDATE ACCOUNT SET role = ? WHERE email = ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);     
            ps.setInt(1, role);
            ps.setString(2, email);
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        
    }

    public static void main(String[] args) {
        EmployeeDAO e = new EmployeeDAO();
        List<Employee> list = e.getEmListByID(1);
        Employee em = e.getEmployeeByID(7);
        System.out.println(e.getManagerIdByDepartmentId(10));
    }
}
