/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const clientlogin=document.getElementById('client_login');
const container_dalogin = document.getElementById('da_login_container');

console.log('hi')

container_dalogin.addEventListener('mouseover',()=>{
   clientlogin.classList.add('show');




});
container_dalogin.addEventListener('mouseout',()=>{
clientlogin.classList.remove('show');




});
