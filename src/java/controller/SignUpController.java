/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDao;
import dao.AccountDetailDao;
import entity.Account;
import entity.AccountDetailId;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author manch
 */
@WebServlet(name = "SignUpController", urlPatterns = {"/signup"})
public class SignUpController extends HttpServlet {

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
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String repass = request.getParameter("repassword");

        String name = request.getParameter("name");
        String phone = request.getParameter("phonenumber");
        String address = request.getParameter("address");
        int idAccountDetail = 0;
        AccountDao accdao = new AccountDao();

        if (accdao.checkAcountExit(user)) {
            request.setAttribute("mess", "Username is already exists");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            if (pass.equals(repass)) {
                idAccountDetail = new AccountDetailDao().addAccountDetail(AccountDetailId.builder().name(name).phonenumber(phone).address(address).build());
                if (idAccountDetail > 0) {
                    accdao.signUp(Account.builder().username(user).password(pass).accontdetailID(idAccountDetail).build());
                    request.setAttribute("mess", "Resgister successfully");
                    request.getRequestDispatcher("register.jsp").forward(request, response);

                }
            }else{
                  request.setAttribute("mess", "Wrong repassword !");
                  request.getRequestDispatcher("register.jsp").forward(request, response);
            }
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
