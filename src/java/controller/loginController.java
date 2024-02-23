/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.AccountDAO;
import DAO.CustomerDAO;
import DAO.InformationDAO;
import DAO.userDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import model.Account;
import model.Admin;
import model.Customer;
import model.Information;
import model.User;

/**
 *
 * @author 2021
 */
public class loginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String httpMethod = request.getMethod();
        HttpSession session = request.getSession();
        if (httpMethod.equals("POST")) {
            AccountDAO ac = new AccountDAO();
            userDAO ud = new userDAO();

            CustomerDAO cus = new CustomerDAO();
            String username = request.getParameter("username");
            String passwordString = request.getParameter("password");
            String checkString = request.getParameter("rem");
            Cookie cuCookie = new Cookie("cuser", username);
            Cookie pCookie = new Cookie("cpass", passwordString);
            Cookie crCookie = new Cookie("crem", checkString);
            if (checkString != null) {
                cuCookie.setMaxAge(60 * 60 * 24 * 7);
                pCookie.setMaxAge(60 * 60 * 24 * 7);
                crCookie.setMaxAge(60 * 60 * 24 * 7);

            } else {
                cuCookie.setMaxAge(0);
                pCookie.setMaxAge(0);
                crCookie.setMaxAge(0);

            }
            response.addCookie(cuCookie);
            response.addCookie(pCookie);
            response.addCookie(crCookie);

            Account acheck = ac.getAccountCheck(username, passwordString);
            request.setAttribute("account1", acheck);

            if (acheck == null) {
                request.setAttribute("errorLogin", "Tài khoản hoặc mật khẩu không hợp lệ");
                request.getRequestDispatcher("login.jsp").forward(request, response);

            } else {
                User x = ud.getUserCheck(username);
                session.setAttribute("userht", x);

                if (acheck.getRoleid() == 2) {
                    Customer customer = cus.getCustomerByUser(x);

                    session.setAttribute("customer", customer);
                    response.sendRedirect("tracuu");

                } else {

                    Admin ad = new Admin(x.getId(), x.getName(), x.getdDate(), x.getEmail(), x.getPhone(), x.getSex(), x.getAccount());

                    session.setAttribute("admin", ad);

//                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    response.sendRedirect("home");
                }

            }

        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
