/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package com.chung.sendEmail;

import DAO.announcementDAO;
import org.junit.Assert;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author chung
 */
public class TestAnnoucment {
    
    public TestAnnoucment() {
    }
    @Test
     public void getAllAnnouncement(){
         announcementDAO ad = new announcementDAO();
          Assert.assertEquals("Librarian close from 11h to 12h",ad.getAllAnnouncement().get(0).getContent() );
          Assert.assertEquals("size should be 1, because of adding an Object","now system going to work normaly",ad.getAllAnnouncement().get(1).getContent());
     }
}
