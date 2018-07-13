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
        return service.AddListing(listing);
    }
    
    @RequestMapping("/getlisting/{queryparams}")
    public String GetListing(@PathVariable String queryparams)
    {
        SpawtService service = new SpawtService();
        return service.GetListing(queryparams);
    }
    
    @RequestMapping("/updateListing/{listing}")
    public String UpdateListing(@PathVariable String listing)
    {
        SpawtService service = new SpawtService();
        return service.UpdateListing(listing);
    }
    
    @RequestMapping("deleteListing/{listingid}")
    public String DeleteListing(@PathVariable String listingid)
    {
        SpawtService service = new SpawtService();
        return service.DeleteListing(listingid);
    }
    

    
}
