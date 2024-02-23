<%-- 
    Document   : edit_address
    Created on : Jan 1, 2024, 7:49:21 AM
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
        <link rel="stylesheet" href="./css/footer214.css">
        <link rel="stylesheet" href="./css/dathang214.css">
        <link rel="stylesheet" href="./css/information.css">


    </head>
    <style>
        .item_info_check {
            display: inline-block;
            width: 15px;
            height: 15px;
            border: 1px solid #999;
            border-radius: 50%;
            position: absolute;
            top:0;
            left: 0;

            padding: 3px;
        }
        .item_info_check span {
            height: 14px;
            width: 14px;
            border-radius: 50%;
            display: inline-block;



        }
        .item_info_set {
            display: inline-block;
            width: 15px;
            height: 15px;
            border: 1px solid #999;
            border-radius: 50%;

            margin-left: -15px;
            padding: 3px;
        }
        .item_info_set span {
            height: 14px;
            width: 14px;
            border-radius: 50%;
            display: inline-block;
            margin-left: 1px;




        }


        .active {
            background-color:  #f60;
        }
    </style>

    <body>
        
        <form id="block_information_sub" action="" method="POST">
            <%--<jsp:include page="index_bar.jsp"></jsp:include>--%>
            <div id="checkout_page" class="main_page">
                <div class="header_booking">
                    <div class="container">
                        <a class="ElaineCosmestic">ElaineCosmestic</a>
                        <div class="block_right_step active_4">
                            <div class="step_item step_1">
                                <span>1</span>
                                Đăng nhập
                            </div>
                            <div class="step_item step_2">
                                <span>2</span>
                                Thông tin nhận hàng
                            </div>
                            <div class="step_item step_3">
                                <span>3</span>
                                Hình thức vận chuyển
                            </div>
                            <div class="step_item step_4">
                                <span>4</span>
                                Thanh toán
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content_information">

                    <strong>Thông tin nhận hàng</strong>
                    <c:forEach items="${requestScope.informationlist}" var="info">

                        <div class="content_info">


                            <div class="title_block_checkout">
                                <div class="left">

                                </div>
                                <div class="right" >
                                    <a >Sửa</a>
                                </div>
                            </div>
                            <div class="block_info_container">
                                <div class="content_thongtin"  >
                                    <div class="space_bottom_5">
                                        <span class="status_lienhe">Liên hệ</span>
                                        <strong> ${info.getName()} - ${info.getPhone()}</strong>
                                    </div>
                                    <div class="text_diachi">
                                        ${info.getAddresString()}
                                    </div>

                                </div>
                                <div class="item_info_check" >
                                    <span class="stick ${info.getAddress().getDescription()=="1"?"active":""}" click="check()">&nbsp;</span>
                                    <input  id="idinfo" name="idinfo" class="form-control" type="hidden" value="${info.getId()}">
                                </div>



                                <a class="txt_del_info" href="deleteaddress?idinfo=${info.getId()}">
                                    <img src="https://hasaki.vn/wap-static/images/graphics/trash_close.svg" style="margin-top:10px">
                                </a>

                            </div>

                        </div>
                    </c:forEach>


                </div>
                <div class="content_information_fill">
                    <div class="col-md-9 style=" margin-right: 40px;>



                        <h3>Bạn muốn giao hàng đến địa chỉ khác</h3>
                        <div class="add_new_address">
                            <a class="btn_xemthem_tittle">+ Thêm địa chỉ mới</a>
                        </div>
                        <div class="block_add_new" style="display:none">
                            <div class="form-group">

                                <input type="text1" name="CustomerName" class="form-control" autocomplete="off"
                                       placeholder="Vui lòng nhập họ tên">
                            </div>
                            <div class="form-group">

                                <input type="text1" name="Phone" class="form-control" autocomplete="off"
                                       placeholder="Vui lòng nhập số điện thoại nhận hàng">
                            </div>
                            <div class="form-group">

                                <select class="form-control" name="province" id="province">
                                    <option value>Chọn khu vực</option>
                                    <option value="1">Hà Nội</option>




                                </select>
                            </div>
                            <div class="form-group">

                                <select class="form-control" name="district" id="district">
                                    <option value>Chọn quận huyện</option>
                                    <option value="1">Quận Ba Đình</option>
                                    <option value="2">Quận Bắc Từ Liêm</option>
                                    <option value="3">Quận Cầu Giấy</option>
                                    <option value="4">Quận Đống Đa</option>
                                    <option value="5">Quận Hà Đông</option>
                                    <option value="6">Quận Hai Bà Trưng</option>
                                    <option value="7">Quận Hoàn Kiếm</option>
                                    <option value="8">Quận Hoàng Mai</option>
                                    <option value="9">Quận Long Biên</option>
                                    <option value="10">Quận Nam Từ Liêm</option>
                                    <option value="11">Quận Tây Hồ</option>
                                    <option value="12">Quận Thanh Xuân</option>
                                    <option value="13">Thị xã Sơn Tây</option>
                                    <option value="14">Huyện Ba Vì</option>
                                    <option value="15">Huyện Chương Mỹ</option>
                                    <option value="16">Huyện Đan Phượng</option>
                                    <option value="17">Huyện Đông Anh</option>
                                    <option value="18">Huyện Gia Lâm</option>
                                    <option value="19">Huyện Hoài Đức</option>
                                    <option value="20">Huyện Mê Linh</option>
                                    <option value="21">Huyện Mỹ Đức</option>
                                    <option value="22">Huyện Phú Xuyên</option>
                                    <option value="23">Huyện Phúc Thọ</option>
                                    <option value="24">Huyện Quốc Oai</option>
                                    <option value="25">Huyện Sóc Sơn</option>
                                    <option value="26">Huyện Thạch Thất</option>
                                    <option value="27">Huyện Thanh Oai</option>
                                    <option value="28">Huyện Thanh Trì</option>
                                    <option value="29">Huyện Thường Tín</option>
                                    <option value="30">Huyện Ứng Hòa</option>



                                </select>
                            </div>
                            <div class="form-group">

                                <input type="text1" name="phuongxa" class="form-control" autocomplete="off"
                                       placeholder="Phường / Xã">
                            </div>
                            <div class="form-group">

                                <input type="text1" name="street" class="form-control" autocomplete="off"
                                       placeholder="Tên đường">
                            </div>

                            <div class="form-group">

                                <input type="text1" name="sonha" class="form-control" autocomplete="off"
                                       placeholder="Số nhà  ">
                            </div>
                            <div class="content_thongtin">
                                <div class="space_bottom_5">
                                    <div class="item_info_set">
                                        <span  >&nbsp;</span>
                                        <input  id="macdinh" name="macdinh" class="form-control" type="hidden" >
                                    </div>
                                    <span> Đặt làm địa chỉ mặc định</span>
                                </div>

                            </div>
                        </div>

                        <div class="button-group" style="margin-top: 20px">

                            <input  id="idinfoset" name="idinfoset" class="form-control" type="hidden" >
                            <a href="${requestScope.informationlist!=null?'checkout':'home'}"<button class="btn btn_site_cancel" href="checkout">Trở lại</button>
                            </a>

                            <button  onclick="setAction('addnewaddress')" class="btn btn_site_update"> Thêm địa chỉ</button>
                            <button onclick="setAction('checkout')" class="btn btn_site_update"> xác nhận</button>

                        </div>


                    </div>
                </div>




            </div>
        </form>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script>

                                 const xemthem = document.querySelector('.btn_xemthem_tittle');
                                 const themmoi = document.querySelector('.block_add_new');

                                 xemthem.addEventListener('click', () => {
                                     themmoi.style.display = 'block';


                                 });


        </script>
        <script>
            const chonitem = document.querySelectorAll('.item_info_check span');
            const idsend = document.querySelector('#idinfoset');
            Array.from(chonitem).forEach(function (element) {
                console.log(element)
                element.addEventListener('click', function (event) {

                    for (let i = 0; i < chonitem.length; i++)
                    {
                        chonitem[i].classList.remove('active');
                    }

                    this.classList.add('active');
                    if (this.classList.contains('active'))
                    {
                        var parentDiv = this.parentNode;

                        var inputInfo = parentDiv.querySelector("#idinfo");
                        idsend.value = inputInfo.value;
                        console.log(idsend.value);



                    }
                    console.log('--------------------');


                });



            });




        </script>
        <script>
            const choniteset = document.querySelector('.item_info_set span');


            choniteset.addEventListener('click', () => {
                if (choniteset.classList.contains("active")) {
                    var parentDiv = choniteset.parentNode;

                    var inputInfo = parentDiv.querySelector("#macdinh");
                    inputInfo.value = "0";
                    console.log(inputInfo.value);


                    choniteset.classList.remove("active");
                } else {
                    var parentDiv = choniteset.parentNode;

                    var inputInfo = parentDiv.querySelector("#macdinh");
                    inputInfo.value = "1";
                    console.log(inputInfo.value);
                    choniteset.classList.add("active");
                }




            });


        </script>
        <script>
            function setAction(actionType) {
                // Lấy thẻ form
                var myForm = document.getElementById('block_information_sub');
                console.log(myForm);

                // Thiết lập action tùy thuộc vào loại hành động

                myForm.action = actionType;  // Thay đổi thành URL của Servlet add


                // Gửi form nếu bạn muốn tự động gửi form sau khi set action
                // myForm.submit();
            }
        </script>
    </body>

</html>