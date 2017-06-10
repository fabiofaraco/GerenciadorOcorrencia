<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="wrapper">
    <div class="container-fluid">
        <div class="page-header">
            <h1 class="titulo">Cadastro de Requerentes</h1>
        </div>
        <c:import url="mensagem.jsp" />
        <div class="well">
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="form-group">
                        <label class="descricao" for="nome">Nome</label>
                        <input type="text" class="form-control" id="nome" name="nome" value="${requerente.nome}" />
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="descricao" for="cpfRequerente">CPF</label>
                        <input type="text" class="form-control mascara-cpf" id="cpfRequerente" name="cpf" value="${requerente.cpf}" />
                    </div>
                </div>

                <div class="col-md-4 col-sm-3">
                    <div class="form-group">
                        <label class="descricao" for="dataNascimento">Nascimento</label>
                        <input type="text" class="form-control data mascara-data" id="dataNascimento" name="dataNascimento" value="${requerente.dataNascimento}" />
                    </div>
                </div>

                <div id="divEmail" class="col-md-5 col-sm-6">
                    <div class="form-group">
                        <label class="descricao" for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="${requerente.email}" ${disabled} />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="titulo" for="residencial">Endereço</label>
            </div>

            <div class="row">
                <div id="divEndereco" class="col-md-5 col-sm-3">
                    <div class="form-group">
                        <label class="descricao" for="logradouro">Endereço</label>
                        <input type="text" class="form-control" id="logradouro" name="endereco.logradouro" value="${requerente.endereco.logradouro}" ${disabled} />
                    </div>
                </div>

                <div id="divComplemento" class="col-md-4 col-sm-6">
                    <div class="form-group">
                        <label class="descricao" for="complemento">Complemento</label>
                        <input type="text" class="form-control" id="complemento" name="endereco.complemento" value="${requerente.endereco.complemento}" ${disabled} />
                    </div>
                </div>

                <div id="divBairro" class="col-md-3 col-sm-6">
                    <div class="form-group">
                        <label class="descricao" for="bairro">Bairro</label>
                        <input type="text" class="form-control" id="bairro" name="endereco.bairro" value="${requerente.endereco.bairro}" ${disabled} />
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-5 col-sm-3">
                    <div class="form-group">
                        <label class="descricao" for="estadoCpf">Estado</label>

                        <select class="form-control" id="estadoCpf" name="endereco.cidade.estado">
                            <option value=""><c:out value="Selecione..."/></option>
                            <c:forEach items="${estados}" var="es">
                                <option value="${es.id}" ${requerente.endereco.cidade.estado.id == es.id? 'selected' : ''}><c:out value="${es.sigla} - ${es.nome}"/></option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                
                <div class="col-md-5 col-sm-6">
                    <div id="divCidade" class="form-group">
                        <label class="descricao" for="cidade">Cidade</label>

                        <select class="form-control" id="cidade" name="endereco.cidade" ${disabled}>
                            <option value=""><c:out value="Selecione..."/></option>
                            <c:forEach items="${cidades}" var="c">
                                <option value="${c.id}" ${requerente.endereco.cidade.id == c.id? 'selected' : ''}><c:out value="${c.nome}"/></option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="titulo" for="telefone">Telefone</label>
            </div>

            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div id="divResidencial" class="form-group">
                        <label class="descricao" for="residencial">Residencial</label>
                        <input type="text" class="form-control mascara-telefone" id="residencial" name="telefone.residencial" value="${requerente.telefone.residencial}" ${disabled} />
                    </div>
                </div>

                <div class="col-md-3 col-sm-6">
                    <div id="divCelular" class="form-group">
                        <label class="descricao" for="celular">Celular</label>
                        <input type="text" class="form-control mascara-celular" id="celular" name="telefone.celular" value="${requerente.telefone.celular}" ${disabled} />
                    </div>
                </div>
            </div>
            <hr/>
            <div class="row">
                <div class="col-md-2 col-sm-4 col-xs-6">
                    <div class="form-group">
                        <button id="btnSalvarRequerente" type="button" class="btn botao col-xs-12">Salvar</button>				  	
                    </div>
                </div>
            </div>
        </div>			

        <input type="hidden" class="form-control" id="id" name="id" value="${requerente.id}"/>
        <input type="hidden" class="form-control" id="nomeFiltro" name="nomeFiltro" value="${nomeFiltro}"/>		
        <input type="hidden" class="form-control" id="cpfFiltro" name="cpfFiltro" value="${cpfFiltro}"/>		
    </div>
</div>