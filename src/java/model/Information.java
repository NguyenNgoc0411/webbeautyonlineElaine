/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author 2021
 */
public class Information {
    private String id,name, phone;
    private Address address;
    public Information()
    {
        
    }
    public Information(String id, String name, String phone, Address address) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Information{" + "id=" + id + ", name=" + name + ", phone=" + phone + ", address=" + address + '}';
    }
    public String getAddresString()
    {
        String x= this.address.getDescription()+", "+this.address.getStreet()+", "+this.address.getCommunes()+" "+this.address.getDistrict()+" "+this.address.getProvince();
        return x;
    }
    
    
}
