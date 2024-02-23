<%-- 
    Document   : admin_bar
    Created on : Dec 25, 2023, 10:15:11 AM
    Author     : luong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            /* Thanh điều khiển */
            .admin-bar {
                position: fixed;
                top: 0;
                left: 0;
                width: 200px;
                height: 100vh;
                /* Chiều cao đầy đủ màn hình */
                background-color: #444;
                /* Màu nền tối */
                color: #fff;
                /* Màu chữ trắng */
                padding: 20px;
                border-right: 1px solid #ccc;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                /* Thêm bóng đổ */
            }

            .admin-bar h1 {
                margin-bottom: 20px;
            }

            .admin-bar ul {
                list-style: none;
                padding: 0;
            }

            .admin-bar li {
                margin-bottom: 10px;
            }

            .admin-bar a {
                color: #fff;
                text-decoration: none;
                display: block;
                /* Hiển thị liên kết thành dạng khối */
                padding: 10px;
            }

            .admin-bar a:hover {
                background-color: #555;
                /* Thay đổi màu nền khi di chuột qua */
            }

            /* Nội dung trang */
            .admin-content {
                margin-left: 220px;
                /* Thêm khoảng cách để tránh đè lên thanh điều khiển */
                padding: 20px;
            }

            .admin-content h1 {
                margin-bottom: 20px;
            }

            /* Chỉnh sửa kiểu chữ và màu sắc */
            body {
                font-family: sans-serif;
                color: #333;
            }
            .dropdown {
                position: relative;
            }

            .dropdown a {
                cursor: pointer;
            }

            .dropdown-menu {
                position: absolute;
                top: 100%;
                left: 0;
                width: 100%;
                background-color: #f1f1f1;
                display: none;
                z-index: 999;
            }

            .dropdown-menu a {
                color: #000;
                text-decoration: none;
                padding: 10px;
            }

            .dropdown-menu a:hover {
                background-color: #ddd;
            }

            .dropdown:hover .dropdown-menu {
                display: block;
            }
        </style>
    </head>
    <body>
        <div class="admin-bar">
            <h1>Admin Bar</h1>
            <ul>
                <li><a href="admin">Trang chủ</a></li>
                <li><a href="home">Quay về</a></li>
                <li><a href="admin_user_control">Quản lý người dùng</a></li>
                <li class="dropdown">
                    <a href="#">Quản lý khuyến mãi</a>
                    <ul class="dropdown-menu">
                        <li><a href="sale_control">Tạo sự kiện</a></li>
                        <li><a href="admin_add_sale_product">Thêm sản phẩm khuyến mãi</a></li>
                        <li><a href="admin_present_sale">Khuyến mãi hiện có</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#">Quản lý sản phẩm</a>
                    <ul class="dropdown-menu">
                        <li><a href="add_product">Thêm sản phẩm</a></li>
                        <li><a href="show_product">Danh sách sản phẩm</a></li>
                    </ul>
                </li>

                <li><a href="#">Quản lý đơn hàng</a></li>
                <li><a href="stat">Thống kê</a></li>
                <li><a href="#">Thông tin cá nhân</a></li>
                <li><a href="#">Đổi mật khẩu</a></li>
                <li><a href="#">Đăng xuất</a></li>
            </ul>
        </div>

    </body>
</html>
