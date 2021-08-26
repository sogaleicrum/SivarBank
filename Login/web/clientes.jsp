<%-- 
    Document   : clientes
    Created on : 03-05-2019, 04:36:07 PM
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
                        <li class="breadcrumb-item active" aria-current="page">Clientes</li>
                    </ol>
                </nav>
            </a>
        </nav>
        <form>
            <div class="container">
                <div class="row">
                    <div class="col-md-4"><h1 class="display-1" > Clientes</h1></div>
                    <div class="col-md-4"></div>
                    <div class="col-md-4"></div>
                </div>
                <table class="table ">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Apellido</th>
                            <th scope="col">Accion</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${usuario}" var="u">
                            <tr>
                                <td><c:out value="${u.id}"/></td>
                                <td><c:out value="${u.nombre}"/></td>
                                <td><c:out value="${u.apellido}"/></td> <td>
                                    <a class="btn btn-block btn-outline-info" href="control?action=actualizar&id=<c:out value="${u.id}"/>">Actualizar</a>
                                    <a class="btn btn-block btn-outline-danger" href="control?action=eliminar&id=<c:out value="${u.id}"/>">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-md-4"><a type="button"  href="control?action=agregarcliente"class="btn btn-block btn-outline-success">Agregar</a></div>
                    <div class="col-md-4"></div>
                    <div class="col-md-4"></div>
                </div>

            </div>
        </form>
    </body>
</html>
