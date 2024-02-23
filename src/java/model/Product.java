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
public class Product {

    private String id, name, unit, brand, image;
    private double discount, vote, price;
    private int sold;

    private Category category;

    public Product() {

    }

    public Product(String id, double vote, String name, String unit, String brand, int sold, double discount, double price, String image, Category x) {
        this.id = id;
        this.vote = vote;
        this.name = name;
        this.unit = unit;
        this.brand = brand;
        this.sold = sold;
        this.discount = discount;
        this.price = price;
        this.image = image;
        this.category = x;
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

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getVote() {
        return vote;
    }

    public void setVote(double vote) {
        this.vote = vote;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", unit=" + unit + ", brand=" + brand + ", image=" + image + ", discount=" + discount + ", vote=" + vote + ", price=" + price + ", sold=" + sold + '}';
    }

    public String getPriceString() {
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(Locale.US);
        String ccx = currencyFormatter.format(this.price);
        String k = ccx.substring(1, ccx.length() - 3);
        return k;

    }

    public String getPrice() {
        DecimalFormat decimalFormat = new DecimalFormat("#,###");
        String soDaDinhDang = decimalFormat.format(this.price);
        return soDaDinhDang;
    }

    public double getPriceDouble() {
        return this.price;
    }

    public String getDiscountPrice() {
        DecimalFormat decimalFormat = new DecimalFormat("#,###");
        String soDaDinhDang = decimalFormat.format(this.price - this.price * this.discount);
        return soDaDinhDang;
    }
    
    public double getDiscountPriceDouble() {
        return this.price - this.price * this.discount;
    }

}
