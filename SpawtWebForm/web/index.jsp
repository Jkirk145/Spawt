

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Spawt Authentification Page</title>
    </head>
    <body>
        <h1>Spawt Authentification Page</h1>
        <h2>Please enter your username and password</h2>
        <form enctype="application/json" name="login" action="mainPage.html" method="POST">
            <table>
                <tr>
                    <td> Username: </td>
                    <td><input type="text" name="username" value="" size="70"/></td>
                </tr>
                <tr>
                    <td> Password: </td>
                    <td><input type="text" name="password" value="" size="70"/></td>
                </tr>
            </table>
            <input type="submit" value="submit" name="submitButton"/>
            
            <%//check to see that submitted username and password match a username and 
            //password inside of the database, then move on to the next webpage
            %>
        </form>
    </body>
</html>
