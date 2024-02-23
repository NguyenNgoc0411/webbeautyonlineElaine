<%-- 
    Document   : admin_add_sale_product
    Created on : Dec 26, 2023, 3:12:41 PM
    Author     : luong
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* CSS cho modal */
            #myModal {
                width: 500px;
                height: 500px;
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 20px;
                background-color: #fff;
                border: 1px solid #ddd;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                z-index: 1000;
            }

            /* CSS cho overlay (phủ màn hình) */
            #overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 999;
            }
        </style>
    </head>
    <body>
        <jsp:include page="admin_bar.jsp"></jsp:include>
            <div class="admin-content">
                <h1>Thêm sản phẩm khuyến mãi</h1>
                <form action="admin_add_sale_product" method="POST">
                    <input type="text" name="search">
                    <input type="submit" value="Tìm kiếm">
                </form>
                <form action="admin_add_sale_product" method="POST">
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
                <button onclick="window.location = 'admin_add_sale_product'">Tất cả</button>
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
                            <th>Chọn</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${AllProducts}" var="p">
                        <tr>
                            <td><img style="width: 150px; height: 150px;" src="${p.getImage()}" alt="alt"/></td>
                            <td>${p.getId()}</td>
                            <td>${p.getName()}</td>
                            <td>${p.getUnit()}</td>
                            <td>${p.getBrand()}</td>
                            <td>${p.getPrice()}</td>
                            <td>${p.getDiscount()}</td>
                            <td>${p.getDiscountPrice()}</td>
                            <td>${p.getCategory().getName()}</td>
                            <td>
                                <button onclick="openModal('${p.getId()}')">Thêm</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <!-- Modal -->
            <div id="myModal">
                <form action="admin_add_sale_product" method="POST" id="addSaleProductForm">
                    <div>
                        <label for="saleProductId">Mã sản phẩm</label>
                        <input type="text" readonly name="saleProductId" id="saleProductId">
                    </div>
                    <div>
                        <label for="hotSale">Sự kiện</label>
                        <select class="form-control" name="hotSale" id="hotSale" >
                            <c:forEach items="${hotSales}" var="p">
                                <option style="width: 100%" value="${p.getId()}">${p.getDescription()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label for="discount">Giảm giá</label>
                        <input type="text" name="discount">
                    </div>
                    <div>
                        <label for="quantity">Số lượng</label>
                        <input type="number" name="quantity">
                    </div>
                    <div>
                        <label for="description">Mô tả</label>
                        <input type="text" name="description">
                    </div>
                    <div>
                        <input type="submit" value="Xác nhận">
                    </div>

                </form>
                <button onclick="closeModal()">Close</button>
            </div>

            <!-- Overlay -->
            <div id="overlay"></div>
        </div>
        <script>
            function openModal(saleProductId) {
                // Hiển thị modal và overlay
                document.getElementById("myModal").style.display = "block";
                document.getElementById("overlay").style.display = "block";

                // Gán giá trị cho trường input
                document.getElementById("saleProductId").value = saleProductId;
            }

            function closeModal() {
                // Đóng modal và overlay
                document.getElementById("myModal").style.display = "none";
                document.getElementById("overlay").style.display = "none";
            }
            
            
        </script>
    </body>
</html>
