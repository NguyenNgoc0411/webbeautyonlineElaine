<%-- 
    Document   : edit_product
    Created on : Dec 23, 2023, 9:45:55 PM
    Author     : luong
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/edit_product.css"/>
    </head>
    <body>
        <jsp:include page="admin_bar.jsp"></jsp:include>
        <div class="admin-content">
            <form action="edit_product" method="POST" enctype="multipart/form-data">
                <h1>Sửa thông tin sản phẩm</h1>
                <div class="form-group">
                    <label for="id">Mã sản phẩm</label>
                    <input type="text" class="form-control" id="id" name="id" value="${product.getId()}">
                </div>
                <div class="form-group">
                    <label for="name">Tên sản phẩm</label>
                    <input type="text" class="form-control" id="name" name="name" value="${product.getName()}">
                </div>
                <div class="form-group">
                    <label for="unit">Đơn vị</label>
                    <input type="text" class="form-control" id="unit" name="unit" value="${product.getUnit()}">
                </div>
                <div class="form-group">
                    <label for="brand">Thương hiệu</label>
                    <input type="text" class="form-control" id="brand" name="brand" value="${product.getBrand()}">
                </div>
                <div class="form-group">
                    <label for="discount">Giảm giá</label>
                    <input type="text" class="form-control" id="discount" name="discount" value="${product.getDiscount()}">
                </div>
                <div class="form-group">
                    <label for="price">Giá bán</label>
                    <input type="text" class="form-control" id="price" name="price" value="${product.getPriceDouble()}">
                </div>
                <div class="form-group">
                    <label for="image">Hình ảnh chính</label>
                    <input type="file" class="form-control-file" id="image" name="image">
                    <input class="none" type="text" class="form-control" name="oldImagePath" value="${product.getImage()}">
                </div>
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

                <div class="form-group">
                    <label for="image">Hình ảnh chi tiết</label>
                    <input type="file" id="imageInput" name="images" multiple accept="image/*">
                </div>
                <div class="form-group">
                    <label for="image">Kích thước</label>
                    <input type="text" class="form-control-file" id="size" name="size" value="${product.getSize()}">
                </div>
                <div class="form-group">
                    <label for="image">Mô tả</label>
                    <input type="text" class="form-control-file" id="description" name="description" value="${product.getDescription()}">
                </div>
                <div class="form-group">
                    <label for="image">Số lượng</label>
                    <input type="text" class="form-control-file" id="quantity" name="quantity" value="${product.getQuantity()}">
                </div>
                <div class="form-group">
                    <label for="image">Loại</label>
                    <input type="text" class="form-control-file" id="typeskin" name="typeskin" value="${product.getTypeskin()}">
                </div>
                <div class="form-group">
                    <label for="image">Xuất xứ</label>
                    <input type="text" class="form-control-file" id="origin" name="origin" value="${product.getOrigin()}">
                </div>
                <div class="form-group">
                    <label for="image">Vấn đề da</label>
                    <input type="text" class="form-control-file" id="problem" name="problem" value="${product.getProblem()}">
                </div>
                <div class="form-group">
                    <label for="image">Thành phần</label>
                    <input type="text" class="form-control-file" id="ingredient" name="ingredient" value="${product.getIngredient()}">
                </div>
                <div class="form-group">
                    <label for="image">Hướng dẫn sử dụng</label>
                    <input type="text" class="form-control-file" id="instruct" name="instruct" value="${product.getInstruct()}">
                </div>
                <div class="form-group">
                    <label for="image">Đặc tính</label>
                    <input type="text" class="form-control-file" id="characteris" name="characteris" value="${product.getCharacteris()}">
                </div>
                <button type="submit" class="btn btn-primary">Xác nhận</button>
            </form>
        </div>
    </body>
</html>
