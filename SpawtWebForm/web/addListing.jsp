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
                    <td> SquareFt: </td>
                    <td><input type="text" name="squareft" value="" size="50"/></td>
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
            <fieldset>
                <legend>Select all Amenities Present</legend>
                    <div>
                        <input type="checkbox" id="hardwoodFloors" name="hardwoodFloors" value="yes">
                        <label for="hardwoodFloors">Hardwood Floors</label>
                    </div>
                    <div>
                        <input type="checkbox" id="parking" name="parking" value="yes">
                        <label for="parking">Parking</label>
                    </div>
                    <div>
                        <input type="checkbox" id="refrigerator" name="refrigerator" value="yes">
                        <label for="refrigerator">Refrigerator</label>
                    </div>
                    <div>
                        <input type="checkbox" id="oven" name="oven" value="yes">
                        <label for="oven">Oven</label>
                    </div>
                    <div>
                        <input type="checkbox" id="washerDryer" name="washerDryer" value="yes">
                        <label for="washerDryer">Washer/Dryer</label>
                    </div>
                    <div>
                        <input type="checkbox" id="firePlace" name="firePlace" value="yes">
                        <label for="firePlace">Fire Place</label>
                    </div>
                    <div>
                        <input type="checkbox" id="dishwasher" name="dishwasher" value="yes">
                        <label for="dishwasher">Dishwasher</label>
                    </div>
                    <div>
                        <input type="checkbox" id="heat" name="heat" value="yes">
                        <label for="heat">Heat</label>
                    </div>
                    <div>
                        <input type="checkbox" id="ac" name="ac" value="yes">
                        <label for="ac">AirConditioning</label>
                    </div>
                    <div>
                        <input type="checkbox" id="backyard" name="backyard" value="yes">
                        <label for="backyard">Backyard</label>
                    </div>
                    <div>
                        <input type="checkbox" id="fence" name="fance" value="yes">
                        <label for="fence">Fence</label>
                    </div>
                    <div>
                        <input type="checkbox" id="pool" name="pool" value="yes">
                        <label for="pool">Pool</label>
                    </div>
                    <div>
                        <input type="checkbox" id="wifi" name="wifi" value="yes">
                        <label for="wifi">WiFi</label>
                    </div>
            </fieldset>
            <input type="submit" value="submit Listing" name="submitListingButton"/>
            <% //turn data inputted into json text and then.....(ask john what to 
            //do after that%>
        </form>
    </body>
</html>
