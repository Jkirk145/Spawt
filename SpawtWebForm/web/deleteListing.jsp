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
        <form onsubmit="return makeJson(this);" name="deleteListing" action="/spawtservice/deleteListing" type="POST">
            <table>
                <tr>
                    <td>Listing ID:</td>
                    <td><input type="text" id="ListingID" name="ListingID" value="" size="80"/></td> 
                </tr>
            </table> 
            
            <input type="submit" value="Delete Listing" name="deleteListingButton"/>
        </form>

        <pre id="errors"></pre>
        
        <script>
            function makeJson(form){
                var jsonElem ={
                    "ListingID": form.elements["ListingID"].value
                };
                var jSONListing = JSON.stringify(jsonElem);
                document.getElementById('errors').innerHTML=jSONListing;
                return false;
            }
        </script>
    </body>
</html>
