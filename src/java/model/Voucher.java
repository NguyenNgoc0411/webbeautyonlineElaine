/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.DecimalFormat;
import java.util.Date;

/**
 *
 * @author 2021
 */
public class Voucher {

    private String id, description, content;
    private Date startDate, endDate;
    private double minprice, discount;

    public Voucher() {

    }

    public Voucher(String id, String description, String content, Date startDate, Date endDate, double minprice, double discount) {
        this.id = id;
        this.description = description;
        this.content = content;
        this.startDate = startDate;
        this.endDate = endDate;
        this.minprice = minprice;
        this.discount = discount;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public double getMinprice() {
        return minprice;
    }

    public void setMinprice(double minprice) {
        this.minprice = minprice;
    }

    public double getDiscount() {
        return discount;
    }
    
    public void setDiscount(double discount) {
        this.discount = discount;
    }

    @Override
    public String toString() {
        return "Voucher{" + "id=" + id + ", description=" + description + ", content=" + content + ", startDate=" + startDate + ", endDate=" + endDate + ", minprice=" + minprice + ", discount=" + discount + '}';
    }
    
    public String formatDouble(double number) {
        DecimalFormat decimalFormat = new DecimalFormat("#,##0");
        return decimalFormat.format(number);
    }
}
