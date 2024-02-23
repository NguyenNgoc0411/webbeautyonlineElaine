package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import DAO.DAO;
import model.Image;
import model.Product;
import model.ProductDetail;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.ArrayList;
import java.util.Collection;

/**
 *
 * @author luong
 */
@MultipartConfig
public class addProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        String contentDisposition = filePart.getHeader("content-disposition");
//        Part filePart1 = request.getPart("exits");
//        String contentDisposition1 = filePart1.getHeader("content-disposition");
//        String hello = request.getParameter("exits");
//        PrintWriter out = response.getWriter();
//        out.println(contentDisposition1);
//        request.getRequestDispatcher("admin_product_control.jsp").forward(request, response);
        request.getRequestDispatcher("add_product.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        PrintWriter out = response.getWriter();
//        out.println(filePart.getSubmittedFileName());
        String id = request.getParameter("id");
        double vote = 0;
        String name = request.getParameter("name");
        String unit = request.getParameter("unit");
        String brand = request.getParameter("brand");
        int sold = 0;
        String discount = request.getParameter("discount");
        String price = request.getParameter("price");
        Part filePart = request.getPart("image");
        String imageName = filePart.getSubmittedFileName();
        String categoryId = request.getParameter("category");
        String size = request.getParameter("size");
        String description = request.getParameter("description");
        String quantity = request.getParameter("quantity");
        String typeskin = request.getParameter("typeskin");
        String origin = request.getParameter("origin");
        String problem = request.getParameter("problem");
        String ingredient = request.getParameter("ingredient");
        String instruct = request.getParameter("instruct");
        String characteris = request.getParameter("characteris");
        String uploadDirectory = getServletContext().getRealPath("/images/");
        try {

            filePart.write(uploadDirectory + getDirectoryByCategoryId(categoryId) + "\\" + imageName);
        } catch (Exception e) {
            System.out.println("lỗi");
        }
        DAO dao = new DAO();
        
        String imagePath = "./images/" + getDirectoryByCategoryId(categoryId) + "/" + imageName;
        Product product = new Product(id, vote, name, unit, brand, sold, Double.parseDouble(discount), Double.parseDouble(price), imagePath, dao.getCategoryByID(categoryId));
       
        // Thêm vào bảng tblproduct
        dao.addProduct(product);

//        response.getWriter().print(uploadDirectory);
        //        response.getWriter().print("The file uploaded sucessfully.");
        ArrayList<Image> images = new ArrayList<>();

        // Thêm chi tiết sản phẩm
        ProductDetail productDetail = new ProductDetail(
                images,
                size,
                description,
                Integer.parseInt(quantity),
                typeskin,
                origin,
                problem,
                ingredient,
                instruct,
                characteris,
                id, vote, name, unit, brand, sold, Double.parseDouble(discount), Double.parseDouble(price), imagePath,dao.getCategoryByID(categoryId));

        dao.addProductDetail(productDetail);
        // Thêm các ảnh chi tiết
        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            if ("images".equals(part.getName())) {
                String fileName = part.getSubmittedFileName();
                // Lưu ảnh vào máy
                part.write(uploadDirectory + getDirectoryByCategoryId(categoryId) + "\\" + fileName);
                // Đường dẫn ảnh lưu trong CSDL
                String filePath = "./images/" + getDirectoryByCategoryId(categoryId) + "/" + fileName;
                Image img = new Image(filePath);
                dao.addListProductImg(img, id);
                System.out.println(img);
            }
        }
        response.sendRedirect("show_product");
    }

    private String getDirectoryByCategoryId(String categoryId) {
        if ("ACNE".equals(categoryId)) {
            return "hotrotrimun";
        } else if ("CSPN".equals(categoryId)) {
            return "chamsocphunu";
        } else if ("CSRM".equals(categoryId)) {
            return "chamsocrangmieng";
        } else if ("DGX".equals(categoryId)) {
            return "daugoivadauxa";
        } else if ("DT".equals(categoryId)) {
            return "duongthe";
        } else if ("KCN".equals(categoryId)) {
            return "chongnangmat";
        } else if ("KM".equals(categoryId)) {
            return "khumui";
        } else if ("MN".equals(categoryId)) {
            return "matna";
        } else if ("NH".equals(categoryId)) {
            return "nuochoa";
        } else if ("SERUM".equals(categoryId)) {
            return "serum";
        } else if ("SRM".equals(categoryId)) {
            return "suaruamat";
        } else if ("ST".equals(categoryId)) {
            return "suatam";
        } else if ("TDC".equals(categoryId)) {
            return "taydachetbody";
        } else if ("TDM".equals(categoryId)) {
            return "trangdiemmoi";
        } else if ("TDMAT".equals(categoryId)) {
            return "trangdiemmat";
        } else if ("TDMT".equals(categoryId)) {
            return "trangdiemmatt";
        } else if ("TONER".equals(categoryId)) {
            return "toner";
        } else if ("TPCN".equals(categoryId)) {
            return "thucphamchucnang";
        }
//        else if (categoryId == "TTM") {
        return "taytrangmat";
//        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
