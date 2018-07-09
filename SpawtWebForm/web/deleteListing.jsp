<%-- 
    Document   : deleteListing
    Created on : Jul 3, 2018, 11:54:09 AM
    Author     : Jamila
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deleting Form</title>
    </head>
    <body>
        <h1>Delete Listing Form</h1>
        <h2>Deleting Listing by ID Number</h2>
        <form enctype="application/json" name="deleteListing" action="/spawtservice/deleteListing" type="POST">
            <table>
                <tr>
                    <td>Listing ID:</td>
                    <td><input type="text" id="listingID" name="listingID" value="" size="80"/></td> 
                </tr>
            </table>   
        </form>
        
        <pre name="errors"></pre>
        <input type="submit" value="Delete Listing" name="deleteListingButton"/>
        <script>
          
        </script>
    </body>
</html>
