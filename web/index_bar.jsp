<%-- 
    Document   : index_bar
    Created on : Dec 30, 2023, 3:14:01 PM
    Author     : luong
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="./css/index.css" type="text/css"/>
        <link rel="stylesheet" href="./css/login_logout1.css" type="text/css"/>
        <link rel="stylesheet" href="./css/tracuu1.css" type="text/css"/>
        <style>
            .none {
                display: none;
            }
        </style>
    </head>
    <body>
        <header>
            <!-- <a href=""><i class="fa-solid fa-bars fa-2xl"></i></a> -->
            <a href="home">
                <h1>Elaine Cosmetics</h1>
            </a>
            <form action="showProducBasicController" method="post">
                <div class="search-container">
                    <input type="text" id="txtSearch" name="data-search" placeholder="Tìm kiếm...">
                    <input class="none" type="text" name="topic" value="searchByNameBar">
                    <button type="submit" id="btnSearch"><i class="fa-solid fa-magnifying-glass fa-2xl"></i></button>
                </div>
            </form>
            <div>
                <i class="fa-solid fa-phone-volume fa-xl"></i>
                <a href="">Hỗ trợ</a>
            </div>
            <div>
                <i class="fa-solid fa-truck-fast fa-xl"></i>
                <a href="tracuu">Tra cứu đơn hàng</a>
            </div>
            <div id="login" >
                <i  class="fa-regular fa-circle-user fa-2xl"></i>
                <a  href="">${sessionScope.userht!=null ? sessionScope.userht.getName():"Đăng nhập/Đăng ký"}  </a>
                <div id="${sessionScope.userht!=null ?'client_login':""}" class="da_login" >
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

                <div id="${sessionScope.userht==null ? 'block_1':""}"  class="sub_login" >
                    <div class="block_login">

                        <div class="text_login"> Đăng nhập với </div>
                        <a class="login_facebook" rel="" href="" data-href="">
                            <img src="https://hasaki.vn/images/graphics/img_login_fb.jpg" class="loading">
                        </a>
                        <a class="login_facebook" rel="" href="" data-href="">
                            <img src="https://hasaki.vn/images/graphics/img_login_gg.jpg" class="loading">
                        </a>
                    </div>
                    <div class="block_login_more">
                        <div class="text_more_login">Hoặc đăng nhập với </div>
                        <a href="login"><button id="login_button_1" rel="" class="btn_popup_login" href="">Đăng nhập</button></a>
                        Bạn chưa có tài khoản ?
                        <a  href="register" rel="" class="popup_register" href="" id="check_100"> ĐĂNG KÝ NGAY</a>
                    </div>
                </div>

            </div>
            <div>
                <i class="fa-solid fa-cart-shopping fa-shake fa-xl"></i>
                <a href="cart_control">Giỏ hàng</a>
            </div>
            <div style=" display:${sessionScope.admin!=null ? 'block':'none'}">
                <a  href="${sessionScope.admin!=null ? 'admin':'home'}">Admin</a>
            </div>

        </header>

        <nav>
            <a href="#">Trang chủ</a>
            <a href="#">Sản phẩm</a>
            <a href="#">Dịch vụ</a>
            <a href="#">Liên hệ</a>
        </nav>
    </body>
</html>
