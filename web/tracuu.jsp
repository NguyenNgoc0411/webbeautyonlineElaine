<%-- 
    Document   : tracuu
    Created on : Dec 23, 2023, 10:08:32 PM
    Author     : 2021
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<%@page import="model.Account" %>
<%@page import="model.Order" %>
<%@page import="java.util.List" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!doctype html>
<html>

    <head>
        <title>Official Signup Form Flat Responsive widget Template :: w3layouts</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords"
              content="Official Signup Form Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

        <!-- fonts -->
        <link href="//fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
        <!-- /fonts -->
        <!-- css -->

        <link href="css/login.css" rel='stylesheet' type='text/css' media="all" />

        <link rel="stylesheet" href="css/tracuu2.css">
        <link rel="stylesheet" href="css/footer214.css">
        <link rel="stylesheet" href="css/tracuu1.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
        <!-- /css -->
        <title>Đơn hàng của tôi</title>
    </head>

    <body>


        <header>
            <!-- <a href=""><i class="fa-solid fa-bars fa-2xl"></i></a> -->
            <a href="home">
                <h1>Elaine Cosmetics</h1>
            </a>
            <form action="search" method="post">
                <div class="search-container">
                    <input type="text" id="txtSearch" name="data-search" placeholder="Tìm kiếm...">
                    <button type="submit" id="btnSearch"><i class="fa-solid fa-magnifying-glass fa-2xl"></i></button>
                </div>
            </form>
            <div>
                <i class="fa-solid fa-phone-volume fa-xl"></i>
                <a href="">Hỗ trợ</a>
            </div>
            <div>
                <i class="fa-solid fa-truck-fast fa-xl"></i>
                <a href="">Tra cứu đơn hàng</a>
            </div>
            <div id="da_login_container">

                <i class="fa-regular fa-circle-user fa-2xl"></i>
                <a href="">Chào ${sessionScope.customer.getName()}</a>
                <div id="client_login" class="da_login">
                    <div class="block_da_login">

                        <div class="item_da_login">
                            <a href="customercontrol">
                                <i class="fa-solid fa-address-book"></i>
                                Tài khoản của bạn

                            </a>
                        </div>
                        <div class="item_da_login">
                            <a href="tracuu">
                                <i class="fa-solid fa-clapperboard"></i>
                                Quản lý đơn hàng

                            </a>
                        </div>
                        <div class="item_da_login">
                            <a href="editaddress">
                                <i class="fa-solid fa-location-dot"></i>
                                Địa chỉ giao hàng

                            </a>
                        </div>
                        <div class="item_da_login" style="cursor: pointer">
                            <a onclick="logout()" >
                                <i class="fa-solid fa-arrow-right-from-bracket"></i>
                                Đăng xuất

                            </a>
                        </div>

                    </div>

                </div>



            </div>
            <div>
                <i class="fa-solid fa-cart-shopping fa-shake fa-xl"></i>
                <a href="cart_control">Giỏ hàng</a>
            </div>
        </header>
        <nav>
            <a href="#">Trang chủ</a>
            <a href="#">Sản phẩm</a>
            <a href="#">Dịch vụ</a>
            <a href="#">Liên hệ</a>
        </nav>


        <div id="my_order_page" class="row">
            <div class="left_order">
                <div class="block_menu_profile width_common">
                    <div class="block_info_profile">
                        <img src="https://hasaki.vn/images/graphics/account-full.svg">
                        <div class="text_profile">
                            <strong>Chào ${sessionScope.customer.getName()}</strong>
                            </br>
                            <a href="">Chỉnh sửa tài khoản</a>
                        </div>
                    </div>
                    <div class="menu_info">
                        <a href="">Quản lý tài khoản</a>
                        <a href="customercontrol">Thông tin tài khoản</a>
                        <a href="tracuu">Đơn hàng của tôi</a>
                        <a href="editaddress">Sổ địa chỉ nhận hàng</a>
                        <a href="">Mua lại</a>
                        <a href="">Hỏi đáp</a>


                    </div>
                </div>
                <div id="block_chitietdonhang">
                    <div class="block_fillter_donhang">
                        <div class="text_fillter_donhang">
                            <strong>Mua online</strong>
                        </div>
                        <div class="tab_sub_fillter_donhang">
                            <a class="item_sub_filler active" data-filter="all" >Tất cả</a>
                            <a class="item_sub_filler"  data-filter="moidat">Mới đặt</a>
                            <a class="item_sub_filler"  data-filter="dangxuly">Đang xử lý</a>
                            <a class="item_sub_filler"  data-filter="thanhcong">Thành công</a>
                            <a  class="item_sub_filler"  data-filter="dahuy">Đã hủy</a>
                        </div>
                    </div>

                    <div id="filter_data" data-item="moidat">
                        <c:forEach items="${requestScope.listorderconfirm}" var="o">
                            <c:set var="idorder" value="${o.getId()}"/>




                            <div class="container_list_order" id="${idorder}">
                                <div class="block_order">


                                    <div class="item_donhang">
                                        <a  href="chitiet?idorder=${idorder}">
                                            <div class="left_item">
                                                Mã đơn hàng 
                                                <span class="txt_color">${idorder}</span>
                                                | Đặt ngày
                                                <span class="txt">${o.getDateString() } </span>

                                                <span class="status_order" style="width: 120px">${o.getStatusString()}</span>
                                                &nbsp; Thanh toán:
                                                <span class="txt">${o.payment.getFormpayment()} &nbsp &nbsp |</span>

                                                &nbsp; Tổng tiền :
                                                <strong class="txt_1">${o.getTotalamountString()}đ</strong>
                                            </div>
                                            <strong class="block_txt_chitiet">Xem chi tiết
                                                <i class="fa-solid fa-circle-right"></i>
                                            </strong>


                                        </a>
                                    </div>
                                    <div class="list_sanpham_order">
                                        <c:forEach items="${o.getProductorder()}" var="p">
                                            <div class="item_order">
                                                <a href="">
                                                    <div class="img_item_order">
                                                        <img class="item_img" src="${p.getImage()}">
                                                    </div>

                                                    <div class="info_item">
                                                        <strong>${p.getBrand()}</strong>
                                                        <h2 class="text_info_item">${p.getName()}</h2>
                                                        <div class="txt"> ${p.getQuantity()}x
                                                            <strong>${p.getPriceString()}đ</strong>
                                                        </div>
                                                    </div>

                                                </a>
                                            </div>

                                        </c:forEach>





                                    </div>
                                    <div class="block_btn_huydon">
                                        <a href="cancel?idcancel=${idorder}" id="btnhuy" class="huyhoacmua btn">Hủy đơn hàng</a>
                                        <a href="" class="danhgia_btn btn">Đánh giá</a>
                                    </div>
                                </div>
                            </div>




                        </c:forEach>
                    </div>

                    <div id="filter_data" data-item="dangxuly">
                        <c:forEach items="${requestScope.listordertransport}" var="o">
                            <c:set var="idorder" value="${o.getId()}"/>




                            <div class="container_list_order" id="${idorder}">
                                <div class="block_order">


                                    <div class="item_donhang">
                                        <a href="chitiet?idorder=${idorder}">
                                            <div class="left_item">
                                                Mã đơn hàng 
                                                <span class="txt_color">${idorder}</span>
                                                | Đặt ngày
                                                <span class="txt">${o.getDateString() } </span>

                                                <span class="status_order" style="width: 120px">${o.getStatusString()}</span>
                                                &nbsp; Thanh toán:
                                                <span class="txt">${o.payment.getFormpayment()} &nbsp &nbsp |</span>

                                                &nbsp; Tổng tiền :
                                                <strong class="txt_1">${o.getTotalamountString()}đ</strong>
                                            </div>
                                            <strong class="block_txt_chitiet">Xem chi tiết
                                                <i class="fa-solid fa-circle-right"></i>
                                            </strong>


                                        </a>
                                    </div>
                                    <div class="list_sanpham_order">
                                        <c:forEach items="${o.getProductorder()}" var="p">
                                            <div class="item_order">
                                                <a href="">
                                                    <div class="img_item_order">
                                                        <img class="item_img" src="${p.getImage()}">
                                                    </div>

                                                    <div class="info_item">
                                                        <strong>${p.getBrand()}</strong>
                                                        <h2 class="text_info_item">${p.getName()}</h2>
                                                        <div class="txt"> ${p.getQuantity()}x
                                                            <strong>${p.getPriceString()}đ</strong>
                                                        </div>
                                                    </div>

                                                </a>
                                            </div>

                                        </c:forEach>





                                    </div>
                                    <div class="block_btn_huydon">
                                        <a href="" id="btnhuy" class="huyhoacmua btn">Xác nhận </a>
                                        <a href="" class="danhgia_btn btn">Đánh giá</a>
                                    </div>
                                </div>
                            </div>




                        </c:forEach>
                    </div>
                    <div id="filter_data" data-item="thanhcong">
                        <c:forEach items="${requestScope.listorder}" var="o">
                            <c:set var="idorder" value="${o.getId()}"/>




                            <div class="container_list_order" id="${idorder}">
                                <div class="block_order">


                                    <div class="item_donhang">
                                        <a href="chitiet?idorder=${idorder}">
                                            <div class="left_item">
                                                Mã đơn hàng 
                                                <span class="txt_color">${idorder}</span>
                                                | Đặt ngày
                                                <span class="txt">${o.getDateString() } </span>

                                                <span class="status_order" style="width: 120px">${o.getStatusString()}</span>
                                                &nbsp; Thanh toán:
                                                <span class="txt">${o.payment.getFormpayment()} &nbsp &nbsp |</span>

                                                &nbsp; Tổng tiền :
                                                <strong class="txt_1">${o.getTotalamountString()}đ</strong>
                                            </div>
                                            <strong class="block_txt_chitiet">Xem chi tiết
                                                <i class="fa-solid fa-circle-right"></i>
                                            </strong>


                                        </a>
                                    </div>
                                    <div class="list_sanpham_order">
                                        <c:forEach items="${o.getProductorder()}" var="p">
                                            <div class="item_order">
                                                <a href="">
                                                    <div class="img_item_order">
                                                        <img class="item_img" src="${p.getImage()}">
                                                    </div>

                                                    <div class="info_item">
                                                        <strong>${p.getBrand()}</strong>
                                                        <h2 class="text_info_item">${p.getName()}</h2>
                                                        <div class="txt"> ${p.getQuantity()}x
                                                            <strong>${p.getPriceString()}đ</strong>
                                                        </div>
                                                    </div>

                                                </a>
                                            </div>

                                        </c:forEach>





                                    </div>
                                    <div class="block_btn_huydon">
                                        <a href="" id="btnhuy" class="huyhoacmua btn">Mua lại</a>
                                        <a href="" class="danhgia_btn btn">Đánh giá</a>
                                    </div>
                                </div>
                            </div>




                        </c:forEach>
                    </div>   
                    <div id="filter_data" data-item="dahuy">
                        <c:forEach items="${requestScope.listordercancel}" var="o">
                            <c:set var="idorder" value="${o.getId()}"/>




                            <div class="container_list_order" id="${idorder}">
                                <div class="block_order">


                                    <div class="item_donhang">
                                        <a  href="chitiet?idorder=${idorder}">
                                            <div class="left_item">
                                                Mã đơn hàng 
                                                <span class="txt_color">${idorder}</span>
                                                | Đặt ngày
                                                <span class="txt">${o.getDateString() } </span>

                                                <span class="status_order" style="width: 120px">${o.getStatusString()}</span>
                                                &nbsp; Thanh toán:
                                                <span class="txt">${o.payment.getFormpayment()} &nbsp &nbsp |</span>

                                                &nbsp; Tổng tiền :
                                                <strong class="txt_1">${o.getTotalamountString()}đ</strong>
                                            </div>
                                            <strong class="block_txt_chitiet">Xem chi tiết
                                                <i class="fa-solid fa-circle-right"></i>
                                            </strong>


                                        </a>
                                    </div>
                                    <div class="list_sanpham_order">
                                        <c:forEach items="${o.getProductorder()}" var="p">
                                            <div class="item_order">
                                                <a href="">
                                                    <div class="img_item_order">
                                                        <img class="item_img" src="${p.getImage()}">
                                                    </div>

                                                    <div class="info_item">
                                                        <strong>${p.getBrand()}</strong>
                                                        <h2 class="text_info_item">${p.getName()}</h2>
                                                        <div class="txt"> ${p.getQuantity()}x
                                                            <strong>${p.getPriceString()}đ</strong>
                                                        </div>
                                                    </div>

                                                </a>
                                            </div>

                                        </c:forEach>





                                    </div>
                                    
                                </div>
                            </div>




                        </c:forEach>
                    </div>

                </div>
            </div>
        </div>
         <footer>
		<div class="slogan">
		  <div class="slogan-container">
			<div class="col1 slogan-colm">
			  <div class="b1 box-slg">
				<div>
				  <img
					src="https://hasaki.vn/v3/images/icons/icon_footer_1.svg"
					alt=""
				  />
				</div>
				<div class="slg text-center">
				  Thanh toán <br />
				  khi nhận hàng
				</div>
			  </div>
			  <div class="b1 box-slg">
				<div>
				  <img
					src="https://hasaki.vn/v3/images/icons/icon_footer_2.svg"
					alt=""
					style="width: 105px; padding: 10px 20px"
				  />
				</div>
				<div class="slg text-center">
				  Giao nhanh <br />
				  miễn phí 2H
				</div>
			  </div>
			  <div class="b1 box-slg">
				<div>
				  <img
					src="https://hasaki.vn/v3/images/icons/icon_footer_3.svg"
					alt=""
				  />
				</div>
				<div class="slg text-center">
				  14 ngày đổi trả <br />
				  miễn phí
				</div>
			  </div>
			  <div class="b1 box-slg">
				<div>
				  <img
					src="https://hasaki.vn/v3/images/icons/icon_footer_4.svg"
					alt=""
				  />
				</div>
				<div class="slg text-center">
				  Thương hiệu uy tín <br />
				  toàn cầu
				</div>
			  </div>
			</div>
			<div class="col2 slogan-colm">
			  <div class="b2 box-slg">
				<div class="bx-hotline text-center">
				  <div class="slg2 text-center">
					<img
					  src="https://hasaki.vn/v3/images/icons/icons_hotline_kn.svg"
					  alt=""
					/>
					KHIẾU NẠI, GÓP Ý
				  </div>
				  <div class="slg2 text-center">
					<a href="" class="btn-slogan">1800 6310</a>
				  </div>
				</div>
			  </div>
			  <div class="b2 box-slg">
				<div class="bx-hotline text-center">
				  <div class="slg2 text-center">
					<img
					  src="https://hasaki.vn/v3/images/icons/icons_hotline_tv.svg"
					  alt=""
					/>
					TƯ VẤN
				  </div>
				  <div class="slg2 text-center">
					<a href="" class="btn-slogan">1800 6324</a>
				  </div>
				</div>
			  </div>
			  <div class="b2 box-slg">
				<div class="bx-hotline text-center">
				  <div class="slg2 text-center">
					<img
					  src="https://hasaki.vn/v3/images/icons/icon_timchinhanh.svg"
					  alt=""
					/>
					TÌM CHI NHÁNH
				  </div>
				  <div class="slg2 text-center">
					<a href="" class="btn-slogan">Hệ Thống</a>
				  </div>
				</div>
			  </div>
			</div>
		  </div>
		</div>
		<div class="footer-wapper">
		  <div class="footer-container">
			<div class="col3 foot-colm">
			  <div class="item-footer">
				<h4>HỖ TRỢ KHÁCH HÀNG</h4>
			  </div>
			  <div class="item-footer">
				<div class="text-color2">
				  <strong> Hotline: 18006324 </strong>
				</div>
				(miễn phí, 08-22h kể cả T7, CN)
			  </div>
			  <div class="item-footer">
				<a href="">Các câu hỏi thường gặp</a>
			  </div>
			  <div class="item-footer">
				<a href="">Gửi yêu cầu hỗ trợ</a>
			  </div>
			  <div class="item-footer">
				<a href="">Hướng dẫn đặt hàng</a>
			  </div>
			  <div class="item-footer">
				<a href="">Phương thức vận chuyển</a>
			  </div>
			  <div class="item-footer">
				<a href="">Chính sách đổi trả</a>
			  </div>
			</div>
			<div class="col4 foot-colm">
			  <div class="item-footer">
				<h4>VỀ ELAINE COSMETICS</h4>
			  </div>
			  <div class="item-footer">
				<a href="">Giới thiệu</a>
			  </div>
			  <div class="item-footer">
				<a href="">Tuyển dụng</a>
			  </div>
			  <div class="item-footer">
				<a href="">Chính sách bảo mật</a>
			  </div>
			  <div class="item-footer">
				<a href="">Điều khoản sử dụng</a>
			  </div>
			  <div class="item-footer">
				<a href="">Điều lệ</a>
			  </div>
			</div>
			<div class="col5 foot-colm">
			  <div class="item-footer">
				<h4>HỢP TÁC & LIÊN KẾT</h4>
			  </div>
			  <div class="icon-footer">
				<div class="icon-social">
				  <img src="https://hasaki.vn/v3/images/icons/fb.svg" alt="" />
				</div>
				<div class="icon-social">
				  <img
					src="https://hasaki.vn/v3/images/icons/icon_tiktok.svg"
					alt=""
				  />
				</div>
				<div class="icon-social">
				  <img
					src="https://hasaki.vn/v3/images/icons/instagram.svg"
					alt=""
				  />
				</div>
			  </div>
			  <div class="item-footer">
				<h4>THANH TOÁN</h4>
				<img
				  src="https://hasaki.vn/v3/images/icons/visa.svg"
				  style="height: 25px"
				/>
				<img
				  src="https://hasaki.vn/v3/images/icons/atm.svg"
				  style="height: 25px"
				/>
			  </div>
			</div>
			<div class="col6 foot-colm">
			  <h3>CẬP NHẬT THÔNG TIN KHUYẾN MÃI</h3>
  
			  <div class="content">
				<form action="" id="formsub">
				  <div class="block-input">
					<input
					  type="input"
					  name
					  class="input-news"
					  placeholder="email của bạn"
					/>
					<button class="btn-sub">Đăng ký</button>
				  </div>
				</form>
			  </div>
			</div>
		  </div>
		</div>
	  </footer>





        <script src="js/tracuu.js"></script>
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
             function logout()
                {
                     
      history.replaceState(null, '', 'index.jsp');
       window.location.href = 'logout';
      // Thay 'login.html' bằng đường dẫn của trang đăng nhập hoặc trang nào bạn muốn chuyển đến sau khi đăng xuất.
    }



        </script>


    </body>

</html>