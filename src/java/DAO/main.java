/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.text.DecimalFormat;

/**
 *
 * @author 2021
 */
public class main {

    public static void main(String[] args) {
        double number = 12345.6789;

        // Sử dụng DecimalFormat để định dạng số
        String formattedNumber = formatDouble(number);
        System.out.println("Formatted Number: " + formattedNumber);
    }

    public static String formatDouble(double number) {
        DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
        return decimalFormat.format(number);
    }
}
