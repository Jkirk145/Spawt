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
        <form name="searchForm" enctype="application/json" id="searchForm" action="spawtservice/searchListing/">
            <table>
                <tr>
                    <td> Street: </td>
                    <td><input type="text" name="Street" value="" size="50"/></td>
                </tr>
                <tr>
                    <td> Zip: </td>
                    <td><input type="text" name="Zip" value="" size="50"/></td>
                </tr>
            </table>
            <input type="button" name="Search" value="Search" onclick="searchDataBase(this)" disabled/>
        </form>
        <table>
            
        </table>
        
        <script>
            function searchDataBase(this){
                //request database search and fill in table under form
            }
        </script>
    </body>
</html>
