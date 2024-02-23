<%-- 
    Document   : confirmorder
    Created on : Jan 3, 2024, 12:55:40 AM
    Author     : 2021
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="css/tracuu2.css">
        <link rel="stylesheet" href="css/footer214.css">
        <link rel="stylesheet" href="css/tracuu1.css">
        <link rel="stylesheet" href="css/chitiet.css">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="admin_bar.jsp"></jsp:include>
            <div id="block_chitietdonhang" style="margin-top: 50px; margin-right:100px">
                <div class="block_fillter_donhang">
                    <div class="text_fillter_donhang">
                        <strong>Mua online</strong>
                    </div>
                    <div class="tab_sub_fillter_donhang">
                        <a class="item_sub_filler " data-filter="all" >Tất cả</a>
                        <a class="item_sub_filler active"  data-filter="moidat">chờ xác nhận</a>
                        <a class="item_sub_filler"  data-filter="dangxuly">Đang xử lý</a>
                        <a class="item_sub_filler"  data-filter="thanhcong">Thành công</a>
                        <a  class="item_sub_filler"  data-filter="dahuy">Đã hủy</a>
                    </div>
                </div>

                <div id="filter_data" data-item="moidat">
                <c:forEach items="${requestScope.listorderconfirm}" var="o">
                    <c:set var="idorder" value="${o.getId()}"/>


                    <div class="container_detail">
                        <h1>Chi tiết đơn hàng</h1>
                        <div class="item_donhang_content">
                            <div class="orderid_col">
                                <div class="space_bottom_5">
                                    Đơn hàng
                                    <strong>${o.getId()}</strong>
                                </div>
                                <div class="space_bottom_10">
                                    Ngày đặt: ${o.getDateString()}
                                </div>
                                <div class="block_status_donhang">
                                    <span class="item_status_donhang space_bottom_5">${o.getStatusString()}</span>
                                </div>

                            </div>
                            <div class="infomation_col">
                                <div class="space_bottom_5">
                                    <strong> Địa chỉ nhận hàng</strong>
                                </div>
                                <div class="info_name">${o.getShipment().getInformation().getName()}</div>
                                <div class="info_name info_phone">Điện thoại: ${o.getShipment().getInformation().getPhone()} </div>
                                <div class="info_address">Địa chỉ :${o.getShipment().getInformation().getAddresString()}</div>

                            </div>
                            <div class="shipment_col">
                                <div class="space_bottom_5">
                                    <strong>Phương thức thanh toán</strong>
                                    <br>
                                    <span>  ${o.getPayment().getFormpayment()}</span>
                                </div>
                                <div class="space_bottom_5">
                                    <strong>Thông tin vận chuyển</strong>
                                    <br>
                                    <a href=""> ${o.getShipment().getType()} : ${o.getShipment().getId()} : ${o.getPayment().getDatePaymentString()}   </a>
                                </div>

                            </div>

                        </div>
                        <div class="block_detail_order_info">
                            <table class="tb_chitiet_donhang" cellpadding="0" cellspacing="0" width="100%">
                                <tbody>
                                    <tr class="tb_header">
                                        <td class="col_sanpham">Sản phẩm</td>
                                        <td class="col_dongia">Đơn giá</td>
                                        <td class="col_soluong">Số lượng</td>
                                        <td class="col_tamtinh">Thành tiền</td>

                                    </tr>
                                    <c:forEach items="${o.getProductorder()}" var="p">
                                        <tr class="product_order">

                                            <td>
                                                <div class="product_order_detail">
                                                    <div class="main_image_shopping">
                                                        <img class="img_order" src="${p.getImage()}">

                                                    </div>
                                                    <div class="product_info_order">

                                                        <strong>${p.getBrand()}</strong>
                                                        <h2 class="text_info_item">${p.getName()}</h2>
                                                        <div class="txt"><b>Dung tích:</b> ${p.getUnit()}</div>


                                                    </div>


                                                </div>
                                            </td>
                                            <td>${p.getPriceString()}đ</td>
                                            <td  class="text_right">${p.getQuantity()}</td>
                                            <td  class="text_right">${p.getTotalpriceString()}đ</td>



                                        </tr>
                                    </c:forEach>
                                    <tr class="tfooter">
                                        <td colspan="3">
                                            <div class="text_right">
                                                <div class="space_bottom_10">Tạm tính</div>
                                                <div class="space_bottom_10">Phí vận chuyển</div>
                                                <div class="space_bottom_10">Giảm giá</div>


                                                <div>
                                                    <strong> Thành tiền</strong>

                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="text_right">
                                                <div class="space_bottom_10">
                                                    <strong class="text_tb">${o.getPriceString()}đ</strong>
                                                </div>
                                                <div class="space_bottom_10">
                                                    <strong class="text_tb">${o.getShipment().getTransportfeeString()}đ</strong>
                                                </div>
                                                <div class="space_bottom_10">
                                                    <strong class="text_tb">${o.getDiscountString()}đ</strong>
                                                </div>
                                                <div class="text_thanhtien">
                                                    <strong>${o.getTotalamountString()}đ</strong>
                                                </div>


                                            </div>

                                        </td>

                                    </tr>
                                </tbody>

                            </table>
                        </div>
                        <div class="text_center_back">
                            <a class="text_back">
                                <i class="fa-solid fa-circle-left"></i>
                                <span class="text_back" style="cursor: pointer">Xác nhận</span>
                            </a> &nbsp; &nbsp;
                            <a  href="confirm?idc=${idorder}"  >
                                <label class="text_danhgia" style="cursor: pointer">Duyệt đơn hàng</label>

                            </a>
                        </div>
                    </div>
                </c:forEach>






            </div>

           

        </div>




        <script>

            const filter_check = document.querySelectorAll('.tab_sub_fillter_donhang .item_sub_filler');
            const filter_data = document.querySelectorAll('#filter_data');

            Array.from(filter_check).forEach(function (element) {

                element.addEventListener('click', function (event) {
                    for (let i = 0; i < filter_check.length; i++)
                    {
                        filter_check[i].classList.remove('active');
                    }

                    this.classList.add('active');
                    console.log('--------------------');
                    let name_filter = element.dataset.filter;

                    Array.from(filter_data).forEach(function (ele) {


                        console.log(ele.dataset.item);
                        if (ele.dataset.item === name_filter || name_filter === 'all')
                        {
                            ele.style.display = 'block';
                        } else {
                            ele.style.display = 'none';
                        }

                    });

                });



            });
        </script>
       






    </body>
</html>
