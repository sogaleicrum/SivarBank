<%-- 
    Document   : Historial
    Created on : 03-05-2019, 04:36:34 PM
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
                        <li class="breadcrumb-item active" aria-current="page">Historial</li>
                    </ol>
                </nav>
            </a>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <h3 class="display-3" style="text-align: center">Historial de clientes</h3>
                </div>
            </div><br>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <table class="table">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">id</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Apellido</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>                           
                            <c:forEach items="${usuario}" var="u">
                                <tr>
                                    <td><c:out value="${u.id}"/></td>
                                    <td><c:out value="${u.nombre}"/></td>
                                    <td><c:out value="${u.apellido}"/></td>
                                    <td>
                                        <a class="btn btn-block btn-primary" href="control?action=saldo&id=<c:out value="${u.id}"/>">Ver Saldo</a>
                                    </td>
                                </tr>
                            </c:forEach>                             
                        </tbody>
                    </table>
                </div>
                <div class="col-md-2"></div>
            </div>
        </div>
    </body>
</body>
</html>
