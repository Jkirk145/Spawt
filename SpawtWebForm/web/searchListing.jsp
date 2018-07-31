<%-- 
    Document   : searchListing
    Created on : Jul 6, 2018, 5:32:18 PM
    Author     : Jamila
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Listings</title>
    </head>
    <body>
        <h1>Search For Listings</h1>
        <form onsubmit="return searchDataBase();" name="searchForm" id="searchForm" action="mainPage.html">
            <table>
                <tr>
                    <td> Street: </td>
                    <td><input type="text" name="Street" id="Street" value="" size="50"/></td>
                </tr>
                <tr>
                    <td> City: </td>
                    <td><input type="text" name="City" id="City" value="" size="50"/></td>
                </tr>
                <tr>
                    <td> Zip: </td>
                    <td><input type="text" name="Zip" id="Zip" value="" size="50"/></td>
                </tr>
            </table>
            <input type="submit" value="search Listings" name="searchListingsButton"/>
        </form>
        <table id="resultTable">
            
        </table>
        <pre id="errors"></pre>
        
        <input id="updateListing" type="hidden" value="">
        
        <script>
            function searchDataBase(){
                //clear table and error bar
                
               // $(documents.getElementById('errors')).remove();
                //$(documents.getElementById('resultTable')).remove();
                //request database search and fill in table under form
                //now call api
                var httpRequest = new XMLHttpRequest();
                
                var searchParams = "";
                var isEntered = 0;
                if(document.getElementById("Street").value !=''){
                    searchParams += "?street="+ document.getElementById("Street").value;
                    isEntered = 1;
                }
                if(document.getElementById("City").value !=''){
                    if(isEntered){
                      searchParams +="&city="+ document.getElementById("City").value;  
                    }
                    else{
                      searchParams += "?city="+ document.getElementById("City").value;  
                    }
                    isEntered = 1; 
                }
                if(document.getElementById("Zip").value !=''){
                    if(isEntered){
                       searchParams +="&zip="+ document.getElementById("Zip").value;  
                    }
                    else{
                        searchParams +="?zip="+ document.getElementById("Zip").value; 
                    }
                } 
                var url = 'http://localhost:8080/SpawtService/getlisting'+ searchParams;
                //console.log(url);
                httpRequest.open('GET', url,true);
                httpRequest.onreadystatechange = function() {//Call a function when the state changes
                        if(this.readyState == XMLHttpRequest.DONE && httpRequest.status == 200) {
                            //console.log("response text"+ httpRequest.responseText);
                            if(httpRequest.responseText !='[]'){
                                var response= httpRequest.responseText;
                                //console.log(JSON.stringify(response));
                                if((httpRequest.responseText.substring(0,4)=="java")){
                                    document.getElementById('errors').innerHTML=httpRequest.responseText;
                                }
                                else{
                                    //console.log("went in else");
                                    document.getElementById('updateListing').value = response;
                                    console.log(document.getElementById('updateListing').value);
                                    fillTable(response); 
                                } 
                            }
                            else{
                                //fillTable(httpRequest.responseText);
                                document.getElementById('errors').innerHTML="No Matching Listings";
                            }
                        }
                    } 
                httpRequest.send('');
                return false;
            }
            //if api call returns array of listing put the listing in the table
            function fillTable(arrayOfListings){
                 //now fill table with database stuff
                //make each table entry clickable to detailed page
                var tableRef = document.getElementById('resultTable');
                //console.log(JSON.stringify(arrayOfListings));
                // Insert a row in the table at the last row
                var parsedJSON = JSON.parse(arrayOfListings);
                for (var i=0;i<parsedJSON.length;i++) {
                    //console.log(" listing: " + JSON.stringify(parsedJSON[i]));
                    var newRow   = tableRef.insertRow(tableRef.rows.length);
                    // Insert a cell in the row at index 0
                    var newCell  = newRow.insertCell(0);
                    var newCell1 = newRow.insertCell(1);
                    var newCell2 = newRow.insertCell(2);
                    // Append a text node to the cell
                    //var stringListing= JSON.stringify(parsedJSON[i]);
                    //console.log(stringListing);
                    newCell1.innerHTML = '<button name="updateButton" onclick="return updateListing('+ i +');" name="updateButton">Update</button>'
                    newCell2.innerHTML = '<button name="deleteButton" onclick="return deleteListing('+ parsedJSON[i].ListingID + ');" name="deleteButton">Delete</button>'
                    var newText  = document.createTextNode('Listing: ' + parsedJSON[i].Street + ' ' + parsedJSON[i].City);
                    newCell.appendChild(newText);   
                }
            }
            //listing is the json variable of the one listing
            function updateListing(listingNum){
                var listing = JSON.parse(document.getElementById('updateListing').value);
                var theListing = JSON.stringify(listing[listingNum]);
                var mylistParam = encodeURIComponent(theListing);
                window.location.href = "updateListing.jsp?theListing=" + mylistParam;
                return false;
            }
            //listing Id is just the id of the listing (varchar)
            function deleteListing(listingId){
                
                //now call api
                var httpRequest = new XMLHttpRequest();
                var url = 'http://localhost:8080/SpawtService/deletelisting/'+ listingId;
                //console.log(url);
                httpRequest.open('POST', url, true);
                //Send the proper header information along with the request
                httpRequest.setRequestHeader('Content-type', 'application/json');
                //console.log("set request header")
                httpRequest.onreadystatechange = function() {//Call a function when the state changes.
                    if(this.readyState == XMLHttpRequest.DONE && httpRequest.status == 200) {
                        //if string is not an error but an id
                        if(!(httpRequest.responseText.substring(0,4)=="java")){
                            //if deleted the listing go to main page agian
                            window.location.href = "http://localhost:8080/mainPage.html";
                        }
                        //else it is an error
                        else{
                            document.getElementById('errors').innerHTML=httpRequest.responseText;
                        }
                    }
                } 
                httpRequest.send('');
                return false;
            }
        </script>
    </body>
</html>
