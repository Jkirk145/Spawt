<%-- 
    Document   : addListing
    Created on : Jul 2, 2018, 7:41:35 PM
    Author     : Jamila
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listing Form</title>
    </head>
    <body>
        <h1>Add Listing Form</h1>
        <h2>Add A Listing by Filling Out All Fields</h2>
        <form onsubmit="return makeJson(this);" enctype="text/plain" name="addListing" action="deleteListing.jsp" type="POST">
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
                    <td><input type="radio" name="catsAllowed" value="Y"/> YES</td>
                    <td><input type="radio" name="catsAllowed" value="N"/> NO</td>
                </tr>
                <tr>
                    <td> Dogs Allowed: </td>
                    <td><input type="radio" name="dogsAllowed" value="Y"/> YES</td>
                    <td><input type="radio" name="dogsAllowed" value="N"/> NO</td>
                </tr>
                <tr>
                    <td> Small Dogs Allowed: </td>
                    <td><input type="radio" name="smallDogsAllowed" value="Y"/> YES</td>
                    <td><input type="radio" name="smallDogsAllowed" value="N"/> NO</td>
                </tr>
                <tr>
                    <td> Medium Dogs Allowed: </td>
                    <td><input type="radio" name="mediumDogsAllowed" value="Y"/> YES</td>
                    <td><input type="radio" name="mediumDogsAllowed" value="N"/> NO</td>
                </tr>
                <tr>
                    <td> Large Dogs Allowed: </td>
                    <td><input type="radio" name="largeDogsAllowed" value="Y"/> YES</td>
                    <td><input type="radio" name="largeDogsAllowed" value="N"/> NO</td>
                </tr>
                <tr>
                    <td> Insurance: </td>
                    <td><input type="radio" name="insurance" value="Y"/> YES</td>
                    <td><input type="radio" name="insurance" value="N"/> NO</td>
                </tr>
            </table>
            <fieldset>
                <legend>Select all Amenities Present</legend>
                    <div>
                        <input type="checkbox" id="HardwoodFloors" name="HardwoodFloors" value="Y"/>
                        <label for="HardwoodFloors">Hardwood Floors</label>
                    </div>
                    <div>
                        <input type="checkbox" id="Parking" name="Parking" value="Y"/>
                        <label for="Parking">Parking</label>
                    </div>
                    <div>
                        <input type="checkbox" id="Refrigerator" name="Refrigerator" value="Y"/>
                        <label for="Refrigerator">Refrigerator</label>
                    </div>
                    <div>
                        <input type="checkbox" id="Oven" name="Oven" value="Y"/>
                        <label for="Oven">Oven</label>
                    </div>
                    <div>
                        <input type="checkbox" id="Washer/Dryer" name="Washer/Dryer" value="Y"/>
                        <label for="Washer/Dryer">Washer/Dryer</label>
                    </div>
                    <div>
                        <input type="checkbox" id="Fireplace" name="Fireplace" value="Y"/>
                        <label for="Fireplace">Fire Place</label>
                    </div>
                    <div>
                        <input type="checkbox" id="Dishwasher" name="Dishwasher" value="Y"/>
                        <label for="Dishwasher">Dishwasher</label>
                    </div>
                    <div>
                        <input type="checkbox" id="Heat" name="Heat" value="Y"/>
                        <label for="Heat">Heat</label>
                    </div>
                    <div>
                        <input type="checkbox" id="AirConditioning" name="AirConditioning" value="Y"/>
                        <label for="AirConditioning">AirConditioning</label>
                    </div>
                    <div>
                        <input type="checkbox" id="Backyard" name="Backyard" value="Y"/>
                        <label for="Backyard">Backyard</label>
                    </div>
                    <div>
                        <input type="checkbox" id="Fence" name="Fence" value="Y"/>
                        <label for="Fence">Fence</label>
                    </div>
                    <div>
                        <input type="checkbox" id="Pool" name="Pool" value="Y"/>
                        <label for="Pool">Pool</label>
                    </div>
                    <div>
                        <input type="checkbox" id="WiFi" name="WiFi" value="Y"/>
                        <label for="WiFi">WiFi</label>
                    </div>
            </fieldset>
            <input type="submit" value="submit Listing" name="submitListingButton"/>
            <% //turn data inputted into json text and then.....(ask john what to 
            //do after that%>
        </form>
        <pre id="results">    
        </pre>
        <script>
            function makeJson(form){
                var jsonAmenities= {
                    "HardwoodFloors":form.elements["HardwoodFloors"].value,
                    "Parking":form.elements["Parking"].value,
                    "Refrigerator":form.elements["Refrigerator"].value,
                    "Oven":form.elements["Oven"].value,
                    "Washer/Dryer":form.elements["Washer/Dryer"].value,
                    "Fireplace":form.elements["Fireplace"].value,
                    "Dishwasher":form.elements["Dishwasher"].value,
                    "Heat":form.elements["Heat"].value,
                    "AirConditioning":form.elements["AirConditioning"].value,
                    "Backyard":form.elements["Backyard"].value,
                    "Fence":form.elements["Fence"].value,
                    "Pool":form.elements["Pool"].value,
                    "WiFi":form.elements["WiFi"].value,
                };
                for(var key in jsonAmenities){
                    if(!form.elements[key].checked) jsonAmenities[key]="N";
                }
                var jsonListAndAmen= {
                    "ListingID": "001",
                    "Street": form.elements["street"].value,
                    "City": form.elements["city"].value,
                    "State":form.elements["state"].value,
                    "Zip":form.elements["zip"].value,
                    "Rooms":form.elements["rooms"].value,
                    "SquareFt": form.elements["squareft"].value,
                    "Rent": form.elements["rent"].value,
                    "DogsOK": form.elements["dogsAllowed"].value,
                    "CatsOK": form.elements["catsAllowed"].value,
                    "SmallDogsOK":form.elements["smallDogsAllowed"].value,
                    "MediumDogsOK": form.elements["mediumDogsAllowed"].value,
                    "LargeDogsOK": form.elements["largeDogsAllowed"].value,
                    "Insurance": form.elements["insurance"].value,
                    "Amenities": jsonAmenities
                };
                //if(!form.elements[insurance].checked) jsonListAndAmen[Insurance]= "N";
                var jsonFullListing= {
                    "Listing": jsonListAndAmen
                };
                var jSONListing = JSON.stringify(jsonFullListing);
                //document.getElementById('results').innerHTML=JSON.stringify(jsonFullListing);
               //return false;
            }
        </script>
    </body>
</html>
