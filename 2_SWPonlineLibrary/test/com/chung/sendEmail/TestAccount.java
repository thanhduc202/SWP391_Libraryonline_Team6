/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package com.chung.sendEmail;

import DAO.accountDAO;
import DAO.announcementDAO;
import DAO.bookDAO;

import Model.announcement;
import Model.book;
import java.util.ArrayList;
import java.util.List;
import module.Account;
import org.junit.Assert;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author chung
 */
public class TestAccount {
    
    public TestAccount() {
    }
       @Test
    public void testGetAccountByName(){
        String input = "chungcacbon@gmail.com";
        Account expect = new Account("chungcacbon@gmail.com", "123", "do van chung", true, 123123123, 1, 1);
        accountDAO ad = new accountDAO();
        Account actual = ad.getAccoutByAccountName(input);
        Assert.assertEquals(expect.getAccountName(), actual.getAccountName());
        Assert.assertEquals(expect.getAccountPassword(), actual.getAccountPassword());
        
    }
    @Test
    public void loginWithUserNameAndPassword(){
        String name= "chungcacbon@gmail.com";
        String password = "123";
        accountDAO ad = new accountDAO();
        boolean expect = true;
        boolean actual= ad.accountVerificationByNameAndPassword(name, password);
        Assert.assertEquals(expect,actual);
    }
    @Test
    public void loginWithGoogle(){
        String name= "chungcacbon@gmail.com";

        accountDAO ad = new accountDAO();
        boolean expect = true;
        boolean actual= ad.accountVerificationByName(name);
        Assert.assertEquals(expect,actual);
    }
    
    @Test
    public void getAllAnnouncement(){
        announcementDAO ad = new announcementDAO();
        List<announcement> ls = new ArrayList<announcement>();
        ls = ad.getAllAnnouncement();
        int sizeExpect=3;
        Assert.assertEquals(sizeExpect,ls.size());
    }
 
        @Test
    public void getAllAnnouncementById(){
        announcementDAO ad = new announcementDAO();
        announcement ann = ad.getAnnouncementById(1);
        String expectContent= "This is ann1";
        
        Assert.assertEquals(expectContent,ann.getContent());
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
