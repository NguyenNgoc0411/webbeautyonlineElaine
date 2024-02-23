/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.userDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.User;

/**
 *
 * @author 2021
 */
@WebServlet(name="registerServlet", urlPatterns={"/register"})
public class registerController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        String httpMethod= request.getMethod();
        if(httpMethod.equals("POST"))
        {   userDAO ud=new userDAO();
            String emailString= request.getParameter("email");
            String phoneString= request.getParameter("phone");
         String passwordString= request.getParameter("password");
          String fullnameString= request.getParameter("fullname");
         String sexString= request.getParameter("gender");
         String dayString= request.getParameter("popupyear")+"-"+request.getParameter("popupmonth")+"-"+request.getParameter("popupdate");
//         
//          
             SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd");
             Date dateu=format.parse(dayString);
          
         
          
            Account a= new Account(phoneString,passwordString,2);
            
            int x=ud.countraw();
             
        String iduser = "U"+String.format("%03d", x);
        User u= new User(iduser,fullnameString,dateu,emailString,phoneString,sexString,a);
       
             
          
//       String fullnameString="ngoc";

     
//         String dayString= "2002"+"-"+"12"+"-"+"10";
//         
//          
//             SimpleDateFormat format1= new SimpleDateFormat("yyyy-MM-dd");
//             Date dateuu=format1.parse(dayString);
            
             
       
        if(sexString.compareTo("1")==0)
        {
            sexString="Nam";
            
        }
        else
        {
            sexString="Nữ";
        }
      
       
            
            request.setCharacterEncoding("UTF-8");
            
           
            
            Account acheck= ud.getAccount(phoneString);
            request.setAttribute("user1", u);
                   if(acheck==null&& ud.checkEmail(phoneString).compareTo(emailString)!=0)
            {
                
              ud.insertUser(u);
                
                response.sendRedirect("login");
                
            }
            else
            {
                request.setAttribute("error","Số điện thoại hoặc email đã tồn tại");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
  
        
    }
        else {request.getRequestDispatcher("register.jsp").forward(request, response);}
        
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(registerController.class.getName()).log(Level.SEVERE, null, ex);
        }

          
        
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(registerController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
