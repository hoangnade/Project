/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BrandDao;
import dao.CategoryDao;
import dao.PriceDao;
import dao.ProductDao;
import entity.Brand;
import entity.Category;
import entity.Price;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author manch
 */
@WebServlet(name = "ProductLast", urlPatterns = {"/product-last"})
public class ProductLast extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
          try {
            ProductDao pd = new ProductDao();

            List<Product> lsProduct = pd.getAll();
            List<Brand> lsBrand = new BrandDao().getAll();
            List<Category> lsCategory = new CategoryDao().getAll();
            List<Price> lsPrice = new PriceDao().getAll();
            Product last = pd.getLast();

            //lsProduct.forEach(System.out::println);
              System.out.println(last);
            // set attribute
            request.setAttribute("data", lsProduct);
            request.setAttribute("brandData", lsBrand);
            request.setAttribute("categoryData", lsCategory);
            request.setAttribute("priceData", lsPrice);
            request.setAttribute("lastData",last);
            request.getRequestDispatcher("productlast.jsp").forward(request, response);
        } catch (IOException | ServletException ex) {

        }
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
        processRequest(request, response);
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
