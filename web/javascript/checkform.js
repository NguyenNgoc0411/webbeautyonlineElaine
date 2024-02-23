/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


    var email=document.getElementById('email');

var phone=document.getElementById('phone');
var password=document.getElementById('reg_password');
var fullname=document.getElementById('fullname');
const msg=document.querySelector('#form_register .form_message');
const mess=document.querySelector('#register .form_group');
var form=document.getElementById('form_register');
var formlogin=document.getElementById('form_login');

var username=document.getElementById('username');
var password=document.getElementById('password');
function showError(input,message)
{ let parent= input.parentElement;
    console.log(parent);
  
   let form_message=parent.querySelector('span');
   parent.classList.add('invalid');
   form_message.innerHTML=message;

   

   


}


function showSuccess(input)
{let parent= input.parentElement;
   let form_message=parent.querySelector('span');
   parent.classList.remove('invalid');
   form_message.innerHTML="";

}


function checkEmptyError(listInput)

{  let idEmptyError=false;
   listInput.forEach(input => {
      input.value=input.value.trim()
      if(!input.value)
      { isEmptyError=true;
         showError(input,'Vui lòng hoàn thiện nội dung')
      }
      else{
         showSuccess(input);
      }
      
   });
   return isEmptyError;
}
function checkEmail(input)
{ const regexEmail=/^[A-Za-z0-9](([a-zA-Z0-9,=\.!\-#|\$%\^&\*\+/\?_`\{\}~]+)*)@(?:[0-9a-zA-Z-]+\.)+[a-zA-Z]{2,9}$/;
 input.value=input.value.trim(); 
   if(regexEmail.test(input.value)){
      showSuccess(input);
   }
   else
   {
      showError(input,'Không hợp lệ');
   }
   return regexEmail.test(input.value);

}
function checkLengthError(input,min,max) {

   input.value=input.value.trim();
   if(input.value.length<min)
   {
      showError(input,'Nhập ít nhất 6 kí tự');
      return true;
   }
   else if(input.value.length>max)
   {
      showError(input,'Không nhập vượt quá 10 kí tự');
      return true;
   }
   else
   {
      showSuccess(input);
   }
   return false;
}
function checkLengthPhone(input)
{
    input.value=input.value.trim();
    if(input.value.length!=10)
    {
        showError(input,'Số điện thoại không hợp lệ');
        return true;
    }
    return false;
}
form.addEventListener('submit',function(e){
   console.log('hi')
           

   
    let isEmptyError=checkEmptyError([email,phone,fullname,password]);
    let isEmail=checkEmail(email);
    let passError=checkLengthError(password,6,10);
    let lphone=checkLengthPhone(phone);
    if(isEmptyError||isEmail||passError||lphone)
    {
        e.preventDefault();
    }
    else{
        
    }

});


formlogin.addEventListener('submit',function(e)
{       
    console.log("hi");
  
    let isEmptyErrorLogin=checkEmptyError([username]);
    if(isEmptyErrorLogin)
    { 
        e.preventDefault();
    }
    else
    {
        
    }
    
    
});
