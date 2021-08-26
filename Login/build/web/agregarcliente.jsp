<%-- 
    Document   : agregarcliente
    Created on : 03-05-2019, 04:49:44 PM
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
                        <li class="breadcrumb-item"><a href="control?action=clientes">Clientes</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Agregar Usuario</li>
                    </ol>
                </nav>
            </a>
        </nav>
        <div class="container">
            <form action="control?action=2" method="post">
                <br>

                <div class="row">
                    <div class="col-md-5 "   ><img src="image/user.png" ></div>
                    <div class="col-md-7 "   ></div>
                </div>
                <div class="row">
                    <div class="col-md-10 "   ></div>
                    <div class="col-md-2">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroup-sizing-default">Id</span>
                            </div>
                            <input type="text" class="form-control" aria-label="Default" value="<c:out value="${ret.id}"/>" name="id" readonly="" aria-describedby="inputGroup-sizing-default">
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-6"> 
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroup-sizing-default">Nombre</span>
                            </div>
                            <input type="text" class="form-control" aria-label="Default" required=""value="<c:out value="${ret.nombre}"/>" name="nombre" aria-describedby="inputGroup-sizing-default">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroup-sizing-default">Apellido</span>
                            </div>
                            <input type="text" class="form-control" aria-label="Default" required=" "value="<c:out value="${ret.apellido}"/>" name="apellido" aria-describedby="inputGroup-sizing-default">
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-3">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroup-sizing-default">Usuario</span>
                            </div>
                            <input type="text" class="form-control" aria-label="Default" required="" value="<c:out value="${ret.usuario}"/>" name="usuario" aria-describedby="inputGroup-sizing-default">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroup-sizing-default">Contraseña</span>
                            </div>
                            <input type="text" class="form-control" aria-label="Default" required="" value="<c:out value="${ret.pass}"/>" name="pass" aria-describedby="inputGroup-sizing-default">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <label class="input-group-text" for="inputGroupSelect01">Tipo cuenta</label>
                            </div>
                            <select name="cargoint" class="custom-select" required=""id="inputGroupSelect01">

                                <c:forEach items="${llenarcargo}" var="c">
                                    <c:choose>
                                        <c:when test="${c.id == ret.cargoint}">
                                            <option value="<c:out value="${c.id}"/>" selected=""><c:out value="${c.cargo}" /></option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="<c:out value="${c.id}"/>"><c:out value="${c.cargo}"/></option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2"><input type="submit" name="g" value="Guardar" class="btn-block btn btn-outline-info"></div>
                </div>

            </form>
        </div>
    </body>
</html>
