<%-- 
    Document   : admin_product_control
    Created on : Dec 22, 2023, 8:29:19 PM
    Author     : luong
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/add_product0511.css"/>
    </head>
    <body>
        <jsp:include page="admin_bar.jsp"></jsp:include>
        <div class="admin-content">
            <form action="add_product" method="POST" enctype="multipart/form-data">
                <h1>Thêm sản phẩm</h1>
                <div class="form-group">
                    <label for="id">Mã sản phẩm</label>
                    <input type="text" class="form-control" id="id" name="id" required>
                </div>
                <div class="form-group">
                    <label for="name">Tên sản phẩm</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="unit">Đơn vị</label>
                    <input type="text" class="form-control" id="unit" name="unit" required>
                </div>
                <div class="form-group">
                    <label for="brand">Thương hiệu</label>
                    <input type="text" class="form-control" id="brand" name="brand" required>
                </div>
                <div class="form-group">
                    <label for="discount">Giảm giá</label>
                    <input type="text" class="form-control" id="discount" name="discount">
                </div>
                <div class="form-group">
                    <label for="price">Giá bán</label>
                    <input type="text" class="form-control" id="price" name="price">
                </div>
                <div class="form-group">
                    <label for="image">Hình ảnh chính</label>
                    <input type="file" class="form-control-file" id="image" name="image">
                </div>
                <div class="form-group">
                    <label for="description">Danh mục</label>
                    <select class="form-control" name="category" id="category">
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

                <div class="form-group">
                    <label for="image">Hình ảnh chi tiết</label>
                    <input type="file" id="imageInput" name="images" multiple accept="image/*">
                </div>
                <div class="form-group">
                    <label for="image">Kích thước</label>
                    <input type="text" class="form-control-file" id="size" name="size">
                </div>
                <div class="form-group">
                    <label for="image">Mô tả</label>
                    <input type="text" class="form-control-file" id="description" name="description">
                </div>
                <div class="form-group">
                    <label for="image">Số lượng</label>
                    <input type="text" class="form-control-file" id="quantity" name="quantity">
                </div>
                <div class="form-group">
                    <label for="image">Loại</label>
                    <input type="text" class="form-control-file" id="typeskin" name="typeskin">
                </div>
                <div class="form-group">
                    <label for="image">Xuất xứ</label>
                    <input type="text" class="form-control-file" id="origin" name="origin">
                </div>
                <div class="form-group">
                    <label for="image">Vấn đề da</label>
                    <input type="text" class="form-control-file" id="problem" name="problem">
                </div>
                <div class="form-group">
                    <label for="image">Thành phần</label>
                    <input type="text" class="form-control-file" id="ingredient" name="ingredient">
                </div>
                <div class="form-group">
                    <label for="image">Hướng dẫn sử dụng</label>
                    <input type="text" class="form-control-file" id="instruct" name="instruct">
                </div>
                <div class="form-group">
                    <label for="image">Đặc tính</label>
                    <input type="text" class="form-control-file" id="characteris" name="characteris">
                </div>
                <button type="submit" class="btn btn-primary">Thêm</button>
            </form>
            <!--            <div id="content"> </div>
                        <button onclick="loadMore()" class="btn btn-primary">Thêm</button>-->
            <!--<img src="./images/cuong1.JPG" alt="alt"/>-->
        </div>

    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function loadMore() {
//            var amount = document.getElementsByClassName("product").length;
            var hello = "xin chào";
            var tmp = document.getElementById("image");
            var tmp1 = document.getElementById("myfile");
            $.ajax({
                url: "/baiTapLon_LapTrinhWeb/add_product",
                type: "post", //send it through get method
                data: {
                    myfile: tmp1
                },
                success: function (data) {
                    var row = document.getElementById("content");
                    row.innerHTML += data;
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });
        }
    </script> 
</html>
