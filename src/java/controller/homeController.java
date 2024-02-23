/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAO;
import model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author luong
 */
public class homeController extends HttpServlet {

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
//        response.setContentType("text/html;charset=UTF-8");
        DAO dao = new DAO();
        request.setAttribute("AllCategories", dao.getAllCategories());
        request.getRequestDispatcher("index.jsp").forward(request, response);
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
        DAO dao = new DAO();
        int count = Integer.parseInt(request.getParameter("amount"));
        List<Product> list = dao.getNext6Products(count);
        PrintWriter out = response.getWriter();
        for (Product p : list) {
            out.println("<div class=\"product-item product-count\">\n" +
"                        <a href=\"product_detail?productId="+p.getId()+"\">\n" +
"                            <div class=\"product-image \">\n" +
"                                <img src=\""+p.getImage()+"\" alt=\"Product Image\">\n" +
"                            </div>\n" +
"                            <div class=\"product-details\">\n" +
"                                <div class=\"product-price\">\n" +
"                                    <div class=\"original-price\">" + p.getPrice() + "đ</div>\n" +
"                                    <div class=\"discounted-price\">" + p.getDiscountPrice() + "đ</div>\n" +
"                                </div>\n" +
"                                <div class=\"product-description\">" + p.getName() +"\n" +
"                                </div>\n" +
"                                <div class=\"product-rating\">\n" +
"                                    <span class=\"stars\">★★★★★</span>\n" +
"                                    <span class=\"review-count\">(50 đánh giá)</span>\n" +
"                                </div>\n" +
"                                <p class=\"purchase-count\">Đã bán: 1000 sản phẩm</p>\n" +
"                            </div>\n" +
"                        </a>\n" +
"                    </div>");
        }
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
