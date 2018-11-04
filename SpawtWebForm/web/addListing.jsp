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
        <title>Listing Form</title>
        
        <style>
            #selectedFiles img {
		max-width: 125px;
		max-height: 125px;
		float: left;
		margin-bottom:10px;
            }
        </style>
    </head>
    <body>
        <h1>Add Listing Form</h1>
        <h2>Add A Listing by Filling Out All Fields</h2>
        <form onsubmit="return makeJson(this);" id="addingForm" action="mainPage.html" method="POST">
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
            Files: <input type="file" id="files" name="files" multiple accept="image/*"><br/>
            <div id="selectedFiles"></div>
            
            <div id="selDiv"></div>

            <input type="submit" value="submit Listing" name="submitListingButton"/>
            <% //turn data inputted into json text and then.....(ask john what to 
            //do after that%>
        </form>
        
        <pre id="errors"></pre>
        
        <script>
            
            var filesArr;
            document.addEventListener("DOMContentLoaded", init, false);
            
            function init() {
		document.querySelector('#files').addEventListener('change', handleFileSelect, false);
		selDiv = document.querySelector("#selectedFiles");
            }
		
            function handleFileSelect(e) {
		if(!e.target.files || !window.FileReader) return;
		selDiv.innerHTML = "";
		var files = e.target.files;
		filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f) {
			var reader = new FileReader();
			reader.onload = function (e) {
                                var html = "<img src=\"" + e.target.result + "\">" + f.name + "<br clear=\"left\"/>";
                                document.getElementById("selDiv").innerHTML += html;
                                document.getElementById("selDiv").innerHTML += "<select id= \"" + f.name +"\">"
                                +"<option value=\"Bathroom\"Bathroom></option>"
                                +"<option value=\"Livingroom\">Livingroom</option>"
                                +"<option value=\"Bedroom\">Bedroom</option>"
                                +"<option value=\"Kitchen\">Kitchen</option>"
                                +"<option value=\"Outside\">Outside</option>"
                                +"<option value=\"Other\">Other</option>"
                                +"</select>" 
                                + "<br></br>";
			}
			reader.readAsDataURL(f); 
                        console.log(f.name);
		});
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
                    "Amenities": amenities
                };
                //if(!form.elements[insurance].checked) jsonListAndAmen[Insurance]= "N";
                var jSONListing = JSON.stringify(jsonListAndAmen);
                //document.getElementById('errors').innerHTML=jSONListing;
                
                //now call api
                var httpRequest = new XMLHttpRequest();
                var url = 'http://localhost:8080/SpawtService/addlisting/'+ jSONListing;
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
                
                
                var didntLoad = 0;
                    //now send images to database---
                filesArr.forEach(function(f){
                   var imageRequest = new XMLHttpRequest();
                   var reader = new FileReader();
                   var image;
                    reader.onload = function (e) {
                        image =  e.target.result;				
                    }
                    reader.readAsDataURL(f);
                    console.log(XMLHttpRequest.responseText);
                    var url = 'http://localhost:8080/SpawtService/addimage/'+ image+'/'+ XMLHttpRequest.responseText+"/"+ document.getElementById(f.name).options[document.getElementById(f.name).selectedIndex].value; //tag for specific picture;
                    console.log(url);
                    imageRequest.open('POST', url, true);
                    //Send the proper header information along with the request
                    imageRequest.setRequestHeader('Content-type', 'multipart/form-data');
                    console.log("set request header")
                    imageRequest.onreadystatechange = function() {//Call a function when the state changes.
                        if(this.readyState == XMLHttpRequest.DONE && imageRequest.status == 200) {
                            //if string is not an error but an id
                            if(!(imageRequest.responseText.substring(0,4)=="java")){
                               // window.location.href = "http://localhost:8080/mainPage.html";
                               console.log(imageRequest.responseText);
                            }
                            //else it is an error
                            else{
                                didntLoad= 1;
                                document.getElementById('errors').innerHTML=imageRequest.responseText;
                            }
                        }
                    } 
                    imageRequest.send(); 
                });
                if(didntLoad==0){
                    window.location.href = "http://localhost:8080/mainPage.html";
                }
                
                return false;
            }
        </script>
    </body>
</html>
