/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spawt.spawtservice.helpers;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import com.spawt.spawtservice.models.*;
/**
 *
 * @author johnkirksey
 */
public class ListingManager {
    protected SessionFactory sessionFactory;
 
    public void setup() {
        // code to load Hibernate Session factory
        final StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
        .configure() // configures settings from hibernate.cfg.xml
        .build();
        try {
            sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
        } catch (Exception ex) {
            StandardServiceRegistryBuilder.destroy(registry);
        }
    }
 
    public void exit() {
        // code to close Hibernate Session factory
        sessionFactory.close();
    }
 
    public int create(Listing l) {
        // code to save a book
        int listingID = 0;
        
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        
        listingID = (int)session.save(l);
        
        session.getTransaction().commit();
        session.close();
        
        return listingID;
    }
 
    protected void read() {
        // code to get a book
    }
 
    protected void update() {
        // code to modify a book
    }
 
    protected void delete() {
        // code to remove a book
    }
 
    public static void main(String[] args) {
        // code to run the program
    }
}
