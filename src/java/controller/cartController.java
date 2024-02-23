/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAO;
import model.Product;
import model.ProductCart;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Cart;

/**
 *
 * @author luong
 */
public class cartController extends HttpServlet {

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
        Cookie[] cookies = request.getCookies();
        String data = "";
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                // Kiểm tra nếu tên cookie là "cart"
                if (cookie.getName().equals("cart")) {
                    data = cookie.getValue();
                }
            }
        }
        String[] listIdProduct = data.split("\\|");
        List<Product> list = new ArrayList<>();
        List<ProductCart> listCardProducts = new ArrayList<>();
        // Tạo một Map để lưu trữ số lượng xuất hiện của từng phần tử
        Map<String, Integer> demPhanTu = new HashMap<>();

        // Đếm số lượng xuất hiện của từng phần tử trong danh sách
        for (String phanTu : listIdProduct) {
            demPhanTu.put(phanTu, demPhanTu.getOrDefault(phanTu, 0) + 1);
        }

        for (Map.Entry<String, Integer> i : demPhanTu.entrySet()) {
//            System.out.println("Phan tu: " + i.getKey() + ", So luong: " + i.getValue());
            if (!i.getKey().isEmpty()) {
                Product p = dao.getProductbyId(i.getKey());
                list.add(p);
                ProductCart c = new ProductCart(i.getValue(), p);
                listCardProducts.add(c);
            }
        }
        Cart cart = new Cart(listCardProducts);
        
        request.setAttribute("cartProducts", cart);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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
