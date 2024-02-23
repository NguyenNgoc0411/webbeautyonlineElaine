<%-- 
    Document   : sale_control
    Created on : Dec 25, 2023, 3:06:47 PM
    Author     : luong
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="admin_bar.jsp"></jsp:include>
        <div class="admin-content">
            <h1>Quản lý sản phẩm khuyến mại</h1>
            <div class="container">
                <form action="" method="post">
                    <div> 
                        <label for="start-time">Thời gian bắt đầu:</label>
                        <input type="datetime-local" id="start-time" name="start-time" step="1">
                    </div>
                    <div>
                        <label for="end-time">Thời gian kết thúc:</label>
                        <input type="datetime-local" id="end-time" name="end-time" step="1">
                    </div>
                    <div> 
                        <label for="description">Mô tả sự kiện</label>
                        <input type="text" id="description" name="description">
                    </div>
                    <div>
                        <button onclick="submitTimes()">Xác nhận</button>
                    </div>
                    
                </form>

            </div>

        </div>
    </body>
</html>
