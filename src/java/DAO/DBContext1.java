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
 * @author luong
 */
public class DBContext1 {
    private Connection connection;
    public Connection getConnection() throws Exception{
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webonline", "root", "@Ngoc30121995");
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("ex");
        }
        return connection;
    }
//    public static void main(String[] args) {
//        DAO dao = new DAO();
//        System.out.println(dao.getAllSanPhams());
//    }
}
