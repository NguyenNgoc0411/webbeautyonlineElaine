/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAO;
import model.HotSale;
import model.SaleProduct;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author luong
 */
public class adminAddSaleProductController extends HttpServlet {

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
        DAO dao = new DAO();
        request.setAttribute("hotSales", dao.getAllHotSale());
        request.setAttribute("AllProducts", dao.getAllProducts());
        request.getRequestDispatcher("admin_add_sale_product.jsp").forward(request, response);
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
        String search = request.getParameter("search");
        String Id = request.getParameter("category");
        String description = request.getParameter("description");
        String quantity = request.getParameter("quantity");
        String discount = request.getParameter("discount");
        String hotSale = request.getParameter("hotSale");
        String saleProductId = request.getParameter("saleProductId");
//        Nếu search != null là lệnh tìm kiếm còn không là lệnh lọc theo category
        if (search != null) {
            request.setAttribute("AllProducts", dao.searchProducts(search));

        } else {
            if (hotSale != null) {
//                lệnh thêm sản phẩm khuyến mại
                try {
                    SaleProduct saleProduct = new SaleProduct(saleProductId, Double.parseDouble(discount), description, hotSale, Integer.parseInt(quantity), 0);
                    dao.addSaleProduct(saleProduct);
                } catch (Exception e) {
                    System.out.println(saleProductId);
                    System.out.println(discount);
                    System.out.println(description);
                    System.out.println(hotSale);
                    System.out.println(quantity);
                }
                request.setAttribute("AllProducts", dao.getAllProducts());
            } else {
                // lệnh lọc theo category
                request.setAttribute("AllProducts", dao.getProductsByCategoryId(Id));
            }
        }
        request.setAttribute("hotSales", dao.getAllHotSale());
        request.getRequestDispatcher("admin_add_sale_product.jsp").forward(request, response);
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
