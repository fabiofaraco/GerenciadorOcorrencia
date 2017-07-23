<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>Autenticação</title>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta name="_csrf" content="${_csrf.token}"/>
        <meta name="_csrf_header" content="${_csrf.headerName}"/>

        <link href=<c:url value="/bootstrap/css/bootstrap.min.css"/> rel="stylesheet"/>
        <link href=<c:url value="/css/jquery-ui-css/jquery-ui.css"/> rel="stylesheet"/>
        <link href=<c:url value="/css/mensagem.css"/> rel="stylesheet"/>
        <link href=<c:url value="/font-awesome/css/font-awesome.min.css"/> rel="stylesheet"/>
        <link href=<c:url value="/css/mensagem.css"/> rel="stylesheet"/>
        <link href=<c:url value="/css/login.css"/> rel="stylesheet"/>        

    </head>
    <body>
        <div class="container-fluid">
            <form id="frm" name="frm" method="post">
                <br/>
                <div class="col-sm-offset-2 col-sm-8">
                    <div class="row">
                        <div class="col-xs-12">
                            <h1 class="titulo-principal text-center"> O código de autenticação digitado não existe. </h1>
                        </div>           
                    </div>
                    
                    <hr/>
                    
                    <div class="row">
                        <div class="form-group col-xs-12 col-sm-4 col-sm-offset-4">
                            <button type="button" id="btnLogin"
                                    class="btn botao-principal btn-block btn-login">Login</button>
                        </div>
                    </div>
                </div>

                <div class="load-img">
                    <img id="loading" src=<c:url value="img/load.gif"/>>                
                </div>           

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </div>
    </body>

    <script src=<c:url value="js/jquery/jquery-2.2.2.min.js"/>></script>
    <script src=<c:url value="js/jquery/jquery.mask.min.js"/>></script>
    <script src=<c:url value="js/jquery/jquery-ui.js"/>></script>
    <script src=<c:url value="js/jquery/jquery-ui.min.js"/>></script>
    <script src=<c:url value="bootstrap/js/bootstrap.min.js"/>></script>
    <script src=<c:url value="js/mensagem.js"/>></script>
    <script src=<c:url value="js/autenticado.js"/>></script>
    <script src=<c:url value="js/ajaxUtil.js"/>></script>
</html>