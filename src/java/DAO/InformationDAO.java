/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Address;
import model.Information;
import model.Order;
import org.eclipse.jdt.internal.compiler.ast.ThisReference;

/**
 *
 * @author 2021
 */
public class InformationDAO extends DBContext {

    public void deleteInfo(String s) {
        try {
            String query = "UPDATE tblinformation SET description = '-1' WHERE id =?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, s);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertInformation(Information u, String idCus) {
        String sql = "insert into tblinformation values (?,?,?,?,?,?,?,?,?) ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, u.getId());
            ps.setString(2, u.getName());
            ps.setString(3, u.getPhone());
            ps.setString(4, u.getAddress().getDescription());
            ps.setString(5, u.getAddress().getStreet());
            ps.setString(6, u.getAddress().getProvince());
            ps.setString(7, u.getAddress().getDistrict());
            ps.setString(8, u.getAddress().getCommunes());
            ps.setString(9, idCus);

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("lỗi ");
        }
    }

    public List<Information> getInformationByIdCus(String idCus) {
        try {
            String query = "select * from tblinformation where tblcustomerid=? and description>='0'";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, idCus);
            ResultSet rs = ps.executeQuery();
            List<Information> list = new ArrayList<>();

            while (rs.next()) {
                Address xAddress = new Address(rs.getString("street"), rs.getString("province"), rs.getString("district"), rs.getString("communes"), rs.getString("description"));
                Information info = new Information(rs.getString("id"), rs.getString("name"), rs.getString("phone"), xAddress);

                list.add(info);

            }
            return list;

        } catch (Exception e) {
        }
        return null;
    }

    public Information getInformationByDescription(String idCus) {
        try {
            String query = "select * from tblinformation where tblcustomerid=? and description='1'";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, idCus);
            ResultSet rs = ps.executeQuery();
            List<Information> list = new ArrayList<>();

            if (rs.next()) {
                Address xAddress = new Address(rs.getString("street"), rs.getString("province"), rs.getString("district"), rs.getString("communes"), rs.getString("description"));
                Information info = new Information(rs.getString("id"), rs.getString("name"), rs.getString("phone"), xAddress);

                return info;

            }

        } catch (Exception e) {
        }
        return null;

    }

    public Information getInformationById(String IdString) {
        try {
            String query = "select * from tblinformation where id=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, IdString);
            ResultSet rs = ps.executeQuery();
            List<Information> list = new ArrayList<>();

            if (rs.next()) {
                Address xAddress = new Address(rs.getString("street"), rs.getString("province"), rs.getString("district"), rs.getString("communes"), rs.getString("description"));
                Information info = new Information(rs.getString("id"), rs.getString("name"), rs.getString("phone"), xAddress);

                return info;

            }

        } catch (Exception e) {
        }
        return null;

    }

    public int countraw() {
        String sql = "SELECT id FROM tblinformation ORDER BY id DESC LIMIT 1; ";

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

    public void insertInfo(Information x) {
        try {
            String query = "UPDATE tblinformation SET description = '0' WHERE id =?";

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, x.getId());
            ps.executeUpdate();

        } catch (Exception e) {
        }

    }

}
