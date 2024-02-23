/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAO;
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
public class showProducBasicController extends HttpServlet {

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
        DAO dao = new DAO();
        request.setAttribute("AllBrandNames", dao.getAllBrandName());
        request.setAttribute("AllProducts", dao.getAllProducts());
        request.setAttribute("AllCategories", dao.getAllCategories());
        request.getRequestDispatcher("show_product_basic.jsp").forward(request, response);
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
        DAO dao = new DAO();
        String cateId = request.getParameter("cateId");
        if (cateId != null && !cateId.isEmpty()) {
            request.setAttribute("AllProducts", dao.getProductsByCategoryId(cateId));
            request.setAttribute("AllBrandNames", dao.getAllBrandName());
            request.setAttribute("AllCategories", dao.getAllCategories());
            request.getRequestDispatcher("show_product_basic.jsp").forward(request, response);
        } else {
            processRequest(request, response);
        }

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
        String topic = request.getParameter("topic");
        if (topic != null && !topic.isEmpty()) {
            if (topic.equals("filterByCateId")) {
                String cateId = request.getParameter("cateId");
                if (cateId.equals("all")) {
                    request.setAttribute("AllProducts", dao.getAllProducts());
                } else {
                    request.setAttribute("AllProducts", dao.getProductsByCategoryId(cateId));
                }

            } else if (topic.equals("searchByNameBar")) {
                String search = request.getParameter("data-search");
                request.setAttribute("AllProducts", dao.searchProducts(search));
            } else if (topic.equals("filterByBrandName")) {
                String brandName = request.getParameter("brandName");
                request.setAttribute("AllProducts", dao.getProductsByBrandName(brandName));
            }
        }

        request.setAttribute("AllBrandNames", dao.getAllBrandName());
        request.setAttribute("AllCategories", dao.getAllCategories());
        request.getRequestDispatcher("show_product_basic.jsp").forward(request, response);
//        processRequest(request, response);
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
