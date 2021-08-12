/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Image;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jdbc.SQLServerConnection;

/**
 *
 * @author manch
 */
public class ImageDao {

    public List<Image> getAllByProductId(int id) {

        String query = "SELECT * FROM HE140172_images WHERE product_id = ?";
        List<Image> ls = new ArrayList<>();

        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Image image = Image.builder()
                        .id(rs.getInt(1))
                        .productId(rs.getInt(2))
                        .imgName(rs.getString(3))
                        .build();
                ls.add(image);
            }
            return ls;
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }
//    
//        public static void main(String[] args) {
//        ImageDao d = new ImageDao();
//        List<Image> ls = d.getAllByProductId(1);
//        for(int i = 0; i < ls.size(); i++) {
//            System.out.println(ls.get(i).getImgName());
//        }
//        
}
