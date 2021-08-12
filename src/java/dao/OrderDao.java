/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import jdbc.SQLServerConnection;

/**
 *
 * @author manch
 */
public class OrderDao {

    public int addOrder(Order order) {
        String query = "INSERT INTO HE140172_orders VALUES(?,?,?,?,?)";
        int check = 0;

        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            ps.setObject(1, order.getName());
            ps.setObject(2, order.getAccountId());
            ps.setObject(3, order.getTotal());
            ps.setObject(4, order.getNote());
            ps.setObject(5, order.getStatus());
      
            check = ps.executeUpdate();
            
            if(check > 0){
                ResultSet rs = ps.getGeneratedKeys();
                rs.next();
                return rs.getInt(1);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Select failed!");
        }

        return 0;
    }
    
       public ArrayList<Order> getOrderById(int id){
        ArrayList<Order> list = new ArrayList<>();
        String query = "SELECT * FROM HE140172_orders WHERE account_id = ?";
        try (Connection con = SQLServerConnection.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = Order.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .accountId(rs.getInt(3))
                        .total(rs.getFloat(4))
                        .note(rs.getString(5))
                        .status(rs.getInt(6))
                        .build();
                        
                list.add(order);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
