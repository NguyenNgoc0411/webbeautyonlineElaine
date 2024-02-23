/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.InformationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Address;
import model.Customer;
import model.Information;

/**
 *
 * @author 2021
 */
@WebServlet(name = "addnewaddressServlet", urlPatterns = {"/addnewaddress"})
public class addnewaddressController extends HttpServlet {

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

        request.getRequestDispatcher("edit_address.jsp").forward(request, response);

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
        String name = request.getParameter("CustomerName");
        String phone = request.getParameter("Phone");
        String province = request.getParameter("province");
        String district = request.getParameter("district");
        String[] ad = {"Quận Ba Đình", "Quận Bắc Từ Liêm", "Quận Cầu Giấy", "Quận Đống Đa", "Quận Hà Đông", "Quận Hai Bà Trưng", "Quận Hoàn Kiếm", "Quận Hoàng Mai", "Quận Long Biên", "Quận Nam Từ Liêm", "Quận Tây Hồ", "Quận Thanh Xuân", "Thị Xã Sơn Tây", "Huyện Ba Vì", "Huyện Chương Mỹ", "Huyện Đan Phượng", "Huyện Đông Anh", "Huyện Gia Lâm", "Huyện Hoài Đức", "Huyện Mê Linh", "Huyện Mỹ Đức", "Huyện Phú Xuyên", "Huyện Phúc Thọ", "Huyện Quốc Oai", "Huyện Sóc Sơn", "Huyện Thạch Thất", "Huyện Thanh Oai", "Huyện Thanh Trì", "Huyện Thường Tín", "Huyện Ứng Hòa"};
        String communes = request.getParameter("phuongxa");
        String street = request.getParameter("street");
        String sonha = request.getParameter("sonha");
        String des = request.getParameter("macdinh");
        InformationDAO informationDAO = new InformationDAO();

        if (name.length() == 0 || phone.length() == 0 || province.length() == 0 || district.length() == 0 || communes.length() == 0 || street.length() == 0 || sonha.length() == 0) {
            response.sendRedirect("editaddress");
        } else {
            Address address = new Address(sonha + " " + street, "Hà Nội", ad[Integer.parseInt(district) - 1], communes, des);
            String id = "IF" + String.format("%03d", informationDAO.countraw());
            Information x = new Information(id, name, phone, address);
            request.setAttribute("infongoc", x);
            HttpSession session = request.getSession();
            Customer cus = (Customer) session.getAttribute("customer");
            if (des.compareTo("1") == 0) {
                informationDAO.insertInfo(informationDAO.getInformationByDescription(cus.getId()));
            }

            informationDAO.insertInformation(x, cus.getId());
            response.sendRedirect("editaddress");
        }
    }

}
