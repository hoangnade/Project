/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDao;
import entity.Cart;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author manch
 */
@WebServlet(name = "updateCartServlet", urlPatterns = {"/update-cart"})
public class updateCartServlet extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            int flag = Integer.valueOf(request.getParameter("flag"));
            int id = Integer.valueOf(request.getParameter("id"));
            
            HttpSession session = request.getSession();
            List<Cart> listOrder = null;
            listOrder = (ArrayList<Cart>) session.getAttribute("listCart");

            for (int i = 0; i < listOrder.size(); i++) {
                if (listOrder.get(i).getId() == id) {
                    if (flag == 1) {
                        listOrder.get(i).setQuantity(listOrder.get(i).getQuantity() - 1);
                        if (listOrder.size() > 1) {
                            if (listOrder.get(i).getQuantity() <= 0) {
                                listOrder.remove(i);
                            }
                        } else {
                            if (listOrder.get(i).getQuantity() <= 0) {
                                listOrder = null;
                                break;
                            }
                        }
                    } else {
                        Product product = new ProductDao().getOne(id);
                        if (listOrder.get(i).getQuantity() < product.getQuantity()) {
                            listOrder.get(i).setQuantity(listOrder.get(i).getQuantity() + 1);
                        } else {
                            listOrder.get(i).setQuantity(listOrder.get(i).getQuantity());
                        }
                    }
                }
            }
            int number = 0;
            double total = 0;
            // tinh tong tien
            if (listOrder != null) {
                for (Cart c : listOrder) {
                    number += c.getQuantity();
                    total += c.getPrice() * c.getQuantity();
                }
            }
            session.setAttribute("totalProduct", number);
            session.setAttribute("totalMoney", total);
            session.setAttribute("listCart", listOrder);
            response.sendRedirect("cart.jsp");
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp");
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
