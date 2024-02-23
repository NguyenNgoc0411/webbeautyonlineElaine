/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author 2021
 */
public class DBContext {
    protected Connection connection;
         public  DBContext(){
             try {
             Class.forName("com.mysql.cj.jdbc.Driver");
             connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webonline","root","@Ngoc30121995");
            
             }
             catch(ClassNotFoundException | SQLException ex){
                 System.out.println("ex");
             }
       
       
        
    } 
    
}
