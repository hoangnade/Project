/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;

/**
 *
 * @author manch
 */
public interface IMethod<E> {

    List<E> getAll();

    E getOne(int id);
    
    boolean add(E ob);

    boolean update(int id, E ob);

    boolean remove(int id);

}
