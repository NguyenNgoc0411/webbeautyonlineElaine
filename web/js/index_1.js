/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

const listImage = document.querySelector('.list-images');
const imgs = document.getElementsByClassName('slide1-img');
const btnLeft = document.querySelector('.btn-left');
const btnRight = document.querySelector('.btn-right');
const length = imgs.length;
let current = 0;

const handleChangeSlide = () => {
    if (current == length - 1) {
        current = 0;
        let width = 800;
        listImage.style.transform = `translateX(0px)`;
        document.querySelector('.active').classList.remove('active');
        document.querySelector('.index-item-' + current).classList.add('active');

    } else {
        current++;
        let width = 800;
        listImage.style.transform = `translateX(${width * -1 * current}px)`;
        document.querySelector('.active').classList.remove('active');
        document.querySelector('.index-item-' + current).classList.add('active');
    }
};

let handleEventChangeSlide = setInterval(handleChangeSlide, 4000);

btnRight.addEventListener('click', () => {
    clearInterval(handleEventChangeSlide);
    handleChangeSlide();
    handleEventChangeSlide = setInterval(handleChangeSlide, 4000);
});

btnLeft.addEventListener('click', () => {
    clearInterval(handleEventChangeSlide);
    if (current == 0) {
        current = length - 1;
        let width = 800;
        listImage.style.transform = `translateX(${width * -1 * current}px)`;
        document.querySelector('.active').classList.remove('active');
        document.querySelector('.index-item-' + current).classList.add('active');
    } else {
        current--;
        let width = 800;
        listImage.style.transform = `translateX(${width * -1 * current}px)`;
        document.querySelector('.active').classList.remove('active');
        document.querySelector('.index-item-' + current).classList.add('active');
    }
    handleEventChangeSlide = setInterval(handleChangeSlide, 4000);
});

// đếm thời gian ở sale-box
document.addEventListener('DOMContentLoaded', function () {
    // Ngày đến hạn
    var targetDate = new Date('2023-12-27 18:00:00');

    var daysElement = document.getElementById('days');
    var hoursElement = document.getElementById('hours');
    var minutesElement = document.getElementById('minutes');
    var secondsElement = document.getElementById('seconds');

    // Cập nhật bộ đếm mỗi giây
    var countdown = setInterval(function () {
        var currentDate = new Date();
        var timeRemaining = targetDate - currentDate;

        var days = Math.floor(timeRemaining / (1000 * 60 * 60 * 24));
        var hours = Math.floor((timeRemaining % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((timeRemaining % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((timeRemaining % (1000 * 60)) / 1000);

        // Cập nhật giao diện người dùng
        daysElement.textContent = padZero(days);
        hoursElement.textContent = padZero(hours);
        minutesElement.textContent = padZero(minutes);
        secondsElement.textContent = padZero(seconds);

        // Kiểm tra nếu đã đến thời điểm đếm ngược kết thúc
        if (timeRemaining <= 0) {
            clearInterval(countdown);
            document.getElementById('countdown').textContent = 'Hết thời gian!';
        }
    }, 1000);

    function padZero(number) {
        return (number < 10) ? '0' + number : number;
    }
});

// hot sale slick 

$(document).ready(function () {
    $(".product-slider").slick({
        slidesToShow: 5, // hiển thị 5 cái
        slidesToScroll: 1, // cuộn 1 cái
        infinite: false, // chạy vô tận
        arrows: true, // bật tắt phím mũi tên
        draggable: false, // bật tắt dùng chuột kéo
        prevArrow: `<button type='button' class='slick-prev slick-arrow'><i class='fa-solid fa-angle-left fa-2xl'></i></button>`,
        nextArrow: `<button type='button' class='slick-next slick-arrow'><i class='fa-solid fa-angle-right fa-2xl'></i></button>`,
        dots: true,
        responsive: [
            {
                breakpoint: 1025,
                settings: {
                    slidesToShow: 4,
                },
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    arrows: false,
                    infinite: false,
                },
            },
        ],
        autoplay: true,
        autoplaySpeed: 3000
    });
});

//  category slide

$(document).ready(function () {
    $(".category-slide").slick({
        slidesToShow: 8,
        slidesToScroll: 4,
        infinite: true,
        arrows: true,
        draggable: false,
        prevArrow: `<button type='button' class='slick-prev slick-arrow'><i class='fa-solid fa-angle-left fa-2xl'></i></button>`,
        nextArrow: `<button type='button' class='slick-next slick-arrow'><i class='fa-solid fa-angle-right fa-2xl'></i></button>`,
        responsive: [
            {
                breakpoint: 1025,
                settings: {
                    slidesToShow: 4,
                },
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    arrows: false,
                    infinite: false,
                },
            },
        ],
        autoplay: true,
        autoplaySpeed: 3000
    });
});

// Gán màu ngẫu nhiên cho category slide
document.addEventListener('DOMContentLoaded', function () {
    const items = document.querySelectorAll('.category-item');

    // Danh sách màu cố định
    const colorList = ['#ffc2b8', '#fee686', '#fec5e6', '#deb5d7', '#bfaee3'];

    items.forEach(item => {
        // Chọn một màu ngẫu nhiên từ danh sách
        const randomColor = colorList[Math.floor(Math.random() * colorList.length)];

        // Áp dụng màu đã chọn làm màu nền cho mỗi phần tử
        item.style.backgroundColor = randomColor;
    });
});

// brand category

$(document).ready(function () {
    $(".list-brand-left").slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        infinite: true,
        arrows: true,
        draggable: false,
        prevArrow: `<button type='button' class='slick-prev slick-arrow'><i class='fa-solid fa-angle-left fa-2xl'></i></button>`,
        nextArrow: `<button type='button' class='slick-next slick-arrow'><i class='fa-solid fa-angle-right fa-2xl'></i></button>`,
        dots: true,
        // responsive: [
        //     {
        //         breakpoint: 1025,
        //         settings: {
        //             slidesToShow: 4,
        //         },
        //     },
        //     {
        //         breakpoint: 480,
        //         settings: {
        //             slidesToShow: 1,
        //             arrows: false,
        //             infinite: false,
        //         },
        //     },
        // ],
        autoplay: true,
        autoplaySpeed: 3000
    });
});

// list-brand-right
$(document).ready(function () {
    $(".list-brand-right").slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        infinite: true,
        arrows: true,
        draggable: false,
        prevArrow: `<button type='button' class='slick-prev slick-arrow'><i class='fa-solid fa-angle-left fa-2xl'></i></button>`,
        nextArrow: `<button type='button' class='slick-next slick-arrow'><i class='fa-solid fa-angle-right fa-2xl'></i></button>`,
        // dots: true,
        // responsive: [
        //     {
        //         breakpoint: 1025,
        //         settings: {
        //             slidesToShow: 4,
        //         },
        //     },
        //     {
        //         breakpoint: 480,
        //         settings: {
        //             slidesToShow: 1,
        //             arrows: false,
        //             infinite: false,
        //         },
        //     },
        // ],
        autoplay: true,
        autoplaySpeed: 3000
    });
});


