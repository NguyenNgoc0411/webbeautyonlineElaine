/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


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

formlogin.addEventListener('submit',function(e)
{       
    console.log("hi");
   
    let isEmptyErrorLogin=checkEmptyError([username,password]);
    if(isEmptyErrorLogin)
    { 
        e.preventDefault();
    }
    else
    {
        
    }});