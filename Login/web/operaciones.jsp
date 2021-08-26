<%-- 
    Document   : operaciones
    Created on : 03-05-2019, 04:36:20 PM
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
                        <li class="breadcrumb-item active" aria-current="page">Operaciones</li>
                    </ol>
                </nav>
            </a>
        </nav>
        <form method="post" action="control?action=3">
            <div class="container">
                <br>
                <div class="row">
                    <div class="col-md-3">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text"  id="inputGroup-sizing-default">Fecha</span>
                            </div>
                            <input type="date" required="" class="form-control" name="fecha" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                        </div>
                        <div class="col-md-9">
                        </div>
                    </div>
                </div>


                <br>
                <div class="row">
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-4">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroup-sizing-default">Cliente</span>
                            </div>
                            <select class="custom-select"  name="idusuario"id="inputGroupSelect01">
                                <c:forEach items="${llenarusuarios}" var="c">

                                    <option value="<c:out value="${c.id}"/>"><c:out value="${c.nombre}"/>,<c:out value="${c.apellido }"/></option>


                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-4">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroup-sizing-default">Operacion</span>
                            </div>
                            <select class="custom-select" name="selectmov"id="inputGroupSelect01">
                                <option value="1">Cargo</option>
                                <option value="2">Abono</option>

                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-4">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroup-sizing-default">Monto</span>
                            </div>
                            <input type="text" required="" class="form-control" name="monto" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                        </div>
                    </div>
                    <div class="col-md-4">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-4">
                        <button type="submit" class="btn btn-block btn-outline-success">Aceptar</button>
                    </div>
                    <div class="col-md-4">
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
