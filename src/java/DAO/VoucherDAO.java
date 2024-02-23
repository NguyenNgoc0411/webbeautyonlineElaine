/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Voucher;

/**
 *
 * @author 2021
 */
public class VoucherDAO extends DBContext {

    public Voucher getVoucher(String id) {
        try {
            String query = "select tblvoucher.* from tblvoucher,tblorder where tblorder.tblvoucherid=tblvoucher.id and tblorder.id=?";
            PreparedStatement ps = connection.prepareStatement(query);

            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                java.sql.Date sqlDate = rs.getDate("startdate");
                // Chuyển đổi thành java.util.Date
                java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
                java.sql.Date sqlDate1 = rs.getDate("enddate");
                java.util.Date endDate = new java.util.Date(sqlDate1.getTime());
                Voucher x = new Voucher(rs.getString("id"), rs.getString("description"), rs.getString("content"), utilDate, endDate, rs.getDouble("minprice"), rs.getDouble("discount"));
                return x;
            }

        } catch (Exception e) {
        }
        return null;
    }

    public Voucher getVoucherByIdVoucher(String id) {
        try {
            String query = "SELECT * FROM webonline.tblvoucher WHERE id = ?;";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                java.sql.Date sqlDate = rs.getDate("startdate");
                // Chuyển đổi thành java.util.Date
                java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
                java.sql.Date sqlDate1 = rs.getDate("enddate");
                java.util.Date endDate = new java.util.Date(sqlDate1.getTime());
                Voucher x = new Voucher(rs.getString("id"), rs.getString("description"), rs.getString("content"), utilDate, endDate, rs.getDouble("minprice"), rs.getDouble("discount"));
                return x;
            }

        } catch (Exception e) {
        }
        return null;
    }

}
