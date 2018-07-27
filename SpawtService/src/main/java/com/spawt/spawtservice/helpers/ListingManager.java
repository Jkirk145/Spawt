/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spawt.spawtservice.helpers;

import java.util.List;
import java.util.Iterator;

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
 
    public List<Listing> read(String whereClause) {
        // code to get a book
        List listings = null;
        try{
            
            Session session = sessionFactory.openSession();
            session.beginTransaction();

            listings = session.createQuery("FROM Listing " + whereClause).list();

            session.getTransaction().commit();
            session.close();
        }
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
        return listings;
    }
 
    public void update(Listing l) {
        // code to modify a book
        try
        {
            Session session = sessionFactory.openSession();
            session.beginTransaction();

            session.update(l);

            session.getTransaction().commit();
            session.close();
        }
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
        
    }
 
    public void delete(int listingID) {
        // code to remove a book
        Listing listing = new Listing();
        listing.setListingID(listingID);

        Session session = sessionFactory.openSession();
        session.beginTransaction();

        session.delete(listing);

        session.getTransaction().commit();
        session.close();
    }
 
    public static void main(String[] args) {
        // code to run the program
    }
}
