/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Date;
import java.util.Locale;

/**
 *
 * @author 2021
 */
public class Shipment {

    private String id, type;
    private Date expectdelivery;
    private double transportfee;
    private int status;
    private Information information;

    public Shipment() {

    }

    public Shipment(String id, String type, Date expectdelivery, double transportfee, int status, Information information) {
        this.id = id;
        this.type = type;
        this.expectdelivery = expectdelivery;
        this.transportfee = transportfee;
        this.status = status;
        this.information = information;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getExpectdelivery() {
        return expectdelivery;
    }

    public void setExpectdelivery(Date expectdelivery) {
        this.expectdelivery = expectdelivery;
    }

    public String getTransportfeeString() {
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(Locale.US);
        String ccx = currencyFormatter.format(this.transportfee);
        String k = ccx.substring(1, ccx.length() - 3);
        return k;
    }

    public double getTransportfee() {
        return transportfee;
    }

    public void setTransportfee(double transportfee) {
        this.transportfee = transportfee;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Information getInformation() {
        return information;
    }

    public void setInformation(Information information) {
        this.information = information;
    }

    @Override
    public String toString() {
        return "Shipment{" + "id=" + id + ", type=" + type + ", expectdelivery=" + expectdelivery + ", transportfee=" + transportfee + ", status=" + status + ", information=" + information + '}';
    }

    /**
     *
     * @param number
     * @return
     */
    
    public String formatDouble(double number) {
        DecimalFormat decimalFormat = new DecimalFormat("#,##0");
        return decimalFormat.format(number);
    }
    
    
}
