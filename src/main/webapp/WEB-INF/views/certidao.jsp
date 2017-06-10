<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="row">
	<div class="col-lg-12">
		<img src="<c:url value="/resources/img/certidao.png"/>" width="200" height="200" 
				data-toggle="modal" data-target="#divGerarCertidao" class="link-collapse"/>
	</div>
	<div class="col-lg-12">
		<h1 class="link-collapse" data-toggle="modal" data-target="#divGerarCertidao">Certidão</h1>
	</div>
</div>	
<div id="divGerarCertidao" class="modal fade" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		
	    <div class="modal-content">
	    	<div class="modal-header">
	    		<button type="button" class="close" data-dismiss="modal">&times;</button>
	        	<h2>Gerar Certidão</h2>
	        </div>
			<div class="modal-body">
				<c:import url="mensagem.jsp" />
			
				<div class="row">
		  			<div class="col-sm-12">
						<div class="form-group">
							<label class="control-label" for="protoclo">Protocolo</label>
				  			<input type="text" id="protocolo" name="protocolo" class="form-control"/>
				  		</div>
			  		</div>
	    		</div>
    		</div>
    		
    		<div class="modal-footer">
     			<button type="button" id="btnGerarCertidao" class="btn btn-lista btn-block" data-dismiss="modal">Gerar</button>
     		</div>
		</div>
	</div>			
</div>

<input type="hidden" id="showModalCertidao" name="showModalCertidao" value="${showModalCertidao}" />