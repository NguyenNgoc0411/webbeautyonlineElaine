<%-- 
    Document   : login
    Created on : Dec 25, 2023, 10:17:53 PM
    Author     : 2021
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="css/slick.css" />
    <link rel="stylesheet" href="css/trangchu.css">
    <link rel="stylesheet" href="css/loginnew.css">
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
        <div id="login" >
            
            <i class="fa-regular fa-circle-user fa-2xl"></i>
            <a href="">Đăng nhập / Đăng ký</a>
            
            <div id="block_1" class="sub_login">
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
                    <button id="login_button_1" rel="" class="btn_popup_login" href="">Đăng nhập</button>
                     Bạn chưa có tài khoản ?
                    <a  href="register" rel="" class="popup_register" href="" id="check_100"> ĐĂNG KÝ NGAY</a>
    
                </div>
            </div>
            
        </div>
        <div>
            <i class="fa-solid fa-cart-shopping fa-shake fa-xl"></i>
            <a href="">Giỏ hàng</a>
        </div>
    </header>
    <div id="modal"  >
        <div id="popup_login">
            <div class="popup_header_login">
                <a href="home"><button title="Đóng" type="button" class="close_btn" id="close_btn_login" >x</button></a>
            </div>
            <div class="popup_login_content">
                <div class="sub_login">
                    <div class="block_login">
                        <span class="arrow_sub_login">
                            <span class="icon_carret_down"></span>
                        </span>

                        <div class="text_login"> Đăng nhập với </div>
                        <a class="login_facebook" rel="" href="" data-href="">
                            <img src="https://hasaki.vn/images/graphics/img_login_fb_2.jpg" class="loading">
                        </a>
                        &nbsp;

                        <a class="login_facebook" rel="" href="" data-href="">
                            <img src="https://hasaki.vn/images/graphics/img_login_gg_2.jpg" class="loading">
                        </a>
                    </div>
                    <div class="block_login_more">
                        <c:set var="cookie" value="${pageContext.request.cookies}"/>
                        
                        <form id="form_login" action="login" method="POST">
                            <div class="text_more_login">Hoặc đăng nhập với </div>
                            <div class="showMessageError">
                                <div class=" alert">
                                    <!-- Tên đăng nhập không khớp -->
                                </div>
                            </div>
                            <div class="form_group">
                                <input type="text" class="form-control" id="username" name="username"   value="${cookie.cuser.value}" >
                                <span class="form_message"></span>
                            </div>
                            <div class="form_group">
                                <input type="password" class="form-control" id="password" name="password" value="${cookie.cpass.value}" >
                                <span class="form_message"></span>
                            </div>
                            <div class="form_group">
                                ${requestScope.errorLogin}
                                
                            </div>
                            
                            <div class="form_group">
                                <label type="checkbox_inline" 1>
                                    <input name="rem" type="checkbox" value="ON" ${cookie.crem!=null?'checked':''}>
                                    Nhớ mật khẩu
                                </label>
                                <a class="popup_forgot" >Quên mật khẩu</a>
                            </div>
                                <button type="submit" class="btn_popup_login" id="login_button">Đăng nhập</button>
                        </form>
                        Bạn chưa có tài khoản ?
                        <a  class="popup_register" href="register" > ĐĂNG KÝ NGAY</a>

                    </div>



                </div>


            </div>


        </div>
    </div>
       

    <nav>
        <a href="#">Trang chủ</a>
        <a href="#">Sản phẩm</a>
        <a href="#">Dịch vụ</a>
        <a href="#">Liên hệ</a>
    </nav>
    <div class="container">
        <div class="slide-bar">
            <div class="category-box">
                <ul class="category-list">
                    <li><a href="">Trang điểm môi</a></li>
                    <li><a href="">Mặt nạ</a></li>
                    <li><a href="">Trang điểm mặt</a></li>
                    <li><a href="">Sữa rửa mặt</a></li>
                    <li><a href="">Dầu gội và Dầu xả</a></li>
                    <li><a href="">Trang điểm mắt</a></li>
                    <li><a href="">Sữa tắm</a></li>
                    <li><a href="">Chống nắng da mặt</a></li>
                    <li><a href="">Tẩy trang mặt</a></li>
                    <li><a href="">Dưỡng thể</a></li>
                    <li><a href="">Toner / Nước Cân Bằng Da</a></li>
                    <li><a href="">Chăm sóc răng miệng</a></li>
                    <li><a href="">Khử mùi</a></li>
                    <li><a href="">Thực phẩm chức năng</a></li>
                    <li><a href="">Nước hoa</a></li>
                    <li><a href="">Chăm sóc phụ nữ</a></li>
                    <li><a href="">Tẩy tế bào chết Body</a></li>
                    <li><a href="">Hỗ trợ trị mụn</a></li>
                    <li><a href="">Serum / Dầu dưỡng tóc</a></li>
                    <!-- Thêm các mục khác nếu cần -->
                </ul>
            </div>
            <div class="slide-show">
                <div class="list-images">
                    <div>
                        <img class="slide1-img" src="https://media.hcdn.vn/hsk/1700102415846x250home-13.jpg" alt="">
                    </div>
                    <div>
                        <img class="slide1-img" src="https://media.hcdn.vn/hsk/1696489598tri-mun-ipl-web.jpg" alt="">
                    </div>
                    <div>
                        <img class="slide1-img" src="https://media.hcdn.vn/hsk/1700102974home-21.jpg" alt="">
                    </div>
                    <div>
                        <img class="slide1-img" src="https://media.hcdn.vn/hsk/1700216103home-137-1.jpg" alt="">
                    </div>
                </div>
                <div class="btns">
                    <div class="btn-left btn"><i class='fa-solid fa-angle-left fa-2xl'></i></div>
                    <div class="btn-right btn"><i class='fa-solid fa-angle-right fa-2xl'></i></div>
                </div>
                <div class="index-images">
                    <div class="index-item index-item-0 active"></div>
                    <div class="index-item index-item-1"></div>
                    <div class="index-item index-item-2"></div>
                    <div class="index-item index-item-3"></div>
                </div>
            </div>
            <div class="ads-box">
                <a href="">
                    <img class="ads-img" src="https://media.hcdn.vn/hsk/1700128472hsk-nowfree-140cn-846x250.jpg" alt="">
                </a>
                <a href=""><img class="ads-img"
                        src="https://media.hcdn.vn/hsk/1696582256unilever-sub-banner-desktop-427x140.jpg" alt=""></a>
                <a href=""><img class="ads-img" src="https://media.hcdn.vn/hsk/1687766948rohto-427x140.jpg" alt=""></a>
            </div>
        </div>

        <div class="hot-sale-box">
            <div class="hot-sale-header">
                <div>
                    <h1><i class="fa-solid fa-bolt-lightning fa-beat"></i> HOT SALE</h1>
                </div>
                <div class="countdown">
                    <span class="time-tag">KẾT THÚC SAU: </span>
                    <span class="timer" id="days">00</span> ngày
                    <span class="timer" id="hours">00</span> giờ
                    <span class="timer" id="minutes">00</span> phút
                    <span class="timer" id="seconds">00</span> giây
                </div>
            </div>
            <div class="product-slider">
                <div class="product-item">
                    <a href="">
                        <div class="product-image">
                            <img src="./img1.jpg" alt="Product Image">
                        </div>
                        <div class="product-details">
                            <div class="product-price">
                                <div class="original-price">$129.99</div>
                                <div class="discounted-price">$99.99</div>
                            </div>
                            <div class="product-description">Kem Chống Nắng Skin1004 Cho Da Nhạy Cảm SPF 50+ 50ml
                            </div>
                            <div class="product-rating">
                                <span class="stars">★★★★★</span>
                                <span class="review-count">(50 đánh giá)</span>
                            </div>
                            <p class="purchase-count">Đã bán: 1000 sản phẩm</p>
                        </div>
                    </a>
                </div>
                <div class="product-item">
                    <a href="">
                        <div class="product-image">
                            <img src="./img1.jpg" alt="Product Image">
                        </div>
                        <div class="product-details">
                            <div class="product-price">
                                <div class="original-price">$129.99</div>
                                <div class="discounted-price">$99.99</div>
                            </div>
                            <div class="product-description">Kem Chống Nắng Skin1004 Cho Da Nhạy Cảm SPF 50+ 50ml
                            </div>
                            <div class="product-rating">
                                <span class="stars">★★★★★</span>
                                <span class="review-count">(50 đánh giá)</span>
                            </div>
                            <p class="purchase-count">Đã bán: 1000 sản phẩm</p>
                        </div>
                    </a>
                </div>
                <div class="product-item">
                    <a href="">
                        <div class="product-image">
                            <img src="./img1.jpg" alt="Product Image">
                        </div>
                        <div class="product-details">
                            <div class="product-price">
                                <div class="original-price">$129.99</div>
                                <div class="discounted-price">$99.99</div>
                            </div>
                            <div class="product-description">Kem Chống Nắng Skin1004 Cho Da Nhạy Cảm SPF 50+ 50ml
                            </div>
                            <div class="product-rating">
                                <span class="stars">★★★★★</span>
                                <span class="review-count">(50 đánh giá)</span>
                            </div>
                            <p class="purchase-count">Đã bán: 1000 sản phẩm</p>
                        </div>
                    </a>
                </div>
                <div class="product-item">
                    <a href="">
                        <div class="product-image">
                            <img src="./img1.jpg" alt="Product Image">
                        </div>
                        <div class="product-details">
                            <div class="product-price">
                                <div class="original-price">$129.99</div>
                                <div class="discounted-price">$99.99</div>
                            </div>
                            <div class="product-description">Kem Chống Nắng Skin1004 Cho Da Nhạy Cảm SPF 50+ 50ml
                            </div>
                            <div class="product-rating">
                                <span class="stars">★★★★★</span>
                                <span class="review-count">(50 đánh giá)</span>
                            </div>
                            <p class="purchase-count">Đã bán: 1000 sản phẩm</p>
                        </div>
                    </a>
                </div>
                <div class="product-item">
                    <a href="">
                        <div class="product-image">
                            <img src="./img1.jpg" alt="Product Image">
                        </div>
                        <div class="product-details">
                            <div class="product-price">
                                <div class="original-price">$129.99</div>
                                <div class="discounted-price">$99.99</div>
                            </div>
                            <div class="product-description">Kem Chống Nắng Skin1004 Cho Da Nhạy Cảm SPF 50+ 50ml
                            </div>
                            <div class="product-rating">
                                <span class="stars">★★★★★</span>
                                <span class="review-count">(50 đánh giá)</span>
                            </div>
                            <p class="purchase-count">Đã bán: 1000 sản phẩm</p>
                        </div>
                    </a>
                </div>
                <div class="product-item">
                    <a href="">
                        <div class="product-image">
                            <img src="./img1.jpg" alt="Product Image">
                        </div>
                        <div class="product-details">
                            <div class="product-price">
                                <div class="original-price">$129.99</div>
                                <div class="discounted-price">$99.99</div>
                            </div>
                            <div class="product-description">Kem Chống Nắng Skin1004 Cho Da Nhạy Cảm SPF 50+ 50ml
                            </div>
                            <div class="product-rating">
                                <span class="stars">★★★★★</span>
                                <span class="review-count">(50 đánh giá)</span>
                            </div>
                            <p class="purchase-count">Đã bán: 1000 sản phẩm</p>
                        </div>
                    </a>
                </div>
                <div class="product-item">
                    <a href="">
                        <div class="product-image">
                            <img src="./img1.jpg" alt="Product Image">
                        </div>
                        <div class="product-details">
                            <div class="product-price">
                                <div class="original-price">$129.99</div>
                                <div class="discounted-price">$99.99</div>
                            </div>
                            <div class="product-description">Kem Chống Nắng Skin1004 Cho Da Nhạy Cảm SPF 50+ 50ml
                            </div>
                            <div class="product-rating">
                                <span class="stars">★★★★★</span>
                                <span class="review-count">(50 đánh giá)</span>
                            </div>
                            <p class="purchase-count">Đã bán: 1000 sản phẩm</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="brand-box">
            <a href=""><img class="brand-ads-img"
                    src="https://media.hcdn.vn/hsk/1700128472hsk-nowfree-140cn-846x250.jpg" alt=""></a>
            <a href=""><img class="brand-ads-img"
                    src="https://media.hcdn.vn/hsk/1696582256unilever-sub-banner-desktop-427x140.jpg" alt=""></a>
            <a href=""><img class="brand-ads-img" src="https://media.hcdn.vn/hsk/1687766948rohto-427x140.jpg"
                    alt=""></a>
        </div>
        <div class="category-box2">
            <div>Danh mục</div>
            <div class="category-slide">
                <div class="category-item">
                    <a href="">
                        <div class="category-image">
                            <img src="https://hasaki.vn/img/category/c24-trang-diem-moi.jpg" alt="Product Image">
                        </div>
                        <div class="category-name">
                            Trang điểm môi
                        </div>
                    </a>
                </div>
                <div class="category-item">
                    <a href="">
                        <div class="category-image">
                            <img src="https://hasaki.vn/img/category/c24-trang-diem-moi.jpg" alt="Product Image">
                        </div>
                        <div class="category-name">
                            Trang điểm môi
                        </div>
                    </a>
                </div>
                <div class="category-item">
                    <a href="">
                        <div class="category-image">
                            <img src="https://hasaki.vn/img/category/c24-trang-diem-moi.jpg" alt="Product Image">
                        </div>
                        <div class="category-name">
                            <div>Trang điểm môi</div>
                        </div>
                    </a>
                </div>
                <div class="category-item">
                    <a href="">
                        <div class="category-image">
                            <img src="https://hasaki.vn/img/category/c24-trang-diem-moi.jpg" alt="Product Image">
                        </div>
                        <div class="category-name">
                            <div>Trang điểm môi</div>
                        </div>
                    </a>
                </div>
                <div class="category-item">
                    <a href="">
                        <div class="category-image">
                            <img src="https://hasaki.vn/img/category/c24-trang-diem-moi.jpg" alt="Product Image">
                        </div>
                        <div class="category-name">
                            <div>Trang điểm môi</div>
                        </div>
                    </a>
                </div>
                <div class="category-item">
                    <a href="">
                        <div class="category-image">
                            <img src="https://hasaki.vn/img/category/c24-trang-diem-moi.jpg" alt="Product Image">
                        </div>
                        <div class="category-name">
                            <div>Trang điểm môi</div>
                        </div>
                    </a>
                </div>
                <div class="category-item">
                    <a href="">
                        <div class="category-image">
                            <img src="https://hasaki.vn/img/category/c24-trang-diem-moi.jpg" alt="Product Image">
                        </div>
                        <div class="category-name">
                            <div>Trang điểm môi</div>
                        </div>
                    </a>
                </div>
                <div class="category-item">
                    <a href="">
                        <div class="category-image">
                            <img src="https://hasaki.vn/img/category/c24-trang-diem-moi.jpg" alt="Product Image">
                        </div>
                        <div class="category-name">
                            <div>Trang điểm môi</div>
                        </div>
                    </a>
                </div>
                <div class="category-item">
                    <a href="">
                        <div class="category-image">
                            <img src="https://hasaki.vn/img/category/c24-trang-diem-moi.jpg" alt="Product Image">
                        </div>
                        <div class="category-name">
                            <div>Trang điểm môi</div>
                        </div>
                    </a>
                </div>
                <div class="category-item">
                    <a href="">
                        <div class="category-image">
                            <img src="https://hasaki.vn/img/category/c24-trang-diem-moi.jpg" alt="Product Image">
                        </div>
                        <div class="category-name">
                            <div>Trang điểm môi</div>
                        </div>
                    </a>
                </div>
                <div class="category-item">
                    <a href="">
                        <div class="category-image">
                            <img src="https://hasaki.vn/img/category/c24-trang-diem-moi.jpg" alt="Product Image">
                        </div>
                        <div class="category-name">
                            <div>Trang điểm môi</div>
                        </div>
                    </a>
                </div>
                <div class="category-item">
                    <a href="">
                        <div class="category-image">
                            <img src="https://hasaki.vn/img/category/c24-trang-diem-moi.jpg" alt="Product Image">
                        </div>
                        <div class="category-name">
                            <div>Trang điểm môi</div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="brand-category">
            <div class="brand-category-header">Thương hiệu</div>
            <div class="list-brand">
                <div class="list-brand-left">
                    <div class="brand-left-item">
                        <a href="">
                            <img src="https://media.hcdn.vn/hsk/1700016462500x500-25_img_410x410_8c5088_fit_center.jpg"
                                alt="">
                        </a>
                    </div>
                    <div class="brand-left-item">
                        <a href="">
                            <img src="https://media.hcdn.vn/hsk/1700016462500x500-25_img_410x410_8c5088_fit_center.jpg"
                                alt="">
                        </a>
                    </div>
                    <div class="brand-left-item">
                        <a href="">
                            <img src="https://media.hcdn.vn/hsk/1700016462500x500-25_img_410x410_8c5088_fit_center.jpg"
                                alt="">
                        </a>
                    </div>
                </div>
                <div class="list-brand-right">
                    <div class="brand-right-items">
                        <div class="brand-item">
                            <a href="">
                                <img src="https://media.hcdn.vn/hsk/1700016462500x500-25_img_410x410_8c5088_fit_center.jpg"
                                    alt="">
                            </a>
                        </div>
                        <div class="brand-item">
                            <a href="">
                                <img src="https://media.hcdn.vn/hsk/1700016462500x500-25_img_410x410_8c5088_fit_center.jpg"
                                    alt="">
                            </a>
                        </div>
                    </div>
                    <div class="brand-right-items">
                        <div class="brand-item">
                            <a href="">
                                <img src="https://media.hcdn.vn/hsk/1700016462500x500-25_img_410x410_8c5088_fit_center.jpg"
                                    alt="">
                            </a>
                        </div>
                        <div class="brand-item">
                            <a href="">
                                <img src="https://media.hcdn.vn/hsk/1700016462500x500-25_img_410x410_8c5088_fit_center.jpg"
                                    alt="">
                            </a>
                        </div>
                    </div>
                    <div class="brand-right-items">
                        <div class="brand-item">
                            <a href="">
                                <img src="https://media.hcdn.vn/hsk/1700016462500x500-25_img_410x410_8c5088_fit_center.jpg"
                                    alt="">
                            </a>
                        </div>
                        <div class="brand-item">
                            <a href="">
                                <img src="https://media.hcdn.vn/hsk/1700016462500x500-25_img_410x410_8c5088_fit_center.jpg"
                                    alt="">
                            </a>
                        </div>
                    </div>
                    <div class="brand-right-items">
                        <div class="brand-item">
                            <a href="">
                                <img src="https://media.hcdn.vn/hsk/1700016462500x500-25_img_410x410_8c5088_fit_center.jpg"
                                    alt="">
                            </a>
                        </div>
                        <div class="brand-item">
                            <a href="">
                                <img src="https://media.hcdn.vn/hsk/1700016462500x500-25_img_410x410_8c5088_fit_center.jpg"
                                    alt="">
                            </a>
                        </div>
                    </div>
                    <div class="brand-right-items">
                        <div class="brand-item">
                            <a href="">
                                <img src="https://media.hcdn.vn/hsk/1700016462500x500-25_img_410x410_8c5088_fit_center.jpg"
                                    alt="">
                            </a>
                        </div>
                        <div class="brand-item">
                            <a href="">
                                <img src="https://media.hcdn.vn/hsk/1700016462500x500-25_img_410x410_8c5088_fit_center.jpg"
                                    alt="">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="suggest-container">
        <div class="suggest-header">
            Gợi ý cho bạn
        </div>
        <div class="suggest-product" id="suggest-product">
            <div class="product-item">
                <a href="">
                    <div class="product-image">
                        <img src="./img1.jpg" alt="Product Image">
                    </div>
                    <div class="product-details">
                        <div class="product-price">
                            <div class="original-price">$129.99</div>
                            <div class="discounted-price">$99.99</div>
                        </div>
                        <div class="product-description">Kem Chống Nắng Skin1004 Cho Da Nhạy Cảm SPF 50+ 50ml
                        </div>
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <span class="review-count">(50 đánh giá)</span>
                        </div>
                        <p class="purchase-count">Đã bán: 1000 sản phẩm</p>
                    </div>
                </a>
            </div>
            <div class="product-item">
                <a href="">
                    <div class="product-image">
                        <img src="./img1.jpg" alt="Product Image">
                    </div>
                    <div class="product-details">
                        <div class="product-price">
                            <div class="original-price">$129.99</div>
                            <div class="discounted-price">$99.99</div>
                        </div>
                        <div class="product-description">Kem Chống Nắng Skin1004 Cho Da Nhạy Cảm SPF 50+ 50ml
                        </div>
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <span class="review-count">(50 đánh giá)</span>
                        </div>
                        <p class="purchase-count">Đã bán: 1000 sản phẩm</p>
                    </div>
                </a>
            </div>
            <div class="product-item">
                <a href="">
                    <div class="product-image">
                        <img src="./img1.jpg" alt="Product Image">
                    </div>
                    <div class="product-details">
                        <div class="product-price">
                            <div class="original-price">$129.99</div>
                            <div class="discounted-price">$99.99</div>
                        </div>
                        <div class="product-description">Kem Chống Nắng Skin1004 Cho Da Nhạy Cảm SPF 50+ 50ml
                        </div>
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <span class="review-count">(50 đánh giá)</span>
                        </div>
                        <p class="purchase-count">Đã bán: 1000 sản phẩm</p>
                    </div>
                </a>
            </div>
            <div class="product-item">
                <a href="">
                    <div class="product-image">
                        <img src="./img1.jpg" alt="Product Image">
                    </div>
                    <div class="product-details">
                        <div class="product-price">
                            <div class="original-price">$129.99</div>
                            <div class="discounted-price">$99.99</div>
                        </div>
                        <div class="product-description">Kem Chống Nắng Skin1004 Cho Da Nhạy Cảm SPF 50+ 50ml
                        </div>
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <span class="review-count">(50 đánh giá)</span>
                        </div>
                        <p class="purchase-count">Đã bán: 1000 sản phẩm</p>
                    </div>
                </a>
            </div>
            <div class="product-item">
                <a href="">
                    <div class="product-image">
                        <img src="./img1.jpg" alt="Product Image">
                    </div>
                    <div class="product-details">
                        <div class="product-price">
                            <div class="original-price">$129.99</div>
                            <div class="discounted-price">$99.99</div>
                        </div>
                        <div class="product-description">Kem Chống Nắng Skin1004 Cho Da Nhạy Cảm SPF 50+ 50ml
                        </div>
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <span class="review-count">(50 đánh giá)</span>
                        </div>
                        <p class="purchase-count">Đã bán: 1000 sản phẩm</p>
                    </div>
                </a>
            </div>
            <div class="product-item">
                <a href="">
                    <div class="product-image">
                        <img src="./img1.jpg" alt="Product Image">
                    </div>
                    <div class="product-details">
                        <div class="product-price">
                            <div class="original-price">$129.99</div>
                            <div class="discounted-price">$99.99</div>
                        </div>
                        <div class="product-description">Kem Chống Nắng Skin1004 Cho Da Nhạy Cảm SPF 50+ 50ml
                        </div>
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <span class="review-count">(50 đánh giá)</span>
                        </div>
                        <p class="purchase-count">Đã bán: 1000 sản phẩm</p>
                    </div>
                </a>
            </div>
            <div class="product-item">
                <a href="">
                    <div class="product-image">
                        <img src="./img1.jpg" alt="Product Image">
                    </div>
                    <div class="product-details">
                        <div class="product-price">
                            <div class="original-price">$129.99</div>
                            <div class="discounted-price">$99.99</div>
                        </div>
                        <div class="product-description">Kem Chống Nắng Skin1004 Cho Da Nhạy Cảm SPF 50+ 50ml
                        </div>
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <span class="review-count">(50 đánh giá)</span>
                        </div>
                        <p class="purchase-count">Đã bán: 1000 sản phẩm</p>
                    </div>
                </a>
            </div>
            <div class="product-item">
                <a href="">
                    <div class="product-image">
                        <img src="./img1.jpg" alt="Product Image">
                    </div>
                    <div class="product-details">
                        <div class="product-price">
                            <div class="original-price">$129.99</div>
                            <div class="discounted-price">$99.99</div>
                        </div>
                        <div class="product-description">Kem Chống Nắng Skin1004 Cho Da Nhạy Cảm SPF 50+ 50ml
                        </div>
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <span class="review-count">(50 đánh giá)</span>
                        </div>
                        <p class="purchase-count">Đã bán: 1000 sản phẩm</p>
                    </div>
                </a>
            </div>
            <div class="product-item">
                <a href="">
                    <div class="product-image">
                        <img src="./img1.jpg" alt="Product Image">
                    </div>
                    <div class="product-details">
                        <div class="product-price">
                            <div class="original-price">$129.99</div>
                            <div class="discounted-price">$99.99</div>
                        </div>
                        <div class="product-description">Kem Chống Nắng Skin1004 Cho Da Nhạy Cảm SPF 50+ 50ml
                        </div>
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <span class="review-count">(50 đánh giá)</span>
                        </div>
                        <p class="purchase-count">Đã bán: 1000 sản phẩm</p>
                    </div>
                </a>
            </div>
            <div class="product-item">
                <a href="">
                    <div class="product-image">
                        <img src="./img1.jpg" alt="Product Image">
                    </div>
                    <div class="product-details">
                        <div class="product-price">
                            <div class="original-price">$129.99</div>
                            <div class="discounted-price">$99.99</div>
                        </div>
                        <div class="product-description">Kem Chống Nắng Skin1004 Cho Da Nhạy Cảm SPF 50+ 50ml
                        </div>
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <span class="review-count">(50 đánh giá)</span>
                        </div>
                        <p class="purchase-count">Đã bán: 1000 sản phẩm</p>
                    </div>
                </a>
            </div>
            <div class="product-item">
                <a href="">
                    <div class="product-image">
                        <img src="./img1.jpg" alt="Product Image">
                    </div>
                    <div class="product-details">
                        <div class="product-price">
                            <div class="original-price">$129.99</div>
                            <div class="discounted-price">$99.99</div>
                        </div>
                        <div class="product-description">Kem Chống Nắng Skin1004 Cho Da Nhạy Cảm SPF 50+ 50ml
                        </div>
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <span class="review-count">(50 đánh giá)</span>
                        </div>
                        <p class="purchase-count">Đã bán: 1000 sản phẩm</p>
                    </div>
                </a>
            </div>
        </div>
        <button id="loadMore">Xem thêm</button>
    </div>
    <footer>
        <div class="footer-container">
            <div class="infor-box">
                <ul>
                    <li class="infor-header">KẾT NỐI VỚI CHÚNG TÔI</li>
                    <li class="infor-title">Facebook</li>
                    <li class="infor-title">Instagram</li>
                    <li class="infor-title">Tiktok</li>
                    <li class="infor-title">Email</li>
                    <li class="infor-title">Địa chỉ</li>
                </ul>
            </div>
            <div class="infor-box">
                <ul>
                    <li class="infor-header">DỊCH VỤ KHÁCH HÀNG</li>
                    <li class="infor-title">Hướng dẫn mua hàng</li>
                    <li class="infor-title">Quy định đổi hàng</li>
                    <li class="infor-title">Ưu đãi khách hàng</li>
                    <li class="infor-title">Điều khoản sử dụng</li>
                    <li class="infor-title">Chính sách bảo hành</li>
                    <li class="infor-title">Chính sách thanh toán</li>
                </ul>
            </div>
            <div class="infor-box">
                <ul>
                    <li class="infor-header">ĐĂNG KÝ NHẬN THÔNG BÁO</li>
                    <li>
                        <form action="">
                            <input type="text" name="input">
                            <button type="submit">Đăng ký</button>
                        </form>
                    </li>
                </ul>
            </div>
        </div>

    </footer>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="js/index.js"></script>
    <script src="js/login.js"></script>
    <script src="js/checklogin.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
</body>

</html>