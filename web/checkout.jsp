<%-- 
    Document   : checkout
    Created on : Dec 31, 2023, 9:08:02 PM
    Author     : 2021
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="./css/footer214.css">
        <link rel="stylesheet" href="./css/dathang214.css">
    </head>

    <body>
        <jsp:include page="index_bar.jsp"></jsp:include>
        ${alert}
            <form action="add_order" id="checkout_page" method="post" class="main_page">
                <input class="none"  type="text" name="topic" value="setOrder">
                <input class="none"  type="text" name="inforId" value="${informationdat.getId()}">
            <div class="content_checkout">
                <div class="container">
                    <div id="checkout_col_left">

                        <div id="box_thongtin_nhanhhang" class="checkout_block">
                            <div class="title_block_checkout">
                                <div class="left">
                                    <strong>Thông tin nhận hàng</strong>
                                </div>
                                <div class="right">
                                    <a href="editaddress">Thay đổi</a>
                                </div>
                            </div>
                            <div class="content_thongtin">
                                <div class="space_bottom_5">
                                    <span class="status_lienhe">Liên hệ</span>
                                    <strong> ${informationdat.getName()} - ${informationdat.getPhone()}</strong>
                                </div>
                                <div class="text_diachi">${informationdat.getAddresString()}</div>
                            </div>
                            <div id="dienthongtin" class="tao_thongtin">
                            </div>
                        </div>

                        <div id="box_hinhthuc_vanchuyen" class="checkout_block">
                            <div class="title_block_checkout">
                                <div class="left">
                                    <strong>Hình thức vận chuyển</strong>
                                </div>
                            </div>
                            <div class="content_thongtin">
                                <div class="content_relative">
                                    <div>
                                        <input type="radio" name="ship-method" value="NinjaVan" checked="">
                                    </div>
                                    <div>
                                        <span style="color: #fe6700;">
                                            <b>[NinjaVan]</b>
                                            Giao hàng chỉ từ 2 ngày
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="box_phuongthuc_thanhtoan" class="checkout_block">
                            <div class="title_block_checkout">
                                <div class="left">
                                    <strong>Phương thức thanh toán</strong>
                                </div>

                            </div>
                            <div class="content_thongtin">
                                <div class="item_phuongthuc">
                                    <div class="content_relative">
                                        <div class="item_dot_check">
                                            <input type="radio" name="pay-method" value="Thanh toán khi nhận hàng (COD)" checked="">
                                        </div>
                                        <div class="space_bottom_5">
                                            Thanh toán khi nhận hàng (COD)
                                        </div>
                                    </div>
                                </div>
                                <div class="item_phuongthuc">
                                    <div class="content_relative">
                                        <div class="item_dot_check">
                                            <span>
                                                <input type="radio" name="pay-method" value="Thanh toán bằng thẻ quốc tế Visa, Master">
                                            </span>
                                        </div>
                                        <div class="space_bottom_5">
                                            Thanh toán bằng thẻ quốc tế Visa, Master
                                        </div>
                                    </div>
                                </div>
                                <div class="item_phuongthuc">
                                    <div class="content_relative">
                                        <div class="item_dot_check">
                                            <span>
                                                <input type="radio" name="pay-method" value="Thẻ ATM nội địa/InternetBanking">
                                            </span>
                                        </div>
                                        <div class="space_bottom_5">
                                            Thẻ ATM nội địa/InternetBanking
                                        </div>
                                    </div>
                                </div>
                                <div class="item_phuongthuc">
                                    <div class="content_relative">
                                        <div class="item_dot_check">
                                            <span>
                                                <input type="radio" name="pay-method" value="Thanh toán trực tuyến với VNPAY">
                                            </span>
                                        </div>
                                        <div class="space_bottom_5">
                                            Thanh toán trực tuyến với VNPAY
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div id="checkout_col_right">
                        <div class="block_donhang checkout_block">
                            <div class="title_block_checkout">
                                <strong>Đơn hàng</strong>
                                <a href="cart_control">Sửa</a>
                            </div>
                            <div class="list_donhang">
                                <c:forEach items="${order.getProductorder()}" var="p">
                                    <div class="item_list_donhang">
                                        <div class="thumb_donhang">
                                            <img class="img_order" src="${p.getImage()}">
                                        </div>
                                        <div class="info_item_donhang">
                                            <div class="space_bottom_5">
                                                <strong>${p.getBrand()}</strong>
                                            </div>
                                            <div class="title_sanpham_donhang">${p.getName()}</div>
                                            <div class="giathanh">
                                                <div class="left">
                                                    SL x<strong>${p.getQuantity()}</strong>
                                                    <span>${p.getTotalPriceString()} đ</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="item_list_donhang">
                                <div class="item_tamtinh">
                                    <div class="tamtinh_left">
                                        <strong>Tạm tính</strong>
                                    </div>
                                    <div class="tamtinh_right">
                                        <strong>${order.getPriceString()} đ</strong>
                                        <input type="text" name="totalBill" id="totalBill" class="none" value="${order.getPrice()}">
                                    </div>
                                </div>
                                <div class="form_group">
                                    <input class="form_control" type="text" id="useVoucherId" name="useVoucherId"   placeholder="Nhập mã giảm giá đổi quà">
                                    <button onclick="sendVoucherId()" class="chuasudung" type="button">Sử dụng</button>
                                </div>
                                <div class="block_phivanchuyen border_top_checkout">

                                    <div class="item_tamtinh_1">
                                        <strong>Phí vận chuyển</strong>
                                        <span>${order.getShipment().getTransportfeeString()} đ</span>
                                        <input class="none" type="text" name="transportfee" value="${order.getShipment().getTransportfee()}">
                                    </div>
                                    <div class="item_tamtinh_1">

                                        <strong>Giảm giá</strong>
                                        <span>${order.getDiscountString()} đ</span>
                                        <input class="none" type="text" name="discountPrice1" value="${order.getDiscount()}">
                                    </div>

                                </div>
                                <div class="block_total_order border_top_checkout">
                                    <div class="item_tamtinh">
                                        <div class="tamtinh_left left">
                                            Thành tiền
                                        </div>
                                        <div class="tamtinh_right thanhtientong">
                                            ${order.getTotalamountString()} đ
                                            <input class="none" type="text" name="totalAmount1" value="${order.getTotalamount()}">
                                        </div>

                                    </div>
                                    <div class="btn_dathang">
                                        <button type="submit" class="btn_dat">Đặt hàng</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <jsp:include page="footer.jsp"></jsp:include>
    
    <script>
        function closePopup() {
            // Đóng overlay và modal
            document.getElementById("overlay").style.display = "none";
            document.getElementById("modal").style.display = "none";
        }
        
        function sendVoucherId() {
            var form = document.createElement("form");

            // Đặt thuộc tính action và method cho form
            form.action = "checkout";
            form.method = "post";

            // Thêm input vào form
            var inputVoucherId = document.getElementById("useVoucherId");

            var inputTopic = document.createElement("input");
            inputTopic.type = "text";
            inputTopic.name = "topic";
            inputTopic.value = "checkVoucherId";

            var inputTotalBill = document.getElementById("totalBill");

            form.appendChild(inputVoucherId);
            form.appendChild(inputTopic);
            form.appendChild(inputTotalBill);
            // Thêm form vào body
            document.body.appendChild(form);

            // Gửi form
            form.submit();
        }
    </script>
</body>

</html>
