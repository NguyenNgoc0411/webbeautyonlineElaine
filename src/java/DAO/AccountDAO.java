/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Account;

/**
 *
 * @author 2021
 */
public class AccountDAO extends  DBContext{
    public Account getAccountCheck(String check,String pass)
    {
         try {
            
            String query="select * from tblaccount where username=? and password=?";
            
            PreparedStatement ps=connection.prepareStatement(query);
            ps.setString(1, check);
            ps.setString(2, pass);
            ResultSet rs= ps.executeQuery();
            if(rs.next())
            {   Account a= new Account(rs.getString(1),rs.getString(2),rs.getInt(3));
            return a;
            }
            
        } catch (Exception e) {
        }
        return null;
    }
   
    
}
