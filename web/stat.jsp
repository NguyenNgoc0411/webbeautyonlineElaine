<%-- 
    Document   : stat.jsp
    Created on : Dec 31, 2023, 11:04:44 PM
    Author     : DUC TOAN
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <meta charset="UTF-8">
        <title>Statitic</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <!--<script src="./js/stat.js"></script>-->
        <link rel="stylesheet" href="./css/stat.css" type="text/css"/>
        <style>

            /* Thanh điều khiển */
            .admin-bar {
                position: fixed;
                top: 0;
                left: 0;
                width: 200px;
                height: 100vh;
                /* Chiều cao đầy đủ màn hình */
                background-color: #444;
                /* Màu nền tối */
                color: #fff;
                /* Màu chữ trắng */
                padding: 20px;
                border-right: 1px solid #ccc;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                /* Thêm bóng đổ */
            }

            .admin-bar h1 {
                margin-bottom: 20px;
            }

            .admin-bar ul {
                list-style: none;
                padding: 0;
            }

            .admin-bar li {
                margin-bottom: 10px;
            }

            .admin-bar a {
                color: #fff;
                text-decoration: none;
                display: block;
                /* Hiển thị liên kết thành dạng khối */
                padding: 10px;
            }

            .admin-bar a:hover {
                background-color: #555;
                /* Thay đổi màu nền khi di chuột qua */
            }

            /* Nội dung trang */
            .admin-content {
                margin-left: 220px;
                /* Thêm khoảng cách để tránh đè lên thanh điều khiển */
                padding: 20px;
            }

            .admin-content h1 {
                margin-bottom: 20px;
            }

            /* Chỉnh sửa kiểu chữ và màu sắc */
            body {
                font-family: sans-serif;
                color: #333;
            }
            .dropdown {
                position: relative;
            }

            .dropdown a {
                cursor: pointer;
            }

            .dropdown-menu {
                position: absolute;
                top: 100%;
                left: 0;
                width: 100%;
                background-color: #f1f1f1;
                display: none;
                z-index: 999;
            }

            .dropdown-menu a {
                color: #000;
                text-decoration: none;
                padding: 10px;
            }

            .dropdown-menu a:hover {
                background-color: #ddd;
            }

            .dropdown:hover .dropdown-menu {
                display: block;
            }
            .container {
                display: flex;
                grid-template-columns: 1fr 1fr 1fr;
                grid-gap: 10px;
                padding: 10px;
            }

            .column {
                padding: 10px;
                flex: 1;
                border: 1px solid black;
            }

            .column-md-6 {
                width: 50%;
            }
            #dateForm{
                padding: 15px;
                display: flex;
                margin-right: 50px;
            }
            #dateForm>label{
                padding-left: 10px;
            }
            .stat-container {
                margin: 0 auto;
                /*display: flex;*/
                padding: 20px;
                background-color: #f5f5f5;
                border-radius: 5px;
            }

            h2 {
                text-align: center;
            }

            form {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
            }

            .form-group {
                margin: 10px;
            }

            label {
                font-weight: bold;
            }

            input[type="date"] {
                padding: 8px;
                border-radius: 5px;
                border: 1px solid #ccc;
            }

            button[type="submit"] {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 14px;
            }

            button[type="submit"]:hover {
                background-color: #45a049;
            }
            .btn{
                padding: 10px 20px;
                background-color: #4CAF50;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 14px;
            }
            #TKproductTlb,
            #TKOrderTlb {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                padding: 20px;
                /*border-collapse: collapse;  Gộp các đường viền của các ô của bảng */
                border: 1px solid #000; /* Đường viền 1 pixel và màu đen */
                /*display: block;*/
            }

            #TKproductTlb th,
            #TKproductTlb td,
            #TKOrderTlb th,
            #TKOrderTlb td {
                padding: 10px;
                border: 1px solid #000;
                text-align: center;
                align-items: center;
            }

            #TKproductTlb th,
            #TKOrderTlb th {
                background-color: #f2f2f2;
                color: #444;
            }

            #TKproductTlb td,
            #TKOrderTlb td {
                border-bottom: 1px solid #000;
            }

            #TKproductTlb tr:hover,
            #TKOrderTlb tr:hover {
                background-color: #f9f9f9;
            }

            #revenue,
            #orderCounter {
                font-weight: bold;
                margin: 10px 0;
                text-align: center;
            }
            .stat-info {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
            }

            .stat-label {
                font-weight: bold;
                margin-right: 10px;
            }

            #revenue,
            #orderCounter {
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="admin-bar">
            <h1>Admin Bar</h1>
            <ul>
                <li><a href="admin">Trang chủ</a></li>
                <li><a href="#">Quản lý người dùng</a></li>
                <li><a href="#">Quản lý khách hàng</a></li>
                <li><a href="#">Quản lý khuyến mãi</a></li>
                <li class="dropdown">
                    <a href="#">Quản lý sản phẩm</a>
                    <ul class="dropdown-menu">
                        <li><a href="add_product">Thêm sản phẩm</a></li>
                        <li><a href="edit_product">Sửa sản phẩm</a></li>
                        <li><a href="#">Xóa sản phẩm</a></li>
                    </ul>
                </li>

                <li><a href="#">Quản lý đơn hàng</a></li>
                <li><a href="#">Thống kê</a></li>
                <li><a href="#">Thông tin cá nhân</a></li>
                <li><a href="#">Đổi mật khẩu</a></li>
                <li><a href="#">Đăng xuất</a></li>
            </ul>
        </div>
        <div class="admin-content">
            <div class="container">
                <div class="column">
                    <h3>Doanh thu tháng này</h3>
                    <p>${monthlyRevenue}</p>
                </div>
                <div class="column">
                    <h3>Số lượng đơn hàng trong tháng</h3>
                    <p>${billinmonth}</p>
                </div>
                <div class="column">
                    <h3>Doanh thu hôm nay</h3>
                    <p>${dailyRevenue}</p>
                </div>
                <div class="column">
                    <h3>Số lượng đơn hàng hôm nay</h3>
                    <p>${bill_today}</p>
                </div>
            </div>

            <div class="container">
                <div class="column column-md-6">
                    <h3>Khách hàng mua nhiều</h3>
                    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                    <c:forEach items="${requestScope.topCustomer}" var="c">
                        <p><strong>${c.getKey()}</strong> <p>Tổng giá trị: ${c.getValue()}</p> </p>

                    </c:forEach>
                </div>
                <div class="column column-md-6">
                    <h3>Sản phẩm doanh thu cao</h3>
                    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                    <c:forEach items="${requestScope.soldproducts}" var="c">
                        <p><strong>${c.getKey().getName()}</strong><p>Doanh thu: ${c.getValue()}</p> </p>

                    </c:forEach>
                </div>
            </div>
            <div><canvas id="myChart" ></canvas></div>

            <script>
                const xValues = ${requestScope.monthList};
                const yValues = ${requestScope.monthlyRevenueList};
                const barColors = ["red", "green", "blue", "orange", "red", "green", "blue", "orange", "red", "green", "blue", "orange", "brown"];
                new Chart("myChart", {
                    type: "bar",
                    data: {
                        labels: xValues,
                        datasets: [{
                                backgroundColor: barColors,
                                data: yValues
                            }]
                    },
                    options: {
                        legend: {display: false},
                        title: {
                            display: true,
                            text: "Doanh thu các tháng"
                        }
                    }
                });
            </script>
            <script>
                function submitForm(event) {
                    event.preventDefault();
                    clearTable("TKproductTlb");
                    var startDate = document.getElementById("startDate").value;
                    var endDate = document.getElementById("endDate").value;
                    // Gửi yêu cầu tới servlet
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "stat", true);
                    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                            var response = xhr.responseText;
                            var lines = response.split('\n');
                            const revenue = lines[0];
                            const orderCounter = lines[1];
                            document.getElementById("revenue").innerText = revenue;
                            document.getElementById("orderCounter").innerText = orderCounter;
                            for (let i = 2; i < lines.length - 1; i++) {
                                console.log(lines[i]);
                                const [id, name, revenue] = lines[i].split(':');
                                console.log(name);
                                const tableElement = document.getElementById("TKproductTlb");
                                const row = document.createElement("tr");
                                const idCell = document.createElement("td");
                                idCell.textContent = id;
                                const nameCell = document.createElement("td");
                                nameCell.textContent = name;
                                const revenueCell = document.createElement("td");
                                revenueCell.textContent = revenue;
                                const viewCell = document.createElement("td");
                                const button = document.createElement("button");
                                button.textContent = id;
                                button.style.opacity="1";
                                button.addEventListener('click', getTKOderProduct);
                                button.classList.add("btn");
                                row.appendChild(idCell);
                                row.appendChild(nameCell);
                                row.appendChild(revenueCell);
                                viewCell.appendChild(button);
                                row.appendChild(viewCell);
                                tableElement.appendChild(row);
                            }
                        }
                    };
                    var data = "startDate=" + startDate + "&endDate=" + endDate + "&action=1";
                    xhr.send(data);
                }
                function getTKOderProduct(event) {
                    event.preventDefault();
                    clearTable("TKOrderTlb");
                    var id = event.target.textContent;
                    console.log(id);
                    var startDate = document.getElementById("startDate").value;
                    var endDate = document.getElementById("endDate").value;

                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "stat", true);
                    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === XMLHttpRequest.DONE) {
                            console.log(data);
                            if (xhr.status === 200) {
                                var response = xhr.responseText;
                                var lines = response.split('\n');
                                for (let i = 0; i < lines.length - 1; i++) {
                                    console.log(lines[i]);
                                    const [id, date, name, phone, totalAmount] = lines[i].split(':');
                                    const tableElement = document.getElementById("TKOrderTlb");
                                    const row = document.createElement("tr");
                                    const idCell = document.createElement("td");
                                    idCell.textContent = id;
                                    const dateCell = document.createElement("td");
                                    dateCell.textContent = date;
                                    const nameCell = document.createElement("td");
                                    nameCell.textContent = name;
                                    const phoneCell = document.createElement("td");
                                    phoneCell.textContent = phone;
                                    const totalAmountCell = document.createElement("td");
                                    totalAmountCell.textContent = totalAmount;
                                    const button = document.createElement("button");
                                    button.textContent = id;
                                    row.appendChild(idCell);
                                    row.appendChild(dateCell);
                                    row.appendChild(nameCell);
                                    row.appendChild(phoneCell);
                                    row.appendChild(totalAmountCell);
                                    tableElement.appendChild(row);
                                }
                            }
                            console.log(responseData);
                        } else {
                            console.error('Request failed with status:', xhr.status);
                        }
                    }

                    ;
                    var data = "startDate=" + startDate + "&endDate=" + endDate + "&action=2&id=" + id;
                    console.log(data);
                    xhr.send(data);
                }
                function clearTable(tableId) {
                    var table = document.getElementById(tableId);
                    var rowCount = table.rows.length;
                    for (var i = rowCount - 1; i > 0; i--) {
                        table.deleteRow(i);
                    }
                }
            </script>
            <div class="stat-container" >
                <h2 id="header">Xem doanh thu sản phẩm</h2>

                <form id="dateForm">
                    <div class="form-group">
                        <label for="startDate">Từ ngày :</label>
                        <input type="date" id="startDate">
                    </div>
                    <div class="form-group">
                        <label for="endDate">Tới ngày:</label>
                        <input type="date" id="endDate">
                    </div>
                    <div class="form-group">
                        <button type="submit" onclick="submitForm(event)">Xem</button>
                    </div>
                </form>
                <div class="stat-info">
                    <div class="stat-label">Tổng doanh thu:</div>
                    <div id="revenue"></div>
                </div>

                <div class="stat-info">
                    <div class="stat-label">Số đơn hàng:</div>
                    <div id="orderCounter"></div>
                </div>
                <div style="align-items:center; justify-content: center;padding-bottom: 50px">
                    <table id="TKproductTlb">
                        <tr>
                            <th>Mã sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Doanh thu đạt được</th>
                            <th>Các hóa đơn</th>
                        </tr>
                    </table>
                </div>
                <div>
                    <table id="TKOrderTlb">
                        <tr>
                            <th>Mã đặt hàng</th>
                            <th>Ngày đặt hàng</th>
                            <th>Tên khách hàng</th>
                            <th>Số điện thoại</th>
                            <th>Giá trị hóa đơn</th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
