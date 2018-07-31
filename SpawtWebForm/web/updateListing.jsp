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
        <link rel="shortcut icon" href="#" />
        <title>Update Listing Form</title>
    </head>
    <body>
        <h1>Update Listing Form</h1>
        <h2>Update Listing</h2>
        <form onsubmit="return makeJson(this);" id="updatingForm" action="mainPage.html" method="POST">
             <table>
                <tr>
                    <td> Street: </td>
                    <td><input type="text" name="Street" value="" size="50"/></td>
                </tr>
                <tr>
                    <td> City: </td>
                    <td><input type="text" name="City" value="" size="50"/></td>
                </tr>
                <tr>
                    <td> State: </td>
                    <td><input type="text" name="State" value="" size="50"></td>
                </tr>
                <tr>
                    <td> Zip: </td>
                    <td><input type="text" name="Zip" value="" size="50"></td>
                </tr>
                <tr>
                    <td> Rooms: </td>
                    <td><input type="text" name="Rooms" value="" size="50"/></td>
                </tr>
                <tr>
                    <td> SquareFt: </td>
                    <td><input type="text" name="SquareFt" value="" size="50"/></td>
                </tr>
                <tr>
                    <td> Rent: </td>
                    <td><input type="text" name="Rent" value="" size="50"/></td>
                </tr>
                <tr>
                    <td> Dogs Allowed: </td>
                    <td><input type="radio" name="DogsOK" value="1"/> YES</td>
                    <td><input type="radio" name="DogsOK" value="0"/> NO</td>
                </tr>
                 <tr>
                    <td> Cats Allowed: </td>
                    <td><input type="radio" name="CatsOK" value="1"/> YES</td>
                    <td><input type="radio" name="CatsOK" value="0"/> NO</td>
                </tr>
                <tr>
                    <td> Small Dogs Allowed: </td>
                    <td><input type="radio" name="SmallDogsOK" value="1"/> YES</td>
                    <td><input type="radio" name="SmallDogsOK" value="0"/> NO</td>
                </tr>
                <tr>
                    <td> Medium Dogs Allowed: </td>
                    <td><input type="radio" name="MediumDogsOK" value="1"/> YES</td>
                    <td><input type="radio" name="MediumDogsOK" value="0"/> NO</td>
                </tr>
                <tr>
                    <td> Large Dogs Allowed: </td>
                    <td><input type="radio" name="LargeDogsOK" value="1"/> YES</td>
                    <td><input type="radio" name="LargeDogsOK" value="0"/> NO</td>
                </tr>
                <tr>
                    <td> Insurance: </td>
                    <td><input type="radio" name="Insurance" value="1"/> YES</td>
                    <td><input type="radio" name="Insurance" value="0"/> NO</td>
                </tr>
            </table>
            <fieldset>
                <legend>Select all Amenities Present</legend>
                    <div>
                        <input type="checkbox" name="HardwoodFloors" value="Y"/>
                        <label for="HardwoodFloors">Hardwood Floors</label>
                    </div>
                    <div>
                        <input type="checkbox" name="Parking" value="Y"/>
                        <label for="Parking">Parking</label>
                    </div>
                    <div>
                        <input type="checkbox" name="Refrigerator" value="Y"/>
                        <label for="Refrigerator">Refrigerator</label>
                    </div>
                    <div>
                        <input type="checkbox" name="Oven" value="Y"/>
                        <label for="Oven">Oven</label>
                    </div>
                    <div>
                        <input type="checkbox" name="Washer/Dryer" value="Y"/>
                        <label for="Washer/Dryer">Washer/Dryer</label>
                    </div>
                    <div>
                        <input type="checkbox"name="Fireplace" value="Y"/>
                        <label for="Fireplace">Fire Place</label>
                    </div>
                    <div>
                        <input type="checkbox" name="Dishwasher" value="Y"/>
                        <label for="Dishwasher">Dishwasher</label>
                    </div>
                    <div>
                        <input type="checkbox" name="Heat" value="Y"/>
                        <label for="Heat">Heat</label>
                    </div>
                    <div>
                        <input type="checkbox" name="AirConditioning" value="Y"/>
                        <label for="AirConditioning">AirConditioning</label>
                    </div>
                    <div>
                        <input type="checkbox" name="Backyard" value="Y"/>
                        <label for="Backyard">Backyard</label>
                    </div>
                    <div>
                        <input type="checkbox" name="Fence" value="Y"/>
                        <label for="Fence">Fence</label>
                    </div>
                    <div>
                        <input type="checkbox" name="Pool" value="Y"/>
                        <label for="Pool">Pool</label>
                    </div>
                    <div>
                        <input type="checkbox" name="WiFi" value="Y"/>
                        <label for="WiFi">WiFi</label>
                    </div>
            </fieldset>
            <input type="hidden" name="ListingID" id="ListingID" value=""/>
            <input type="submit" value="submit Listing" name="submitListingButton"/>
            <% //turn data inputted into json text and then.....(ask john what to 
            //do after that%>
        </form>
        
        
        <pre id="errors"></pre>
        
        <script>
            
           var urlFull=document.URL;
           var params=urlFull.substr(urlFull.lastIndexOf('=')+1,urlFull.length);
           console.log(params);
           var decodedString = decodeURIComponent(params);
           //console.log(decodedString);
           var updateList= JSON.parse(decodedString);
           //console.log(JSON.stringify(updateList));
           
           document.getElementById("updatingForm").elements["Street"].value = updateList.Street;
           document.getElementById("updatingForm").elements["City"].value = updateList.City;
           document.getElementById("updatingForm").elements["State"].value = updateList.State;
           document.getElementById("updatingForm").elements["Zip"].value = updateList.Zip;
           document.getElementById("updatingForm").elements["Rooms"].value = updateList.Rooms;
           document.getElementById("updatingForm").elements["SquareFt"].value = updateList.SquareFt;
           document.getElementById("updatingForm").elements["Rent"].value = updateList.Rent;
           
           document.getElementById("updatingForm").elements["DogsOK"].value = updateList.DogsOK;
           document.getElementById("updatingForm").elements["CatsOK"].value = updateList.CatsOK;
           document.getElementById("updatingForm").elements["SmallDogsOK"].value = updateList.SmallDogsOK;
           document.getElementById("updatingForm").elements["MediumDogsOK"].value = updateList.MediumDogsOK;
           document.getElementById("updatingForm").elements["LargeDogsOK"].value = updateList.LargeDogsOK;
           document.getElementById("updatingForm").elements["Insurance"].value = updateList.Insurance;
           document.getElementById("updatingForm").elements["ListingID"].value = updateList.ListingID;
           
           var amenities = updateList.Amenities;
           var splitAmen = amenities.split(",");
           for(var amen in splitAmen){
               document.getElementById("updatingForm").elements[amen].checked = "YES";  
           }
        
           
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
                    "WiFi":form.elements["WiFi"].value
                };
                for(var key in jsonAmenities){
                    //console.error("inside For Loop");
                    if(!form.elements[key].checked){
                       // console.error(jsonAmenities);
                        delete jsonAmenities[key];
                    }   
                }
                //create a string that is the amenities
                var amenities = "";
                for(key in jsonAmenities){
                    amenities += key + ",";
                }
                //get rid of last comma
                amenities = amenities.substring(0, amenities.length-1)
                var jsonListAndAmen= {
                    "Street": form.elements["Street"].value,
                    "City": form.elements["City"].value,
                    "State":form.elements["State"].value,
                    "Zip":form.elements["Zip"].value,
                    "Rooms":form.elements["Rooms"].value,
                    "SquareFt": form.elements["SquareFt"].value,
                    "Rent": form.elements["Rent"].value,
                    "DogsOK": form.elements["DogsOK"].value,
                    "CatsOK": form.elements["CatsOK"].value,
                    "SmallDogsOK":form.elements["SmallDogsOK"].value,
                    "MediumDogsOK": form.elements["MediumDogsOK"].value,
                    "LargeDogsOK": form.elements["LargeDogsOK"].value,
                    "Insurance": form.elements["Insurance"].value,
                    "Amenities": amenities,
                    "ListingID": updateList.ListingID
                };
                //if(!form.elements[insurance].checked) jsonListAndAmen[Insurance]= "N";
                
                var jSONListing = JSON.stringify(jsonListAndAmen);
                //document.getElementById('errors').innerHTML=jSONListing;
                
                //now call api
                var httpRequest = new XMLHttpRequest();
                var url = 'http://localhost:8080/SpawtService/updatelisting/'+ jSONListing;
                //console.log(url);
                httpRequest.open('POST', url, true);
                //Send the proper header information along with the request
                httpRequest.setRequestHeader('Content-type', 'application/json');
                console.log("set request header")
                httpRequest.onreadystatechange = function() {//Call a function when the state changes.
                    if(this.readyState == XMLHttpRequest.DONE && httpRequest.status == 200) {
                        //if string is not an error but an id
                        if(!(httpRequest.responseText.substring(0,4)=="java")){
                            window.location.href = "http://localhost:8080/mainPage.html";
                        }
                        //else it is an error
                        else{
                            document.getElementById('errors').innerHTML=httpRequest.responseText;
                        }
                    }
                } 
                httpRequest.send();
                return false;
            }
        </script>
    </body>
</html>
