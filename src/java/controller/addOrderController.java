/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAO;
import DAO.InformationDAO;
import DAO.OrderDAO;
import DAO.PaymentDAO;
import DAO.ShipmentDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Customer;
import model.Information;
import model.Order;
import model.Payment;
import model.Product;
import model.ProductOrder;
import model.Shipment;
import model.Voucher;

/**
 *
 * @author luong
 */
public class addOrderController extends HttpServlet {

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
        if (topic != null && topic.equals("setOrder")) {
            String payMethod = request.getParameter("pay-method");
            String inforId = request.getParameter("inforId");
            InformationDAO inforDAO = new InformationDAO();
            Information information = inforDAO.getInformationById(inforId);
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("customer");
            String customerId = customer.getId();
            // lấy shipment
            String shipMethod = request.getParameter("ship-method");
            Date currentDate = new Date();
            java.sql.Date date = new java.sql.Date(currentDate.getTime());
            Voucher voucher = new Voucher();
            voucher = (Voucher) session.getAttribute("voucher");
            System.out.println(voucher);
            session.removeAttribute("voucher");
            DAO dao = new DAO();
            Cookie[] cookies = request.getCookies();
            String data = "";
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("cart")) {
                        data = cookie.getValue();
                    }
                }
            }
            String[] listIdProduct = data.split("\\|");
            List<ProductOrder> listOrdersProducts = new ArrayList<>();
            // Tạo một Map để lưu trữ số lượng xuất hiện của từng phần tử
            Map<String, Integer> demPhanTu = new HashMap<>();

            // Đếm số lượng xuất hiện của từng phần tử trong danh sách
            for (String phanTu : listIdProduct) {
                demPhanTu.put(phanTu, demPhanTu.getOrDefault(phanTu, 0) + 1);
            }

            for (Map.Entry<String, Integer> i : demPhanTu.entrySet()) {
                if (!i.getKey().isEmpty()) {
                    Product p = dao.getProductbyId(i.getKey());
                    ProductOrder c = new ProductOrder(i.getValue(), p);
                    listOrdersProducts.add(c);
                }
            }

            Shipment shipment = new Shipment(
                    "",
                    shipMethod,
                    null,
                    Double.parseDouble(request.getParameter("transportfee")),
                    0,
                    information
            );

            Payment payment = new Payment(
                    "",
                    payMethod,
                    0,
                    date,
                    0
            );

            Order order = new Order(
                    "",
                    payment,
                    shipment,
                    voucher,
                    customer,
                    date,
                    null,
                    Double.parseDouble(request.getParameter("discountPrice1")),
                    Double.parseDouble(request.getParameter("totalBill")),
                    Double.parseDouble(request.getParameter("totalAmount1")),
                    listOrdersProducts
            );

            // thêm dữ liệu vào bảng order
            OrderDAO orderDAO = new OrderDAO();
            String orderId = orderDAO.addOrder(order);

            for (ProductOrder i : order.getProductorder()) {
                // thêm dữ liệu vào bảng sản phẩm đặt
                orderDAO.addProductOrder(i, orderId);
                // cập nhật số lượng còn lại của sản phẩm trong bảng tblproductdetail
                int avaiQuantity = dao.getQuantityProductById(i.getId());
                dao.updateQuantityProductById(avaiQuantity - i.getQuantity(), i.getId());
                // cập nhật số lượng đã bán trong bảng tblproduct
                dao.updateSoldProductById(i.getQuantity(), i.getId());
            }

            // thêm dữ liệu vào bảng shipment
            ShipmentDAO shipDAO = new ShipmentDAO();
            shipDAO.addShipment(shipment, orderId);

            // thêm dữ liệu vào bảng payment
            PaymentDAO payDAO = new PaymentDAO();
            payDAO.addPayment(payment, orderId);

            Cookie cookie = new Cookie("cart", "");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
//        response.getWriter().println("<script>alert('Done!');</script>");
        request.setAttribute("alert", """
                                      <div id="popup" class="popup">
                                          <h2>Đặt hàng thành công</h2>
                                          <p>Cảm ơn bạn đã mua hàng!!!</p>
                                      </div>
                                      """);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
