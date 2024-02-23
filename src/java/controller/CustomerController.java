/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.CustomerDAO;
import DAO.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import model.Customer;
import model.User;

/**
 *
 * @author 2021
 */
@WebServlet(name="CustomerController", urlPatterns={"/customercontrol"})
public class CustomerController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CustomerController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
//        CustomerDAO customerDAO = new CustomerDAO();
//		HttpSession httpSession = request.getSession();
//		Customer custumer = (Customer) httpSession.getAttribute("customer");
//		Customer custumer2 = .getUserByID(custumer.getId());
//		request.setAttribute("customer", custumer2);
		request.getRequestDispatcher("trang.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        String ten = request.getParameter("ten");
        String gender = request.getParameter("gender");
        String ngay = request.getParameter("ngay");
        String thang = request.getParameter("thang");
        String nam = request.getParameter("nam");
       CustomerDAO customerDAO = new CustomerDAO();
        String dateString = nam + "-" + thang + "-" + ngay;
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        
        try {
            // Chuyển đổi chuỗi thành đối tượng Date
             Date dateu = dateFormat.parse(dateString);

            // Chuyển đối tượng java.util.Date thành đối tượng java.sql.Date
           
            HttpSession httpSession = request.getSession();
    		Customer custumer = (Customer) httpSession.getAttribute("customer");
                Customer neww= new Customer(custumer.getId(), ten, dateu, email,custumer.getPhone(),gender );
               User h= (User) httpSession.getAttribute("userht");
             
            customerDAO.updateCustomer(neww);
            custumer.setEmail(email);
            custumer.setName(ten);
            custumer.setDate(dateu);
            custumer.setSex(gender);
           h.setEmail(email);
            h.setName(ten);
            h.setDate(dateu);
            h.setSex(gender);
          
            
            response.sendRedirect("customercontrol");
        } catch (ParseException e) {
            e.printStackTrace();
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
