<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="wrapper" class="cadUsuario">
    <div class="container-fluid">
        <div class="page-header">
            <h1 class="titulo">Cadastro de Usuários</h1>
        </div>
        <c:import url="mensagem.jsp" />
        <div class="well">
            <div class="form-group">
                <label class="titulo" for="residencial">Dados Pessoais</label>
            </div>

            <div class="row">
                <div class="col-md-5">
                    <div class="form-group">
                        <label class="descricao" for="nome">Nome</label>
                        <input type="text" class="form-control" id="nome" name="nome" value="${usuario.nome}" ${disabled} />
                    </div>
                </div>

                <div class="col-md-3 col-sm-4">
                    <div class="form-group">
                        <label class="descricao" for="cpf">CPF</label>
                        <input type="text" class="form-control mascara-cpf" id="cpf" name="cpf" value="${usuario.cpf}" ${disabled}/>
                    </div>
                </div>

                <div class="col-md-3 col-sm-5">
                    <div class="form-group">
                        <label class="descricao" for="perfil">Perfil</label>
                        <select class="form-control" id="perfil" name="perfil" ${disabled}>
                            <option value=""><c:out value="Selecione..."/></option>
                            <c:forEach items="${perfis}" var="p">
                                <option value="${p.id}" ${usuario.perfil.id == p.id ? 'selected' : ''}><c:out value="${p.descricao}"/></option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-5 col-sm-4">
                    <div class="form-group">
                        <label class="descricao" for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="${usuario.email}" ${disabled}/>
                    </div>
                </div>
            </div>

            <div class="row">

            </div>

            <div class="row">
                <div class="col-md-4 col-sm-4">
                    <div class="form-group">
                        <label class="descricao" for="senha">Senha</label>
                        <input type="password" class="form-control" id="senha" name="senha" value="" ${disabled}/>
                    </div>
                </div>

                <div class="col-md-4 col-sm-4">
                    <div class="form-group">
                        <label class="descricao" for="confirmaSenha">Confirma Senha</label>
                        <input type="password" class="form-control" id="confirmaSenha" name="confirmaSenha" value="" ${disabled} />
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12 col-sm-4 col-md-2 ">
                    <div class="form-group">
                        <button id="btnSalvar" type="button" class="btn botao btn-lg col-xs-12" ${disabled}>
                            Salvar
                        </button>				  	
                    </div>
                </div>
            </div>
        </div>

        <input type="hidden" class="form-control" id="id" name="id" value="${usuario.id}"/>		
        <input type="hidden" class="form-control" id="nomeFiltro" name="nomeFiltro" value="${nomeFiltro}"/>		
        <input type="hidden" class="form-control" id="cpfFiltro" name="cpfFiltro" value="${cpfFiltro}"/>		
    </div>
</div>
