<%-- 
    Document   : card
    Created on : Dec 30, 2023, 3:11:12 PM
    Author     : luong
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/index.css" type="text/css"/>
        <link rel="stylesheet" href="./css/login_logout1.css" type="text/css"/>
        <link rel="stylesheet" href="./css/tracuu1.css" type="text/css"/>
        <link rel="stylesheet" href="./css/cart214.css" type="text/css"/>
    </head>
    <body>
        <jsp:include page="index_bar.jsp"></jsp:include>
            <div class="container"> 

                <div class="cart-container">
                    <h3>Giỏ hàng của bạn</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Hình ảnh</th>
                                <th>Tên sản phẩm</th>
                                <th>Thương hiệu</th>
                                <th>Giá bán gốc</th>
                                <th>Giảm giá</th>
                                <th>Giá bán thực tế</th>
                                <th>Số lượng</th>
                                <th>Xóa</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${cartProducts.getProduct()}" var="p">
                            <tr>
                                <td><img style="width: 100px; height: 100px;" src="${p.getImage()}" alt="alt"/></td>
                                <td>${p.getName()}</td>
                                <td>${p.getBrand()}</td>
                                <td>
                                    ${p.getPrice()}
                                    <div class="product-price" style="display: none;">${p.getTotalPrice()}</div>
                                </td>
                                <td>${p.getDiscount()}</td>
                                <td>${p.getDiscountPrice()}</td>
                                <td>
                                    <div class="quantity-container">

                                        <a class="quantityChange" href="add_product_to_cart?Id=${p.getId()}"><i class="fa-regular fa-circle-up fa-xl"></i></a>

<!--<input class="quantityProductInput" oninput="loadQuantity(this.value, '${p.getId()}')" type="number" id="quantity${p.getId()}" name="quantity" value="${p.getQuantity()}">-->
                                        <input readonly="" class="quantityProductInput" type="text" id="quantity${p.getId()}" name="quantity" value="${p.getQuantity()}">

                                        <a class="quantityChange" href="add_product_to_cart?downId=${p.getId()}"><i class="fa-regular fa-circle-down fa-xl"></i></a>
                                    </div>
                                </td>
                                <td>
                                    <button class="no-outline" onclick="confirmDelete('${p.getId()}')"><i class="fa-regular fa-trash-can fa-xl"></i></button>
                                </td>
                            </tr>
                        </c:forEach>
                    <form action="delete_product_in_cart" method="post" id="formDelete">
                        <input style="display: none" type="text" id="topic" name="topic" value="deleteCardProduct">
                        <!--<input style="display: none" type="text" id="productId" name="productId">-->
                    </form>
                    </tbody>
                </table>
            </div>
            <div class="temp-price-container">
                <strong>Hóa đơn của bạn</strong>
                <hr>
                <div class="temp-price">
                    <strong>Tạm tính:</strong>
                    <div id="total-temp-price">${cartProducts.getTotalpriceString()} đ</div>
                </div>
                <div class="temp-price">
                    <strong>Giảm giá:</strong>
                    <div id="total-discount-price">${cartProducts.getTotaldiscountString()} đ</div>
                </div>
                <hr>
                <div class="temp-price">
                    <strong>Tổng cộng:</strong>
                    <div id="total-price">${cartProducts.getTotalamountString()} đ</div>
                </div>
                <div class="order-btn">
                    <a href="checkout"><button id="">Tiến hành đặt hàng</button></a>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <script>
            function confirmDelete(Id) {
                if (confirm("Xác nhận xóa " + Id + " khỏi giỏ hàng?")) {
                    var form = document.getElementById("formDelete");
                    var input = document.createElement("input");
                    input.type = "text";
                    input.name = "productId";
                    //                var input = document.getElementById("productId");
                    input.value = Id;
                    form.appendChild(input);
                    form.submit();
                }
                loadTempPrice();
            }
            function loadQuantity(quantity, id) {
                var input = document.getElementById("quantity" + id);

                $.ajax({
                    url: "/BaiTapLonLTWEB/add_product_to_cart",
                    type: "post", //send it through get method
                    data: {
                        topic: "UpDownCardProduct",
                        productId: id,
                        quantity: quantity
                    },
                    success: function (data) {
//                        var tmp = document.getElementById("");
                        $('#total-temp-price').html(data);
                        //                    row.innerHTML += data;
//                        input.value = data;
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });
            }
            function loadOn(price) {
                var tempPrice = document.getElementById("total-temp-price");
                tempPrice.innerHTML = price;
            }
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </body>
</html>
