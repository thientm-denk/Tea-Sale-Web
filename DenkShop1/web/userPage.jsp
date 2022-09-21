<%-- Document : user Created on : May 31, 2022, 11:26:26 AM Author : OS --%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page import="sample.user.UserDTO" %>
            <%@page contentType="text/html" pageEncoding="UTF-8" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <title>User Page</title>

                </head>

               

                <body style="background-color: #00525C;">


                    <div class="Container" style="width: 70%; margin: 0 auto; background-color: #00525C">

                        <div style="position: fixed; bottom: 1%; right: 16%;">
                            <a href="userCart.jsp">
                                <div style="width: 35px; height: 35px ; background-image: url('./PICTURE/cartIcon.png'); background-size: 35px 35px;">
        
                                </div>
                            </a>
                        </div>

                        <header
                            style="background-color:  #7CB48E; border: solid 1px #00A6FF; width: 100%; border-radius: 7px;">
                            <div>
                                <h1 style="text-align: center;">SHOPPING PAGE</h1>
                            </div>

                            <!-- SEARCH -->
                            <div style="display: inline-block;">
                                <form action="MainController">
                                    Search <input type="search" name="search" value="${param.search}" />
                                    <input type="submit" name="action" value="SearchShop">
                                </form>
                                <form action="MainController" style="float: right; margin: 1px;">
                                    <input type="hidden" name="search" value="" />
                                    <input type="hidden" name="action" value="SearchShop" />
                                    <input type="submit" value="*SearchAll*">
                                </form>
                            </div>

                            <!-- TEN USER -->
                            <div style=" margin-bottom: 1%; float: right;">
                                <p style="display: inline; justify-content: right">WELCOME:
                                    ${sessionScope.LOGIN_USER.userName} </p>
                                <form action="MainController" style="display: inline; ">
                                    <input type="submit" name="action" value="Logout">
                                </form>
                            </div>

                        </header>

                        <div>
                            <p style="text-align: center; color: #00A6FF;">${requestScope.MESSAGE}</p>
                        </div>

                        <c:forEach var="pro" varStatus="counter" items="${requestScope.LIST_TEA}">


                            <div class="item" style="width: 100%; margin-top: 1%;">
                                <div style="width: 100%; height: 200px; background-color: #9DB0A2; padding: 0.2%;  ">

                                    <div class="Picture"
                                        style="width: 25%; height: 100%; display: inline-block; float: left; padding: 0 auto">
                                        <img src="./PICTURE/${pro.productID}.jpg" alt="${pro.name}"
                                            style="max-width: 100%;height: 100%;">
                                    </div>

                                    <div class="Info"
                                        style="width: 65%; height: 100%;display: inline-block; padding-top: 1%; padding-bottom: 1%; padding-left: 1%;">
                                        <form action="MainController">
                                            <p style="display: inline; font-size: 30px;">
                                                ${pro.productID}-${pro.name}-${pro.price}-${pro.categoyID}
                                            </p>
                                            <input type="hidden" name="cmbTea"
                                                value="${pro.productID}-${pro.name}-${pro.price}-${pro.categoyID}">
                                            <br>
                                            <select name="cmbQuantity">
                                                <option value="1">1 cup</option>
                                                <option value="2">2 cups</option>
                                                <option value="3">3 cups</option>
                                                <option value="4">4 cups</option>
                                                <option value="5">5 cups</option>
                                                <option value="10">10 cups</option>
                                            </select>

                                            <input type="hidden" name="search" value="${param.search}">
                                            <input type="submit" name="action" value="Add">
                                        </form>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>
                    </div>


                </body>

                </html>