<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>Menu Principal</title>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>

        <link href=<c:url value="/bootstrap/css/bootstrap.min.css"/> rel="stylesheet"/>
        <link href=<c:url value="/css/jquery-ui-css/jquery-ui.css"/> rel="stylesheet"/>
        <link href=<c:url value="/css/jquery-ui-css/jquery.datetimepicker.min.css"/> rel="stylesheet"/>
        <link href=<c:url value="/css/mensagem.css"/> rel="stylesheet"/>
        <link href=<c:url value="/css/cadastro.css"/> rel="stylesheet"/>
        <link href=<c:url value="/css/lista.css"/> rel="stylesheet"/>
        <link href=<c:url value="/css/menu-principal.css"/> rel="stylesheet"/>
        <link href=<c:url value="/css/grafico.css"/> rel="stylesheet"/>
        <link href=<c:url value="/css/sb-admin.css"/> rel="stylesheet"/>
        <link href=<c:url value="/css/morris.css"/> rel="stylesheet"/>
        <link href=<c:url value="/font-awesome/css/font-awesome.min.css"/> rel="stylesheet"/>
    </head>
    <body>
        <form id="frm" name="frm" method="post">
            <input type="hidden" id="contextPath" name="contextPath" value="${pageContext.request.contextPath}" />

            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html">Gerenciador de Ocorrências</a>
                </div>
                <!-- Top Menu Items -->
                <ul class="nav navbar-right top-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Fábio Faraco <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a id="aLogout" href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li id="liMenu">
                            <a href="javascript:void(0);"><i class="fa fa-fw fa-home"></i> Home</a>
                        </li>
                        <li id="liUsuario">
                            <a href="javascript:void(0);" id="aUsuario"><i class="fa fa-fw fa-user"></i> Usuários</a>
                        </li>
                        <li id="liRequerente">
                            <a href="javascript:void(0);" id="aRequerente"><i class="fa fa-fw fa-users"></i> Requerentes</a>
                        </li>
                        <li id="liOcorrencia">
                            <a href="javascript:void(0);" id="aOcorrencia"><i class="fa fa-fw fa-ambulance"></i> Ocorrências</a>
                        </li>
                        <li id="liProtocolo">
                            <a href="javascript:void(0);" id="aProtocolo"><i class="fa fa-fw fa-folder"></i> Protocolos</a>
                        </li>
                        <li id="liCertidao">
                            <a href="javascript:void(0);" id="aCertidao"><i class="fa fa-fw fa-file-pdf-o"></i> Certidão</a>
                        </li>
                        <li id="liGrafico">
                            <a href="javascript:void(0);" id="aGrafico"><i class="fa fa-fw fa-pie-chart"></i> Gráficos</a>
                        </li>
                    </ul>
                </div>
            </nav>

            <div id="conteudo"></div>

            <div class="load-img">
                <img id="loading" src=<c:url value="img/load.gif"/>>                
            </div>           

        </form>
    </body>

    <script src=<c:url value="js/jquery/jquery-2.2.2.min.js"/>></script>
    <script src=<c:url value="js/jquery/jquery.mask.min.js"/>></script>
    <script src=<c:url value="js/jquery/jquery-ui.js"/>></script>
    <script src=<c:url value="js/jquery/jquery-ui.min.js"/>></script>
    <script src=<c:url value="js/jquery/jquery.datetimepicker.full.js"/>></script>
    <script src=<c:url value="bootstrap/js/bootstrap.min.js"/>></script>
    <script src=<c:url value="js/moment.js"/>></script>
    <script src=<c:url value="js/mensagem.js"/>></script>
    <script src=<c:url value="js/util.js"/>></script>
    <script src=<c:url value="js/ajaxUtil.js"/>></script>
    <script src=<c:url value="js/menu.js"/>></script>
    <script src=<c:url value="js/cadastroUsuario.js"/>></script>
    <script src=<c:url value="js/cadastroRequerente.js"/>></script>
    <script src=<c:url value="js/cadastroOcorrencia.js"/>></script>
    <script src=<c:url value="js/cadastroProtocolo.js"/>></script>
    <script src=<c:url value="js/listaUsuario.js"/>></script>
    <script src=<c:url value="js/listaRequerente.js"/>></script>
    <script src=<c:url value="js/listaOcorrencia.js"/>></script>
    <script src=<c:url value="js/listaProtocolo.js"/>></script>
    <script src=<c:url value="js/Chart.js"/>></script>
    <script src=<c:url value="js/Chart.min.js"/>></script>
    <script src=<c:url value="js/Chart.min.js"/>></script>
    <script src=<c:url value="js/Chart.bundle.js"/>></script>
    <script src=<c:url value="js/Chart.bundle.min.js"/>></script>
    <script src=<c:url value="js/grafico.js"/>></script>
        <script src=<c:url value="js/certidao.js"/>></script>
</html>