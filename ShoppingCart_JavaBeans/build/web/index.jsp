<%-- 
    Document   : index
    Created on : 2011-12-25, 14:14:54
    Author     : Eli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="javax.servlet.*,java.io.File,javax.xml.parsers.*,java.util.*,org.w3c.dom.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@taglib prefix="func" uri="/WEB-INF/tlds/functions" %>
<%@taglib prefix="cookie" uri="/WEB-INF/tlds/taglib8.tld" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="text-align:center">
            <h1>Shopping Cart</h1>          
            <form name="countTotal" method="POST" >
                <table border="1" width="1" cellspacing="2" cellpadding="4" align="center">
                    <thead>
                        <tr style="background-color: rgb(245, 245, 245)">
                            <th>Item</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>

                    <c:import var="itemsInfo" url="/itemsPrices.xml"/>
                    <x:parse var="output" xml="${itemsInfo}"/>

                    <jsp:useBean id="cart" scope="session" class="org.mypackage.cart.Cart" />                   

                    <%--If start using the application, for each 
                    item from the xml file, we will create an object from Item class 
                    using createItems method from Cart class--%>                   
                    <c:if test="${func:isCartCreated(cart)=='no'}">                      
                        <c:set var="itemsCount" value="${0}"/>
                        <x:forEach select="$output/items/item" var="item">
                            <c:set var="itemsCount" value="${itemsCount+1}"/>
                        </x:forEach>
                        ${func:createItems(cart,itemsCount)}
                    </c:if>

                    <%--For each item we dispay name and price from the xml file--%>
                    <c:set var="index" value="${-1}"/>
                    <x:forEach select="$output/items/item" var="item">

                        <c:set var="index" value="${index+1}"/>
                        <c:set var="itemName"><x:out select="name" /></c:set>
                        <c:set var="itemPrice"><x:out select="price"/></c:set>
                        <c:set var="itemQuantity" value="quantity_${itemName}"/>

                        ${func:setItemPrice(cart,index,itemPrice)}
                        ${func:setItemQuantity(cart, index, param[itemQuantity])}
                        <cookie:addCookie name="cookie_${itemName}" value="${param[itemQuantity]}" age="1800"/>
                                                                                              
                        <c:set var="quantity">
                            ${func:getItemQuantity(cart,index)}
                        </c:set>
                        <c:set var="cookieQuantity">
                            <cookie:getCookieValue name="cookie_${itemName}"/>
                        </c:set>
                        
                        <%--If we start using the application, but we have cookie--%>
                        <c:if test="${not empty cookieQuantity and empty param[itemQuantity] }">
                            <c:set var="quantity" value="${cookieQuantity}"/>
                            ${func:setItemQuantity(cart, index, quantity)}
                        </c:if>
                                                                                                                    
                        <tr>
                            <td>${itemName}</td>
                            <td>${itemPrice}</td>                           
                            <td><input type="text" size="10" style="text-align: right" 
                                       name="quantity_${itemName}" value="${quantity}"/></td>
                            <td><input type="text" size="10" style="text-align: right" 
                                       name="total_${itemName}" value="${func:calculateItemTotal(cart,index)}" 
                                       readonly="readonly" /></td>                           
                        </tr>
                    </x:forEach>

                    <tr>
                        <td>Total</td>
                        <td></td>
                        <td></td>
                        <td><input type="text" name="totalAll" size="10" style="text-align: right" 
                                   readonly="readonly" value="${func:calculateAllItemsTotal(cart)}"/></td>
                    </tr>
                    </tbody>
                </table>                                                       
                <input type="submit" value="Total" name="totalBtn" />
            </form>
            <a href="https://github.com/epmironova/WWW_Project_3_script_free" target="_blank">Report</a> 
            <a href="https://github.com/epmironova/WWW_Project_3_script_free/zipball/master" target="_blank">Code</a>
        </div>
    </body>
</html>
