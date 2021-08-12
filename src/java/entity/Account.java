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


@Builder
@Setter
@Getter
@ToString
public class Account {
    private int userID;
    private String username;
    private String password;
    private int isSell;
    private int isAdmin;
    private int accontdetailID;
    private int status;
}
