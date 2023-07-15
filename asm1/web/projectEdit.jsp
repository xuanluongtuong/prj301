<%-- 
    Document   : emList
    Created on : Jun 7, 2023, 11:45:53 PM
    Author     : admin
--%>

<%@page import="model.Project"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.5/flowbite.min.css"  rel="stylesheet" />
        <link rel="stylesheet" href="css/styleadd.css?v=51">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="fontawesome/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>LTX Manager</title>   
        <style>
            .form-group {
                display: grid;
            }
            .form-container {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-bottom: 10px;
            }



            @media (min-width: 900px) {
                .form-container {
                    flex-direction: row;
                }
                .form-left,
                .form-right {
                    align-items: flex-start;
                }
            }
        </style>
    </head>
    <body>

        <%@include file="header.jsp"%>

        <!-- menu -->
        <div class="mymenu">
            <div class="mylist">
                <% Project pro = (Project)request.getAttribute("project");
                %>
                <form action="projectedit" method="post" enctype="multipart/form-data" style="display: inline; justify-content: center;">

                    <div class="form-container">
                        <div class="form-left">
                            <div class="form-group">
                                <label class="form-label" for="MAKH">Customer Name</label>
                                <input class="form-input" type="text" id="MAKH" name="MAKH" value="<%=pro.getMakh()%>" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="TENKH">Customer Name</label>
                                <input class="form-input" type="text" id="TENKH" name="TENKH" value="<%=pro.getTenkh()%>" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="TENDA">Project Name</label>
                                <input class="form-input" type="text" id="TENDA" name="MADA" value="<%=pro.getMaDA()%>" required />
                            </div> 
                            <div class="form-group">
                                <label class="form-label" for="TENDA">Project Name</label>
                                <input class="form-input" type="text" id="TENDA" name="TENDA" value="<%=pro.getTenDA()%>" required />
                            </div>                            

                            <div class="form-group">
                                <label class="form-label" for="DIADIEM">Address</label>
                                <input class="form-input" type="text" id="DIADIEM" name="DIADIEM" value="<%=pro.getDiaDiem()%>" required />
                            </div>

                        </div>

                        <div class="form-right">

                            <div class="form-group">
                                <label class="form-label" for="NGANSACH">Budget(Milions Dong)</label>
                                <input class="form-input" type="number" id="NGANSACH" name="NGANSACH" value="<%=pro.getNganSach()%>" required />
                            </div>

                            <div class="form-group">
                                <label class="form-label" for="NGAYTHICONG">Start Date</label>
                                <input class="form-input" type="date" id="NGAYTHICONG" name="NGAYTHICONG" value="<%=pro.getNgayThiCong()%>" required />
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="TRANGTHAI">Status</label>
                                <select class="form-input" id="TRANGTHAI" name="TRANGTHAI" required>
                                    <option value="2" <%=pro.getTrangThai() == 2 ? "selected" : ""%>>Đang thi công</option>
                                    <option value="1" <%=pro.getTrangThai() == 1 ? "selected" : ""%>>Hoàn thành</option>
                                    <option value="0" <%=pro.getTrangThai() == 0 ? "selected" : ""%>>Đã hủy</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="form-label" >Image</label>
                                <input class="form-input" type="text" name="IMG" value="<%=pro.getUrlImg()%>" required />
                            </div>

                            <!--                            <div class="form-group">   
                            
                                                            <label class="form-label" >Upload new image</label>                                
                                                            <input type="file" name="file" />
                                                        </div>-->
                            <div class="form-button">
                                <button class="btn-submit" type="submit" style="margin: 24px;">Submit</button>
                            </div>
                        </div>                        
                    </div>


                </form>
            </div>
        </div>
        <!-- menu -->

        <%@include file="footer.jsp"%>

    </body>
</html>
