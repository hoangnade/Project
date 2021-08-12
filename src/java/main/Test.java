/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import dao.ProductDao;
import dao.AccountDao;
import dao.AccountDetailDao;
import dao.OrderDao;
import dao.OrderDetailDao;
import entity.Product;
import entity.Account;
import entity.AccountDetailId;
import entity.Order;
import entity.OrderDetail;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author manch
 */
public class Test {
    public static void main(String[] args) {
        //List<Product> ls = new ProductDao().getAll();
        //ls.forEach(System.out::println);
       
        //Product p = new ProductDao().getOne(2);
        //System.out.println(p);
        
//        Product b = Product.builder()
//                .brandId(1)
//                .categoryId(1)
//                .name("Noi 1")
//                .price(500000)
//                .quantity(1)
//                .imgName("noi1.jpg")
//                .description("")
//                .note("")
//                .status(1)
//                .priceId(1)
//                .sellId(3)
//                .build();
//        
//        System.out.println(new ProductDao().add(b));
        
//        AccountDao ac = new AccountDao();
//        System.out.println( ac.signUp(Account.builder().username("sa").password("123456").build()));
       
//        AccountDetailDao accdao = new AccountDetailDao();
//       
//        System.out.println(accdao.addAccountDetail(AccountDetailId.builder().name("hungg").mobile("0912312312").address("HP").build()));

//    AccountDao acc = new AccountDao();
//        System.out.println(acc.signUp(Account.builder().username("admin2").password("123456").accontdetailID(14).build()));
//    }
//        String user = "admin";
//        AccountDao acc = new AccountDao();
//        acc.checkAcountExit(user);
//        System.out.println(acc.checkAcountExit(user));
//      
//    AccountDao acc = new AccountDao();
//        System.out.println(acc.getAccountByUserID(1));
//        ArrayList<Order> odd = new OrderDao().getOrderById(7);
//        System.out.println(odd);

           AccountDetailDao dao = new AccountDetailDao();
           AccountDetailId accDetail = dao.getOneAccountDetail(1);
           System.out.println(accDetail);
    }
}