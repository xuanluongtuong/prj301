<%-- 
    Document   : emList
    Created on : Jun 7, 2023, 11:45:53 PM
    Author     : admin
--%>

<%@page import="model.NhanVien"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Danh Sách Nhân Viên</title>
        <style>
            table{
                min-width: 500px;
                border-collapse: collapse;
            }
            a{
                text-decoration: none;
                color: blue;
            }
        </style>

        <script>
            function doDelete(id) {
                if (confirm("Are you sure to delete student with id = " + id + "?")) {
                    window.location = "delete?id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <%ArrayList<NhanVien> list = (ArrayList<NhanVien>)request.getAttribute("dataNV");
        %>
        <h3> Danh Sách Nhân Viên </h3><br/>

        <table border="1">
            <tr>
                <td>
                    ID
                </td>
                <td>
                    Full name 
                </td>
                <td>
                    Name
                </td>
                <td>
                    Gender
                </td>
                <td>
                    Date of birth
                </td>
                <td>
                    Address
                </td>
                <td>
                    Phone Number
                </td>
                <td>
                    Email address
                </td>
                <td>
                    Position
                </td>
                <td>
                    Manager ID
                </td>
                <td>
                    Department
                </td>
                <td>
                    Department ID 
                </td>
                <td>
                    Salary
                </td>
            </tr>


            <% for (NhanVien nv : list) {
            %>
            <tr>
                <td>
                    <%=nv.getMaNV() %>
                </td> 
                <td>
                    <%=nv.getTen()%>
                </td>
                <td>
                    <%=nv.getHoVaTen()%>
                </td>
                <td>
                    <% if(nv.getGt()==1){
                            out.print("Nam");
                        }
                        else{
                            out.print("Nữ");
                        }
                    %>
                </td>                
                <td>
                    <%=nv.getNgaySinh()%>
                </td>
                <td>
                    <%=nv.getDiaChi()%>
                </td>
                <td>
                    <%=nv.getSDT()%>
                </td>
                <td>
                    <%=nv.getEmail()%>
                </td>
                <td>
                    <%=nv.getViTri()%>
                </td>
                <td>
                    <%=nv.getMaQL()%>
                </td>
                <td>
                    <%=nv.getPhongBan()%>
                </td>
                <td>
                    <%=nv.getMaPB()%>
                </td>
                <td>
                    <%=nv.getLuong()%>
                </td> 
            </tr>
            <%}%>

        </table>        
    </body>
</html>
