/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author manch
 */
@Builder
@Setter
@Getter
@ToString

public class Order {
    private int id;
    private String name;
    private int accountId;
    private double total;
    private String note;
    private int status;
}
