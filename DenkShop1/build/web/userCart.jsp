<%-- Document : userCart Created on : Jul 7, 2022, 3:35:40 PM Author : denk --%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page import="tea.Tea" %>
            <%@page import="tea.Cart" %>
                <%@page contentType="text/html" pageEncoding="UTF-8" %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        <title>JSP Page</title>
                        <script src='https://www.google.com/recaptcha/api.js'></script>
                    </head>

                    <body style="background-color: #00525C;">



                        <div class="Container" style="width: 70%; margin: 0 auto; background-color: #00525C">



                            <header
                                style="background-color:  #7CB48E; border: solid 1px #00A6FF; width: 100%; border-radius: 7px;">
                                <div>
                                    <h1 style="text-align: center;">${sessionScope.LOGIN_USER.userName} CART</h1>
                                </div>

                                <!-- TEN USER -->
                                <div style=" float: right; margin: auto 0;">
                                    <p style="display: inline; justify-content: right">
                                        ${sessionScope.LOGIN_USER.userName} </p>
                                    <form action="MainController" style="display: inline; ">
                                        <input type="submit" name="action" value="Logout">
                                    </form>
                                </div>

                            </header>
                            <h3 style="text-align: center; color: #FFA300;"> ${requestScope.ERROR}</h3>
                            <div>
                                <p style="text-align: center; color: #00A6FF;">${requestScope.MESSAGE}</p>
                            </div>
                            <div style="margin-top: 35px;">

                                <c:forEach var="pro" varStatus="counter" items="${sessionScope.CART.cart.value}">
                                    ${pro.productID}
                                </c:forEach>


                                <% Cart cart=(Cart) session.getAttribute("CART"); double total=0; if (cart !=null) { int
                                    count=0; for (Tea tea : cart.getCart().values()) { total +=tea.getPrice() *
                                    tea.getQuantity(); %>

                                    <div class="item" style="width: 100%; margin-top: 1%;">
                                        <div
                                            style="width: 100%; height: 200px; background-color: #9DB0A2; padding: 0.2%;  ">

                                            <div class="Picture"
                                                style="width: 25%; height: 100%; display: inline-block; float: left; padding: 0 auto">
                                                <img src="./PICTURE/<%= tea.getProductID()%>.jpg"
                                                    alt="<%= tea.getName()%>" style="max-width: 100%;height: 100%;">
                                            </div>

                                            <div class="Info"
                                                style="width: 65%; height: 100%;display: inline-block; padding-top: 1%; padding-bottom: 1%; padding-left: 1%;">
                                                <form action="MainController">
                                                    <p style="display: inline; font-size: 30px;">
                                                        <%= tea.getName()%> - <%= tea.getPrice()%>
                                                    </p>
                                                    <br>
                                                    <input type="hidden" name="productID"
                                                        value="<%= tea.getProductID()%>" />
                                                    <input type="int" name="quantity" value="<%= tea.getQuantity()%>">
                                                    Cup</input>
                                                    <br>
                                                    <input type="submit" name="action" value="Edit" />
                                                    <input type="submit" name="action" value="Remove" />
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <% } %>
                            </div>





                        </div>



                        </tbody>
                        </table>
                        <h1 style="text-align: center">Total: <%=total%>$</h1>


                        <% } else { %>
                            

                            <% } %>

                                <div style="display: flex; justify-content: center">
                                    <form action="MainController" id="Checkout">
                                        <input type="hidden" name="total" value="<%=total%>">

                                        <div class="g-recaptcha"
                                            data-sitekey="6LeM9NEgAAAAAHAkzaWvP9D_6e_Q5MWYbm3K5IFt"></div>
                                        <input type="submit" name="action" value="Checkout"
                                            style="background-color: #FCE181;color: #3B4A3F; font-size: 25px;border: solid black 0.2px; margin-right: 2.5px; width: 150px; height: 32px;">
                                        <a href="userPage.jsp"><div style="float: right; width: 150px; height: 32px ;text-align: center;color: #3B4A3F; font-size: 25px; border: solid black 0.2px; text-decoration: none; background-color:  #FCE181; margin-left: 2.5px; ">Mua
                                            tiep</div></a>
                                    </form>


                                </div>


                               
                                <script>
                                    const forms = document.querySelectorAll('div.g-recaptcha');
                                    forms.forEach(form => {
                                        const formParentElement = form.parentElement;

                                        formParentElement.addEventListener("submit", e => {
                                            if (grecaptcha.getResponse() === '') {
                                                e.preventDefault();
                                                alert('Please check the recaptcha');
                                            }
                                        }, false)
                                    });
                                </script>
                    </body>

                    </html>