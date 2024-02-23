/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Address;
import model.Information;
import model.Payment;
import model.Shipment;

/**
 *
 * @author 2021
 */
public class PaymentDAO extends DBContext {

    public Payment getPaymentByOrderId(String idOr) {
        try {
            String query = "select * from tblpayment where tblorderid=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, idOr);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                java.sql.Date sqlDate = rs.getDate("datepayment");

                // Chuyển đổi thành java.util.Date
                java.util.Date utilDate = new java.util.Date(sqlDate.getTime());

                Payment p;
                p = new Payment(rs.getString("id"), rs.getString("formpayment"), rs.getDouble("totalamount"), utilDate, rs.getInt("status"));
                return p;
            }

        } catch (Exception e) {
        }
        return null;
    }
    
    public void addPayment(Payment payment, String tblorderid) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        String query = """
               INSERT INTO `webonline`.`tblpayment` (`id`, `formpayment`, `totalamount`, `datepayment`, `status`, `tblorderid`) VALUES (?, ?, ?, ?, ?, ?);
               """;
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, String.format("PM%03d", countraw()));
            ps.setString(2, payment.getFormpayment());
            ps.setDouble(3, payment.getTotalamount());
            java.sql.Date datepayment = new java.sql.Date(payment.getDatepayment().getTime());
            ps.setDate(4, datepayment);
            ps.setInt(5, payment.getStatus());
            ps.setString(6, tblorderid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("looix");
        }
    }

    public int countraw() {
        String sql = "SELECT id FROM tblpayment ORDER BY id DESC LIMIT 1; ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String x = rs.getString(1);
                x = x.substring(2);
                return Integer.parseInt(x) + 1;
            }

        } catch (Exception e) {
        }
        return 0;
    }

}
