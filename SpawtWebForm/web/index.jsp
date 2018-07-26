

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
        <form onsubmit="return validateUser(this);" name="login" action="" method="POST">
            <table>
                <tr>
                    <td> Username: </td>
                    <td><input type="text" id="username" name="username" value="" size="70"/></td>
                </tr>
                <tr>
                    <td> Password: </td>
                    <td><input type="text" id="password" name="password" value="" size="70"/></td>
                </tr>
            </table>
            <input type="submit" value="submit" name="submitButton"/>
            
            <%//check to see that submitted username and password match a username and 
            //password inside of the database, then move on to the next webpage
            %>
        </form>
        <pre name="errors"></pre>
        <script>
         //send username and password to api and validate, if good let form finish,
         //if not print error and stop default submit
         function validateUser(form){
                var httpRequest = new XMLHttpRequest();
                var url = 'http://localhost:8080/SpawtService/1/'+ document.getElementById('username').value+
                        '/' + document.getElementById('password').value;
                console.log(url);
                //console.log(url);
                httpRequest.open('POST', url, true);
                //Send the proper header information along with the request
                httpRequest.onreadystatechange = function() {//Call a function when the state changes.
                    if(this.readyState == XMLHttpRequest.DONE && httpRequest.status == 200) {
                        console.log("finished");
                        if(!(httpRequest.responseText.substring(0,4)=="java")){
                            console.log("going to main page");
                            window.location.href = "http://localhost:8080/mainPage.html";
                        }
                        else{
                            document.getElementById('errors').innerHTML=httpRequest.responseText;
                        }
                    }
                } 
                httpRequest.send();
                //because api call not set up just go to main page immediately
                window.location.href = "http://localhost:8080/mainPage.html";
                return false;
         }
        </script>
    </body>
</html>
