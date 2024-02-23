/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author 2021
 */
public class ProductDetail extends Product{
    private ArrayList<Image> images;
    private String size, description;
    private int quantity;
    private String typeskin, origin, problem, ingredient, instruct, characteris;

    public ProductDetail() {
    }

    public ProductDetail(ArrayList<Image> images, String size, String description, int quantity, String typeskin, String origin, String problem, String ingredient, String instruct, String characteris, String id, double vote, String name, String unit, String brand, int sold, double discount, double price, String image, Category category) {
        super(id, vote, name, unit, brand, sold, discount, price, image, category);
        this.images = images;
        this.size = size;
        this.description = description;
        this.quantity = quantity;
        this.typeskin = typeskin;
        this.origin = origin;
        this.problem = problem;
        this.ingredient = ingredient;
        this.instruct = instruct;
        this.characteris = characteris;
    }

    public ArrayList<Image> getImagesDetail() {
        return images;
    }

    public void setImage(ArrayList<Image> image) {
        this.images = image;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getTypeskin() {
        return typeskin;
    }

    public void setTypeskin(String typeskin) {
        this.typeskin = typeskin;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getProblem() {
        return problem;
    }

    public void setProblem(String problem) {
        this.problem = problem;
    }

    public String getIngredient() {
        return ingredient;
    }

    public void setIngredient(String ingredient) {
        this.ingredient = ingredient;
    }

    public String getInstruct() {
        return instruct;
    }

    public void setInstruct(String instruct) {
        this.instruct = instruct;
    }

    public String getCharacteris() {
        return characteris;
    }

    public void setCharacteris(String characteris) {
        this.characteris = characteris;
    }
    
    
}
