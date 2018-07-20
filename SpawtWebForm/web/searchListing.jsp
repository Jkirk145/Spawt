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
                    <td><input type="text" name="Street" value="" size="50"/></td>
                </tr>
                <tr>
                    <td> City: </td>
                    <td><input type="text" name="City" value="" size="50"/></td>
                </tr>
                <tr>
                    <td> Zip: </td>
                    <td><input type="text" name="Zip" value="" size="50"/></td>
                </tr>
            </table>
            <input type="submit" value="search Listings" name="searchListingsButton"/>
        </form>
        <table id="resultTable">
            
        </table>
        
        <script>
            function searchDataBase(form){
                //request database search and fill in table under form
                
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
                
                return false;
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
