/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import DAO.DAO;

/**
 *
 * @author 2021
 */
public class SaleProduct {
    private Product product;
    private double discount;
    private String description;
    private HotSale hotsale;
    private int quantity, available;

    public SaleProduct(){
    }

    public SaleProduct(String productId, double discount, String description, String hotSaleId, int quantity, int available) {
        DAO dao = new DAO();
        this.product = dao.getProductbyId(productId);
        this.discount = discount;
        this.description = description;
        this.hotsale = dao.getHotSaleByID(hotSaleId);
        this.quantity = quantity;
        this.available = available;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public HotSale getHotsale() {
        return hotsale;
    }

    public void setHotsale(HotSale hotsale) {
        this.hotsale = hotsale;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getAvailable() {
        return available;
    }

    public void setAvailable(int available) {
        this.available = available;
    }
    
    
    
}
