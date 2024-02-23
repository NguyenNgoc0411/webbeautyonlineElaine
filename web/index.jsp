<%-- 
    Document   : index
    Created on : Nov 22, 2023, 12:03:42 AM
    Author     : luong
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
        <link rel="stylesheet" href="./css/slick.css" type="text/css" />
        <link rel="stylesheet" href="./css/index.css" type="text/css"/>



    </head>

    <body>
        <jsp:include page="index_bar.jsp"></jsp:include>
            <div class="container">
                <div class="slide-bar">
                    <div class="category-box">
                        <ul class="category-list">
                        <c:forEach items="${AllCategories}" var="p">
                            <li><a href="showProducBasicController?cateId=${p.getId()}">${p.getName()}</a></li>
                            </c:forEach>
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
                    <div class="countdown" id="countdown">
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
                                <img src="https://hasaki.vn/img/category/c24-trang-diem-moi.jpg" alt="Product Image">
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
                                <img src="https://hasaki.vn/img/category/c24-trang-diem-moi.jpg" alt="Product Image">
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
                                <img src="https://hasaki.vn/img/category/c24-trang-diem-moi.jpg" alt="Product Image">
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
                                <img src="https://hasaki.vn/img/category/c24-trang-diem-moi.jpg" alt="Product Image">
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
                                <img src="https://hasaki.vn/img/category/c24-trang-diem-moi.jpg" alt="Product Image">
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
                                <img src="https://hasaki.vn/img/category/c24-trang-diem-moi.jpg" alt="Product Image">
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
                                <img src="https://hasaki.vn/img/category/c24-trang-diem-moi.jpg" alt="Product Image">
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
                    <c:forEach items="${AllCategories}" var="p">
                        <div class="category-item">
                            <a href="showProducBasicController?cateId=${p.getId()}">
                                <div class="category-image">
                                    <img src="${p.getImage()}" alt="Product Image">
                                </div>
                                <div class="category-name">${p.getName()}</div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="brand-category">
                <div class="brand-category-header">Thương hiệu</div>
                <div class="list-brand">
                    <div class="list-brand-left">
                        <div class="brand-left-item">
                            <a href="">
                                <img src="https://media.hcdn.vn/hsk/1703902560pr-pop_img_410x410_8c5088_fit_center.jpg"
                                     alt="">
                            </a>
                        </div>
                        <div class="brand-left-item">
                            <a href="">
                                <img src="https://media.hcdn.vn/hsk/1703903424500x500-11-2_img_410x410_8c5088_fit_center.jpg"
                                     alt="">
                            </a>
                        </div>
                        <div class="brand-left-item">
                            <a href="">
                                <img src="https://media.hcdn.vn/hsk/1703902506md-pop_img_410x410_8c5088_fit_center.jpg"
                                     alt="">
                            </a>
                        </div>
                    </div>
                    <div class="list-brand-right">
                        <div class="brand-right-items">
                            <div class="brand-item">
                                <a href="">
                                    <img src="https://media.hcdn.vn//hsk/brandunilever-cover1680318116_img_190x190_30c310_fit_center.jpg"
                                         alt="">
                                </a>
                            </div>
                            <div class="brand-item">
                                <a href="">
                                    <img src="https://media.hcdn.vn/brand/1607579699vichy2_img_190x190_30c310_fit_center.jpg"
                                         alt="">
                                </a>
                            </div>
                        </div>
                        <div class="brand-right-items">
                            <div class="brand-item">
                                <a href="">
                                    <img src="https://media.hcdn.vn//hsk/brandMaybellinecover-brand500x5001694758662_img_190x190_30c310_fit_center.jpg"
                                         alt="">
                                </a>
                            </div>
                            <div class="brand-item">
                                <a href="">
                                    <img src="https://media.hcdn.vn/hsk/brand/Anessa500x5001660185805_img_190x190_30c310_fit_center.jpg"
                                         alt="">
                                </a>
                            </div>
                        </div>
                        <div class="brand-right-items">
                            <div class="brand-item">
                                <a href="">
                                    <img src="https://media.hcdn.vn/hsk/brand/klairs500x5001621912412_img_190x190_30c310_fit_center.jpg"
                                         alt="">
                                </a>
                            </div>
                            <div class="brand-item">
                                <a href="">
                                    <img src="https://media.hcdn.vn/hsk/brand/Loreal500x5001621934505_img_190x190_30c310_fit_center.jpg"
                                         alt="">
                                </a>
                            </div>
                        </div>
                        <div class="brand-right-items">
                            <div class="brand-item">
                                <a href="">
                                    <img src="https://media.hcdn.vn/hsk/brand/PG-Image-Cover1660037234_img_190x190_30c310_fit_center.jpg"
                                         alt="">
                                </a>
                            </div>
                            <div class="brand-item">
                                <a href="">
                                    <img src="https://media.hcdn.vn/hsk/brand/Skin1004500x5001621936139_img_190x190_30c310_fit_center.jpg"
                                         alt="">
                                </a>
                            </div>
                        </div>
                        <div class="brand-right-items">
                            <div class="brand-item">
                                <a href="">
                                    <img src="https://media.hcdn.vn/brand/1615522660bio2_img_190x190_30c310_fit_center.jpg"
                                         alt="">
                                </a>
                            </div>
                            <div class="brand-item">
                                <a href="">
                                    <img src="https://media.hcdn.vn/brand/1607579699vichy2_img_190x190_30c310_fit_center.jpg"
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
                                    <span class="review-count">(50 đánh giá)</span>
                                </div>
                                <p class="purchase-count">Đã bán: 1000 sản phẩm</p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
            <button onclick="loadMore()" id="loadmore1">Xem thêm</button>
        </div>
        <jsp:include page="footer.jsp"></jsp:include> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script src="js/index.js"></script>
        <script src="js/login_logout.js"></script>
    </body>

    <script>
                function loadMore() {
                    var count = document.getElementsByClassName("product-count").length;
                    $.ajax({
                        url: "/BaiTapLonLTWEB/home",
                        type: "post", //send it through get method
                        data: {
                            amount: count
                        },
                        success: function (data) {
                            var row = document.getElementById("suggest-product");
                            row.innerHTML += data;
                        },
                        error: function (xhr) {
                            //Do Something to handle error
                        }
                    });
                }

                function logout()
                {

                    history.replaceState(null, '', 'index.jsp');
                    window.location.href = 'logout';
                    // Thay 'login.html' bằng đường dẫn của trang đăng nhập hoặc trang nào bạn muốn chuyển đến sau khi đăng xuất.
                }

    </script> 

</html>

