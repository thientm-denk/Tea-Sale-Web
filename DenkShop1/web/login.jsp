<%-- 
    Document   : login
    Created on : May 31, 2022, 10:47:51 AM
    Author     : OS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="google-signin-client_id" content="190266346697-illu0eve4eoat2snof79v1nes1len3os.apps.googleusercontent.com">
        <title>Login</title>
        

        <style>
            .data {
                display: none;
            }

            /* .g-signin2 {
                position: absolute;
                top: 50%;
                left: 50%;
                margin-top: -50px;
                margin-left: -50px;
            } */
        </style>
    </head>

    
    <body style="background-color: #00525C;">

        <div class="Container" style="width: 70%; margin: 0 auto; background-color: #00525C">
            <h1 style="text-align: center;">LOGIN TO SHOP</h1>

            <form action="MainController" method="POST" >
                <div style="margin: 0 auto; width: 50%; height: 50%; ">
                    <p style="text-align: center;"> User ID</p> 
                <div style="display: flex; justify-content: center;">
                    <input type="text" name="userID" class="box" /> </br>
                </div>
                
                <p style="text-align: center;">Password</p>
                <div style="display: flex; justify-content: center;">
                    <input type="password" name="password" class="box"/> </br>
                </div>
                
                </div>
                <div class="subcon" style="display: flex; justify-content: center; margin-top: 2px;">
                    <input type="submit" name="action" value="Login" class="button" />
                    <input type="reset" value="Reset" class="button"/>
                </div>
            </form>

            <script src="https://apis.google.com/js/platform.js" async defer></script>
            
            <div style="display: flex; justify-content: center; margin-top: 3px;">
                <div class="g-signin2" data-onsuccess="onSignIn" ></div>
            </div>
           

        </div>
      

        <script>
            function onSignIn(googleUser) {
                var profile = googleUser.getBasicProfile();
                $("#name").text(profile.getName());
                $("#email").text(profile.getEmail());
                $("#image").attr('src', profile.getImageUrl());
                $(".data").css("display", "block");
                $(".g-signin2").css("display", "none");
            }
        </script>
        <!--Thay the-->
        <h3 style="color: red; text-align: center;">${requestScope.ERROR}</h3>
    </body>
</html>
