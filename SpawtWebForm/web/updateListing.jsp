<%-- 
    Document   : updateListing
    Created on : Jul 6, 2018, 5:32:00 PM
    Author     : Jamila
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Listing</title>
    </head>
    <body>
        <h1>Update Detailed Listing</h1>
        <form name="updateForm" id="updateForm" enctype="application/json" action="spawtservice/updateListing/">
             <table>
                <tr>
                    <td> Street: </td>
                    <td><input type="text" name="Listing[Street]" value="" size="50"/></td>
                </tr>
                <tr>
                    <td> City: </td>
                    <td><input type="text" name="Listing[City]" value="" size="50"/></td>
                </tr>
                <tr>
                    <td> State: </td>
                    <td><input type="text" name="Listing[State]" value="" size="50"></td>
                </tr>
                <tr>
                    <td> Zip: </td>
                    <td><input type="text" name="Listing[Zip]" value="" size="50"></td>
                </tr>
                <tr>
                    <td> Rooms: </td>
                    <td><input type="text" name="Listing[Rooms]" value="" size="50"/></td>
                </tr>
                <tr>
                    <td> SquareFt: </td>
                    <td><input type="text" name="Listing[SquareFt]" value="" size="50"/></td>
                </tr>
                <tr>
                    <td> Rent: </td>
                    <td><input type="text" name="Listing[Rent]" value="" size="50"/></td>
                </tr>
                <tr>
                    <td> Dogs Allowed: </td>
                    <td><input type="radio" name="Listing[DogsOK]" value="Y"/> YES</td>
                    <td><input type="radio" name="Listing[DogsOK]" value="N"/> NO</td>
                </tr>
                 <tr>
                    <td> Cats Allowed: </td>
                    <td><input type="radio" name="Listing[CatsOK]" value="Y"/> YES</td>
                    <td><input type="radio" name="Listing[CatsOK]" value="N"/> NO</td>
                </tr>
                <tr>
                    <td> Small Dogs Allowed: </td>
                    <td><input type="radio" name="Listing[SmallDogsOK]" value="Y"/> YES</td>
                    <td><input type="radio" name="Listing[SmallDogsOK]" value="N"/> NO</td>
                </tr>
                <tr>
                    <td> Medium Dogs Allowed: </td>
                    <td><input type="radio" name="Listing[MediumDogsOK]" value="Y"/> YES</td>
                    <td><input type="radio" name="Listing[MediumDogsOK]" value="N"/> NO</td>
                </tr>
                <tr>
                    <td> Large Dogs Allowed: </td>
                    <td><input type="radio" name="Listing[LargeDogsOK]" value="Y"/> YES</td>
                    <td><input type="radio" name="Listing[LargeDogsOK]" value="N"/> NO</td>
                </tr>
                <tr>
                    <td> Insurance: </td>
                    <td><input type="radio" name="Listing[Insurance]" value="Y"/> YES</td>
                    <td><input type="radio" name="Listing[Insurance]" value="N"/> NO</td>
                </tr>
            </table>
            <fieldset>
                <legend>Select all Amenities Present</legend>
                    <div>
                        <input type="checkbox" name="Listing[Amenities][HardwoodFloors]" value="Y"/>
                        <label for="HardwoodFloors">Hardwood Floors</label>
                    </div>
                    <div>
                        <input type="checkbox" name="Listing[Amenities][Parking]" value="Y"/>
                        <label for="Parking">Parking</label>
                    </div>
                    <div>
                        <input type="checkbox" name="Listing[Amenities][Refrigerator]" value="Y"/>
                        <label for="Refrigerator">Refrigerator</label>
                    </div>
                    <div>
                        <input type="checkbox" name="Listing[Amenities][Oven]" value="Y"/>
                        <label for="Oven">Oven</label>
                    </div>
                    <div>
                        <input type="checkbox" name="Listing[Amenities][Washer/Dryer]" value="Y"/>
                        <label for="Washer/Dryer">Washer/Dryer</label>
                    </div>
                    <div>
                        <input type="checkbox"name="Listing[Amenities][Fireplace]" value="Y"/>
                        <label for="Fireplace">Fire Place</label>
                    </div>
                    <div>
                        <input type="checkbox" name="Listing[Amenities][Dishwasher]" value="Y"/>
                        <label for="Dishwasher">Dishwasher</label>
                    </div>
                    <div>
                        <input type="checkbox" name="Listing[Amenities][Heat]" value="Y"/>
                        <label for="Heat">Heat</label>
                    </div>
                    <div>
                        <input type="checkbox" name="Listing[Amenities][AirConditioning]" value="Y"/>
                        <label for="AirConditioning">AirConditioning</label>
                    </div>
                    <div>
                        <input type="checkbox" name="Listing[Amenities][Backyard]" value="Y"/>
                        <label for="Backyard">Backyard</label>
                    </div>
                    <div>
                        <input type="checkbox" name="Listing[Amenities][Fence]" value="Y"/>
                        <label for="Fence">Fence</label>
                    </div>
                    <div>
                        <input type="checkbox" name="Listing[Amenities][Pool]" value="Y"/>
                        <label for="Pool">Pool</label>
                    </div>
                    <div>
                        <input type="checkbox" name="Listing[Amenities][WiFi]" value="Y"/>
                        <label for="WiFi">WiFi</label>
                    </div>
            </fieldset>
            <input type="submit" value="submit Listing" name="submitListingButton"/>
            <% //turn data inputted into json text and then.....(ask john what to 
            //do after that%>
        </form>
        
        <pre id="errors"></pre>
        
        <script>
            //keeps only the amenities marked "y" if not then not in json data
            var form = document.getElementById("addingForm");
            form.addEventListener('submit', function () {
            var allAmenities = myForm.getElementsByTagName('input:checkbox');

            for (var i = 0; i < allAmenities.length; i++) {
                var input = allAmenities[i];

                if (!input.checked) {
                    input.name = '';
                }
            });
        </script>
    </body>
</html>
