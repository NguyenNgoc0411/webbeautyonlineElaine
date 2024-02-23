/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DBContext;
import DAO.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.Product;

/**
 *
 * @author DUC TOAN
 */
@WebServlet(name = "StatServlet", urlPatterns = {"/stat"})
public class StatController extends DBContext {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet StatServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StatServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        // Lấy dữ liệu thống kê từ nguồn nào đó
        DAO dao = new DAO();
        LocalDate currentDate = LocalDate.now();

        // Lấy thông tin về tháng và năm hiện tại
        int currentYear = currentDate.getYear();
        int currentMonth = currentDate.getMonthValue();

        // Tạo đối tượng YearMonth từ tháng và năm hiện tại
        YearMonth yearMonth = YearMonth.of(currentYear, currentMonth);
        LocalDate startDate = yearMonth.atDay(1);
        LocalDate endDate = yearMonth.atEndOfMonth();
        double monthlyRevenue = dao.revenueStat(startDate.toString(), endDate.toString());

        // Đặt dữ liệu thống kê là thuộc tính của request
        request.setAttribute("monthlyRevenue", monthlyRevenue);

        int billInMonth = dao.countOder(startDate.toString(), endDate.toString());
        request.setAttribute("billinmonth", billInMonth);

        double dailyRevenue = dao.revenueStat(currentDate.toString(), currentDate.toString());
        request.setAttribute("dailyRevenue", dailyRevenue);

        int bill_today = dao.countOder(currentDate.toString(), currentDate.toString());
        request.setAttribute("bill_today", bill_today);

        List<Double> mothlyRevenueList = new ArrayList<>();
        List<String> monthList = new ArrayList<>();
        for (int i = 12; i >= 0; i--) {
            int month = currentMonth - i;
            int year = currentYear;
            if (month <= 0) {
                month += 12;
                year = year - 1;
            }
            String tmp = "'Tháng " + String.valueOf(month) + "/"
                    + String.valueOf(year) + "'";
            monthList.add(tmp);
            mothlyRevenueList.add(dao.monthlyRevenueStat(String.valueOf(month), String.valueOf(year)));
        }
        request.setAttribute("monthList", monthList);
        request.setAttribute("monthlyRevenueList", mothlyRevenueList);

        Map<Product, Double> TKproduct = dao.getSoldProducts(startDate.toString(), endDate.toString(), 5);
        request.setAttribute("soldproducts", TKproduct);
        Map<String, Double> topCustomer = dao.getCustomer(startDate.toString(), endDate.toString(), 5);
        request.setAttribute("topCustomer", topCustomer);
        // Chuyển tiếp yêu cầu đến trang JSP để hiển thị kết quả
        request.getRequestDispatcher("stat.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
        // Lấy giá trị ngày bắt đầu và ngày kết thúc từ yêu cầu
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String action = request.getParameter("action");
        StringBuilder responseText = new StringBuilder();
        DAO dao = new DAO();
        if ("1".equals(action)) {
            double revenue = dao.revenueStat(startDate, endDate);
            int ordercounter = dao.countOder(startDate, endDate);
            Map<Product, Double> TKproduct = dao.getSoldProducts(startDate, endDate, 10);
            responseText.append(String.valueOf(revenue)).append("\n");
            responseText.append(ordercounter).append("\n");
            for (Map.Entry<Product, Double> entry : TKproduct.entrySet()) {
                Product product = entry.getKey();
                Double quantity = entry.getValue();
                responseText.append(product.getId()).append(":").append(product.getName()).append(":");
                responseText.append(quantity).append("\n");
                // Thực hiện các thao tác với product và quantity
            }
        }
        if ("2".equals(action)) {
            List<String> ordersList = dao.getOrderByProductId(startDate, endDate, action);
            for (String order : ordersList) {
                responseText.append(order).append("\n");
            }
        }
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
//        response.setHeader("revenue", revenue);

        // Gửi kết quả về client
        PrintWriter out = response.getWriter();
        out.print(responseText.toString());
        out.flush();
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

        // Lấy ngày bắt đầu và ngày kết thúc của tháng hiện tại