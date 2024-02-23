/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


// const modal_block= document.getElementById('modal_block');
// const blockdisplay=document.getElementById('block_1');
// var loginblock = document.querySelector(".sub_login");
        
//  function toggleModal (e)
//  {
//     modal_block.classList.toggle('hide');
//  }      
//     modal_block.addEventListener('mouseout',toggleModal);
// // // modal_block.addEventListener('mouseout',()=>{
// // //     loginblock.style.display="none";


    

// // // });
// modal_block.addEventListener('mouseover',function(e){
// if(e.target ==e.currentTarget){
//     toggleModal()
// }
// });

const display= document.getElementById('login');
const blockdisplay=document.getElementById('block_1');
var loginblock = document.querySelector(".sub_login");


display.addEventListener('mouseover',()=>{
loginblock.classList.add('show');




});
display.addEventListener('mouseout',()=>{
loginblock.classList.remove('show');




});

const login_button= document.getElementById('login_button_1');
const btn_close1=document.querySelector('#popup_login .popup_header_login #close_btn_login');
   const modal=document.getElementById('modal');
   
   login_button.addEventListener('click',()=>{
    
    modal.classList.add('show');
    loginblock.classList.remove('show');
   }) ;
   btn_close1.addEventListener('click',()=>{
    modal.classList.remove('show');
   });

const register=document.querySelector('header .popup_register');
const register_1=document.querySelector('#modal .popup_register');
const btn_register_close=document.querySelector('#register #close_btn_register');
const login_link=document.getElementById('login_link');
const modal_register=document.getElementById('register');
const btn_register= document.getElementById('btnRegister');

function toggleModal (e)
 { modal_register.classList.add('show');
 modal.classList.remove('show');
   
 }  


register.addEventListener('click',toggleModal);
register_1.addEventListener('click',toggleModal);
login_link.addEventListener('click',()=>{
   modal.classList.add('show');
   loginblock.style.display="none";
   modal_register.classList.remove('show')

});

//btn_register_close.addEventListener('click',()=>{
//   window.location.href("trangchu.jsp");
//});


//const btnregister= document.querySelector('#register #btnRegister');
//btnregister.addEventListener('click',()=>{
//        if(${requestScope.error}!="")
//        {
//             modal_register.classList.add('show');
//        }
//
//      
//       
//   
//});



//script check dangnhap
var username=document.getElementById('username');
function showMessageError(input,message){

   let 

}
//script check dangky
var email=document.querySelector('#email');
var reg_password=document.querySelector('#reg_password');
var reg_fullname=document.querySelector('#reg_fullname');
function showErrorRegister (input,message)
{
   let MesageErrorRegister=document.querySelector('.showErrorRegister');
   MesageErrorRegister.innerHTML=message
   MesageErrorRegister.classList.add('error')
   
}
function showSuccess(input)
{
   let MesageErrorRegister=document.querySelector('.showErrorRegister');
   MesageErrorRegister.innerHTML=''
   MesageErrorRegister.classList.remove('error')
}
showErrorRegister(email,'Email hoặc số điện thoại không hợp lệ.')
showSuccess(email)