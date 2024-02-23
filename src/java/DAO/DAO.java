/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import model.Category;
import model.HotSale;
import model.Image;
import model.Product;
import model.ProductDetail;
import model.SaleProduct;
import java.util.List;
import java.sql.*;
import java.util.*;

/**
 *
 * @author luong
 */
public class DAO {
    
    
    
    public void updateSoldProductById(int sold, String productId){
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        String query = "UPDATE `webonline`.`tblproduct` SET `sold` = sold + ? WHERE (`id` = ?);";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setDouble(1, sold);
            ps.setString(2, productId);
            ps.executeUpdate();
        } catch (Exception e) {
            // lỗi
            System.out.println("update số lượng không thành công");
        }
    }
    
    public void updateQuantityProductById(int quantity, String productId){
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        String query = "UPDATE `webonline`.`tblproductdetail` SET `quantity` = ? WHERE (`tblproductid` = ?);";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setDouble(1, quantity);
            ps.setString(2, productId);
            ps.executeUpdate();
        } catch (Exception e) {
            // lỗi
            System.out.println("update số lượng không thành công");
        }
    }
    
    public int getQuantityProductById(String productId){
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        int quantity = 0;
        String query = "SELECT quantity FROM webonline.tblproductdetail where tblproductid = ?;";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                quantity = rs.getInt(1);
                break;
            }
        } catch (Exception e) {
            System.out.println("Lấy số lượng không thành công");
        }
        return quantity;
    }

    public List<HotSale> getAllHotSale() {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        List<HotSale> list = new ArrayList<>();
        String query = "SELECT * FROM webonline.tblhotsale;";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new HotSale(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<String> getAllBrandName() {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        List<String> list = new ArrayList<>();
        String query = "SELECT distinct brand FROM webonline.tblproduct;";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public HotSale getHotSaleByID(String hotSaleId) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        HotSale hotsale = new HotSale();
        String query = "SELECT * FROM webonline.tblhotsale WHERE id = ?;";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, hotSaleId);
            rs = ps.executeQuery();
            while (rs.next()) {
                hotsale = new HotSale(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
            }
        } catch (Exception e) {
        }
        return hotsale;
    }

    public List<Product> getAllProducts() {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM webonline.tblproduct;";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category cte= this.getCategoryByID(rs.getString(10));
                Product x = new Product(rs.getString(1), rs.getDouble(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getDouble(7), rs.getDouble(8), rs.getString(9), cte);
                list.add(x);
            }
        } catch (Exception e) {
        }
        return list;
    }
    // chuyển thành lấy 6
    public List<Product> getNext6Products(int count) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM webonline.tblproduct ORDER BY id LIMIT 6 OFFSET ?;";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, count);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product x = new Product(rs.getString(1), rs.getDouble(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getDouble(7), rs.getDouble(8), rs.getString(9),this.getCategoryByID(rs.getString(10)));
                list.add(x);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductsByCategoryId(String Id) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM webonline.tblproduct WHERE tblcategoryid = ?;";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, Id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category cte= this.getCategoryByID(rs.getString(10));
                Product x = new Product(rs.getString(1), rs.getDouble(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getDouble(7), rs.getDouble(8), rs.getString(9), cte);
                list.add(x);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Product> getProductsByBrandName(String brandName) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM webonline.tblproduct WHERE brand LIKE ?;";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, brandName);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category cte= this.getCategoryByID(rs.getString(10));
                Product x = new Product(rs.getString(1), rs.getDouble(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getDouble(7), rs.getDouble(8), rs.getString(9), cte);
                list.add(x);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<SaleProduct> getSaleProductsByHotsaleId(String Id) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        List<SaleProduct> list = new ArrayList<>();
        String query = """
                       SELECT tblsaleproduct.*, tblproductdetail.quantity FROM webonline.tblsaleproduct, webonline.tblproductdetail
                       WHERE tblsaleproduct.productId = tblproductdetail.tblproductid
                       AND tblsaleproduct.hotSaleId = ?;
                       """;
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, Id);
            rs = ps.executeQuery();
            while (rs.next()) {
                SaleProduct x = new SaleProduct(rs.getString(1), rs.getDouble(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6));
                list.add(x);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchProducts(String text) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM webonline.tblproduct WHERE name LIKE ? OR id LIKE ? OR brand LIKE ?;";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            text = "%" + text + "%";
            ps.setString(1, text);
            ps.setString(2, text);
            ps.setString(3, text);
            
            rs = ps.executeQuery();
            while (rs.next()) {
                Product x = new Product(rs.getString(1), rs.getDouble(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getDouble(7), rs.getDouble(8), rs.getString(9), this.getCategoryByID(rs.getString(10)));
                list.add(x);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> getAllCategories() {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        List<Category> list = new ArrayList<>();
        String query = "SELECT * FROM webonline.tblcategory;";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category x = new Category(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                list.add(x);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Category getCategoryByID(String categoryID) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        Category tmp = new Category();
        String query = "SELECT * FROM webonline.tblcategory WHERE id = ?;";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, categoryID);
            rs = ps.executeQuery();
            while (rs.next()) {
                tmp = new Category(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
            }
        } catch (Exception e) {
        }
        return tmp;
    }

    public int getQuantityOfImages() {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        int result = 0;
        String query = "SELECT count(*) FROM webonline.tblimage;";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return result;
    }

    public void addProduct(Product product) {
        System.out.println(product);
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        String query = """
               INSERT INTO webonline.`tblproduct` (id, vote, name, unit, brand, sold, discount, price, image, tblcategoryid) 
               VALUES 
               (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
               """;
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, product.getId());
            ps.setDouble(2, product.getVote());
            ps.setString(3, product.getName());
            ps.setString(4, product.getUnit());
            ps.setString(5, product.getBrand());
            ps.setInt(6, product.getSold());
            ps.setDouble(7, product.getDiscount());
            ps.setDouble(8, product.getPriceDouble());
            ps.setString(9, product.getImage());
            ps.setString(10, product.getCategory().getId());
            ps.executeUpdate();
            System.out.println(query);
        } catch (Exception e) {
            System.out.println("looix");
        }
    }

    public void addListProductImg(Image image, String productId) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        String query = """
               INSERT INTO `webonline`.`tblimage` (`id`, `tblproductdetail`, `path`) VALUES (?, ?, ?);
               """;
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, image.getId());
            ps.setString(2, productId);
            ps.setString(3, image.getPath());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("looix");
        }
    }

    public void addProductDetail(ProductDetail productDetail) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        String query = """
               INSERT INTO webonline.`tblproductdetail` (tblproductid, size, description, quantity, typeskin, origin, problem, ingredient, instruct,`characteris`)
               VALUES 
               (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
               """;
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, productDetail.getId());
            ps.setString(2, productDetail.getSize());
            ps.setString(3, productDetail.getDescription());
            ps.setInt(4, productDetail.getQuantity());
            ps.setString(5, productDetail.getTypeskin());
            ps.setString(6, productDetail.getOrigin());
            ps.setString(7, productDetail.getProblem());
            ps.setString(8, productDetail.getIngredient());
            ps.setString(9, productDetail.getInstruct());
            ps.setString(10, productDetail.getCharacteris());
            ps.executeUpdate();
            System.out.println(query);
        } catch (Exception e) {
            System.out.println("looix");
        }
    }
    
     public void addSaleProduct(SaleProduct saleProduct) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        String query = """
               INSERT INTO `webonline`.`tblsaleproduct` (`productId`, `discount`, `description`, `hotSaleId`, `quantity`) VALUES (?, ?, ?, ?, ?);
               """;
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, saleProduct.getProduct().getId());
            ps.setDouble(2, saleProduct.getDiscount());
            ps.setString(3, saleProduct.getDescription());
            ps.setString(4, saleProduct.getHotsale().getId());
            ps.setInt(5, saleProduct.getQuantity());
            ps.executeUpdate();
            this.updateDiscountProduct(saleProduct.getDiscount(), saleProduct.getProduct().getId());
        } catch (Exception e) {
            System.out.println("looix");
        }
    }

    public void deleteProduct(String Id) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        String query = "DELETE FROM `webonline`.`tblproduct` WHERE (`id` = ?);";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, Id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteSaleProduct(String Id) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        String query = "DELETE FROM `webonline`.`tblsaleproduct` WHERE (`productId` = ?);";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, Id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Product getProductbyId(String Id) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        Product tmp = new Product();
        String query = "SELECT * FROM webonline.tblproduct WHERE id = ?;";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, Id);
            rs = ps.executeQuery();
            while (rs.next()) {
                tmp = new Product(rs.getString(1), rs.getDouble(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getDouble(7), rs.getDouble(8), rs.getString(9),  this.getCategoryByID(rs.getString(10)));
            }
        } catch (Exception e) {
        }
        return tmp;
    }

    public ArrayList<Image> getImagesByProductId(String Id) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        ArrayList<Image> images = new ArrayList<>();
        String query = "SELECT * FROM webonline.tblimage where tblproductdetail = ?;";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, Id);
            rs = ps.executeQuery();
            while (rs.next()) {
                images.add(new Image(rs.getString(1), rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return images;
    }

    public ProductDetail getProductDetailById(String Id) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        Product product = new DAO().getProductbyId(Id);
        ArrayList<Image> images = new DAO().getImagesByProductId(Id);
        ProductDetail productDetail = new ProductDetail();
        String query = "SELECT * FROM webonline.tblproductdetail WHERE tblproductid = ?;";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, Id);
            rs = ps.executeQuery();
            while (rs.next()) {
                productDetail = new ProductDetail(images, rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        product.getId(), product.getVote(), product.getName(), product.getUnit(), product.getBrand(), product.getSold(), product.getDiscount(),
                        product.getPriceDouble(), product.getImage(), product.getCategory());
            }
        } catch (Exception e) {
        }
        return productDetail;
    }

    public void updateProduct(Product product) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        String query = "UPDATE `webonline`.`tblproduct` SET `name` = ?, `unit` = ?, `brand` = ?, `discount` = ?, `price` = ?, `image` = ?, `tblcategoryid` = ? WHERE (`id` = ?);";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, product.getName());
            ps.setString(2, product.getUnit());
            ps.setString(3, product.getBrand());
            ps.setDouble(4, product.getDiscount());
            ps.setDouble(5, product.getPriceDouble());
            ps.setString(6, product.getImage());
            ps.setString(7, product.getCategory().getId());
            ps.setString(8, product.getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateDiscountAndQuantity(String discount, String quantity, String productId) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        String query = "UPDATE `webonline`.`tblsaleproduct` SET `discount` = ?, `quantity` = ? WHERE (`productId` = ?);";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setDouble(1, Double.parseDouble(discount));
            ps.setInt(2, Integer.parseInt(quantity));
            ps.setString(3, productId);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void updateDiscountProduct(double discount, String productId) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        String query = "UPDATE `webonline`.`tblproduct` SET `discount` = ? WHERE (`id` = ?);";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setDouble(1, discount);
            ps.setString(2, productId);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateProductDetail(ProductDetail productDetail) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        String query = "UPDATE webonline.`tblproductdetail` SET `size` = ?, `description` = ?, `quantity` = ?, `typeskin` = ?, `origin` = ?, `problem` = ?, `ingredient` = ?, `instruct` = ?,`characteris` = ? WHERE (`tblproductid` = ?);";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, productDetail.getSize());
            ps.setString(2, productDetail.getDescription());
            ps.setInt(3, productDetail.getQuantity());
            ps.setString(4, productDetail.getTypeskin());
            ps.setString(5, productDetail.getOrigin());
            ps.setString(6, productDetail.getProblem());
            ps.setString(7, productDetail.getIngredient());
            ps.setString(8, productDetail.getInstruct());
            ps.setString(9, productDetail.getCharacteris());
            ps.setString(10, productDetail.getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateImageProductDetail(Image image, String Id) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        String query = "UPDATE webonline.tblimage SET `path` = ? WHERE (`tblproductdetail` = ?);";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, image.getPath());
            ps.setString(2, Id);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    
    // toàn
     public double revenueStat(String frDate, String toDate) throws Exception {
        double revenue = 0;
//        sua lai truy van
        String sql = "SELECT totalamount FROM tblpayment WHERE paymentdate >= ? AND paymentdate <= ?;";
        try {
             Connection connection = null;
             connection = new DBContext1().getConnection();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, frDate);
            st.setString(2, toDate);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                revenue += rs.getDouble(1);
            }
            System.out.println(rs);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return revenue;
    }
     public Product getProduct(String Id) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        Product tmp = new Product();
        String query = "SELECT * FROM webonline.tblproduct WHERE id = ?;";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, Id);
            rs = ps.executeQuery();
            while (rs.next()) {
                tmp = new Product(rs.getString(1), rs.getDouble(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getDouble(7), rs.getDouble(8), rs.getString(9),  this.getCategoryByID(rs.getString(10)));
            }
        } catch (Exception e) {
        }
        return tmp;
    }

    public double monthlyRevenueStat(String month, String year) throws Exception {
        double revenue = 0;
        String sql = "	  SELECT totalamount\n"
                + "FROM tblpayment\n"
                + "WHERE YEAR(paymentdate) = ?\n"
                + "  AND DATEPART(MONTH, paymentdate) = ?";
        try {
            Connection connection = null;
             connection = new DBContext1().getConnection();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, year);
            st.setString(2, month);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                revenue += rs.getDouble(1);
            }
            System.out.println(rs);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return revenue;
    }

//    public List<String> getOderId(String frDate, String toDate) {
//        List<String> OderIdList = new ArrayList<>();
//        String sql = "SELECT id FROM tblOder WHERE date >= ? AND date <= ?;";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, frDate);
//            st.setString(2, toDate);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                OderIdList.add(rs.getString(1));
//            }
//            System.out.println(rs);
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return OderIdList;
//    }
    public Map<Product, Double> getSoldProducts(String frDate, String toDate, int top) throws Exception {
        Map<Product, Double> SoldProducts = new LinkedHashMap<>();
        String sql = "SELECT p.id, po.quantity, po.price, SUM(po.quantity * po.price) AS total\n"
                + "FROM tblorder o\n"
                + "JOIN tblProductOrder po ON o.id = po.tblorderid\n"
                + "JOIN tblproduct p ON po.tblproductid = p.id\n"
                + "WHERE o.date >= '?' AND o.date <= '?'\n"
                + "GROUP BY p.id, po.quantity, po.price ORDER BY total DESC Limit ?;";
        try {
             Connection connection = null;
             connection = new DBContext1().getConnection();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(3, String.valueOf(top));
            st.setString(1, frDate);
            st.setString(2, toDate);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SoldProducts.put(getProduct(rs.getString(1)), rs.getDouble(4));
            }
            System.out.println(rs);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return SoldProducts;
    }

    public List<String> getOrderByProductId(String frDate, String toDate, String productId) throws Exception {
        List<String> results = new ArrayList<>();
        String sql = "SELECT tblorder.id, tblorder.date, tblUser.name, tblUser.phone, tblorder.totalamount\n"
                + "FROM tblorder\n"
                + "JOIN tblProductOrder ON tblorder.id = tblProductOrder.tblorderid\n"
                + "JOIN tblproduct ON tblProductOrder.tblproductid = tblproduct.id\n"
                + "JOIN tblUser ON tblorder.tblcustomerid = tblUser.id\n"
                + "WHERE tblproduct.id = ?\n"
                + "  AND tblorder.date >= '?'\n"
                + "  AND tblorder.date <= '?';";
        try {
             Connection connection = null;
             connection = new DBContext1().getConnection();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, productId);
            st.setString(2, frDate);
            st.setString(3, toDate);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String tmp = rs.getString(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4)+":"+rs.getString(5);
                results.add(tmp);
            }
            System.out.println(rs);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return results;
    }

    public Map<String, Double> getCustomer(String frDate, String toDate, int top) throws Exception {
        Map<String, Double> Customers = new LinkedHashMap<>();
        String sql = "SELECT u.name, u.email, SUM(o.totalamount) AS total_amount\n"
                + "FROM tblorder o\n"
                + "JOIN tblUser u ON o.tblCustomerId = u.id\n"
                + "WHERE o.date >= '?' AND o.date <= '?'\n"
                + "GROUP BY u.name, u.email ORDER BY total_amount DESC limit ?;";
        try {
             Connection connection = null;
             connection = new DBContext1().getConnection();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, frDate);
            st.setString(2, toDate);
            st.setString(3, String.valueOf(top));
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customers.put(rs.getString(1), rs.getDouble(3));
            }
            System.out.println(rs);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return Customers;
    }

    public int countOder(String frDate, String toDate) throws Exception {
        String sql = "SELECT COUNT(*) AS order_count\n"
                + "FROM tblorder\n"
                + "WHERE date >= '?' AND date <= '?';";
        try {
             Connection connection = null;
             connection = new DBContext1().getConnection();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, frDate);
            st.setString(2, toDate);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
            System.out.println(rs);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
}
