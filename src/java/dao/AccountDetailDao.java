/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Account;
import entity.AccountDetailId;
import entity.Product;
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
public class AccountDetailDao {

    public AccountDetailId getOneAccountDetail(int id) {
        String query = "SELECT * FROM HE140172_account_detail WHERE id = ?";
        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AccountDetailId accdetail = AccountDetailId.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .phonenumber(rs.getString(3))
                        .address(rs.getString(4))
                        .build();
                return accdetail;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed!");
        }
        return null;
    }

    public int addAccountDetail(AccountDetailId accountDetail) {

        String query = "INSERT INTO HE140172_account_detail VALUES(?, ?, ?)";
        int check = 0;

        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setObject(1, accountDetail.getName());
            ps.setObject(2, accountDetail.getPhonenumber());
            ps.setObject(3, accountDetail.getAddress());
            check = ps.executeUpdate();
            if (check > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                rs.next();
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Add failed!");
        }
        return 0;
    }

    public boolean updateInfor(int id, AccountDetailId accDetail) {
        String query = "UPDATE HE140172_account_detail SET " + "name = ?," + " phone_number = ?," + "address = ?" + " WHERE id = ?";
        int check = 0;

        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setObject(1, accDetail.getName());
            ps.setObject(2, accDetail.getPhonenumber());
            ps.setObject(3, accDetail.getAddress());
            ps.setObject(4, id);

            check = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Update failed!");
        }
        return check > 0;
    }
    
        public List<AccountDetailId> getAccountDetailByID(int id) {
        List<AccountDetailId> ls = new ArrayList<>();
        String query = "SELECT * FROM HE140172_accounts WHERE account_detail_id = ?";

        try (Connection con = SQLServerConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                    AccountDetailId accountDetail = AccountDetailId.builder()
                                    .id(rs.getInt(1))
                                    .name(rs.getString(2))
                                    .phonenumber(rs.getString(3))
                                    .address(rs.getString(4))
                                      .build();
                ls.add(accountDetail);
            }
            return ls;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("failed!");
        }
        return null;
    }
}
