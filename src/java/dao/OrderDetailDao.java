/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Cart;
import entity.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import jdbc.SQLServerConnection;

/**
 *
 * @author manch
 */
public class OrderDetailDao {

    public boolean add(List<Cart> listcart, int orderId) {

        String query = "INSERT INTO HE140172_order_detail VALUES(?,?,?,?,?)";
        int check = 0;

        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            for (Cart cart : listcart) {
                
            ps.setObject(1, orderId);
            ps.setObject(2, cart.getId());
            ps.setObject(3, cart.getName());
            ps.setObject(4, cart.getPrice());
            ps.setObject(5, cart.getQuantity());
            ps.addBatch();

            }
            ps.executeBatch();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(System.out);
        }
        return false;
        
    }
   
     public ArrayList<OrderDetail> getOrderDetailByOrderId(int orderId){
        ArrayList<OrderDetail> list = new ArrayList<>();
        String query = "SELECT * FROM HE140172_order_detail WHERE order_id = ?";
        try (Connection con = SQLServerConnection.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = OrderDetail.builder()
                        .id(rs.getInt(1))
                        .orderId(rs.getInt(2))
                        .productId(rs.getInt(3))
                        .productName(rs.getString(4))
                        .productPrice(rs.getDouble(5))
                        .quantity(rs.getInt(6))
                        .build();
                
                list.add(orderDetail);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        } 
        
        return null;
    }
}
