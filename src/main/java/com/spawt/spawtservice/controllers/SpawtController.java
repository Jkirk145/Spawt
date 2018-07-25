/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spawt.spawtservice.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.Map;
import org.apache.log4j.*;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Iterator;

/**
 *
 * @author johnkirksey
 */
@RestController
public class SpawtController {
    
    static Logger log = Logger.getLogger(SpawtController.class.getName());
    
    
    
    
    @RequestMapping("/getalllistings")
    public static String GetAllListings()
    {
        //SpawtService service = new SpawtService();
        //return service.TestDB();
        return "Hello Spawt User!";
    }
    
    @RequestMapping("/1/{userid}/{password}")
    public String Authenticate(@PathVariable String userid, @PathVariable String password)
    {
        SpawtService service = new SpawtService();
        return service.Authenticate(userid, password);
    }
    
    @RequestMapping("/addlisting/{listing}")
    public String AddListing(@PathVariable String listing)
    {
        SpawtService service = new SpawtService();
        
        
        /*listing = "{\n" +
                    "\"Listing\": {\n" +
                    "\"ListingID\": \"001\",\n" +
                    "\"Street\": \"1820 Whitley Ave\",\n" +
                    "\"City\": \"Hollywood\",\n" +
                    "\"State\": \"CA\",\n" +
                    "\"Zip\": \"90068\",\n" +
                    "\"Rooms\": \"3\",\n" +
                    "\"SquareFt\": \"990\",\n" +
                    "\"Rent\": \"$1800.00\",\n" +
                    "\"DogsOK\": 0,\n" +
                    "\"CatsOK\": 0,\n" +
                    "\"SmallDogsOK\": 0,\n" +
                    "\"MediumDogsOK\": 0,\n" +
                    "\"LargeDogsOK\": 0,\n" +
                    "\"Insurance\": 0\n" +
                    "	}\n" +
                    "}";*/
        
        return service.AddListing(listing);
    }
    
    @RequestMapping("/getlisting")
    public String GetListing(@RequestParam Map<String, String> SearchParams)
    {
        
        //SearchParams.forEach((k, v) -> System.out.println("Key: " + k + " / Value + " + v));
        
        
        SpawtService service = new SpawtService();
        return service.GetListing(SearchParams);
    }
    
    
    @RequestMapping("/updateListing/{listing}")
    public String UpdateListing(@PathVariable String listing)
    {
        SpawtService service = new SpawtService();
        return service.UpdateListing(listing);
    }
    
    @RequestMapping("deleteListing/{listingid}")
    public String DeleteListing(@PathVariable int listingid)
    {
        SpawtService service = new SpawtService();
        return service.DeleteListing(listingid);
    }
    

    
}
