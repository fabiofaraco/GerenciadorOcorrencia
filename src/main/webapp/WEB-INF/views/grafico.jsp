<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="wrapper" class="graficos">
    <div class="container-fluid">
        <div class="page-header">
            <h1 class="titulo">Gráficos</h1>
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
                                    <input type="text" id="dtInicio" name="dtInicio" class="form-control mascara-data data" placeholder="Data de Início" value="${dtInicio}" />
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="form-group">
                                    <input type="text" id="dtFim" name="dtFim" class="form-control mascara-data data" placeholder="Data Final" value="${dtFim}" />
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-5">
                                <div class="form-group">
                                    <select class="form-control" id="tipoGrafico" name="tipoGrafico">
                                        <option value=""><c:out value="Selecione o tipo de gráfico..."/></option>
                                        <option value="bar"><c:out value="Barra"/></option>
                                        <option value="line"><c:out value="Linha"/></option>
                                        <option value="pie"><c:out value="Pizza"/></option>
                                        <option value="doughnut"><c:out value="Rosca"/></option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-sm-2">
                                <div class="form-group">
                                    <button type="button" id="btnFiltro" name="btnFiltro" class="btn botao-filtro btn-block btn-sm" >Filtrar </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                    
        <div class="row">
            <div id="chartBarLine" class="chart-container">
                <canvas id="charBarLine"></canvas>
            </div>

            <div id="chartPie" class="chart-container-pie">
                <canvas id="charPie"></canvas>
            </div>

        </div>
    </div>


