/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import model.Account;
import model.User;

/**
 *
 * @author 2021
 */
public class userDAO extends DBContext {
    public int countraw()
    {
        String sql="SELECT id FROM tbluser ORDER BY id DESC LIMIT 1; ";
       
                try {
            PreparedStatement ps= connection.prepareStatement(sql);
             ResultSet rs= ps.executeQuery();
            if(rs.next())
            {   
                String x= rs.getString(1);
                x=x.substring(1);
                return Integer.parseInt(x)+1;
            }
            
            
            
            
        } catch (Exception e) {
        }
                return 0;
    }
    public void insertUser  ( User u)
    {
        String sql="insert into tbluser values (?,?,?,?,?,?) ";
        String sqlac="insert into tblaccount values (?,?,?,?)";
        String sqlcus="insert into tblcustomer values(?,?)";
         Date currentDate = new Date();
                try {
            PreparedStatement ps= connection.prepareStatement(sql);
            PreparedStatement psac= connection.prepareStatement(sqlac);
             PreparedStatement pscus= connection.prepareStatement(sqlcus);
            ps.setString(1, u.getId());
            ps.setString(2,u.getName());
           
              
              
                      

        // Chuyển đổi thành java.sql.Date
         java.sql.Date sqlDate = new java.sql.Date(u.getdDate().getTime());
         java.sql.Date sqlDate1 = new java.sql.Date(currentDate.getTime());
            
            ps.setDate(3,sqlDate);
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getPhone());
            ps.setString(6, u.getSex());
            
            ps.executeUpdate();
            psac.setString(1, u.getAccount().getUsername());
            psac.setString(2, u.getAccount().getPassword());
            psac.setInt(3, u.getAccount().getRoleid());
            psac.setString(4,u.getId() );
            psac.executeUpdate();
            pscus.setString(1, u.getId());
            pscus.setDate(2, sqlDate1);
            pscus.executeUpdate();
        } catch (Exception e) {
        }
    }
    public String checkEmail (String x) {
        try {
            
            String query="select email from tbluser where phone=?";
            
            PreparedStatement ps=connection.prepareStatement(query);
            ps.setString(1, x);
            ResultSet rs= ps.executeQuery();
            if(rs.next())
            {   
                
              return rs.getString(1);
            }
            
        } catch (Exception e) {
        }
        return "";
        
        
    }
    public User getUserCheck (String check)
    {
        try {
            
            String query="select * from tbluser,tblaccount where tbluser.phone=tblaccount.username and tbluser.phone=?";
            
            PreparedStatement ps=connection.prepareStatement(query);
            ps.setString(1, check);
            ResultSet rs= ps.executeQuery();
            if(rs.next())
            {   Account a= new Account(rs.getString(7),rs.getString(8),rs.getInt(9));
            java.sql.Date sqlDate = rs.getDate(3);

                        // Chuyển đổi thành java.util.Date
                        java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
               
            
                 User u;
                 
                
                u = new User(rs.getString(1), rs.getString(2),utilDate,rs.getString(4),rs.getString(5),rs.getString(6),a);
                return u;
            }
            
        } catch (Exception e) {
        }
        return null;
    }
    public Account getAccount(String check)
    {
         try {
            
            String query="select * from tblaccount where username=?";
            
            PreparedStatement ps=connection.prepareStatement(query);
            ps.setString(1, check);
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
