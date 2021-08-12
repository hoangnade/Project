/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Cart;
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
public class ProductDao implements IMethod<Product> {

    @Override
    public List<Product> getAll() {

        String query = "SELECT * FROM HE140172_products";
        List<Product> ls = new ArrayList<>();

        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = Product.builder()
                        .id(rs.getInt(1))
                        .brandId(rs.getInt(2))
                        .categoryId(rs.getInt(3))
                        .name(rs.getString(4))
                        .price(rs.getDouble(5))
                        .quantity(rs.getInt(6))
                        .imgName(rs.getString(7))
                        .description(rs.getString(8))
                        .note(rs.getString(9))
                        .status(rs.getInt(10))
                        .priceId(rs.getInt(11))
                        .sellId(rs.getInt(12))
                        .build();
                ls.add(p);
            }
            return ls;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Select failed!");
        }
        return null;
    }

    @Override
    public Product getOne(int id) {
        String query = "SELECT * FROM HE140172_products WHERE id = ?";

        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = Product.builder()
                        .id(rs.getInt(1))
                        .brandId(rs.getInt(2))
                        .categoryId(rs.getInt(3))
                        .name(rs.getString(4))
                        .price(rs.getDouble(5))
                        .quantity(rs.getInt(6))
                        .imgName(rs.getString(7))
                        .description(rs.getString(8))
                        .note(rs.getString(9))
                        .status(rs.getInt(10))
                        .priceId(rs.getInt(11))
                        .sellId(rs.getInt(12))
                        .build();

                return p;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Select failed!");
        }
        return null;
    }

    @Override
    public boolean add(Product ob) {
        String query = "INSERT INTO HE140172_products VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        int check = 0;

        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, ob.getBrandId());
            ps.setObject(2, ob.getCategoryId());
            ps.setObject(3, ob.getName());
            ps.setObject(4, ob.getPrice());
            ps.setObject(5, ob.getQuantity());
            ps.setObject(6, ob.getImgName());
            ps.setObject(7, ob.getDescription());
            ps.setObject(8, ob.getNote());
            ps.setObject(9, ob.getStatus());
            ps.setObject(10, ob.getPriceId());
            ps.setObject(11, ob.getSellId());
            check = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Add failed!");
        }

        return check > 0;
    }

    @Override
    public boolean update(int id, Product ob) {
        String query = "UPDATE HE140172_products SET " + "brand_id = ?, " + "category_id = ?," + " name = ?," + " price = ?, " + " quantity = ?, " + " img_name = ?, " + " description = ?, " + " note = ?," + " status = ?," + " price_id = ? " + " WHERE id = ?";
        int check = 0;

        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, ob.getBrandId());
            ps.setObject(2, ob.getCategoryId());
            ps.setObject(3, ob.getName());
            ps.setObject(4, ob.getPrice());
            ps.setObject(5, ob.getQuantity());
            ps.setObject(6, ob.getImgName());
            ps.setObject(7, ob.getDescription());
            ps.setObject(8, ob.getNote());
            ps.setObject(9, ob.getStatus());
            ps.setObject(10, ob.getPriceId());
            ps.setObject(11, id);

            check = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Update failed!");
        }

        return check > 0;
    }

    @Override
    public boolean remove(int id) {
        String query = "DELETE FROM HE140172_products WHERE id = ?";
        int check = 0;

        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setObject(1, id);
            check = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Delete failed!");
        }

        return check > 0;
    }

    public List<Product> searchByName(String text) {

        String query = "SELECT * FROM HE140172_products WHERE name LIKE ?";
        List<Product> ls = new ArrayList<>();

        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, "%" + text + "%");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .brandId(rs.getInt(2))
                        .categoryId(rs.getInt(3))
                        .name(rs.getString(4))
                        .price(rs.getDouble(5))
                        .quantity(rs.getInt(6))
                        .imgName(rs.getString(7))
                        .description(rs.getString(8))
                        .note(rs.getString(9))
                        .status(rs.getInt(10))
                        .priceId(rs.getInt(11))
                        .build();
                ls.add(product);
            }
            return ls;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("failed!");
        }
        return null;

    }

    public List<Product> filterByBrand(int id) {

        String query = "SELECT * FROM HE140172_products WHERE brand_id = ?";
        List<Product> ls = new ArrayList<>();

        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = Product.builder()
                        .id(rs.getInt(1))
                        .brandId(rs.getInt(2))
                        .categoryId(rs.getInt(3))
                        .name(rs.getString(4))
                        .price(rs.getDouble(5))
                        .quantity(rs.getInt(6))
                        .imgName(rs.getString(7))
                        .description(rs.getString(8))
                        .note(rs.getString(9))
                        .status(rs.getInt(10))
                        .priceId(rs.getInt(11))
                        .priceId(rs.getInt(12))
                        .build();
                ls.add(p);
            }
            return ls;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("failed!");
        }
        return null;

    }

    public List<Product> filterByCategory(int id) {

        String query = "SELECT * FROM HE140172_products WHERE category_id = ?";
        List<Product> ls = new ArrayList<>();

        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = Product.builder()
                        .id(rs.getInt(1))
                        .brandId(rs.getInt(2))
                        .categoryId(rs.getInt(3))
                        .name(rs.getString(4))
                        .price(rs.getDouble(5))
                        .quantity(rs.getInt(6))
                        .imgName(rs.getString(7))
                        .description(rs.getString(8))
                        .note(rs.getString(9))
                        .status(rs.getInt(10))
                        .priceId(rs.getInt(11))
                        .priceId(rs.getInt(12))
                        .build();
                ls.add(p);
            }
            return ls;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("failed!");
        }
        return null;
    }

    public List<Product> filterByPrice(int id) {

        String query = "SELECT * FROM HE140172_products WHERE price_id = ?";
        List<Product> ls = new ArrayList<>();

        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = Product.builder()
                        .id(rs.getInt(1))
                        .brandId(rs.getInt(2))
                        .categoryId(rs.getInt(3))
                        .name(rs.getString(4))
                        .price(rs.getDouble(5))
                        .quantity(rs.getInt(6))
                        .imgName(rs.getString(7))
                        .description(rs.getString(8))
                        .note(rs.getString(9))
                        .status(rs.getInt(10))
                        .priceId(rs.getInt(11))
                        .priceId(rs.getInt(12))
                        .build();
                ls.add(p);
            }
            return ls;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("failed!");
        }
        return null;
    }

    public Product getLast() {
        String query = "SELECT TOP 1 * FROM HE140172_products ORDER BY id DESC";
        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = Product.builder()
                        .id(rs.getInt(1))
                        .brandId(rs.getInt(2))
                        .categoryId(rs.getInt(3))
                        .name(rs.getString(4))
                        .price(rs.getDouble(5))
                        .quantity(rs.getInt(6))
                        .imgName(rs.getString(7))
                        .description(rs.getString(8))
                        .note(rs.getString(9))
                        .status(rs.getInt(10))
                        .priceId(rs.getInt(11))
                        .priceId(rs.getInt(12))
                        .build();

                return p;
            }

        } catch (SQLException e) {

        }
        return null;

    }

    public List<Product> getProductBySellID(int sid) {
        List<Product> ls = new ArrayList<>();
        String query = "SELECT * FROM HE140172_products WHERE sell_id = ?";

        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, sid);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = Product.builder()
                        .id(rs.getInt(1))
                        .brandId(rs.getInt(2))
                        .categoryId(rs.getInt(3))
                        .name(rs.getString(4))
                        .price(rs.getDouble(5))
                        .quantity(rs.getInt(6))
                        .imgName(rs.getString(7))
                        .description(rs.getString(8))
                        .note(rs.getString(9))
                        .status(rs.getInt(10))
                        .priceId(rs.getInt(11))
                        .priceId(rs.getInt(12))
                        .build();
                ls.add(p);
            }
            return ls;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("failed!");
        }
        return null;
    }

    public boolean updateQuantityProduct(List<Cart> list) {
        String query = "UPDATE HE140172_products SET quantity = ? WHERE id = ?";
        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            for (Cart c : list) {
                ps.setInt(1, new ProductDao().getOne(c.getId()).getQuantity() - c.getQuantity());
                ps.setInt(2, c.getId());
                ps.addBatch();
            }
            ps.executeBatch();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    public static void main(String[] args) {
        ProductDao dao = new ProductDao();
        List<Product> p  = dao.getAll();
        for (Product product : p) {
            System.out.println(product);
        }
    }

}
