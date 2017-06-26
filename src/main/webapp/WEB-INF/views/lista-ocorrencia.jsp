<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="wrapper" class="listaOcorrencia">
    <div class="container-fluid">
        <div class="page-header">
            <h1 class="titulo">Lista de Ocorrências</h1>
        </div>
        <c:import url="mensagem.jsp" />

        <div class="panel-group">
            <div class="panel panel-default">
                <a id="aFiltroOcorrencia" data-toggle="collapse" href="#filtro" class="link-filtro">
                    <div class="panel-heading cabecalho-panel">
                        <span class="glyphicon glyphicon-menu-up text-right"></span>
                        Filtrar
                    </div>
                </a>

                <div id="filtro" class="panel-collapse collapse in">
                    <div class="panel-body">
                        <div class="row filtro">

                            <div class="col-sm-3">
                                <div class="form-group">
                                    <input type="number" 
                                           min="1"
                                           id="idFiltro" 
                                           name="idFiltro" 
                                           class="form-control" 
                                           placeholder="Nª Evento" 
                                           value="${idFiltro}" />
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <div class="form-group">
                                    <select class="form-control" id="naturezaEventoFiltro" name="naturezaEventoFiltro">
                                        <option value="0"><c:out value="Selecione a natureza do evento..."/></option>
                                        <c:forEach items="${naturezasEvento}" var="naturezaEvento">
                                            <option value="${naturezaEvento.id}" 
                                                    ${naturezaEventoFiltro == naturezaEvento.id ? 'selected' : ''}>
                                                <c:out value="${naturezaEvento.descricao}"/>
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="form-group">
                                    <input type="text" id="dataOcorrenciaFiltro" name="dataOcorrenciaFiltro" class="form-control mascara-data data" placeholder="Data da Ocorrência" value="${dataOcorrenciaFiltro}" />
                                </div>
                            </div>

                            <div class="col-sm-2">
                                <div class="form-group">
                                    <button type="button" id="btnFiltroOcorrencia" name="btnFiltroOcorrencia" class="btn botao-filtro btn-block btn-sm" >Filtrar </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:choose>
            <c:when test="${!empty ocorrencias}">
                <div class="list-group">
                    <c:forEach items="${ocorrencias}" var="ocorrencia">
                        <a href="javascript:void(0);" class="list-group-item list-group-style">
                            <div class="row">
                                <div class="col-sm-9 col-md-10">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <h4 class="list-group-item-heading titulo">Evento Nº ${ocorrencia.id}</h4>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="titulo col-xs-4 col-sm-2">Grupamento:</label>
                                        <div class="col-xs-8 col-sm-4">
                                            <label class="descricao">${ocorrencia.nrGrupamento}ª ${ocorrencia.tipoGrupamento.descricao}</label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="titulo col-xs-4 col-sm-2">Data:</label>
                                        <div class="col-xs-8 col-sm-4">
                                            <label class="descricao lbl-formata-data">${ocorrencia.dataOcorrencia}</label>
                                        </div>

                                        <label class="titulo col-xs-4 col-sm-2">Hora:</label>
                                        <div class="col-xs-8 col-sm-4">
                                            <label class="descricao">${ocorrencia.horaOcorrencia}</label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="titulo col-xs-4 col-md-2">Natureza:</label>
                                        <div class="col-xs-8 col-md-4">
                                            <label class="descricao">${ocorrencia.naturezaEvento.descricao}</label>
                                        </div>

                                        <label class="titulo col-xs-4 col-md-2">Responsável: </label>
                                        <div class="col-xs-8 col-md-4">
                                            <label class="descricao">${ocorrencia.responsavel}</label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="titulo col-xs-4 col-md-2">Endereço: </label>
                                        <div class="col-xs-8 col-md-4">
                                            <label class="descricao">
                                                ${ocorrencia.endereco.logradouro},
                                                ${ocorrencia.endereco.complemento}
                                            </label>
                                        </div>

                                        <label class="titulo col-xs-4 col-md-2">Bairro: </label>
                                        <div class="col-xs-8 col-md-4">
                                            <label class="descricao">
                                                ${ocorrencia.endereco.bairro}
                                            </label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="titulo col-xs-4 col-md-2">Cidade: </label>
                                        <div class="col-xs-8 col-md-4">
                                            <label class="descricao">
                                                ${ocorrencia.endereco.cidade.nome}
                                            </label>
                                        </div>

                                        <label class="titulo col-xs-4 col-md-2">Estado: </label>
                                        <div class="col-xs-8 col-md-4">
                                            <label class="descricao">
                                                ${ocorrencia.endereco.cidade.estado.sigla}
                                            </label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label type="button" 
                                               class="btn btn-link" 
                                               data-toggle="collapse" 
                                               data-target="#relato_${ocorrencia.id}">
                                            Ler relato...
                                        </label>
                                    </div>

                                    <div class="row">
                                        <label class="descricao col-xs-12">
                                            <div id="relato_${ocorrencia.id}" class="collapse text-justify">
                                                ${ocorrencia.relato}
                                            </div>
                                        </label>
                                    </div>

                                </div>
                                <div class="col-xs-12 col-sm-3 col-md-2">
                                    <div class="form-group">
                                        <button type="button" class="btn btn-link btn-alterar-ocorrencia" 
                                                data-id-ocorrencia="${ocorrencia.id}">
                                            <span class="glyphicon glyphicon-pencil"></span> Alterar
                                        </button>

                                        <button type="button" class="btn btn-link btn-excluir-ocorrencia" 
                                                data-id-ocorrencia="${ocorrencia.id}" 
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

            <button id="btnIncluirOcorrencia" type="button" class="btn botao-lista col-xs-12 col-sm-4 col-sm-offset-4">Incluir</button>

            <div class="modal fade" id="modal-excluir-ocorrencia" role="dialog">
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
                            <button type="button" class="btn botao btn-realiza-exclusao-ocorrencia">Excluir</button>
                            <button type="button" class="btn botao" data-dismiss="modal">Fechar</button>
                        </div>
                    </div>    
                </div>
            </div>
        </div>
    </div>
</div>


