/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import DAO.DAO;

/**
 *
 * @author 2021
 */
public class Image {
     private String id, path;

    public Image() {
    }

    public Image(String path) {
        DAO dao = new DAO();
        int count = dao.getQuantityOfImages();
        this.id = String.format("I%05d", count+1);
        this.path = path;
    }

    public Image(String id, String path) {
        this.id = id;
        this.path = path;
    }
    
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Override
    public String toString() {
        return "Image{" + "id=" + id + ", path=" + path + '}';
    }
    
}
