/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
import java.util.List;

/**
 *
 * @author 2021
 */
public class Customer extends User {

    private Date dateregister;
    private List<Information> information;

    public Customer() {

    }
 public Customer(String id, String name, Date date, String email, String phone, String sex)
    {
        super(id,name,date,email,phone,sex);
    }
    
    public Customer(Date dateregister, List<Information> information, String id, String name, Date date, String email, String phone, String sex, Account account) {
        super(id, name, date, email, phone, sex, account);
        this.dateregister = dateregister;
        this.information = information;
    }

    public Date getDateregister() {
        return dateregister;
    }

    public void setDateregister(Date dateregister) {
        this.dateregister = dateregister;
    }

    public List<Information> getInformation() {
        return information;
    }

    public void setInformation(List<Information> information) {
        this.information = information;
    }

    @Override
    public String toString() {
        return "Customer{" + "dateregister=" + dateregister + ", information=" + information + '}';
    }

}
