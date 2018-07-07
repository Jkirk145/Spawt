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
import com.windowsazure.messaging.Notification;
import com.windowsazure.messaging.NotificationHub;
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
    
    private String connectionString = "Endpoint=sb://flyluckns.servicebus.windows.net/;SharedAccessKeyName=DefaultFullSharedAccessSignature;SharedAccessKey=eNm+X5CZaEXcK9Dcsu0f5OaGDryF9vOq2Vcl3pWLPIo=";
    private String hubName = "FlyLuckHub";
    
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
    
    @RequestMapping(value="/sendmessage")
    public String SendMessage (@RequestParam Map<String, String> RequestParams)
    {
        String message = "";
        String tags = "";
        message = RequestParams.get("message");
        tags = RequestParams.get("tags");
        
        List<String> tagList = Arrays.asList(tags.split(","));
        
        Set<String> tagSet = new HashSet<String>(tagList);
        
        NotificationHub hub = new NotificationHub(connectionString, hubName);

        Notification gn = Notification.createGcmNotifiation(message);
        Notification an = Notification.createAppleNotifiation(message);
        
        hub.sendNotification(gn, tagSet);
        hub.sendNotification(an, tagSet);
        
        return "Message sent";
    }
    
}
