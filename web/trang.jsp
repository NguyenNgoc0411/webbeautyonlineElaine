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

<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quan ly tai khoan</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="./css/profile.css" />
    
</head>

<body>
    <header>
        <!-- <a href=""><i class="fa-solid fa-bars fa-2xl"></i></a> -->
        <a href="home">
            <h1>Elaine Cosmetics</h1>
        </a>
        <form action="search" method="post">
            <div class="search-container">
                <input type="text" id="txtSearch" name="data-search" placeholder="Tìm kiếm..." />
                <button type="submit" id="btnSearch">
                    <i class="fa-solid fa-magnifying-glass fa-2xl"></i>
                </button>
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
                



            </div>
        <div>
            <i class="fa-solid fa-cart-shopping fa-shake fa-xl"></i>
            <a href="">Giỏ hàng</a>
        </div>
        
    </header>
    <nav>
        <a href="#">Trang chủ</a>
        <a href="#">
            <i class="fa-solid fa-chevron-right fa-1x"></i>
        </a>
        <a href="#">Thông tin tài khoản</a>
    </nav>

    <div class="width-common" id="w3-wrapper">
        <div class="container">
            <div class="colm-main1">
                <div class="box-infor">
                    <div class="avatar-profile">
                        <img id="avat" src="https://hasaki.vn/images/graphics/account-full.svg" alt="" />
                    </div>
                    <div class="name-profile text-color1">
                        <strong>Chào bạn</strong>
                    </div>
                    
                    <a href="" class="txt-666">Chỉnh sửa tài khoản</a>
                </div>
                <div class="box-menu">
                    <a href="customercontrol" class="item-menu">Quản lý tài khoản</a>
                    <a href="customercontrol" class="item-menu active">Thông tin tài khoản</a>
                    <a href="tracuu" class="item-menu">Đơn hàng của tôi</a>
                    <a href="editaddress" class="item-menu">Sổ địa chỉ nhận hàng</a>

                    <a href="" class="item-menu">Mua lại</a>
                    <a href="" class="item-menu">Hỏi đáp</a>
                </div>
            </div>
            <div class="colm-main2">
                <div class="colm">
                    <form action="customercontrol" method="post">
                        <div class="content">Thông tin tài khoản</div>
                        <div class="content2">
                            <div class="hinhanh">
                                <div>
                                    <img src="" alt="">
                                </div>
                                <a href="" style="text-decoration: none; color: black;">Tải hình ảnh của bạn</a>
                            </div>

                            <div class="thongtin">
                                <div class="nhap">
                                    <input type="text" placeholder="${sessionScope.customer.email }" name="email" id="email" value="${sessionScope.customer.email }">
                                </div>
                                <div class="nhap">
                                    <input type="text" placeholder="${sessionScope.customer.name }" name="ten" id="ten" value="${sessionScope.customer.name }">
                                </div>
                                <div class="gioitinh">
                                   
                                        <input name="gender" type="radio" value="Nam" ${sessionScope.customer.sex=="Nam"?'checked':"" } />Nam
                                        <input name="gender" type="radio" value="Nữ" ${sessionScope.customer.sex=="Nữ"?'checked':"" } />Nữ
                                        <input name="gender" type="radio" value="Khác" />Không xác định
                                  
                                </div>
                                <div class="ngaysinh">
                                    <b>Ngày sinh (Không bắt buộc)</b>
                                    <div>
                                        <select name="ngay" id="" >
                                            <option value="" class="chon">Ngày</option>
                                            <option value="${Integer.parseInt(sessionScope.customer.getDate().substring(8))}" selected>${sessionScope.customer.getDate().substring(8)}</option>
                                            <option value="01">01</option>
                                            <option value="02">02</option>
                                            <option value="03">03</option>
                                            <option value="04">04</option>
                                            <option value="05">05</option>
                                            <option value="06">06</option>
                                            <option value="07">07</option>
                                            <option value="08">08</option>
                                            <option value="09">09</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                            <option value="13">13</option>
                                            <option value="14">14</option>
                                            <option value="15">15</option>
                                            <option value="16">16</option>
                                            <option value="17">17</option>
                                            <option value="18">18</option>
                                            <option value="19">19</option>
                                            <option value="20">20</option>
                                            <option value="21">21</option>
                                            <option value="22">22</option>
                                            <option value="23">23</option>
                                            <option value="24">24</option>
                                            <option value="25">25</option>
                                            <option value="26">26</option>
                                            <option value="27">26</option>
                                            <option value="28">28</option>
                                            <option value="29">29</option>
                                            <option value="30">30</option>
                                        </select>
                                        <select name="thang" id="">
                                            <option value="" class="chon">Tháng</option>
                                             <option value="${Integer.parseInt(sessionScope.customer.getDate().substring(5,7))}" selected>${sessionScope.customer.getDate().substring(5,7)}</option>
                                            <option value="01">01</option>
                                            <option value="02">02</option>
                                            <option value="03">03</option>
                                            <option value="04">04</option>
                                            <option value="05">05</option>
                                            <option value="06">06</option>
                                            <option value="07">07</option>
                                            <option value="08">08</option>
                                            <option value="09">09</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select>
                                        <select name="nam" id="">
                                            <option value="" class="chon">Năm</option>
                                             <option value="${Integer.parseInt(sessionScope.customer.getDate().substring(0,4))}" selected>${sessionScope.customer.getDate().substring(0,4)}</option>
                                            <option value="2000">2000</option>
                                            <option value="2001">2001</option>
                                            <option value="2002">2002</option>
                                            <option value="2003">2003</option>
                                            <option value="2004">2004</option>
                                            <option value="2005">2005</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="capnhat"><button type="submit">Cập nhật</button></div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="colm">
                    <div class="content">Số điện thoại và Email</div>
                    <div class="thaydoi">
                        <div class="thaydoi1"><i class="fa-solid fa-phone"></i></div>
                        <div class="thaydoi2">
                            <div class="a">Số điện thoại</div>
                            <div class="a">${sessionScope.customer.phone }</div>
                        </div>
                        <div class="thaydoi3">Cập nhật</div>
                    </div>

                    <div class="thaydoi">
                        <div class="thaydoi1"><i class="fa-regular fa-envelope"></i></div>
                        <div class="thaydoi2">
                            <div class="a">Email</div>
                            <div class="a">${sessionScope.customer.email }</div>
                        </div>

                    </div>
                    <div class="content">Bảo mật</div>
                    <div class="thaydoi1"><i class="fa-solid fa-lock"></i></div>
                    <div class="thaydoi2">
                        <div class="a">Đổi mật khẩu</div>

                    </div>
                    <div class="thaydoi3">Cập nhật</div>

                    <div class="content">Liên kết mạng xã hội</div>
                    <div class="thaydoi1"><i class="fa-brands fa-facebook"></i></div>
                    <div class="thaydoi2">
                        <div class="a">Facebook</div>

                    </div>
                    <div class="thaydoi3">Cập nhật</div>
                    <div class="cach"></div>
                    <div class="thaydoi1"><i class="fa-brands fa-google"></i></div>
                    <div class="thaydoi2">
                        <div class="a">Google</div>

                    </div>
                    <div class="thaydoi3">Cập nhật</div>
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
                            <img src="https://hasaki.vn/v3/images/icons/icon_footer_1.svg" alt="" />
                        </div>
                        <div class="slg text-center">
                            Thanh toán <br />
                            khi nhận hàng
                        </div>
                    </div>
                    <div class="b1 box-slg">
                        <div>
                            <img src="https://hasaki.vn/v3/images/icons/icon_footer_2.svg" alt=""
                                style="width: 105px; padding: 10px 20px" />
                        </div>
                        <div class="slg text-center">
                            Giao nhanh <br />
                            miễn phí 2H
                        </div>
                    </div>
                    <div class="b1 box-slg">
                        <div>
                            <img src="https://hasaki.vn/v3/images/icons/icon_footer_3.svg" alt="" />
                        </div>
                        <div class="slg text-center">
                            14 ngày đổi trả <br />
                            miễn phí
                        </div>
                    </div>
                    <div class="b1 box-slg">
                        <div>
                            <img src="https://hasaki.vn/v3/images/icons/icon_footer_4.svg" alt="" />
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
                                <img src="https://hasaki.vn/v3/images/icons/icons_hotline_kn.svg" alt="" />
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
                                <img src="https://hasaki.vn/v3/images/icons/icons_hotline_tv.svg" alt="" />
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
                                <img src="https://hasaki.vn/v3/images/icons/icon_timchinhanh.svg" alt="" />
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
                            <img src="https://hasaki.vn/v3/images/icons/icon_tiktok.svg" alt="" />
                        </div>
                        <div class="icon-social">
                            <img src="https://hasaki.vn/v3/images/icons/instagram.svg" alt="" />
                        </div>
                    </div>
                    <div class="item-footer">
                        <h4>THANH TOÁN</h4>
                        <img src="https://hasaki.vn/v3/images/icons/visa.svg" style="height: 25px" />
                        <img src="https://hasaki.vn/v3/images/icons/atm.svg" style="height: 25px" />
                    </div>
                </div>
                <div class="col6 foot-colm">
                    <h3>CẬP NHẬT THÔNG TIN KHUYẾN MÃI</h3>

                    <div class="content">
                        <form action="" id="formsub">
                            <div class="block-input">
                                <input type="input" name class="input-news" placeholder="email của bạn" />
                                <button class="btn-sub">Đăng ký</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </footer>
                        
                        <script>
                            
                        </script>
</body>

</html>