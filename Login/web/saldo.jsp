<%-- 
    Document   : saldo
    Created on : 03-11-2019, 01:17:03 PM
    Author     : jason.rodriguezusam
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-light bg-light">
            <a class="navbar-brand" href="#">
                <img src="image/LogoSample_By.jpg" width="100%" height="100%" class="d-inline-block align-top" alt="">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="menu.jsp">Menu</a></li>
                        <li class="breadcrumb-item"><a href="control?action=historial">Historial</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Saldo</li>
                    </ol>
                </nav>
            </a>
        </nav>
        <form method="post" action="control">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">

                    </div>
                    <div class="col-md-4">
                        <table class="table">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col">Fecha</th>
                                    <th scope="col">Cargo</th>
                                    <th scope="col">abono</th>
                                    <th scope="col">Saldo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${movimiento}" var="m">
                                    <tr>
                                        <td><c:out value="${m.fecha}"/></td>
                                        <td><c:out value="${m.cargo}"/></td>
                                        <td><c:out value="${m.abono}"/></td>
                                        <td><c:out value="${m.saldo}"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-4">

                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
