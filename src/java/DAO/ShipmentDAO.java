/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Address;
import model.Image;
import model.Information;
import model.Order;
import model.Shipment;
import java.sql.*;
import java.util.*;

/**
 *
 * @author 2021
 */
public class ShipmentDAO extends DBContext {

    public Shipment getShipmentByOrderId(String idOr) {
        try {
            String query = "select a.*,b.id as idd,b.name,b.phone,b.street,b.province,b.district,b.communes,b.description from tblshipment as a,tblinformation as b where a.tblorderid=? and b.id= a.tblinformationid";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, idOr);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Address xAddress = new Address(rs.getString("street"), rs.getString("province"), rs.getString("district"), rs.getString("communes"), rs.getString("description"));
                Information info = new Information(rs.getString("idd"), rs.getString("name"), rs.getString("phone"), xAddress);
                java.sql.Date sqlDate = rs.getDate("expectdelivery");

                // Chuyển đổi thành java.util.Date
                java.util.Date utilDate = new java.util.Date(sqlDate.getTime());

                Shipment aShipment;
                aShipment = new Shipment(rs.getString("id"), rs.getString("type"), utilDate, rs.getDouble("transportfee"), rs.getInt("status"), info);
                return aShipment;
            }

        } catch (Exception e) {
        }
        return null;
    }

    public void addShipment(Shipment shipment, String tblorderid) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        String query = "INSERT INTO `webonline`.`tblshipment` (`id`, `type`, `transportfee`, `expectdelivery`, `status`, `tblinformationid`, `tblorderid`) VALUES (?, ?, ?, ?, ?, ?, ?);";

        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, String.format("SH%03d", countraw()));
            ps.setString(2, shipment.getType());
            ps.setDouble(3, shipment.getTransportfee());
            java.util.Date currentDate = new java.util.Date();
            java.sql.Date date = new java.sql.Date(currentDate.getTime());
            ps.setDate(4, date);
            ps.setInt(5, shipment.getStatus());
            ps.setString(6, shipment.getInformation().getId());
            ps.setString(7, tblorderid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("looix");
        }
    }

    public int countraw() {
        String sql = "SELECT id FROM tblshipment ORDER BY id DESC LIMIT 1; ";
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
