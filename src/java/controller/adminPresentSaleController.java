/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author luong
 */
public class adminPresentSaleController extends HttpServlet {

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
        request.getRequestDispatcher("admin_present_sale.jsp").forward(request, response);
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
        String hotSaleId = request.getParameter("hotSaleId");
        // saleProductId khác null là 1 trong 2 chức năng xóa hoặc lưu được gọi
        String topic = request.getParameter("topic");
        if ("updateBtn".equals(topic)) {
            String discount = request.getParameter("discount");
            String quantity = request.getParameter("quantity");
            String saleProductId = request.getParameter("saleProductId");
            System.out.println(discount);
            System.out.println(quantity);
            System.out.println(saleProductId);
            dao.updateDiscountAndQuantity(discount, quantity, saleProductId);
            dao.updateDiscountProduct(Double.parseDouble(discount), saleProductId);
        }
//        if (saleProductId != null) {
//            // discount khác null là chức năng lưu được gọi nếu không thì chức năng xóa được gọi
//            if (discount != null) {
//                dao.updateDiscountAndQuantity(discount, quantity, saleProductId);
//            } else {
//                dao.deleteSaleProduct(saleProductId);
//            }
//        }
        request.setAttribute("AllProducts", dao.getSaleProductsByHotsaleId(hotSaleId));
        request.setAttribute("hotSales", dao.getAllHotSale());
        request.getRequestDispatcher("admin_present_sale.jsp").forward(request, response);
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
