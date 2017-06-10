<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="wrapper">
    <div class="container-fluid">
        <div class="page-header">
            <h1 class="titulo">Lista de Usuários</h1>
        </div>
        <c:import url="mensagem.jsp" />

        <div class="panel-group">
            <div class="panel panel-default">
                <a id="aFiltroUsuario"data-toggle="collapse" href="#filtro" class="link-filtro">
                    <div class="panel-heading cabecalho-panel">
                        <span class="glyphicon glyphicon-menu-up text-right"></span>
                        Filtrar
                    </div>
                </a>
                <div id="filtro" class="panel-collapse collapse in">
                    <div class="panel-body">
                        <div class="row filtro">

                            <div class="col-sm-4">
                                <div class="form-group">
                                    <input type="text" id="nomeFiltro" name="nomeFiltro" class="form-control" placeholder="Buscar Nome" value="${nomeFiltro}" />
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <div class="form-group">
                                    <input type="text" id="cpfFiltro" name="cpfFiltro" class="form-control mascara-cpf" placeholder="Buscar CPF" value="${cpfFiltro}" />
                                </div>
                            </div>

                            <div class="col-sm-2">
                                <div class="form-group">
                                    <button type="button" id="btnFiltro" name="btnFiltro" class="btn botao-filtro btn-block btn-sm" >Filtrar </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <c:choose>
            <c:when test="${!empty usuarios}">
                <div class="list-group">
                    <c:forEach items="${usuarios}" var="usuario">
                        <a href="javascript:void(0);" class="list-group-item list-group-style">
                            <div class="row">
                                <div class="col-sm-9 col-md-10">
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <h4 class="list-group-item-heading titulo">${usuario.nome}</h4>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="titulo col-xs-3 col-md-2">CPF:</label>
                                        <div class="col-xs-9 col-md-4">
                                            <label class="descricao">${usuario.cpf}</label>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="titulo col-xs-3 col-md-2">Perfil:</label>
                                        <div class="col-xs-9 col-md-4">
                                            <label class="descricao">${usuario.perfil.descricao}</label>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="titulo col-xs-3 col-md-2">E-mail</label>
                                        <div class="col-xs-9 col-md-10">
                                            <label class="descricao">${usuario.email}</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-3 col-md-2">
                                    <div class="form-group">
                                        <button type="button" class="btn btn-link btn-alterar" 
                                                data-id-usuario="${usuario.id}">
                                            <span class="glyphicon glyphicon-pencil"></span> Alterar
                                        </button>

                                        <button type="button" class="btn btn-link btn-excluir" 
                                                data-id-usuario="${usuario.id}" 
                                                data-nome-usuario="${usuario.nome}"
                                                data-toggle="modal">
                                            <span class="glyphicon glyphicon-trash"></span> Remover
                                        </button>
                                    </div>  
                                </div>
                            </div>
                        </a>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="list-group">
                        <a href="javascript:void(0);" class="list-group-item">
                            <h4 class="descricao">${msgConsulta}</h4>
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
            <button id="btnIncluirUsuario" type="button" class="btn botao-lista col-xs-12 col-sm-4 col-sm-offset-4">Incluir</button>

            <div class="modal fade" id="modal-excluir-usuario" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h3 class="modal-title titulo">Confirmação</h3>
                        </div>
                        <div class="modal-body">
                            <h4 id="msgConfirmacao" class="descricao"></h4>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn botao btn-realiza-exclusao-usuario">Excluir</button>
                            <button type="button" class="btn botao" data-dismiss="modal">Fechar</button>
                        </div>
                    </div>    
                </div>
            </div>
        </div>
    </div>
</div>


