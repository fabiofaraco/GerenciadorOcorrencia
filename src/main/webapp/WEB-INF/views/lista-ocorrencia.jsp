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

                            <div class="col-sm-4">
                                <div class="form-group">
                                    <input type="text" id="nrOcorrenciaFiltro" name="nrOcorrenciaFiltro" class="form-control" placeholder="Número da Ocorrência" value="${nrOcorrenciaFiltro}" />
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <div class="form-group">
                                    <input type="text" id="dataOcorrenciaFiltro" name="dataOcorrenciaFiltro" class="form-control" placeholder="Data da Ocorrência" value="${dataOcorrenciaFiltro}" />
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

        <a href="javascript:void(0);" class="list-group-item list-group-style">
            <div class="row">
                <div class="col-sm-9 col-md-10">
                    <div class="row">
                        <div class="col-xs-12">
                            <h4 class="list-group-item-heading titulo">123456 - 24/05/2017 14:04</h4>
                        </div>
                    </div>

                    <div class="row">
                        <label class="titulo col-xs-4 col-md-2">Natureza:</label>
                        <label class="descricao col-xs-8 col-md-4">Acidente com Veículo Automotor</label>

                        <label class="titulo col-xs-4 col-md-2">Responsável: </label>
                        <label class="descricao col-xs-8 col-md-4">Dr. Fulano de tal</label>
                    </div>


                    <div class="row">
                        <label class="titulo col-xs-4 col-md-2">Endereço: </label>
                        <label class="descricao col-xs-8 col-md-4">Rua Grão Pará, nº 405, apt. 102</label>

                        <label class="titulo col-xs-4 col-md-2">Bairro: </label>
                        <label class="descricao col-xs-8 col-md-4">Recreio dos Bandeirantes</label>
                    </div>

                    <div class="row">
                        <label class="titulo col-xs-4 col-md-2">Cidade: </label>
                        <label class="descricao col-xs-8 col-md-4">Rio de Janeiro</label>

                        <label class="titulo col-xs-4 col-md-2">Estado: </label>
                        <label class="descricao col-xs-8 col-md-4">RJ</label>
                    </div>

                    <div class="row">
                        <label class="titulo col-md-2" data-toggle="collapse" data-target="#relato">Ler relato...</label>
                    </div>
                    
                    <div class="row">
                        <label class="descricao col-xs-12">
                            <div id="relato" class="collapse text-justify">
                                Todas estas questões, devidamente ponderadas, 
                                levantam dúvidas sobre se o acompanhamento das 
                                preferências de consumo agrega valor ao 
                                estabelecimento do remanejamento dos quadros 
                                funcionais. No mundo atual, a necessidade de 
                                renovação processual auxilia a preparação e a 
                                composição de todos os recursos funcionais 
                                envolvidos. O que temos que ter sempre em mente é 
                                que o novo modelo estrutural aqui preconizado aponta
                                para a melhoria dos conhecimentos estratégicos para
                                atingir a excelência. Neste sentido, a estrutura 
                                atual da organização representa uma abertura para a
                                melhoria das posturas dos órgãos dirigentes com 
                                relação às suas atribuições. 
                            </div>
                        </label>
                    </div>

                </div>
                <div class="col-xs-12 col-sm-3 col-md-2">
                    <div class="form-group">
                        <button type="button" class="btn btn-link btn-alterar-ocorrencia" 
                                data-id-ocorrencia="14">
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

        <!-- <c:choose>
            <c:when test="${!empty ocorrencias}">
                <div class="list-group">
                <c:forEach items="${ocorrencias}" var="ocorrencia">
                    <a href="javascript:void(0);" class="list-group-item list-group-style">
                        <div class="row">
                            <div class="col-sm-9 col-md-10">

                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-2">
                                <div class="form-group">
                                    <button type="button" class="btn btn-link btn-alterar-ocorrencia" 
                                            data-id-usuario="${ocorrencia.id}">
                                        <span class="glyphicon glyphicon-pencil"></span> Alterar
                                    </button>

                                    <button type="button" class="btn btn-link btn-excluir-ocorrencia" 
                                            data-id-usuario="${ocorrencia.id}" 
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
        </c:choose> -->

        <button id="btnIncluirOcorrencia" type="button" class="btn botao-lista col-xs-12 col-sm-4 col-sm-offset-4">Incluir</button>

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


