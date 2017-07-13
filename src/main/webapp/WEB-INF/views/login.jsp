<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>Login</title>
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

                <input type="hidden" id="contextPath" name="contextPath" value="${pageContext.request.contextPath}" />

                <div class="form-group">
                    <h1>Sistema Gerenciador de Ocorrências</h1>
                </div>

                <div class="form-group col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
                    <c:import url="mensagem.jsp" />
                </div>

                <input type="hidden" class="form-control" id="error" name="error" value="${error}">

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
                        <button id="btnAutenticacao" name="btnAutenticacao" type="button" class="btn btn-info btn-block" data-toggle="modal">Verificar Autenticidade</button>
                    </div>
                </div>

                <div class="modal fade" id="modal-autenticacao" role="dialog">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h3 class="modal-title titulo">Inserir o código de Autenticação</h3>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <input type="text" class="form-control" id="cdAutenticacao" name="cdAutenticacao" placeholder="Código de Autenticação">
                                    </div>           
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn botao btn-autentica">Autenticar</button>
                                <button type="button" class="btn botao" data-dismiss="modal">Fechar</button>
                            </div>
                        </div>    
                    </div>
                </div>

                <div class="modal fade" id="modal-autenticado" role="dialog">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h3 class="modal-title titulo">Inserir o código de Autenticação</h3>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <label class="titulo"> Dados do Requerente </label>
                                    </div>           
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn botao" data-dismiss="modal">Fechar</button>
                            </div>
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
    <script src=<c:url value="js/login.js"/>></script>
    <script src=<c:url value="js/util.js"/>></script>
    <script src=<c:url value="js/ajaxUtil.js"/>></script>
</html>