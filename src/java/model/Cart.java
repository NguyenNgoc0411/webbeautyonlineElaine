/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.DecimalFormat;
import java.util.List;

/**
 *
 * @author luong
 */
public class Cart {

    private int quantity;
    private double totalprice, totaldiscount, totalamount;
    private List<ProductCart> product;

    public Cart() {
    }

    public Cart(List<ProductCart> product) {
        this.quantity = 0;
        for (ProductCart i : product) {
            this.totalprice += i.getQuantity() * i.getPriceDouble();
            this.totalamount += i.getQuantity() * i.getDiscountPriceDouble();
        }
        this.totaldiscount = this.totalprice - this.totalamount;
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalprice() {
        return Math.ceil(totalprice);
    }
    
    public String getTotalpriceString(){
        return formatDouble(totalprice);
    }
    
    public String formatDouble(double number) {
        DecimalFormat decimalFormat = new DecimalFormat("#,##0");
        return decimalFormat.format(number);
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }

    public double getTotaldiscount() {
        return Math.ceil(totaldiscount);
    }
    
    public String getTotaldiscountString() {
        return formatDouble(totaldiscount);
    }

    public void setTotaldiscount(double totaldiscount) {
        this.totaldiscount = totaldiscount;
    }

    public double getTotalamount() {
        return Math.ceil(totalamount);
    }
    
    public String getTotalamountString() {
        return formatDouble(totalamount);
    }

    public void setTotalamount(double totalamount) {
        this.totalamount = totalamount;
    }

    public List<ProductCart> getProduct() {
        return product;
    }

    public void setProduct(List<ProductCart> product) {
        this.product = product;
    }

}
