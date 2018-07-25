/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spawt.spawtservice.controllers;

/**
 *
 * @author johnkirksey
 */
import java.lang.String;
import java.sql.*;
import com.google.gson.*;
import com.spawt.spawtservice.helpers.Helpers;
import com.spawt.spawtservice.helpers.ListingManager;
import com.spawt.spawtservice.models.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.apache.log4j.*;
import java.util.List;
import java.util.Map.Entry;

/**
 *
 * @author johnkirksey
 */



public class SpawtService {
    
    Connection cn = null;
    Statement st = null;
    ResultSet rs = null;
    String json = "";
    
    static Logger log = Logger.getLogger(SpawtController.class.getName());
    
    
    public String Authenticate(String userid, String password)
    {
        try{
            cn = DBConnect();
            st = cn.createStatement();
            String sql = "insert into Listing...";
            rs = st.executeQuery(sql);
        }
        catch (SQLException se)
        {
            log.error(se.toString());
            System.out.println(se.toString());
        }
        finally {  
            if (rs != null) try { rs.close(); } catch(Exception e) {log.error("Error in SpawtService.GetHolds: " + e.toString());}  
            if (st != null) try { st.close(); } catch(Exception e) {log.error("Error in SpawtService.GetHolds: " + e.toString());}  
            if (cn != null) try { cn.close(); } catch(Exception e) {log.error("Error in SpawtService.GetHolds: " + e.toString());}  
        }
        return "OK";
    }
    
    
    public String TestDB()
    {
        String retval = "Connected...";
        //cn = DBConnect();
        try{
            cn = DBConnect();
            st = cn.createStatement();
            String sql = "insert into Listing...";
            
        }
        catch (SQLException se)
        {
            log.error(se.toString());
            System.out.println(se.toString());
            retval = se.toString();
        }
        finally {  
            if (rs != null) try { rs.close(); } catch(Exception e) {log.error("Error in SpawtService.GetHolds: " + e.toString());}  
            if (st != null) try { st.close(); } catch(Exception e) {log.error("Error in SpawtService.GetHolds: " + e.toString());}  
            if (cn != null) try { cn.close(); } catch(Exception e) {log.error("Error in SpawtService.GetHolds: " + e.toString());}  
        }
        return retval;
    
    
    }
    
    public String AddListing(String listing)
    {
        String listingID = "NULL";
        Gson gson = new Gson();
        try{
            
            
            Listing l = gson.fromJson(listing, Listing.class);
            Foo f = gson.fromJson(listing, Foo.class);
            /*Listing l = new Listing();
            l.Street = "Whitney Ave";
            l.City = "East Hollywood";
            l.State = "CA";
            l.Rooms = "1";
            l.Rent = "1800";*/
            
            
            ListingManager manager = new ListingManager();
            manager.setup();
            listingID = Integer.toString(manager.create(l));
            manager.exit();
            
            //cn = DBConnect();
            //st = cn.createStatement();

            //rs = st.executeQuery(sql);
        }
        catch (Exception e)
        {
            listingID = e.toString();
            log.error(e.toString());
            System.out.println(e.toString());
        }
        return listingID;
    }
    
    
    
    public String UpdateListing(String listingID)
    {
        try{
            cn = DBConnect();
            st = cn.createStatement();
            String sql = "select NAME, CELLULAR from t_Crew c INNER JOIN t_CrewOnBoard cob on cob.CREWID = c.CREWID where cob.LEGID = '" + listingID + "'";
            rs = st.executeQuery(sql);
            Gson gson = new Gson();
            json = gson.toJson(RSToArrayList(rs));
        }
                catch (SQLException se)
        {
            log.error(se.toString());
            System.out.println(se.toString());
        }
        finally {  
            if (rs != null) try { rs.close(); } catch(Exception e) {log.error("Error in SpawtService.GetMx: " + e.toString());}  
            if (st != null) try { st.close(); } catch(Exception e) {log.error("Error in SpawtService.GetMx: " + e.toString());}  
            if (cn != null) try { cn.close(); } catch(Exception e) {log.error("Error in SpawtService.GetMx: " + e.toString());}  
        }
        return json;

    }
    
    
    public String DeleteListing(int listingID)
    {
        String retVal = "Listing has been removed successfully";
        ListingManager manager = new ListingManager();
        try
        {
            manager.setup();
            manager.delete(listingID);
        }
        catch (Exception e)
        {
            retVal = e.toString();
        }
        finally
        {
            manager.exit();
         }
        return retVal;
        
    }
    
    public String GetListing(Map <String, String> params)
    {
        //params = "Street="
        String json = "";
        
        String paramString = "WHERE ";
        int i = 0;
        
        for(Map.Entry<String, String> entry : params.entrySet())
        {
            paramString += entry.getKey() + " LIKE '%" + entry.getValue() + "%'";
            i++;
            if(i < params.size() )
                paramString += " OR ";
            else
                break;
        }
        
        
        try{
            List<Listing> listings = null;
            
            ListingManager manager = new ListingManager();
            manager.setup();
            listings = manager.read(paramString);
            manager.exit();
            
            Gson gson = new Gson();
            json = gson.toJson(listings);
        }
        catch (Exception e)
        {
            log.error(e.toString());
            System.out.println(e.toString());
        }
        
        return json;

    }
    
    private Connection DBConnect()
    {
        Helpers helper = new Helpers();
        
        Connection cn = null;
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String conn = helper.GetConnectionString();
            cn = DriverManager.getConnection(conn);
        }
        catch (ClassNotFoundException e){
            log.error(e.toString());
            System.out.println(e.toString());
        }
        catch (SQLException se){
            log.error(se.toString());
            System.out.println(se.toString());
        }
        catch (Exception ex){
            log.error(ex.toString());
            System.out.println(ex.toString());
        }
        return cn;
    }
    
    private ArrayList RSToArrayList(ResultSet rs)
    {
        ArrayList al = new ArrayList();
        try{
            ResultSetMetaData rsmd = rs.getMetaData();
            
            while(rs.next())
            {
                Map<String, String> map = new HashMap<String, String>();
                for(int i=1; i<=rsmd.getColumnCount(); i++)
                {
                    map.put(rsmd.getColumnName(i), rs.getString(i));
                }
                al.add(map);
            }
        }
        catch(SQLException se)
        {}
        
        return al;
    }
    
    
}
