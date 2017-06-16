<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="wrapper" class="protocolo">
    <div class="container-fluid">
        <div class="page-header">
            <h1 class="titulo">Protocolos</h1>
        </div>
        <c:import url="mensagem.jsp" />

        <div class="panel-group">
            <div class="panel panel-default">
                <a id="aFiltroProtocolo"data-toggle="collapse" href="#filtro" class="link-filtro">
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
                                    <input type="text" 
                                           id="cpfRequerenteFiltro" 
                                           name="cpfRequerenteFiltro" 
                                           class="form-control mascara-cpf" 
                                           placeholder="Buscar CPF" 
                                           value="${cpfRequerenteFiltro}" />
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <div class="form-group">
                                    <input type="text" 
                                           id="cdAutenticacao" 
                                           name="cdAutenticacao" 
                                           class="form-control" 
                                           placeholder="Código de Autenticação" 
                                           value="${cdAutenticacaoFiltro}" />
                                </div>
                            </div>

                            <div class="col-sm-2">
                                <div class="form-group">
                                    <button type="button" 
                                            id="btnFiltro" 
                                            name="btnFiltro" 
                                            class="btn botao-filtro btn-block btn-sm">
                                        Filtrar 
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <c:choose>
            <c:when test="${!empty protocolos}">
                <div class="list-group">
                    <c:forEach items="${protocolos}" var="protocolo">
                        <a href="javascript:void(0);" class="list-group-item list-group-style">
                            <div class="row">
                                <div class="col-sm-9 col-md-10">
                                    <div class="row">
                                        <label class="titulo col-xs-12 col-sm-2">Autenticação:</label>
                                        <div class="col-xs-12 col-sm-10">
                                            <label class="descricao">
                                                ${protocolo.codigoAutenticacao}
                                            </label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="titulo col-xs-4 col-sm-2">Nome:</label>
                                        <div class="col-xs-8 col-sm-4">
                                            <label class="descricao">${protocolo.requerente.nome}</label>
                                        </div>

                                        <label class="titulo col-xs-4 col-sm-2">CPF:</label>
                                        <div class="col-xs-8 col-sm-4">
                                            <label class="descricao lbl-formata-data">${protocolo.requerente.cpf}</label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="titulo col-xs-4 col-sm-2">Evento:</label>
                                        <div class="col-xs-8 col-sm-4">
                                            <label class="descricao">
                                                ${protocolo.ocorrencia.naturezaEvento.descricao}
                                            </label>
                                        </div>

                                        <label class="titulo col-xs-4 col-sm-2">Data</label>
                                        <div class="col-xs-8 col-sm-4">
                                            <label class="descricao lbl-formata-data">
                                                ${protocolo.ocorrencia.dataOcorrencia}
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-3 col-md-2">
                                    <div class="row">
                                        <button type="button" class="btn btn-link btn-excluir-protocolo" 
                                                data-id-protocolo="${protocolo.id}"
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
            <button id="btnIncluir" type="button" class="btn botao-lista col-xs-12 col-sm-4 col-sm-offset-4">Incluir</button>

            <div class="modal fade" id="modal-excluir-protocolo" role="dialog">
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
                            <button type="button" class="btn botao btn-realiza-exclusao-protocolo">Excluir</button>
                            <button type="button" class="btn botao" data-dismiss="modal">Fechar</button>
                        </div>
                    </div>    
                </div>
            </div>
        </div>
    </div>
</div>