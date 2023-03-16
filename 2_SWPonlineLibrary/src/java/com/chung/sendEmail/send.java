/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.chung.sendEmail;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/**
 *
 * @author chung
 */
@WebServlet(name="send", urlPatterns={"/send"})
public class send extends HttpServlet {
   
    
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String host = "smtp.gmail.com";
    int port = 587;
    String username = "chungdvhe160136@fpt.edu.vn";
    String password = "ilynvflipaezfmyi";

    Properties props = new Properties();
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.host", host);
    props.put("mail.smtp.port", port);

    Session session = Session.getInstance(props, new Authenticator() {
      protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(username, password);
      }
    });

    String from = "chungdvhe160136@fpt.edu.vn";
    String to = "chungcacbon@gmail.com";
    String subject = "Email subject";
    String text = "This is email that have been compose by Vee can this message ";
         try {
              MimeMessage message = new MimeMessage(session);
    message.setFrom(new InternetAddress(from));
    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
    message.setSubject(subject);
    message.setText(text);

    Transport.send(message);
         } catch (Exception e) {
         }
   

    response.getWriter().println("Email sent successfully.");
  }

}
