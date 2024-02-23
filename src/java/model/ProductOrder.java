/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author 2021
 */
public class ProductOrder extends Product {

    private int quantity;
    private double totalprice;

    public ProductOrder() {

    }

    public ProductOrder(int quantity, double totalprice) {
        this.quantity = quantity;
        this.totalprice = totalprice;
    }

    public ProductOrder(int quantity, Product product) {
        super(product.getId(), product.getVote(), product.getName(), product.getUnit(), product.getBrand(), product.getSold(), product.getDiscount(), product.getPriceDouble(), product.getImage(), product.getCategory());
        this.quantity = quantity;
        this.totalprice = quantity * (product.getPriceDouble() - product.getPriceDouble() * product.getDiscount());
    }

    public ProductOrder(int quantity, double totalprice, String id, double vote, String name, String unit, String brand, int sold, double discount, double price, String image, Category x) {
        super(id, vote, name, unit, brand, sold, discount, price, image, x);
        this.quantity = quantity;
        this.totalprice = totalprice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }

//    @Override
//    public String toString() {
//        return "ProductOrder{" + "quantity=" + quantity + ", totalprice=" + totalprice + '}';
//    }

    public String getTotalpriceString() {
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(Locale.US);
        String ccx = currencyFormatter.format(this.totalprice);
        String k = ccx.substring(1, ccx.length() - 3);
        return k;
    }
    
    public String getTotalPriceString() {
        return formatDouble(totalprice);
    }
    
    public String formatDouble(double number) {
        DecimalFormat decimalFormat = new DecimalFormat("#,##0");
        return decimalFormat.format(number);
    }

}
