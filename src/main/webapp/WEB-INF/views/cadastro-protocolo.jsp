
<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
    <head>
        <title>Cadastro de Requerentes</title>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>

        <link href=<c:url value="/resources/bootstrap/css/bootstrap.min.css"/> rel="stylesheet"/>
        <link href=<c:url value="/resources/css/mensagem.css"/> rel="stylesheet"/>
        <link href=<c:url value="/resources/css/cadastro.css"/> rel="stylesheet"/>
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
                        <h1>Cadastro de Protocolos</h1>
                    </div>
                    <c:import url="mensagem.jsp" />
                    <div class="well">
                        <div class="row">
                            <div class="col-md-12">
                                <label class="titulo">Dados do Requerente</label>
                            </div>

                            <div class="col-md-4">
                                <div id="divCpf" class="form-group">
                                    <label class="descricao" for="nome">CPF</label>
                                    <input type="text" class="form-control mascara-cpf" id="cpf" name="requerente.cpf" value="${protocolo.requerente.cpf}">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <label class="titulo">Dados da Ocorrência</label>
                            </div>

                            <div class="col-sm-4">
                                <div id="divOcorrencia" class="form-group">
                                    <label class="descricao" for="dataOcorrencia">Data</label>
                                    <input type="text" class="form-control mascara-data" id="dataOcorrencia" name="ocorrencia.data" value="${protocolo.ocorrencia.data}"/>
                                </div>
                            </div>

                            <div class="col-sm-8">
                                <div id="divEndereco" class="form-group">
                                    <label class="descricao" for="endereco">Endereço</label>
                                    <select class="form-control" id="endereco" name="endereco">
                                        <option value="">Selecione...</option>
                                    </select>
                                </div>
                            </div>
                        </div>			  	

                        <hr/>

                        <div class="row">
                            <div class="col-md-2 col-sm-4 col-xs-6">
                                <div class="form-group">
                                    <button id="btnConsultar" type="button" class="btn btn-cadastro col-xs-12">Consultar</button>				  	
                                </div>
                            </div>

                            <div class="col-md-2 col-sm-4 col-xs-6">
                                <div class="form-group">
                                    <button id="btnVoltar" type="button" class="btn btn-voltar col-xs-12">Retornar</button>				  	
                                </div>
                            </div>
                        </div>
                    </div>			
                    <input type="hidden" class="form-control" id="id" name="id" value="${protocolo.id}"/>

                    <input type="hidden" id="openModal" name="openModal" value="${openModal}"/>
                    <input type="hidden" id="msgRequerente" name="msgRequerente" value="${msgRequerente}"/>
                    <input type="hidden" id="msgOcorrencia" name="msgOcorrencia" value="${msgOcorrencia}"/>

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

                                        <div class="col-md-8">
                                            <div id="divNome" class="form-group">
                                                <label class="descricao" for="nome">Nome</label>
                                                <input type="text" class="form-control" id="nome" name="nome" value="${requerente.nome}" disabled>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div id="divCpfRequerente" class="form-group">
                                                <label class="descricao" for="nome">CPF</label>
                                                <input type="text" class="form-control mascara-cpf" value="${requerente.cpf}" disabled>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="titulo">Dados da Ocorrência</label>
                                        </div>

                                        <div class="col-md-4">
                                            <div id="divSobrenome" class="form-group">
                                                <label class="descricao" for="data">Data</label>
                                                <input type="text" class="form-control mascara-data" id="data" name="ocorrencia.data" value="${ocorrencia.data}" disabled />
                                            </div>
                                        </div>

                                        <div class="col-md-8">
                                            <div id="divSobrenome" class="form-group">
                                                <label class="descricao" for="natureza">Natureza</label>
                                                <input type="text" class="form-control" id="natureza" name="evento.descricao" value="${ocorrencia.evento.descricao}" disabled />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div id="divSobrenome" class="form-group">
                                                <label class="descricao" for="sobrenome">Endereço</label>
                                                <input type="text" class="form-control" id="natureza" name="endereco." 
                                                       value="${ocorrencia.endereco.logradouro} - ${ocorrencia.endereco.complemento} - ${ocorrencia.endereco.bairro} - ${ocorrencia.endereco.cidade.estado.sigla} - ${ocorrencia.endereco.cidade.nome}" disabled/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" id="btnSalvar" class="btn btn-lista btn-realiza-consulta-protocolo">Salvar</button>
                                    <button type="button" class="btn btn-lista" data-dismiss="modal">Fechar</button>
                                </div>

                                <input type="hidden" id="idRequerente" name="idRequerente" value="${requerente.id}"> 
                                <input type="hidden" id="idOcorrencia" name="idOcorrencia" value="${ocorrencia.id}">
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>

    <script src=<c:url value="/resources/js/jquery/jquery-2.2.2.min.js"/>></script>
    <script src=<c:url value="/resources/js/jquery/jquery.mask.min.js"/>></script>
    <script src=<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>></script>
    <script src=<c:url value="/resources/js/mensagem.js"/>></script>
    <script src=<c:url value="/resources/js/cadastroProtocolo.js"/>></script>
    <script src=<c:url value="/resources/js/util.js"/>></script>
</html>