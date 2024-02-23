/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.DecimalFormat;

/**
 *
 * @author 2021
 */
public class ProductCart extends Product {
    private int quantity;
    private double totalPrice;

    public ProductCart() {
    }

    public ProductCart(int quantity, double totalPrice) {
        this.quantity = quantity;
        this.totalPrice = totalPrice;
    }
    
    public ProductCart(int quantity, Product product) {
        super(product.getId(), product.getVote(), product.getName(), product.getUnit(), product.getBrand(), product.getSold(), product.getDiscount(), product.getPriceDouble(), product.getImage(), product.getCategory());
        this.quantity = quantity;
        this.totalPrice = quantity * (product.getPriceDouble() - product.getPriceDouble() * product.getDiscount());
    }

    public ProductCart(int quantity, double totalPrice, String id, double vote, String name, String unit, String brand, int sold, double discount, double price, String image, Category x) {
        super(id, vote, name, unit, brand, sold, discount, price, image, x);
        this.quantity = quantity;
        this.totalPrice = totalPrice;
    }
    
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }
    
    public String getTotalPriceString() {
        return formatDouble(totalPrice);
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    public String formatDouble(double number) {
        DecimalFormat decimalFormat = new DecimalFormat("#,##0");
        return decimalFormat.format(number);
    }
}