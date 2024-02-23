<%-- 
    Document   : product_detail
    Created on : Jan 3, 2024, 2:14:18 AM
    Author     : luong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
        <!--<link rel="stylesheet" href="./css/slick.css" type="text/css" />-->
        <link rel="stylesheet" href="./css/index.css" type="text/css"/>
        <link rel="stylesheet" href="./css/login_logout1.css" type="text/css"/>
        <link rel="stylesheet" href="./css/product_detail.css" type="text/css"/>
    </head>
    <body>
        <jsp:include page="index_bar.jsp"></jsp:include>
            <div class="container">

                <div class="product-box">
                    <div>Sản phẩm</div>
                    <div class="container-fliud">
                        <div class="wrapper row">
                            <div class="preview">

                                <div class="preview-pic tab-content">
                                    <div class="tab-pane.active" id="pic-1"><img src=${productDetail.image} />
                                </div>
                            </div>
                            <ul class="ul-img">
                                <c:forEach items="${productDetail.getImagesDetail()}" var="image">
                                    <li>
                                        <a data-lightbox="productGallery" data-title="Product Image" onclick="showImage('${image.getPath()}')">
                                            <img src="${image.getPath()}" alt="Product Image" />
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="details col-md-6 d-flex justify-content-center" style="margin-top: 25px">
                            <h2 class="product-title" >${productDetail.name}</h2>
                            <div class="rating">
                                <div class="stars">
                                    <c:set var="roundedVote" value="${Math.round(productDetail.getVote())}"/>

                                    <c:forEach var="i" begin="1" end="5">
                                        <span class="fa fa-star ${i le roundedVote ? 'checked' : ''}"></span>
                                    </c:forEach>
                                </div>
                                <span class="review-no"></span>
                            </div>
                            <h5 class="sizes">sizes:
                                <span class="size" data-toggle="tooltip" title="small">${productDetail.getSize()}</span>
                            </h5>
                            <p class="product-description">${productDetail.getDescription()}</p>
                            <p>Thương hiệu: ${productDetail.getBrand()}</p>

                            <h3 class="price">Giá <span class= "original-price">${productDetail.getPrice()} </span></h3>
                            <h3 class="price">KM <span class="discounted-price">${productDetail.getDiscountPrice()}</span></h3>
                            <p>Ðã bán: ${productDetail.getSold()} Sản phẩm</p>
                            <p>Còn lại: ${productDetail.getQuantity()} Sản phẩm</p>
                            <div class="action">
                                <button class="add-to-cart" type="button">
                                    <a href="add_product_to_cart?Id=${productDetail.getId()}">Thêm vào giỏ hàng</a>
                                </button>

                            </div>
                        </div> 
                    </div>
                </div>
                <div class="card">
                    <nav class="nav-tabs" role="tablist">
                        <li role="presentation" class="tab-li active">
                            <a href="#ttsp" aria-controls="ttsp" role="tab" data-toggle="tab">Thông tin sản phẩm</a>
                        </li>
                        <li role="presentation" class="tab-li">
                            <a href="#tssp" aria-controls="tssp" role="tab" data-toggle="tab" class="tab-li">Thông số sản phẩm</a>
                        </li>
                        <li role="presentation" class="tab-li">
                            <a href="#tpsp" aria-controls="tpsp" role="tab" data-toggle="tab" class="tab-li">Thành phần sản phẩm</a>
                        </li>
                        <li role="presentation" class="tab-li">
                            <a href="#hdsd" aria-controls="hdsh" role="tab" data-toggle="tab">Hướng dẫn sử dụng</a>
                        </li>
                    </nav>
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="ttsp">${productDetail.description}</div>
                        <div role="tabpanel" class="tab-pane " id="tssp">
                            Name: ${productDetail.name}<br> 
                            Size: ${productDetail.size} <br> 
                            Type Skin: ${productDetail.typeskin}<br>
                            Origin: ${productDetail.origin}<br>
                            Characteris: ${productDetail.characteris}
                        </div>
                        <div role="tabpanel" class="tab-pane" id="tpsp">${productDetail.getIngredient()}</div>
                        <div role="tabpanel" class="tab-pane" id="hdsd">${productDetail.getInstruct()}</div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script src="./js/index.js"></script>
        <script src="./js/login_logout.js"></script>
        <script>
                                            $(document).ready(function () {
                                                $('.nav-tabs a').on('click', function (e) {
                                                    e.preventDefault();
                                                    $('.nav-tabs li').removeClass('active');
                                                    $('.tab-pane').removeClass('active');
                                                    $(this).parent('li').addClass('active');
                                                    $($(this).attr('href')).addClass('active');
                                                });
                                            });
        </script>
        <script>
            function showImage(imageUrl) {
                var imageElement2 = document.createElement('img');
                imageElement2.src = imageUrl;
                Lightbox.show(imageElement2);
            }
            class Lightbox {
                static activate() {
                    document.body.insertAdjacentHTML("beforeend", `
            <div class="lightbox" id="lightbox" style="display: none;">
                <div class="lightbox__inner">
                    <button type="button" class="lightbox__close">
                        &times;
                    </button>
                    <div class="lightbox__content"></div>
                </div>
            </div>`);

                    const lightBox = document.querySelector("#lightbox");
                    const btnClose = lightBox.querySelector(".lightbox__close");
                    const content = lightBox.querySelector(".lightbox__content");
                    const closeLightbox = () => {
                        lightBox.style.display = "none";
                        content.innerHTML = "";
                    };

                    lightBox.addEventListener("mousedown", e => {
                        if (e.target.matches("#lightbox")) {
                            closeLightbox();
                        }
                    });

                    btnClose.addEventListener("click", () => {
                        closeLightbox();
                    });
                }

                static show(htmlOrElement) {
                    const content = document.querySelector("#lightbox .lightbox__content");

                    document.querySelector("#lightbox").style.display = null;

                    if (typeof htmlOrElement === "string") {
                        content.innerHTML = htmlOrElement;
                    } else {
                        content.innerHTML = "";
                        content.appendChild(htmlOrElement);
                    }
                }
            }
            Lightbox.activate();
        </script>
    </body>

</html>
