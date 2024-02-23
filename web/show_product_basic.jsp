<%-- 
    Document   : show_product_basic
    Created on : Jan 2, 2024, 10:50:11 PM
    Author     : luong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/show_product_basic.css"/>
    </head>
    <body>
        <jsp:include page="index_bar.jsp"></jsp:include>
            <div class="container">
                <div class="filter-container">
                    <label for="brand-filter">Danh mục:</label>
                    <form action="showProducBasicController" method="post" id="filterByCateId">

                        <input class="none" type="text" name="topic" value="filterByCateId">
                        <select onchange="submitForm()" id="brand-filter" name="cateId">
                            <option disabled="" selected value="">Chọn danh mục</option>
                            <option value="all">Tất cả</option>
                        <c:forEach items="${AllCategories}" var="p">
                            <option value="${p.getId()}">${p.getName()}</option>
                        </c:forEach>
                        <!-- Thêm các thương hiệu khác nếu cần -->
                    </select>
                    <!--<button class="no-outline" id="cateFilterBtn" type="submit"><i class="fa-solid fa-filter"></i></button>-->
                </form>
                <label for="ps-filter">Thương hiệu:</label>
                <form action="showProducBasicController" method="post" id="filterByBrandName">
                    <input class="none" type="text" name="topic" value="filterByBrandName">
                    <select onchange="sendBrandName()" id="ps-filter" name="brandName">
                        <option disabled="" selected value="">Chọn thương hiệu</option>
                        <c:forEach items="${AllBrandNames}" var="p">
                            <option value="${p}">${p}</option>
                        </c:forEach>
                        <!-- Thêm các lựa chọn P/S khác nếu cần -->
                    </select>
                </form>


                <!-- Thêm các lựa chọn cho các danh mục khác theo yêu cầu -->
            </div>

            <div class="content">
                <div class="product-container" id="product-container">
                    <!-- Sản phẩm sẽ được hiển thị ở đây -->
                    <div class="suggest-product" id="suggest-product">
                        <c:forEach items="${AllProducts}" var="p">
                            <div class="product-item product-count">
                                <a href="product_detail?productId=${p.getId()}">
                                    <div class="product-image">
                                        <img src="${p.getImage()}" alt="Product Image">
                                    </div>
                                    <div class="product-details">
                                        <div class="product-price">
                                            <div class="original-price">${p.getPrice()}đ</div>
                                            <div class="discounted-price">${p.getDiscountPrice()}đ</div>
                                        </div>
                                        <div class="product-description">${p.getName()}
                                        </div>
                                        <div class="product-rating">
                                            <span class="stars">★★★★★</span>
                                            <span class="review-count">(${p.getSold()} đánh giá)</span>
                                        </div>
                                        <p class="purchase-count">Đã bán: ${p.getSold()} sản phẩm</p>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
    <script>
        function submitForm() {
            var form = document.getElementById('filterByCateId');
            form.submit();
        }
        function sendBrandName(){
            var form = document.getElementById('filterByBrandName');
            form.submit();
        }
    </script>
</html>
