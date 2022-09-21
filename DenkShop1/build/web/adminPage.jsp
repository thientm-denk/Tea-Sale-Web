<%-- Document : adminPage Created on : May 31, 2022, 11:30:53 AM Author : OS --%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page import="java.util.List" %>
            <%@page import="sample.user.UserDTO" %>
                <%@page contentType="text/html" pageEncoding="UTF-8" %>

                    <!DOCTYPE html>
                    <html>

                    <head>
                        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        <title>Admin Page</title>
                    </head>



                    <body style="background-color: #00525C;">

                        <div class="Container" style="width: 70%; margin: 0 auto; background-color: #00525C">

                            <h1 style="display: inline;">WELCOME ADMIN: ${sessionScope.LOGIN_USER.userName} </h1>
                            <c:url var="logoutLink" value="MainController">
                                <c:param name="action" value="Logout"></c:param>
                            </c:url>

                            <a href="${logoutLink}" style="text-decoration: none;">
                                <div
                                    style="display:inline; border: solid 1px black;width: fit-content; height: fit-content; padding: 3px; background-color: #9DB0A2; color: #897618; text-decoration: none;">
                                    logout

                                </div>
                            </a>
                            <a href="createTea.jsp" style="text-decoration: none;">
                                <div
                                    style="display:inline; border: solid 1px black;width: fit-content; height: fit-content; padding: 3px; background-color: #9DB0A2; color: #897618; text-decoration: none;">
                                    Them San Pham

                                </div>
                            </a>
                            <form action="MainController">
                                Search <input type="search" name="search" value="${param.search}" />
                                input <input type="submit" name="action" value="Search">
                            </form>

                            <c:if test="${requestScope.LIST_TEA!= null}">
                                <c:if test="${not empty requestScope.LIST_TEA}">
                                    <table border="1" style="background-color: #EEF3E3;">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>productID</th>
                                                <th>name</th>
                                                <th>price</th>
                                                <th>quantity</th>
                                                <th>categoyID</th>
                                                <th>Delete</th>
                                                <th>UPDATE</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="pro" varStatus="counter" items="${requestScope.LIST_TEA}">
                                                <form action="MainController">
                                                    <tr>
                                                        <td>${counter.count}</td>
                                                        <td>
                                                            <input type="text" name="productID" value="${pro.productID}"
                                                                readonly="" style="border: none; width: 80px;">
                                                        </td>
                                                        <td><input type="text" name="name" value="${pro.name}"
                                                                required="" style="border: none; width: 200px;"></td>
                                                        <td><input type="text" name="price" value="${pro.price}"
                                                                required="" style="border: none; width: 100px;">
                                                        </td>
                                                        <td><input type="text" name="quantity" value="${pro.quantity}"
                                                                required="" style="border: none; width: 70px;">
                                                        </td>
                                                        <td><input type="text" name="categoyID" value="${pro.categoyID}"
                                                                required="" style="border: none; width: 100px;"></td>

                                                        <td>
                                                            <input type="hidden" name="search" value="${param.search}">
                                                            <input type="submit" name="action" value="Update">
                                                        </td>

                                                        <td>
                                                            <c:url var="deleteLink" value="MainController">
                                                                <c:param name="action" value="Delete"></c:param>
                                                                <c:param name="search" value="${param.search}">
                                                                </c:param>
                                                                <c:param name="productID" value="${pro.productID}">
                                                                </c:param>
                                                            </c:url>
                                                            <a href="${deleteLink}">Delete</a>
                                                        </td>

                                                    </tr>
                                                </form>

                                            </c:forEach>
                                            ${requestScope.ERROR}


                                        </tbody>
                                    </table>
                                </c:if>
                            </c:if>


                        </div>
                    </body>

                    </html>