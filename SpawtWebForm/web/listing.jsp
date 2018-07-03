<%-- 
    Document   : listing
    Created on : Jul 2, 2018, 7:41:35 PM
    Author     : apple
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listing Form</title>
    </head>
    <body>
        <h1>Add A Listing by Filling Out All Fields</h1>
        <form name="listingForm" action="database" type="POST">
             <table>
                <tr>
                    <td> Street: </td>
                    <td><input type="text" name="street" value="" size="50"/></td>
                </tr>
                <tr>
                    <td> City: </td>
                    <td><input type="text" name="city" value="" size="50"/></td>
                </tr>
                <tr>
                    <td> State: </td>
                    <td><input type="text" name="state" value="" size="50"></td>
                </tr>
                <tr>
                    <td> Zip: </td>
                    <td><input type="text" name="zip" value="" size="50"></td>
                </tr>
                <tr>
                    <td> Rooms: </td>
                    <td><input type="text" name="rooms" value="" size="50"/></td>
                </tr>
                <tr>
                    <td> Rent: </td>
                    <td><input type="text" name="rent" value="" size="50"/></td>
                </tr>
                <tr>
                    <td> Cats Allowed: </td>
                    <td><input type="radio" name="catsAllowed" value="yes"> YES</td>
                    <td><input type="radio" name="catsAllowed" value="no"> NO</td>
                </tr>
                <tr>
                    <td> Dogs Allowed: </td>
                    <td><input type="radio" name="dogsAllowed" value="yes"> YES</td>
                    <td><input type="radio" name="dogsAllowed" value="no"> NO</td>
                </tr>
                <tr>
                    <td> Small Dogs Allowed: </td>
                    <td><input type="radio" name="smallDogsAllowed" value="yes"> YES</td>
                    <td><input type="radio" name="smallDogsAllowed" value="no"> NO</td>
                </tr>
                <tr>
                    <td> Medium Dogs Allowed: </td>
                    <td><input type="radio" name="mediumDogsAllowed" value="yes"> YES</td>
                    <td><input type="radio" name="mediumDogsAllowed" value="no"> NO</td>
                </tr>
                <tr>
                    <td> Large Dogs Allowed: </td>
                    <td><input type="radio" name="largeDogsAllowed" value="yes"> YES</td>
                    <td><input type="radio" name="largeDogsAllowed" value="no"> NO</td>
                </tr>
                <tr>
                    <td> Insurance: </td>
                    <td><input type="radio" name="insurance" value="yes"> YES</td>
                    <td><input type="radio" name="insurance" value="no"> NO</td>
                </tr>
            </table>
            <input type="submit" value="submit Listing" name="submitListingButton"/>
            <% //turn data inputted into json text and then.....(ask john what to 
            //do after that%>
        </form>
    </body>
</html>
