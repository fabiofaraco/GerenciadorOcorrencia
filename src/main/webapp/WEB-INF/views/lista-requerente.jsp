<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="wrapper">
    <div class="container-fluid">
        <div class="page-header">
            <h1 class="titulo">Lista de Requerentes</h1>
        </div>
        <c:import url="mensagem.jsp" />

        <div class="panel-group">
            <div class="panel panel-default">
                <a id="aFiltroRequerente" data-toggle="collapse" href="#filtro" class="link-filtro">
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
                                    <button type="button" id="btnFiltroRequerente" name="btnFiltroRequerente" class="btn botao-filtro btn-block btn-sm" >Filtrar </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <c:choose>
            <c:when test="${!empty requerentes}">
                <div class="list-group">
                    <c:forEach items="${requerentes}" var="requerente">
                        <a href="javascript:void(0);" class="list-group-item list-group-style">
                            <div class="row">
                                <div class="col-sm-12 col-md-10">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <h4 class="list-group-item-heading titulo">${requerente.nome}</h4>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="titulo col-xs-4 col-sm-2">CPF:</label>
                                        <div class="col-xs-8 col-sm-4">
                                            <label class="descricao">${requerente.cpf}</label>
                                        </div>

                                        <label class="titulo col-xs-4 col-sm-2">Nascimento:</label>
                                        <div class="col-xs-8 col-sm-4">
                                            <label class="descricao lbl-formata-data">${requerente.dataNascimento}</label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="titulo col-xs-4 col-sm-2">E-mail:</label>
                                        <div class="col-xs-8 col-sm-10">
                                            <label class="descricao">${requerente.email}</label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="titulo col-xs-4 col-md-2">Endereço: </label>
                                        <div class="col-xs-8 col-md-4">
                                            <label class="descricao">
                                                ${requerente.endereco.logradouro},
                                                ${requerente.endereco.complemento}
                                            </label>
                                        </div>

                                        <label class="titulo col-xs-4 col-md-2">Bairro: </label>
                                        <div class="col-xs-8 col-md-4">
                                            <label class="descricao">
                                                ${requerente.endereco.bairro}
                                            </label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="titulo col-xs-4 col-md-2">Cidade: </label>
                                        <div class="col-xs-8 col-md-4">
                                            <label class="descricao">
                                                ${requerente.endereco.cidade.nome}
                                            </label>
                                        </div>

                                        <label class="titulo col-xs-4 col-md-2">Estado: </label>
                                        <div class="col-xs-8 col-md-4">
                                            <label class="descricao">
                                                ${requerente.endereco.cidade.estado.sigla}
                                            </label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="titulo col-xs-4 col-sm-2">Tel Res:</label>
                                        <div class="col-xs-8 col-sm-4">
                                            <label class="descricao">
                                                ${requerente.telefone.residencial} 
                                            </label>
                                        </div>

                                        <label class="titulo col-xs-4 col-sm-2">Tel Cel:</label>
                                        <div class="col-xs-8 col-sm-4">
                                            <label class="descricao">
                                                ${requerente.telefone.celular} 
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-12 col-md-2">
                                    <div class="form-group">
                                        <button type="button" class="btn btn-link btn-alterar-requerente" 
                                                data-id-requerente="${requerente.id}">
                                            <span class="glyphicon glyphicon-pencil"></span> Alterar
                                        </button>

                                        <button type="button" class="btn btn-link btn-excluir-requerente" 
                                                data-id-requerente="${requerente.id}" 
                                                data-nome-requerente="${requerente.nome}"
                                                data-toggle="modal">
                                            <span class="glyphicon glyphicon-trash"></span> Remover
                                        </button>
                                    </div>  
                                </div>
                            </div>
                        </a>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="list-group">
                    <a href="javascript:void(0);" class="list-group-item">
                        <h4 class="descricao">${msgConsulta}</h4>
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
        <button id="btnIncluirRequerente" type="button" class="btn botao-lista col-xs-12 col-sm-4 col-sm-offset-4">Incluir</button>

        <div class="modal fade" id="modal-excluir-requerente" role="dialog">
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
                        <button type="button" class="btn botao btn-realiza-exclusao-requerente">Excluir</button>
                        <button type="button" class="btn botao" data-dismiss="modal">Fechar</button>
                    </div>
                </div>    
            </div>
        </div>
    </div>
</div>