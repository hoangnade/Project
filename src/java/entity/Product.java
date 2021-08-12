/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import lombok.Builder;
import lombok.Setter;
import lombok.Getter;
import lombok.ToString;

/**
 *
 * @author manch
 */
@Setter
@Getter
@Builder
@ToString

public class Product {
    
    private int id;
    private int brandId;
    private int categoryId;
    private String name;
    private double price;
    private int quantity;
    private String imgName;
    private String description;
    private String note;
    private int status;
    private int priceId;
    private int sellId;
    
}
