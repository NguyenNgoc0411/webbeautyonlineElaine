/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.*;
import java.util.List;
import model.Address;
import model.Category;
import model.Customer;
import model.Information;
import model.Order;
import model.Payment;
import model.Product;
import model.ProductOrder;
import model.Shipment;
import model.Voucher;

/**
 *
 * @author 2021
 */
public class OrderDAO extends DBContext {

    public Order getOrderById(String id, Customer idCustomer) {
        try {

            String query = "select * from tblorder where id=?";

            PreparedStatement ps = connection.prepareStatement(query);

            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                java.sql.Date sqlDate = rs.getDate("date");

                // Chuyển đổi thành java.util.Date
                java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
                java.sql.Date sqlDate1 = rs.getDate("approvaldate");
//                         private String id;
//    private Payment payment;
//    private Shipment shipment;
//    private Voucher voucher;
//    private  Customer customer;
//    private Date date,approvaldate;
//    private double  discount,price,to
//                         

                // Chuyển đổi thành java.util.Date
                java.util.Date utilDate1 = new java.util.Date(sqlDate.getTime());
                String orderId = rs.getString("id");
                Order a = new Order();
                a.setId(orderId);
                a.setShipment(this.getShipmentByOrderId(orderId));
                a.setPayment(this.getPaymentByOrderId(orderId));
                a.setCustomer(idCustomer);
                if (this.getVoucherByIdOrder(orderId) != null) {

                    a.setVoucher(this.getVoucherByIdOrder(orderId));
                } else {
                    a.setVoucher(null);
                }
                a.setApprovaldate(utilDate1);
                a.setDate(utilDate);
                a.setDiscount(rs.getDouble("discount"));
                a.setPrice(rs.getDouble("price"));
                a.setTotalamount(rs.getDouble("totalamount"));
                a.setProductorder(this.getProductOrdersByOrders(orderId));
                return a;

            }

        } catch (Exception e) {
        }
        return null;
    }

    public List<Order> getAllOrderByDone(Customer idCustomer) {
        try {

            String query = "select tblorder.*,tblshipment.status from tblorder,tblshipment where tblcustomerid=? and tblshipment.tblorderid=tblorder.id and tblshipment.status='2' order by date desc";

            PreparedStatement ps = connection.prepareStatement(query);

            ps.setString(1, idCustomer.getId());
            ResultSet rs = ps.executeQuery();
            List<Order> list = new ArrayList<>();
            while (rs.next()) {
                java.sql.Date sqlDate = rs.getDate("date");

                // Chuyển đổi thành java.util.Date
                java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
                java.sql.Date sqlDate1 = rs.getDate("approvaldate");
//                         private String id;
//    private Payment payment;
//    private Shipment shipment;
//    private Voucher voucher;
//    private  Customer customer;
//    private Date date,approvaldate;
//    private double  discount,price,to
//                         

                // Chuyển đổi thành java.util.Date
                java.util.Date utilDate1 = new java.util.Date(sqlDate.getTime());
                String orderId = rs.getString("id");
                Order a = new Order();
                a.setId(orderId);
                a.setShipment(this.getShipmentByOrderId(orderId));
                a.setPayment(this.getPaymentByOrderId(orderId));
                a.setCustomer(idCustomer);
                if (this.getVoucherByIdOrder(orderId) != null) {

                    a.setVoucher(this.getVoucherByIdOrder(orderId));
                } else {
                    a.setVoucher(null);
                }
                a.setApprovaldate(utilDate1);
                a.setDate(utilDate);
                a.setDiscount(rs.getDouble("discount"));
                a.setPrice(rs.getDouble("price"));
                a.setTotalamount(rs.getDouble("totalamount"));
                a.setProductorder(this.getProductOrdersByOrders(orderId));
                list.add(a);

            }
            return list;

        } catch (Exception e) {
        }
        return null;
    }

    public List<Order> getAllOrderByTransport(Customer idCustomer) {
        try {

            String query = "select tblorder.*,tblshipment.status from tblorder,tblshipment where tblcustomerid=? and tblshipment.tblorderid=tblorder.id and tblshipment.status='1' order by date desc";

            PreparedStatement ps = connection.prepareStatement(query);

            ps.setString(1, idCustomer.getId());
            ResultSet rs = ps.executeQuery();
            List<Order> list = new ArrayList<>();
            while (rs.next()) {
                java.sql.Date sqlDate = rs.getDate("date");

                // Chuyển đổi thành java.util.Date
                java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
                java.sql.Date sqlDate1 = rs.getDate("approvaldate");
//                         private String id;
//    private Payment payment;
//    private Shipment shipment;
//    private Voucher voucher;
//    private  Customer customer;
//    private Date date,approvaldate;
//    private double  discount,price,to
//                         

                // Chuyển đổi thành java.util.Date
                java.util.Date utilDate1 = new java.util.Date(sqlDate.getTime());
                String orderId = rs.getString("id");
                Order a = new Order();
                a.setId(orderId);
                a.setShipment(this.getShipmentByOrderId(orderId));
                a.setPayment(this.getPaymentByOrderId(orderId));
                a.setCustomer(idCustomer);
                if (this.getVoucherByIdOrder(orderId) != null) {

                    a.setVoucher(this.getVoucherByIdOrder(orderId));
                } else {
                    a.setVoucher(null);
                }
                a.setApprovaldate(utilDate1);
                a.setDate(utilDate);
                a.setDiscount(rs.getDouble("discount"));
                a.setPrice(rs.getDouble("price"));
                a.setTotalamount(rs.getDouble("totalamount"));
                a.setProductorder(this.getProductOrdersByOrders(orderId));
                list.add(a);

            }
            return list;

        } catch (Exception e) {
        }
        return null;
    }

    public List<Order> getAllOrderByConfirm(Customer idCustomer) {
        try {

            String query = "select tblorder.*,tblshipment.status from tblorder,tblshipment where tblcustomerid=? and tblshipment.tblorderid=tblorder.id and tblshipment.status='0' order by date desc";

            PreparedStatement ps = connection.prepareStatement(query);

            ps.setString(1, idCustomer.getId());
            ResultSet rs = ps.executeQuery();
            List<Order> list = new ArrayList<>();
            while (rs.next()) {
                java.sql.Date sqlDate = rs.getDate("date");

                // Chuyển đổi thành java.util.Date
                java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
                java.sql.Date sqlDate1 = rs.getDate("approvaldate");
//                         private String id;
//    private Payment payment;
//    private Shipment shipment;
//    private Voucher voucher;
//    private  Customer customer;
//    private Date date,approvaldate;
//    private double  discount,price,to
//                         

                // Chuyển đổi thành java.util.Date
                java.util.Date utilDate1 = new java.util.Date(sqlDate.getTime());
                String orderId = rs.getString("id");
                Order a = new Order();
                a.setId(orderId);
                a.setShipment(this.getShipmentByOrderId(orderId));
                a.setPayment(this.getPaymentByOrderId(orderId));
                a.setCustomer(idCustomer);
                if (this.getVoucherByIdOrder(orderId) != null) {

                    a.setVoucher(this.getVoucherByIdOrder(orderId));
                } else {
                    a.setVoucher(null);
                }
                a.setApprovaldate(utilDate1);
                a.setDate(utilDate);
                a.setDiscount(rs.getDouble("discount"));
                a.setPrice(rs.getDouble("price"));
                a.setTotalamount(rs.getDouble("totalamount"));
                a.setProductorder(this.getProductOrdersByOrders(orderId));
                list.add(a);

            }
            return list;

        } catch (Exception e) {
        }
        return null;
    }

    public Shipment getShipmentByOrderId(String idOr) {
        try {
            String query = "select a.*,b.id as idd,b.name,b.phone,b.street,b.province,b.district,b.communes,b.description from tblshipment as a,tblinformation as b where a.tblorderid=? and b.id= a.tblinformationid";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, idOr);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Address xAddress = new Address(rs.getString("street"), rs.getString("province"), rs.getString("district"), rs.getString("communes"), rs.getString("description"));
                Information info = new Information(rs.getString("idd"), rs.getString("name"), rs.getString("phone"), xAddress);
                java.sql.Date sqlDate = rs.getDate("expectdelivery");

                // Chuyển đổi thành java.util.Date
                java.util.Date utilDate = new java.util.Date(sqlDate.getTime());

                Shipment aShipment;
                aShipment = new Shipment(rs.getString("id"), rs.getString("type"), utilDate, rs.getDouble("transportfee"), rs.getInt("status"), info);
                return aShipment;
            }

        } catch (Exception e) {
        }
        return null;
    }

    public Payment getPaymentByOrderId(String idOr) {
        try {
            String query = "select * from tblpayment where tblorderid=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, idOr);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                java.sql.Date sqlDate = rs.getDate("datepayment");

                // Chuyển đổi thành java.util.Date
                Payment p = new Payment();
                p.setId(rs.getString("id"));
                p.setFormpayment(rs.getString("formpayment"));
                p.setTotalamount(rs.getDouble("totalamount"));
                p.setStatus(rs.getInt("status"));
                if (sqlDate == null) {
                    p.setDatepayment(null);
                } else {
                    java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
                    p.setDatepayment(utilDate);
                }

                return p;
            }

        } catch (Exception e) {
        }
        return null;
    }

    public Voucher getVoucherByIdOrder(String id) {
        try {
            String query = "select tblvoucher.* from tblvoucher,tblorder where tblorder.tblvoucherid=tblvoucher.id and tblorder.id=?";
            PreparedStatement ps = connection.prepareStatement(query);

            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                java.sql.Date sqlDate = rs.getDate("startdate");

                // Chuyển đổi thành java.util.Date
                java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
                java.sql.Date sqlDate1 = rs.getDate("enddate");
                java.util.Date endDate = new java.util.Date(sqlDate1.getTime());

                Voucher x = new Voucher();

                x.setId(rs.getString("id"));
                x.setDescription(rs.getString("description"));
                x.setContent(rs.getString("content"));
                x.setStartDate(utilDate);
                x.setEndDate(endDate);
                x.setMinprice(rs.getDouble("minprice"));
                x.setDiscount(rs.getDouble("discount"));
                return x;
            }

        } catch (Exception e) {
        }
        return null;
    }

    public List<ProductOrder> getProductOrdersByOrders(String id) {
        try {

            String query = "select a.quantity, a.totalprice,b.* from tblproductorder as a, tblproduct as b where a.tblorderid=? and a.tblproductid=b.id";

            PreparedStatement ps = connection.prepareStatement(query);

            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            List<ProductOrder> list = new ArrayList<>();
//            public ProductOrder(int quantity, double totalprice, String id, String name, String unit, String brand, String image, double discount, double vote, double price, int sold) {
//        super(id, name, unit, brand, image, discount, vote, price, sold);
            while (rs.next()) {

                ProductOrder po = new ProductOrder(rs.getInt("quantity"), rs.getDouble("totalprice"), rs.getString("id"), rs.getDouble("vote"), rs.getString("name"), rs.getString("unit"), rs.getString("brand"), rs.getInt("sold"), rs.getDouble("discount"), rs.getDouble("price"), rs.getString("image"), this.getCategoryByID(rs.getString("tblcategoryid")));
                list.add(po);

            }
            return list;

        } catch (Exception e) {
            System.out.println("lỗi get product by order");
        }
        return null;
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

    public void removeOrder() {

    }

    public String addOrder(Order order) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        String query = "INSERT INTO `webonline`.`tblorder` (`id`, `date`, `approvaldate`, `discount`, `totalamount`, `tblcustomerid`, `tblvoucherid`, `price`) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        if (order.getVoucher() == null) {
            query = "INSERT INTO `webonline`.`tblorder` (`id`, `date`, `approvaldate`, `discount`, `totalamount`, `tblcustomerid`, `price`) VALUES (?, ?, ?, ?, ?, ?, ?);";
        }
        String tmp = "";
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            java.sql.Date date = new java.sql.Date(order.getDate().getTime());
            tmp = String.format("DH%05d", countraw());
            ps.setString(1, tmp);
            ps.setDate(2, date);
            ps.setDate(3, null);
            ps.setDouble(4, order.getDiscount());
            ps.setDouble(5, order.getTotalamount());
            ps.setString(6, order.getCustomer().getId());
            if (order.getVoucher() == null) {
                ps.setDouble(7, order.getPrice());
            } else {
                ps.setString(7, order.getVoucher().getId());
                ps.setDouble(8, order.getPrice());
            }
            ps.executeUpdate();
        } catch (Exception e) {

        }
        return tmp;
    }

    public int countraw() {
        String sql = "SELECT id FROM tblorder ORDER BY id DESC LIMIT 1; ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String x = rs.getString(1);
                x = x.substring(2);
                return Integer.parseInt(x) + 1;
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public void addProductOrder(ProductOrder productOrder, String orderId) {
        Connection conn = null; // ket noi voi sql server
        PreparedStatement ps = null; // gui cau lenh query sang sql server
        ResultSet rs = null; // nhan ket qua tra ve
        String query = """
               INSERT INTO `webonline`.`tblproductorder` (`quantity`, `price`, `tblproductid`, `tblorderid`) VALUES (?, ?, ?, ?);
               """;
        try {
            conn = new DBContext1().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productOrder.getQuantity()); // ham khoi tao
            ps.setDouble(2, productOrder.getPriceDouble());
            ps.setString(3, productOrder.getId());
            ps.setString(4, orderId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("looix");
        }
    }
    public void cancelOrder(String  o)
    {
         try {
            String query="UPDATE tblshipment SET status = -1 WHERE tblorderid =?";
            String querypay="UPDATE tblpayment SET status = -1 WHERE tblorderid =?";
            PreparedStatement ps= connection.prepareStatement(query);
            PreparedStatement pspay= connection.prepareStatement(querypay);
            ps.setString(1,o);
            pspay.setString(1, o);
            ps.executeUpdate();
            pspay.executeUpdate();
        } catch (Exception e) {
        }
    }
    public List<Order> getAllOrderByCancel(Customer idCustomer)
    {
        try {
            
            String query="select tblorder.*,tblshipment.status from tblorder,tblshipment where tblcustomerid=? and tblshipment.tblorderid=tblorder.id and tblshipment.status='-1' order by date desc";
            
            PreparedStatement ps=connection.prepareStatement(query);
         
            
            ps.setString(1, idCustomer.getId());
            ResultSet rs= ps.executeQuery();
            List<Order> list= new ArrayList<>();
            while(rs.next())
            {      java.sql.Date sqlDate = rs.getDate("date");

                        // Chuyển đổi thành java.util.Date
                        java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
                         java.sql.Date sqlDate1 = rs.getDate("approvaldate");
//                         private String id;
//    private Payment payment;
//    private Shipment shipment;
//    private Voucher voucher;
//    private  Customer customer;
//    private Date date,approvaldate;
//    private double  discount,price,to
//                         

                        // Chuyển đổi thành java.util.Date
                        java.util.Date utilDate1 = new java.util.Date(sqlDate.getTime());
                       String orderId=rs.getString("id");
                 Order a=new Order();
                 a.setId(orderId);
                 a.setShipment(this.getShipmentByOrderId(orderId));
                 a.setPayment(this.getPaymentByOrderId(orderId));
                 a.setCustomer(idCustomer);
                if(this.getVoucherByIdOrder(orderId)!=null)
                {
                    
                
                 a.setVoucher(this.getVoucherByIdOrder(orderId));}
                else {
                    a.setVoucher(null);
                }
                 a.setApprovaldate(utilDate1);
                 a.setDate(utilDate);
                 a.setDiscount(rs.getDouble("discount"));
                 a.setPrice(rs.getDouble("price"));
                 a.setTotalamount(rs.getDouble("totalamount"));
                 a.setProductorder(this.getProductOrdersByOrders(orderId));
                 list.add(a);
                 
            }
            return list;
            
        } catch (Exception e) {
        }
        return null;
    }
     public List<Order> getAllOrderWaitByCustomer(Customer c)
    {
        try {
            
            String query="select tblorder.*,tblshipment.status from tblorder,tblshipment where tblcustomerid=? and tblshipment.tblorderid=tblorder.id and tblshipment.status='0' order by date desc";
            
            PreparedStatement ps=connection.prepareStatement(query);
         
            
            ps.setString(1, c.getId());
            ResultSet rs= ps.executeQuery();
            List<Order> list= new ArrayList<>();
            while(rs.next())
            {      java.sql.Date sqlDate = rs.getDate("date");

                        // Chuyển đổi thành java.util.Date
                        java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
                         java.sql.Date sqlDate1 = rs.getDate("approvaldate");
//                         private String id;
//    private Payment payment;
//    private Shipment shipment;
//    private Voucher voucher;
//    private  Customer customer;
//    private Date date,approvaldate;
//    private double  discount,price,to
//                         

                        // Chuyển đổi thành java.util.Date
                        java.util.Date utilDate1 = new java.util.Date(sqlDate.getTime());
                       String orderId=rs.getString("id");
                 Order a=new Order();
                 a.setId(orderId);
                 a.setShipment(this.getShipmentByOrderId(orderId));
                 a.setPayment(this.getPaymentByOrderId(orderId));
                 a.setCustomer(c);
                if(this.getVoucherByIdOrder(orderId)!=null)
                {
                    
                
                 a.setVoucher(this.getVoucherByIdOrder(orderId));}
                else {
                    a.setVoucher(null);
                }
                 a.setApprovaldate(utilDate1);
                 a.setDate(utilDate);
                 a.setDiscount(rs.getDouble("discount"));
                 a.setPrice(rs.getDouble("price"));
                 a.setTotalamount(rs.getDouble("totalamount"));
                 a.setProductorder(this.getProductOrdersByOrders(orderId));
                 list.add(a);
                 
            }
            return list;
            
        } catch (Exception e) {
        }
        return null;
    }
     public void confirmOrder(String  o)
    {
         try {
            String query="UPDATE tblshipment SET status = 1 WHERE tblorderid =?";
            String querypay="UPDATE tblpayment SET status = 1 WHERE tblorderid =?";
            PreparedStatement ps= connection.prepareStatement(query);
            PreparedStatement pspay= connection.prepareStatement(querypay);
            ps.setString(1,o);
            pspay.setString(1, o);
            ps.executeUpdate();
            pspay.executeUpdate();
        } catch (Exception e) {
        }
    }
    

}
