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
        <link href=<c:url value="/css/login.css"/> rel="stylesheet"/>        

    </head>
    <body>
        <div id="principal" class="container-fluid">
            <form id="frm" name="frm" method="post">
                <input type="hidden" id="contextPath" name="contextPath" value="${pageContext.request.contextPath}" />
                <input type="hidden" class="form-control" id="error" name="error" value="${error}">

                <div class="row">
                    <div class="col-xs-12">
                        <h1 class="titulo-principal text-center">Gerenciador de Ocorrências</h1>
                    </div>
                </div>

                <div class="well col-sm-offset-3 col-sm-6">
                    <div class="row">
                        <div class="col-xs-12 col-sm-8 col-sm-offset-2">
                            <c:import url="mensagem.jsp" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-sm-8 col-sm-offset-2">
                            <input type="text" class="form-control" id="username" 
                                   name="username"  placeholder="Login">
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-sm-8 col-sm-offset-2">
                            <input type="password" class="form-control" id="password" 
                                   name="password" placeholder="Senha">
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-sm-8 col-sm-offset-2 ">
                            <label class="checkbox-inline descricao">
                                <input id="remember-me" name="remember-me" 
                                       type="checkbox" value="">Lembrar-me
                            </label>
                        </div>
                    </div>

                    <div class="row"> 
                        <div class="form-group col-sm-8 col-sm-offset-2">
                            <button id="btnLogin" name="btnLogin" type="button" 
                                    class="btn botao-principal btn-block">Entrar</button>
                            <button id="btnEsqueceuSenha" name="btnEsqueceuSenha" 
                                    type="button" class="btn btn-link btn-block">
                                Esqueci minha senha
                            </button>
                        </div>
                    </div>

                    <div class="row">

                        <div class="form-group col-md-4 col-md-offset-2 col-sm-5 col-sm-offset-1">
                            <button id="btnGerarCertidao" name="btnGerarCertidao" 
                                    type="button" class="btn botao sm btn-block">
                                Certidão
                            </button>
                        </div>

                        <div class="form-group col-md-4 col-sm-5">
                            <button id="btnAutenticacao" name="btnAutenticacao" 
                                    type="button" class="btn botao sm btn-block" data-toggle="modal">
                                Autenticar
                            </button>
                        </div>

                    </div>
                </div>
        </div>

        <div class="modal fade" id="modal-autenticacao" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h3 class="modal-title titulo">Autenticar</h3>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <input type="text" class="form-control" id="cdAutenticacao" name="cdAutenticacao" placeholder="Código de Autenticação">
                            </div>           
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div id="msgErroAutenticacao"></div>
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

        <div class="modal fade" id="modal-autenticacao-certidao" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h3 class="modal-title titulo">Gerar Certidão</h3>
                    </div>

                    <div class="modal-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <div id="msgErroCertidao"></div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <input type="text" class="form-control" id="cdAutenticacaoCertidao" name="cdAutenticacaoCertidao" placeholder="Código de Autenticação">
                            </div>           
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <div id="relatorioCertidao"></div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn botao btn-gerar">Gerar</button>
                        <button type="button" class="btn botao" data-dismiss="modal">Fechar</button>
                    </div>
                </div>    
            </div>
        </div>

        <div class="modal fade" id="modal-autenticado" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h3 class="modal-title titulo">Autenticado</h3>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <h3 class="titulo"> Dados do Requerente </h3>
                            </div>           
                        </div>

                        <div class="row">
                            <label class="titulo col-xs-4 col-md-2">Nome:</label>
                            <div class="col-xs-8 col-md-4">
                                <label id="lblNomeRequerente" class="descricao"></label>
                            </div>

                            <label class="titulo col-xs-4 col-md-2">CPF:</label>
                            <div class="col-xs-8 col-md-4">
                                <label id="lblCpfRequerente" class="descricao"></label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <hr/>
                                <h3 class="titulo"> Dados da Ocorrência </h3>
                            </div>           
                        </div>

                        <div class="row">
                            <label class="titulo col-xs-4 col-md-2">Data:</label>
                            <div class="col-xs-8 col-md-4">
                                <label id="lblDataOcorrencia" class="descricao lbl-formata-data"></label>
                                <label id="lblHoraOcorrencia" class="descricao"></label>
                            </div>

                            <label class="titulo col-xs-4 col-md-2">Natureza:</label>
                            <div class="col-xs-8 col-md-4">
                                <label id="lblNaturezaOcorrencia" class="descricao"></label>
                            </div>
                        </div>

                        <div class="row">
                            <label class="titulo col-xs-4 col-md-2">Responsável: </label>
                            <div class="col-xs-8 col-md-10">
                                <label id="lblResponsavelOcorrencia" class="descricao"></label>
                            </div>
                        </div>

                        <div class="row">
                            <label class="titulo col-xs-4 col-md-2">Endereço: </label>
                            <div class="col-xs-8 col-md-4">
                                <label id="lblEnderecoOcorrencia" class="descricao"></label>
                            </div>

                            <label class="titulo col-xs-4 col-md-2">Bairro: </label>
                            <div class="col-xs-8 col-md-4">
                                <label id="lblBairroOcorrencia" class="descricao"></label>
                            </div>
                        </div>

                        <div class="row">
                            <label class="titulo col-xs-4 col-md-2">Cidade: </label>
                            <div class="col-xs-8 col-md-4">
                                <label id="lblCidadeOcorrencia" class="descricao"></label>
                            </div>

                            <label class="titulo col-xs-4 col-md-2">Estado: </label>
                            <div class="col-xs-8 col-md-4">
                                <label id="lblEstadoOcorrencia" class="descricao"></label>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn botao" data-dismiss="modal">Fechar</button>
                    </div>
                </div>    
            </div>
        </div>

        <div class="modal fade" id="modal-redefinir-senha" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h3 class="modal-title titulo">Redefinir Senha</h3>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <input type="text" class="form-control" id="emailRedefinicao" 
                                       name="emailRedefinicao" placeholder="E-mail">
                            </div>           
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div id="msgErroRedefinir"></div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn botao btn-redefinir">Enviar</button>
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