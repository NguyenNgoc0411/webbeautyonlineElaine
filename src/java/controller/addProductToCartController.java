/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Cart;
import model.Product;
import model.ProductCart;

/**
 *
 * @author luong
 */
public class addProductToCartController extends HttpServlet {

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
        String productId = request.getParameter("Id");
        // Lấy tất cả các cookie từ request
        Cookie[] cookies = request.getCookies();
        String data = "";
        String oldData = "";
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                // Kiểm tra nếu tên cookie là "username"
                if (cookie.getName().equals("cart")) {
                    data = cookie.getValue();
                    oldData = data;
                }
            }
        }
        if (data.length() > 0) {
            if (productId != null) {
                data += "|" + productId;
            } else {
                String downId = request.getParameter("downId");
                data = downProductCard(data, downId);
                System.out.println(downId);
            }
        } else {
            data = productId;
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
        DAO dao = new DAO();
        if (demPhanTu.containsKey(productId) && demPhanTu.get(productId) > dao.getQuantityProductById(productId)) {
            Cookie cookie = new Cookie("cart", oldData);

            // Thiết lập thời gian sống của cookie (ví dụ: 24 giờ)
            cookie.setMaxAge(24 * 60 * 60);
            // Thêm cookie vào response
            response.addCookie(cookie);
        } else {
            Cookie cookie = new Cookie("cart", data);

            // Thiết lập thời gian sống của cookie (ví dụ: 24 giờ)
            cookie.setMaxAge(24 * 60 * 60);
            // Thêm cookie vào response
            response.addCookie(cookie);
        }
        response.sendRedirect("cart_control");
    }

    public String downProductCard(String listId, String deleteId) {
        String[] tmp = listId.split("\\|");
        String result = "";
        ArrayList<String> danhSach = new ArrayList<>(Arrays.asList(tmp));
        danhSach.remove(deleteId);
        result = String.join("|", danhSach);
        // In danh sách sau khi xóa
        return result;
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
        String topic = request.getParameter("topic");
        if (topic.equals("UpDownCardProduct")) {
            String productId = request.getParameter("productId");
            String upDownQuantity = request.getParameter("quantity");
//            System.out.println(productId + " " + upQuantity);
            Cookie[] cookies = request.getCookies();
            String data = "";
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    // Kiểm tra nếu tên cookie là "username"
                    if (cookie.getName().equals("cart")) {
                        data = cookie.getValue();
                    }
                }
            }
            ArrayList<String> listTmp = new ArrayList<>(Arrays.asList(data.split("\\|")));
            // Tạo một Map để lưu trữ số lượng xuất hiện của từng phần tử
            Map<String, Integer> demPhanTu = new HashMap<>();

            // Đếm số lượng xuất hiện của từng phần tử trong danh sách
            for (String phanTu : listTmp) {
                demPhanTu.put(phanTu, demPhanTu.getOrDefault(phanTu, 0) + 1);
            }
            if (demPhanTu.containsKey(productId)) {
                int tmp = Integer.valueOf(upDownQuantity) - demPhanTu.get(productId);
                if (tmp > 0) {
                    // thêm sản phẩm cho đủ
                    for (int i = 0; i < Math.abs(tmp); i++) {
                        data += "|" + productId;
                    }
                } else {
                    // xóa bớt sản phẩm cho đủ
                    if (tmp != 0) {
                        for (int i = 0; i < Math.abs(tmp); i++) {
                            data = downProductCard(data, productId);
                        }
                    }

                }
            }
            Cookie cookie = new Cookie("cart", data);

            // Thiết lập thời gian sống của cookie (ví dụ: 24 giờ)
            cookie.setMaxAge(24 * 60 * 60);
            // Thêm cookie vào response
            response.addCookie(cookie);

            DAO dao = new DAO();
            List<Product> list = new ArrayList<>();
            List<ProductCart> listCardProducts = new ArrayList<>();
            // Tạo một Map để lưu trữ số lượng xuất hiện của từng phần tử

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
            System.out.println(cart.getTotalprice());
            DecimalFormat decimalFormat = new DecimalFormat("0,000");
            response.getWriter().write(decimalFormat.format(cart.getTotalprice()));
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
