<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="wrapper" class="certidao">
    <div class="container-fluid">
        <div class="page-header">
            <h1 class="titulo">Certidão</h1>
        </div>
        <c:import url="mensagem.jsp" />

        <div class="panel-group">
            <div class="panel panel-default">
                <a id="aFiltroOcorrencia" data-toggle="collapse" href="#filtro" class="link-filtro">
                    <div class="panel-heading cabecalho-panel">
                        <span class="glyphicon glyphicon-menu-up text-right"></span>
                        Buscar
                    </div>
                </a>

                <div id="filtro" class="panel-collapse collapse in">
                    <div class="panel-body">
                        <div class="row filtro">
                            <div class="col-md-9">
                                <div class="form-group">
                                    <input type="text" 
                                           id="nrAutenticacao" 
                                           name="nrAutenticacao" 
                                           class="form-control" 
                                           placeholder="Código de Autenticação" 
                                           value="${nrAutenticacao}" />
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <button type="button" 
                                            id="btnGerarCertidao" 
                                            name="btnGerarCertidao" 
                                            class="btn botao-filtro btn-block btn-sm" >
                                        Gerar Certidão
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="relatorioCertidao"></div>
    </div>
</div>