/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAO;
import DAO.InformationDAO;
import DAO.VoucherDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Cart;
import model.Customer;
import model.Order;
import model.Payment;
import model.Product;
import model.ProductCart;
import model.ProductOrder;
import model.Shipment;
import model.Voucher;

/**
 *
 * @author 2021
 */
@WebServlet(name = "checkoutServlet", urlPatterns = {"/checkout"})
public class checkoutServletController extends HttpServlet {

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
        String[] listIdProduct = data.split("\\|");
        List<Product> list = new ArrayList<>();
        List<ProductOrder> listOrdersProducts = new ArrayList<>();
        List<ProductCart> listCartsProducts = new ArrayList<>();
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
                ProductCart pc = new ProductCart(i.getValue(), p);
                ProductOrder c = new ProductOrder(i.getValue(), p);
                listOrdersProducts.add(c);
                listCartsProducts.add(pc);
            }
        }
        Cart cart = new Cart(listCartsProducts);
        InformationDAO informationDAO = new InformationDAO();
        HttpSession session = request.getSession();
        Customer cus = (Customer) session.getAttribute("customer");

        String idInfString = request.getParameter("idinfoset");

        if (idInfString == null) {
            request.setAttribute("informationdat", informationDAO.getInformationByDescription(cus.getId()));
        } else {
            request.setAttribute("informationdat", informationDAO.getInformationById(idInfString));
        }

//        request.setAttribute("informationdat", informationDAO.getInformationByDescription(cus.getId()));
        request.setAttribute("cartProducts", cart);

        Voucher voucher = new Voucher();
        voucher = (Voucher) session.getAttribute("voucher");

        Order order = new Order(
                "",
                new Payment(),
                new Shipment(),
                voucher,
                new Customer(),
                new Date(),
                new Date(),
                0,
                cart.getTotalamount(),
                cart.getTotalamount() + 15000,
                listOrdersProducts
        );
        order.getShipment().setTransportfee(15000);
        if (voucher != null) {
            if (voucher.getDiscount() > 1) {
                order.setDiscount(voucher.getDiscount());
            } else {
                order.setDiscount((order.getPrice() + order.getShipment().getTransportfee()) * voucher.getDiscount());
            }
            order.setTotalamount(order.getPrice() + order.getShipment().getTransportfee() - order.getDiscount());
        }
        request.setAttribute("order", order);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
        String voucherId = request.getParameter("voucherId");
        VoucherDAO vcd = new VoucherDAO();
        InformationDAO informationDAO = new InformationDAO();
        String idInfString = request.getParameter("idinfoset");
        HttpSession session = request.getSession();
        Customer cus = (Customer) session.getAttribute("customer");
        if (idInfString == null) {
            request.setAttribute("informationdat", informationDAO.getInformationByDescription(cus.getId()));
        } else {
            request.setAttribute("informationdat", informationDAO.getInformationById(idInfString));
        }
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
        System.out.println("oke " + topic);
        if (topic != null) {
            if (topic.equals("setOrder")) {
                // lấy thông tin nhận hàng
//            String 
                // lấy hình thức vận chuyển
                // lấy phương thức thanh toán
                // lấy danh sách id của các sản phẩm trên cookie (lấy giỏ hàng)
                //
            } else if (topic.equals("checkVoucherId")) {
                String voucherId = request.getParameter("useVoucherId");
                String totalBill = request.getParameter("totalBill");

                VoucherDAO vcd = new VoucherDAO();
                try {
                    Voucher voucher = vcd.getVoucherByIdVoucher(voucherId);
                    if (voucher != null) {
                        if (compareDatesWithToday(voucher.getStartDate()) <= 0 && compareDatesWithToday(voucher.getEndDate()) >= 0) {
                            if (Double.parseDouble(totalBill) >= voucher.getMinprice()) {
                                // Lấy đối tượng HttpSession từ request
                                HttpSession session = request.getSession();

                                // Lưu trữ đối tượng Product vào session
                                session.setAttribute("voucher", voucher);
                            }
                        }
                    }
                } catch (Exception e) {

                }
            }
        }
        processRequest(request, response);
    }

    public static int compareDatesWithToday(Date inputDate) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String providedDateStr = dateFormat.format(inputDate);
        // Lấy ngày hiện tại
        LocalDate currentDate = LocalDate.now();
        LocalDate providedDate = LocalDate.parse(providedDateStr, DateTimeFormatter.ISO_LOCAL_DATE);

        // So sánh ngày
        if (currentDate.isAfter(providedDate)) {
//            Ngày có sẵn nằm trước hiện tại hay nhỏ hơn
            return -1;
        } else if (currentDate.isBefore(providedDate)) {
            return 1;
        } else {
            return 0;
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
