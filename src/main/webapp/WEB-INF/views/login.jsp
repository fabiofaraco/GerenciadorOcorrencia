<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>

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
                <div class="form-group">
                    <h1>Sistema Gerenciador de Ocorrências</h1>
                </div>

                <div class="form-group col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
                    <c:import url="mensagem.jsp" />
                </div>

                <div class="col-sm-8 col-sm-offset-2 col-lg-6 col-lg-offset-3 container-fluid login-wrapper">
                    <div class="form-group col-sm-8 col-sm-offset-2">
                        <input type="text" class="form-control" id="username" name="username"  placeholder="Login">
                    </div>

                    <div class="form-group col-sm-8 col-sm-offset-2">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Senha">
                    </div>
                    <div class="form-group col-sm-8 col-sm-offset-2 ">
                        <label class="checkbox-inline"><input id="remember-me" name="remember-me" type="checkbox" value="">Lembrar-me</label>
                    </div>

                    <div class="form-group col-sm-8 col-sm-offset-2">
                        <button id="btnLogin" name="btnLogin" type="button" class="btn btn-primary btn-block">Entrar</button>
                        <button id="btnEsqueceuSenha" name="btnEsqueceuSenha" type="button" class="btn btn-link btn-block">Esqueci minha senha</button>
                    </div>
                </div>
                <div class="col-xs-12 container-fluid">
                    <div class="form-group col-sm-4 col-sm-offset-2 col-lg-2 col-lg-offset-4">
                        <button id="btnGerarCertidao" name="btnGerarCertidao" type="button" class="btn btn-info btn-block btn-gerar-certidao">Imprimir Certidão</button>
                    </div>
                    <div class="form-group col-sm-4 col-lg-2">
                        <button id="btnAutenticacao" name="btnAutenticacao" type="button" class="btn btn-info btn-block">Verificar Autenticidade</button>
                    </div>
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
    <script src=<c:url value="js/login.js"/>></script>
</html>