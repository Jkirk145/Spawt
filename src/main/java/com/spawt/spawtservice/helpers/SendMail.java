/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package com.spawt.spawtservice.helpers;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import com.sun.mail.smtp.*;
import org.apache.log4j.*;
import com.google.gson.*;
import com.spawt.spawtservice.models.Request;
/**
 *
 * @author johnkirksey
 */
public class SendMail {
    
    private String _to = "john.kirksey@luckcompanies.com, rblanchard@luckcompanies.com, kelly.fleshood@luckcompanies.com";
    private String _from = "n833cl@gmail.com";
    private String _subject;
    private String _body;
    private Request request;
    static Logger log = Logger.getLogger(SendMail.class.getName());
    
    public SendMail(String email)
    {
        Gson gson = new Gson();
        
        request = gson.fromJson(email, Request.class);
        
        _body = "\nDestination: " + request.Destination +
		"\nDepart: " + request.DateDepart + " " + request.TimeDepart +
                "\nReturn: " + request.DateReturn + " " + request.TimeReturn +
                "\nRental Car: " + request.RentalCar +
                "\n# of Passengers: " + request.NumPax +
                "\nSpecial Requests: " + request.Specials +
                "\nPurpose of trip: " + request.Purpose +
                "\nRequestor: " + request.Requestor;
        
    }
    
    public void Send()
    {
        log.info("Sending email....");
        Properties props = System.getProperties();
        props.put("mail.smtps.host","smtp.gmail.com");
        props.put("mail.smtps.auth","true");
        try
        {
            Session session = Session.getInstance(props, null);
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(_from));
            msg.setRecipients(Message.RecipientType.TO,
                InternetAddress.parse(_to));
            msg.setSubject("Flight Request TEST " + request.Subject);
            msg.setText(_body);
            msg.setHeader("X-Mailer", "Spawt TEST");
            msg.setSentDate(new Date());
            SMTPTransport t =
                (SMTPTransport)session.getTransport("smtps");
            t.connect("smtp.gmail.com", "n833cl@gmail.com", "Luckstone29");
            t.sendMessage(msg, msg.getAllRecipients());
            System.out.println("Response: " + t.getLastServerResponse());
            t.close();
        }
        catch(MessagingException me)
        {
            log.error("Error in SendMail.Send: " + me.toString());
            System.out.println(me.toString());
        }
        
        
    }
    
}
