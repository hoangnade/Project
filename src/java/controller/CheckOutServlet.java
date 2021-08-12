/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDetailDao;
import dao.OrderDao;
import dao.OrderDetailDao;
import dao.ProductDao;
import entity.Account;
import entity.AccountDetailId;
import entity.Cart;
import entity.Order;
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
@WebServlet(name = "CheckOutServlet", urlPatterns = {"/check-out"})
public class CheckOutServlet extends HttpServlet {

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
            String name = request.getParameter("name");
//            String mobile = request.getParameter("phonenumber");
//            String address = request.getParameter("address");
            String note = request.getParameter("note");

            // add Order
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("acc");
            if (account != null) {
                List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
                double totalPrice = (double) session.getAttribute("totalMoney");
                OrderDao od = new OrderDao();
                int orderId = od.addOrder(Order.builder()
                        .name(name)
                        .accountId(account.getUserID())
                        .total(totalPrice)
                        .note(note)
                        .status(1)
                        .build());

                //add Order Detail
                if (orderId > 0) {
                    OrderDetailDao odd = new OrderDetailDao();
                    boolean isCheckAddOrderDetail = odd.add((List<Cart>) session.getAttribute("listCart"), orderId);

                    if (isCheckAddOrderDetail) {
                        boolean isCheckUpdateProductQuantity = new ProductDao().updateQuantityProduct(listCart);
                        if (isCheckUpdateProductQuantity) {
                            AccountDetailId accountDetail = new AccountDetailDao().getOneAccountDetail(account.getAccontdetailID());
                        }
                        session.removeAttribute("listCart");
                        session.removeAttribute("totalProduct");
                        session.removeAttribute("totalMoney");
                        session.removeAttribute("listOrder");
                        response.sendRedirect("thanks.jsp");
   
                    } else {
                        // remove order
                       response.sendRedirect("checkout.jsp");
                    }
                } else {
                    response.sendRedirect("checkout.jsp");
                }
            } else {
   
                session.removeAttribute("listCart");
                session.removeAttribute("totalProduct");
                session.removeAttribute("totalMoney");
                session.removeAttribute("accountDetailInfo");
                session.removeAttribute("listOrder");
                response.sendRedirect("login.jsp");
            }
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
