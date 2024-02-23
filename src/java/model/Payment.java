/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author 2021
 */
public class Payment {
    private String id,formpayment;
    private double totalamount;
    private Date datepayment;
    private int status;
    public Payment()
    {
        
    }

    public Payment(String id, String formpayment, double totalamount, Date datepayment, int status) {
        this.id = id;
        this.formpayment = formpayment;
        this.totalamount = totalamount;
        this.datepayment = datepayment;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFormpayment() {
        return formpayment;
    }

    public void setFormpayment(String formpayment) {
        this.formpayment = formpayment;
    }

    public double getTotalamount() {
        return totalamount;
    }

    public void setTotalamount(double totalamount) {
        this.totalamount = totalamount;
    }

    public Date getDatepayment() {
        return datepayment;
    }
    public String getDatePaymentString()
    {
         SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd");
         if(datepayment==null)
         {
             return "";
         }
        String dateString= format.format(datepayment);
        return dateString;
    }
    public void setDatepayment(Date datepayment) {
        this.datepayment = datepayment;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Payment{" + "id=" + id + ", formpayment=" + formpayment + ", totalamount=" + totalamount + ", datepayment=" + datepayment + ", status=" + status + '}';
    }
    
    
}
