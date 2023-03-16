/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package com.chung.sendEmail;

import DAO.accountDAO;
import DAO.announcementDAO;
import DAO.bookDAO;

import Model.book;
import java.util.List;

import org.junit.Test;

import org.junit.Assert;

/**
 *
 * @author chung
 */
public class TestBooks {
    
    public TestBooks() {
    }
    
 
    
    @Test
    public void testGetAllBook(){
        
        
        bookDAO bd = new bookDAO();
        List<book> ls = bd.getAllBook();
        Assert.assertEquals("A Court of Mist and Fury",ls.get(0).getBookName() );
        Assert.assertEquals("The Adventures of Sherlock Holmes",ls.get(1).getBookName());
    }
    @Test
     public void testGetBookByPatialName(){
        String input = "Court";
        
        bookDAO bd = new bookDAO();
        List<book> ls = bd.getBookByPartialName(input);
        
        Assert.assertEquals("A Court of Mist and Fury",ls.get(0).getBookName() );
        
    }
    
 
    
}
