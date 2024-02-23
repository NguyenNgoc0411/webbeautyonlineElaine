/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.*;

/**
 *
 * @author 2021
 */
public class CustomerDAO extends DBContext {

    public Customer getCustomerByUser(User xUser) {
        try {
            String query = "select * from tblcustomer where id=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, xUser.getId());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                java.sql.Date sqlDate = rs.getDate("dateregister");
                java.util.Date utilDate = new java.util.Date(sqlDate.getTime());

                Customer a;

                a = new Customer(utilDate, this.getInformationByIdCus(xUser.getId()), xUser.getId(), xUser.getName(), xUser.getdDate(), xUser.getEmail(), xUser.getPhone(), xUser.getSex(), xUser.getAccount());
                return a;
            }

        } catch (Exception e) {
        }
        return null;
    }

    public List<Information> getInformationByIdCus(String idCus) {
        try {
            String query = "select * from tblinformation where tblcustomerid=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, idCus);
            ResultSet rs = ps.executeQuery();
            List<Information> list = new ArrayList<>();

            if (rs.next()) {
                Address xAddress = new Address(rs.getString("street"), rs.getString("province"), rs.getString("district"), rs.getString("communes"), rs.getString("description"));
                Information info = new Information(rs.getString("id"), rs.getString("name"), rs.getString("phone"), xAddress);

                list.add(info);

            }
            return list;

        } catch (Exception e) {
        }
        return null;
    }

//    public Customer getUserByID(String id) throws SQLException {
//        String query = "select * from tblcustomer where id=?";
//
//        PreparedStatement preparedStatement = connection.prepareStatement(query);
//        preparedStatement.setString(1, id);
//        ResultSet resultSet = preparedStatement.executeQuery();
//        try {
//
//            while (resultSet.next()) {
//                Customer customer = new Customer(resultSet.getString("id"),
//                        resultSet.getString("name"),
//                        resultSet.getDate("date"),
//                        resultSet.getString("email"),
//                        resultSet.getString("phone"),
//                        resultSet.getString("sex")
//                );
//                return customer;
//            }
//        } catch (Exception e) {
//            // TODO: handle exception
//        }
//        return null;
//    }

    public void updateCustomer(String name, String email, String sex, Date date, String id) {
        String query = "update tblcutomer set name=?, email=?, sex=?, date=? where id=?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, sex);
            java.sql.Date dateUpdate = new java.sql.Date(date.getTime());
            preparedStatement.setDate(4, dateUpdate);
            preparedStatement.setString(5, id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            // TODO: handle exception
        }

    }
    public Customer getUserByID(String id) {
		String query = " select * from tbluser where id";
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, id);
			resultSet = preparedStatement.executeQuery();
                        
                        
			if(resultSet.next()) {
                           
                             java.util.Date sqlDate1 = new java.util.Date(resultSet.getDate("date").getTime());
				Customer customer = new Customer(resultSet.getString("id"),
						resultSet.getString("name"),
						sqlDate1,
						resultSet.getString("email"),
						resultSet.getString("phone"),
						resultSet.getString("sex")
						);
				return customer;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
     }
      public List<Customer> getALLCustomers() {
		String query = " select * from tbluser ";
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			preparedStatement = connection.prepareStatement(query);
			
			resultSet = preparedStatement.executeQuery();
                        List<Customer> l= new ArrayList<>();
                        
                        
			while(resultSet.next()) {
                           
                             java.util.Date sqlDate1 = new java.util.Date(resultSet.getDate("date").getTime());
				Customer customer = new Customer(resultSet.getString("id"),
						resultSet.getString("name"),
						sqlDate1,
						resultSet.getString("email"),
						resultSet.getString("phone"),
						resultSet.getString("sex")
						);
				l.add(customer);
			}
                        return l;
		} catch (Exception e) {
	
		}
		return null;
	}
   
	public void updateCustomer(Customer xCustomer) {
           
		String query = "update tbluser set name=?, email=?, sex=?, date=? where id=?";
		
		PreparedStatement preparedStatement = null;
		try {     java.sql.Date sqlDate = new java.sql.Date(xCustomer.getdDate().getTime());
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, xCustomer.getName());
			preparedStatement.setString(2, xCustomer.getEmail());
			preparedStatement.setDate(4, sqlDate);
			preparedStatement.setString(3, xCustomer.getSex());
			preparedStatement.setString(5, xCustomer.getId());
			preparedStatement.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
		}
		
	}
    
}
