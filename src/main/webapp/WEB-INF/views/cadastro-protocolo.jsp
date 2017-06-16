<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="wrapper" class="cadProtocolo">
    <div class="container-fluid">
        <div class="page-header">
            <h1 class="titulo">Cadastro de Protocolos</h1>
        </div>
        <c:import url="mensagem.jsp" />
        <div class="well">
            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="titulo">Dados do Requerente</label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="descricao" for="cpfRequerente">CPF Requerente</label>
                        <input type="text" 
                               id="cpfRequerente" 
                               name="cpfRequerente" 
                               class="form-control mascara-cpf" 
                               value="${cpfRequerente}" />
                    </div>
                </div>

                <div class="col-sm-8">
                    <label class="descricao" for="nomeRequerente">Nome</label>
                    <div class="form-group">
                        <input type="text" 
                               id="nomeRequerente" 
                               name="nomeRequerente" 
                               class="form-control mascara-cpf" 
                               value="${nome}" 
                               disabled />
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="titulo">Dados da Ocorrência</label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4">
                    <label class="descricao" for="dataOcorrencia">Data da Ocorrência</label>
                    <div class="form-group">
                        <input type="text" 
                               id="dataOcorrencia" 
                               name="dataOcorrencia" 
                               class="form-control mascara-data data" 
                               value="${dataOcorrencia}" />
                    </div>
                </div>

                <div class="col-sm-8">
                    <label class="descricao" for="evento">Evento</label>
                    <div id="divEvento" class="form-group">
                        <select class="form-control" id="evento" name="ocorrencia.id">
                            <option value=""><c:out value="Selecione..."/></option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12 col-sm-4 col-md-2 ">
                    <div class="form-group">
                        <button id="btnSalvar" type="button" class="btn botao btn-lg col-xs-12">
                            Salvar
                        </button>				  	
                    </div>
                </div>
            </div>
        </div>
                            
        <input type="hidden" class="form-control" id="idRequerente" name="requerente.id"/>		
        
        <input type="hidden" class="form-control" id="nomeFiltro" name="nomeFiltro" value="${nomeFiltro}"/>		
        <input type="hidden" class="form-control" id="cpfFiltro" name="cpfFiltro" value="${cpfFiltro}"/>		
    </div>
</div>
