/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Cart;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "removeCartServlet", urlPatterns = {"/remove-cart"})
public class removeCartServlet extends HttpServlet {

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
            int id = Integer.parseInt(request.getParameter("id"));

            HttpSession session = request.getSession();
            if (id == 0) {
                session.removeAttribute("listCart");
                session.removeAttribute("totalProduct");
                session.removeAttribute("totalMoney");

                //remove all session
                //session.invalidate();
            } else {
                List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
                for (int i = 0; i < listCart.size(); i++) {
                    if (listCart.get(i).getId() == id) {
                        listCart.remove(i);
                        break;
                    }
                }
                int number = 0;
                double total = 0;
                // tinh tong tien
                for (Cart c : listCart) {
                    number += c.getQuantity();
                    total += c.getPrice() * c.getQuantity();
                }
                session.setAttribute("totalProduct", number);
                session.setAttribute("totalMoney", total);
                session.setAttribute("listCart", listCart); 
            }
            response.sendRedirect("cart.jsp");
        } catch (Exception e) {
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
