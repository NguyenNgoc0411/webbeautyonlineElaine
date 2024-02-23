/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author 2021
 */
public class Account {
    private String username,password;
    private int roleid;
    public Account()
    {
        
        
    }
    public Account( String username, String password, int roleid) {
        
        this.username = username;
        this.password = password;
        this.roleid = roleid;
    }

    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoleid() {
        return roleid;
    }

    public void setRoleid(int roleid) {
        this.roleid = roleid;
    }

    @Override
    public String toString() {
        return "Account{" + "username=" + username + ", password=" + password + ", roleid=" + roleid + '}';
    }

   
    
    
    
}
