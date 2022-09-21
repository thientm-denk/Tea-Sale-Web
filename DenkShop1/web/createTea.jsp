<%-- Document : createTea Created on : Jul 7, 2022, 10:29:08 AM Author : denk --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
        </head>

        <body style="background-color: #00525C;">
            <div class="Container" style="width: 70%; margin: 0 auto; background-color: #00525C; color: #FF635F;">
                <h1>Input Product information</h1>
                <form action="MainController" method="POST">
                    ProductID<input type="text" name="productID" required="" /> </br>
                    Name<input type="text" name="name" required="" /> </br>
                    Price<input type="float" name="price" required="" /> </br>
                    Quantity<input type="int" name="quantity" required="" /> </br>
                    CategoyID<input type="int" name="categoyID" required="" /> </br>
                    <input type="submit" name="action" value="Create" />
                    <input type="reset" value="Reset" />
                </form>
                <h1> ${requestScope.MESSEGES} </h1>
                <a href="adminPage.jsp">Ve lai page ADMIN</a>
            </div>



        </body>

        </html>