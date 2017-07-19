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
                <div class="well col-sm-offset-2 col-sm-8">
                    <div class="row">
                        <div class="col-xs-12">
                            <h3 class="titulo"> Não Autenticado </h3>
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
    <script src=<c:url value="js/util.js"/>></script>
    <script src=<c:url value="js/ajaxUtil.js"/>></script>
</html>