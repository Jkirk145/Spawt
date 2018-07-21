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
        <form onsubmit="return searchDataBase(this);" name="searchForm" id="searchForm" action="mainPage.html">
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
        
        <script>
            function searchDataBase(form){
                //request database search and fill in table under form
                //now call api
                var httpRequest = new XMLHttpRequest();
                var searchParams = "?Street="+ document.getElementById("Street").value +
                        "City="+ document.getElementByID("City") +"Zip="+ document.getElementById("Zip").value;
                var url = 'http://localhost:8080/SpawtService/getlisting/'+ searchParams;
                //console.log(url);
                httpRequest.open('POST', url, true);
                //Send the proper header information along with the request
                httpRequest.setRequestHeader('Content-type', 'application/json');
                console.log("set request header")
                httpRequest.onreadystatechange = function() {//Call a function when the state changes.
                    if(this.readyState == XMLHttpRequest.DONE && httpRequest.status == 200) {
                        //alert(httpRequest.responseText);
                        if(httpRequest.responseText){
                            fillTable();
                        }
                        else{
                            console.log(httpRequest.responseText);
                            document.getElementById('errors').innerHTML=httpRequest.responseText;
                            console.log("error");
                        }
                    }
                } 
                httpRequest.send();
                return false;
            }
            //if api call returns array of listing put the listing in the table
            function fillTable(arrayOfListings){
                 //now fill table with database stuff
                //make each table entry clickable to detailed page
                var tableRef = document.getElementById('resultTable');
                // Insert a row in the table at the last row
                var newRow   = tableRef.insertRow(tableRef.rows.length);
                // Insert a cell in the row at index 0
                var newCell  = newRow.insertCell(0);
                var newCell1 = newRow.insertCell(1);
                var newCell2 = newRow.insertCell(2);
                // Append a text node to the cell
                newCell1.innerHTML = '<button name="updateButton" onclick="return updateListing(listing);" name="updateButton">Update</button>'
                newCell2.innerHTML = '<button name="deleteButton" onclick="return deleteListing(listingId);" name="deleteButton">Delete</button>'
                var newText  = document.createTextNode('Listing ID');
                newCell.appendChild(newText);
            }
            //listing is the json variable of the one listing
            function updateListing(listing){
                
                return false;
            }
            //listing Id is just the id of the listing (varchar)
            function deleteListing(listingId){
                var jsonElem ={
                    "ListingID": listingId
                };
                var jSONListing = JSON.stringify(jsonElem);
                
                return false;
            }
        </script>
    </body>
</html>
