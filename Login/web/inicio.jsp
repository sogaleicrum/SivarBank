<%-- 
    Document   : inicio
    Created on : 03-05-2019, 08:54:09 AM
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
    <body >
        <form method="post" action="control?action=1">
            <div class="container" >
                <br>
                <div class="row">
                    <div class="col-md-4">

                    </div>
                    <div class="col-md-2">
                        <img src="image/LogoSample_ByTailorBrands (1).jpg">
                    </div>
                    <div class="col-md-2">
                        <h1 class="display-1 " ></h1>
                    </div>
                    <div class="col-md-4">

                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-4">

                    </div>
                    <div class="col-md-4">

                        <form>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Usuario</label>
                                <input type="text" class="form-control" id="exampleInputEmail1" name="usuario" placeholder="Usuario">
                                <small id="emailHelp" class="form-text text-muted">${msj1}</small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" class="form-control" name="pass" placeholder="Password">
                                <small id="emailHelp" class="form-text text-muted">${msj2}</small>
                            </div>
                            <button type="submit" class="btn-block btn btn-outline-success">Ingresar</button>
                        </form>
                    </div>
                    <div class="col-md-4">

                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
