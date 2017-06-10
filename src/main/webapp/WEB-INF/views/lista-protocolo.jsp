<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>Lista de Ocorrência</title>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>

        <link href=<c:url value="/resources/bootstrap/css/bootstrap.min.css"/> rel="stylesheet"/>
        <link href=<c:url value="/resources/css/mensagem.css"/> rel="stylesheet"/>
        <link href=<c:url value="/resources/css/lista.css"/> rel="stylesheet"/>
        <link href=<c:url value="/resources/datatable/css/dataTables.bootstrap.min.css"/> rel="stylesheet"/>		

        <link href=<c:url value="/resources/css/sb-admin.css"/> rel="stylesheet"/>
        <link href=<c:url value="/resources/css/morris.css"/> rel="stylesheet"/>
        <link href=<c:url value="/resources/font-awesome/css/font-awesome.min.css"/> rel="stylesheet"/>
    </head>
    <body>
        <form id="frm" name="frm" method="post">
            <div id="wrapper">
                <c:import url="menu-principal.jsp" />
                <div class="container-fluid">
                    <div class="page-header">
                        <h1>Lista de Protocolo</h1>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="table-responsive">          
                                <table class="table table-striped table-hover data-table">
                                    <thead>
                                        <tr>
                                            <th>Nº Protocolo</th>
                                            <th>Requerente</th>
                                            <th>Nº Evento</th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${protocolos}" var="protocolo">
                                            <tr>
                                                <td>${protocolo.id}</td>
                                                <td>${protocolo.requerente.nome}</td>
                                                <td>${protocolo.ocorrencia.id}</td>
                                                <td>
                                                    <a class="btn btn-block btn-visualizar" data-id-protocolo="${protocolo.id}">
                                                        <span class="glyphicon glyphicon-search"></span>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a class="btn btn-block btn-alterar" data-id-protocolo="${protocolo.id}">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a class="btn btn-block btn-excluir" data-id-protocolo="${protocolo.id}">
                                                        <span class="glyphicon glyphicon-trash"></span>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <button id="btnIncluirProtocolo" type="button" class="btn btn-lista col-xs-12 col-sm-4 col-sm-offset-4">Incluir</button>
                        </div>

                        <div class="modal fade" id="modal-inserir-protocolo" role="dialog">
                            <div class="modal-dialog modal-md">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h3 class="modal-title">Protocolo</h3>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="titulo">Dados do Requerente</label>
                                            </div>

                                            <div class="col-md-12">
                                                <div id="divNome" class="form-group">
                                                    <label class="descricao" for="nome">CPF</label>
                                                    <input type="text" class="form-control mascara-cpf" id="cpf" name="requerente.cpf" value="${protocolo.requerente.cpf}">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="titulo">Dados da Ocorrência</label>
                                            </div>

                                            <div class="col-md-12">
                                                <div id="divSobrenome" class="form-group">
                                                    <label class="descricao" for="data">Data</label>
                                                    <input type="text" class="form-control mascara-data" id="data" name="ocorrencia.data" value="${protocolo.ocorrencia.data}"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div id="divSobrenome" class="form-group">
                                                    <label class="descricao" for="sobrenome">Endereço</label>
                                                    <select class="form-control" id="endereco" name="endereco">
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-lista btn-realiza-consulta-protocolo">Buscar</button>
                                        <button type="button" class="btn btn-lista" data-dismiss="modal">Fechar</button>
                                    </div>
                                </div>    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>

    <script src=<c:url value="/resources/js/jquery/jquery-2.2.2.min.js"/>></script>
    <script src=<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>></script>
    <script src=<c:url value="/resources/js/tabela.js"/>></script>
    <script src=<c:url value="/resources/js/listaProtocolo.js"/>></script>
    <script src=<c:url value="/resources/js/util.js"/>></script>
    <script src=<c:url value="/resources/datatable/js/jquery.dataTables.min.js"/>></script>
    <script src=<c:url value="/resources/datatable/js/dataTables.bootstrap.min.js"/>></script>
</html>