<%-- 
    Document   : show_product
    Created on : Dec 24, 2023, 5:34:31 PM
    Author     : luong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <jsp:include page="admin_bar.jsp"></jsp:include>
        <div class="admin-content">
            <h1>Danh sách sản phẩm</h1>
            <form action="search_product" method="POST">
                <input type="text" name="search">
                <input type="submit" value="Tìm kiếm">
            </form>
            <form action="show_product" method="POST">
                <div class="form-group">
                    <label for="description">Danh mục</label>
                    <select class="form-control" name="category" id="category" >
                        <option style="width: 100%" value="ACNE">Hỗ trợ trị mụn</option>
                        <option style="width: 100%" value="CSPN">Chăm sóc phụ nữ</option>
                        <option style="width: 100%" value="CSRM">Chăm sóc răng miệng</option>
                        <option style="width: 100%" value="DGX">Dầu gội và dầu xả</option>
                        <option style="width: 100%" value="dt">Dưỡng thể</option>
                        <option style="width: 100%" value="KCN">Chống nắng da mặt</option>
                        <option style="width: 100%" value="KM">Khử mùi</option>
                        <option style="width: 100%" value="MN">Mặt nạ</option>
                        <option style="width: 100%" value="NH">Nước hoa</option>
                        <option style="width: 100%" value="SERUM">Serum / Dầu dưỡng tóc</option>
                        <option style="width: 100%" value="SRM">Sữa rửa mặt</option>
                        <option style="width: 100%" value="ST">Sữa tắm</option>
                        <option style="width: 100%" value="TDC">Tẩy tế bào chết body</option>
                        <option style="width: 100%" value="TDM">Trang điểm môi</option>
                        <option style="width: 100%" value="TDMAT">Trang điểm mặt</option>
                        <option style="width: 100%" value="TDMT">Trang điểm mắt</option>
                        <option style="width: 100%" value="TONER">Toner / nước cân bằng da</option>
                        <option style="width: 100%" value="TPCN">Thực phẩm chức năng</option>
                        <option style="width: 100%" value="TTM">Tẩy trang mặt</option>
                    </select>
                </div>
                <button type="submit">Lọc</button>
            </form>
            <button onclick="window.location = 'show_product'">Tất cả</button>
            <table>
                <thead>
                    <tr>
                        <th>Hình ảnh</th>
                        <th>ID</th>
                        <th>Tên sản phẩm</th>
                        <th>Đơn vị</th>
                        <th>Thương hiệu</th>
                        <th>Giá bán gốc</th>
                        <th>Giảm giá</th>
                        <th>Giá bán thực tế</th>
                        <th>Danh mục</th>
                        <th>Xóa</th>
                        <th>Sửa</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${AllProducts}" var="p">
                        <tr>
                            <td><img style="width: 100px; height: 100px;" src="${p.getImage()}" alt="alt"/></td>
                            <td>${p.getId()}</td>
                            <td>${p.getName()}</td>
                            <td>${p.getUnit()}</td>
                            <td>${p.getBrand()}</td>
                            <td>${p.getPrice()}</td>
                            <td>${p.getDiscount()}</td>
                            <td>${p.getDiscountPrice()}</td>
                            <td>${p.getCategory().getName()}</td>
                            <td>
                                <button onclick="confirmDelete('${p.getId()}')">Delete</button>
                            </td>
                            <td>
                                <button onclick="confirmUpdate('${p.getId()}')">Update</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
    <script>
        function confirmDelete(Id) {
            if (confirm("Xác nhận xóa sản phẩm" + Id)) {
                window.location = "delete_product?Id=" + Id;
            }
        }
        function confirmUpdate(Id) {
            if (confirm("Xác nhận sửa thông tin của sản phẩm " + Id)) {
                window.location = "edit_product?Id=" + Id;
            }
        }
    </script>
</html>
