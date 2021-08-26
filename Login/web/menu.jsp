<%-- 
    Document   : menu
    Created on : 03-05-2019, 04:24:13 PM
    Author     : jason.rodriguezusam
--%>

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
                        
                        <li class="breadcrumb-item"><a href=""></a></li>
                        <li class="breadcrumb-item active" aria-current="page">Menu</li>
                    </ol>
                </nav>
            </a>
        </nav>
        <div class="container">
            <br>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4"><a type="button" href="control?action=clientes"class="btn btn-block btn-outline-primary">Cliente</a></div>
                <div class="col-md-4"></div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4"><a type="button" href="control?action=operaciones"class="btn btn-block btn-outline-primary">Operaciones</a></div>
                <div class="col-md-4"></div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4"><a type="button" href="control?action=historial"class="btn btn-block btn-outline-primary">Historial</a></div>
                <div class="col-md-4"></div>
            </div>
        </div>
    </body>
</html>
