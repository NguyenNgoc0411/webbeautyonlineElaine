<%-- 
    Document   : admin_present_sale
    Created on : Dec 25, 2023, 10:57:19 PM
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
            .none {
                display: none;
            }
            .sale-bar {
                display: flex;
                justify-content: space-between;
            }
        </style>
    </head>
    <body>
        <jsp:include page="admin_bar.jsp"></jsp:include>
            <div class="admin-content">
                <h1>Danh sách khuyến mãi </h1>
                <div class="sale-bar">
                    <form action="admin_present_sale" method="POST">
                        <select class="form-control" name="hotSaleId" id="myInput1">
                            <option value="" disabled selected>Select an option</option>
                        <c:forEach items="${hotSales}" var="p">
                            <option value="${p.getId()}">${p.getDescription()}</option>
                        </c:forEach>
                    </select>
                    <input type="submit" value="Submit">
                </form>
                <div>
                    <a href="admin_add_sale_product">Thêm sản phẩm vào sự kiện</a>
                </div>    
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Hình ảnh</th>
                        <th>ID</th>
                        <th>Tên sản phẩm</th>
                        <th>Thương hiệu</th>
                        <th>Giá bán gốc</th>
                        <th>Giảm giá (%)</th>
                        <th>Danh mục</th>
                        <th>Số lượng khuyến mãi</th>
                        <th>Trong kho</th>
                        <th>Xóa</th>
                        <th>Sửa</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${AllProducts}" var="p">
                        <tr>
                            <td><img style="width: 100px; height: 100px;" src="${p.getProduct().getImage()}" alt="alt"/></td>
                            <td>${p.getProduct().getId()}</td>
                            <td>${p.getProduct().getName()}</td>
                            <td>${p.getProduct().getBrand()}</td>
                            <td>${p.getProduct().getPrice()}</td>
                            <td>
                                <input type="text" id="discount${p.getProduct().getId()}" name="discount" value="${p.getProduct().getDiscount()}">
                            </td>
                            <td>${p.getProduct().getCategory().getName()}</td>
                            <td>
                                <input type="number" id="quantity${p.getProduct().getId()}" name="quantity" value="${p.getQuantity()}">
                            </td>

                            <td>${p.getAvailable()}</td>

                            <td>
                                <input class="none" type="text" id="saleProductId${p.getProduct().getId()}" name="saleProductId" value="${p.getProduct().getId()}">
                                <input class="none" type="text" id="hotSaleId${p.getProduct().getId()}" name="hotSaleId" value="${p.getHotsale().getId()}">
                                <button onclick="confirmUpdate('${p.getProduct().getId()}')">Lưu</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
                <form class="none" action="admin_present_sale" method="post" id="formUpdate">
                    <input class="none" type="text" name="topic" value="updateBtn">
                </form>
        </div>

        <script>
            function test() {
                var inputValue = $("#myInput1").val();
                $.ajax({
                    type: "POST",
                    url: "/baiTapLon_LapTrinhWeb/admin_present_sale",
                    data: {data1: inputValue},
                    success: function (response) {
                        // Xử lý phản hồi từ Servlet (nếu cần)
                        console.log(response);
                        alert(response);
                    },
                    error: function (error) {
                        console.error('Error:', error);
                    }
                });
            }
            function confirmDelete(Id) {
                if (confirm("Xác nhận gỡ bỏ sản phẩm" + Id + " khỏi chương trình khuyến mãi")) {
                    var form = document.getElementById("saleProductId");
                    form.submit();
                }

            }
            function confirmUpdate(Id) {
                if (confirm("Xác nhận sửa thông tin của sản phẩm " + Id)) {
                    var form = document.getElementById("formUpdate");
                    var inputDiscount = document.getElementById("discount"+Id);
                    var inputQuantity = document.getElementById("quantity"+Id);
                    var inputSaleProductId = document.getElementById("saleProductId"+Id);
                    var inputHotSaleId = document.getElementById("hotSaleId"+Id);
                    form.appendChild(inputDiscount);
                    form.appendChild(inputQuantity);
                    form.appendChild(inputSaleProductId);
                    form.appendChild(inputHotSaleId);
                    form.submit();
                }
            }
        </script>
    </body>
</html>
