/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author 2021
 */
public class Admin extends  User{

    public Admin() {
    }

    public Admin(String id, String name, Date date, String email, String phone, String sex, Account account) {
        super(id, name, date, email, phone, sex, account);
    }
    
    
}
