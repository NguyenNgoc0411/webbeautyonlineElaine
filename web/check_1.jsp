<%-- 
    Document   : check
    Created on : Dec 25, 2023, 10:07:32 AM
    Author     : 2021
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<%@page import="model.Account" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.List" %>
<%@page import="model.Order" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          
        <h1>Xin chao mn</h1>
        <h1>${sessionScope.lis1.getName()}</h1>
         <c:forEach items="${sessionScope.listorder}" var="s">
                <c:set var="masv" value="${s.getId()}"/>
                <tr>
                    <td>${masv}</td>
                                        
                </tr>




            </c:forEach>
       
    </body>
</html>
