/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author 2021
 */
public class Order {

    private String id;
    private Payment payment;
    private Shipment shipment;
    private Voucher voucher;
    private Customer customer;
    private Date date, approvaldate;
    private double discount, price, totalamount;
    private List<ProductOrder> productorder;

    public Order() {

    }

    public Order(String id, Payment payment, Shipment shipment, Voucher voucher, Customer customer, Date date, Date approvaldate, double discount, double price, double totalamount, List<ProductOrder> productorder) {
        this.id = id;
        this.payment = payment;
        this.shipment = shipment;
        this.voucher = voucher;
        this.customer = customer;
        this.date = date;
        this.approvaldate = approvaldate;
        this.discount = discount;
        this.price = price;
        this.totalamount = totalamount;
        this.productorder = productorder;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    public Shipment getShipment() {
        return shipment;
    }

    public void setShipment(Shipment shipment) {
        this.shipment = shipment;
    }

    public Voucher getVoucher() {
        return voucher;
    }

    public void setVoucher(Voucher voucher) {
        this.voucher = voucher;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getApprovaldate() {
        return approvaldate;
    }

    public void setApprovaldate(Date approvaldate) {
        this.approvaldate = approvaldate;
    }

    public String getDateString() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = format.format(date);
        return dateString;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotalamount() {
        return totalamount;
    }

    public void setTotalamount(double totalamount) {
        this.totalamount = totalamount;
    }

    public List<ProductOrder> getProductorder() {
        return productorder;
    }

    public void setProductorder(List<ProductOrder> productorder) {
        this.productorder = productorder;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", payment=" + payment + ", shipment=" + shipment + ", voucher=" + voucher + ", customer=" + customer + ", date=" + date + ", approvaldate=" + approvaldate + ", discount=" + discount + ", price=" + price + ", totalamount=" + totalamount + ", productorder=" + productorder + '}';
    }

    public String getStatusString(){
    if(this.shipment.getStatus()==0)
    {
        return "Chờ xác nhận";
    }
    else if(this.shipment.getStatus()==1)
    {
        return "Đang vận chuyển";
    }
    else if( this.shipment.getStatus()==-1)
    {
        return "Đã hủy";
    }
    return "Hoàn tất";
}
    public String getTotalamountString() {
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(Locale.US);
        String ccx = currencyFormatter.format(this.totalamount);
        String k = ccx.substring(1, ccx.length() - 3);
        return k;

    }

    public String getDiscountString() {
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(Locale.US);
        String ccx = currencyFormatter.format(this.discount);
        String k = ccx.substring(1, ccx.length() - 3);
        return k;
    }

    public String getPriceString() {
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(Locale.US);
        String ccx = currencyFormatter.format(this.price);
        String k = ccx.substring(1, ccx.length() - 3);
        return k;
    }
    
    
//    public String getPriceString() {
//        return formatDouble(totalamount);
//    }
    
    public String formatDouble(double number) {
        DecimalFormat decimalFormat = new DecimalFormat("#,##0");
        return decimalFormat.format(number);
    }
}
