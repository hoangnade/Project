/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Account;
import entity.Price;
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
public class AccountDao {

    public Account login(String user, String pass) {
        String sql = "SELECT * FROM HE140172_accounts WHERE username = ? AND password = ?";

        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account acc = Account.builder()
                        .userID(rs.getInt(1))
                        .username(rs.getString(2))
                        .password(rs.getString(3))
                        .isSell(rs.getInt(4))
                        .isAdmin(rs.getInt(5))
                        .accontdetailID(rs.getInt(6))
                        .status(rs.getInt(7))
                        .build();

                return acc;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed!");
        }
        return null;
    }

    public boolean checkAcountExit(String user) {
        String sql = "SELECT * FROM HE140172_accounts WHERE username = ?";
        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user);

            ResultSet rs = ps.executeQuery();
            return rs.next();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed!");
        }
        return false;
    }

    public boolean signUp(Account acc) {
        String sql = "INSERT INTO HE140172_accounts VALUES(?,?,0,0,?,1)";
        int check = 0;

        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setObject(1, acc.getUsername());
            ps.setObject(2, acc.getPassword());
            ps.setObject(3, acc.getAccontdetailID());
            check = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Add failed!");
        }

        return check > 0;
    }

    public boolean updatePassword(String pass, int id) {
        int check = 0;
        String sql = "UPDATE HE140172_accounts SET password = ? WHERE user_id=?";
        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setInt(2, id);
            check = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Add failed!");
        }

        return check > 0;
    }

    public ArrayList<Account> getAll() {

        String query = "SELECT * FROM HE140172_accounts";
        ArrayList<Account> ls = new ArrayList<>();

        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(query)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account account = Account.builder()
                        .userID(rs.getInt(1))
                        .username(rs.getString(2))
                        .password(rs.getString(3))
                        .isAdmin(rs.getInt(4))
                        .isSell(rs.getInt(5))
                        .accontdetailID(rs.getInt(6))
                        .status(rs.getInt(7))
                        .build();
                ls.add(account);
            }
            return ls;
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    public boolean deleteAccount(int id) {
        String query = "DELETE FROM HE140172_accounts WHERE user_id = ?";
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

    public List<Account> getAccountByUserID(int id) {
        List<Account> ls = new ArrayList<>();
        String query = "SELECT * FROM HE140172_accounts WHERE user_id = ?";

        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                    Account account = Account.builder()
                                      .userID(rs.getInt(1))
                                      .username(rs.getString(2))
                                      .password(rs.getString(3))
                                      .isSell(rs.getInt(4))
                                      .isAdmin(rs.getInt(5))
                                      .accontdetailID(rs.getInt(6))
                                      .status(rs.getInt(7))
                                      .build();
                ls.add(account);
            }
            return ls;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("failed!");
        }
        return null;
    }
    
}
