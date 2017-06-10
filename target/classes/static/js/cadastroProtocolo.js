$(document).ready(function() {
	if( $('#openModal').val() == "true") {
		$('#modal-inserir-protocolo').modal('show');
	}
	
//	--------------------------------------------------------------------------------------------------------	
	
	$("#cpf").focusout(function(){
		if($("#cpf").val() != "") {
			if(validaCPF($('#cpf').val())) {
				$.post("validaCpf", {'cpf' : $("#cpf").val()} ,function(data) {
					$("#divCpf").limparCritica();
					
					if(data != "") {
						$("#divCpf").realizaCritica({'mensagem' : data, 'field' : "cpf"});
					} else {
						$("#divCpf").limparCritica();
					}
				});
			} else {
				$("#divCpf").realizaCritica({'mensagem' : 'Por favor, digite um CPF válido', 'field' : "cpf"});
			}
		}
    });	

//	--------------------------------------------------------------------------------------------------------
	
	$("#dataOcorrencia").focusout(function(){
		if($("#dataOcorrencia").val() != "") {
			if(validaData("dataOcorrencia", "divOcorrencia", "Data")) {
				$.post("validaDataOcorrencia", {'data' : $("#dataOcorrencia").val()} ,function(data) {
					$("#divOcorrencia").limparCritica();
					
					if(data != "") {
						$("#divOcorrencia").realizaCritica({'mensagem' : data, 'field' : "dataOcorrencia"});
					} else {
						$("#divOcorrencia").limparCritica();
					}
				});
			}
		}
    });	
	
//	--------------------------------------------------------------------------------------------------------
	
	$('#dataOcorrencia').on('change', function () { 
		var data = $('#dataOcorrencia').val(); 
		
		var select = $('#endereco');			
		select.find('option').remove();
		$('<option>').val("").text("Selecione...").appendTo(select);
		
		$.post("carregaEndereco", {'data' : data} ,function(data) {
			if(data != "") {
				$.each(JSON.parse(data), function(index, value) {
		        	$('<option>').val(value.id).text(value.endereco.logradouro).appendTo(select);
		        });
			}
		});
	});
	
//	--------------------------------------------------------------------------------------------------------
	
	$('#btnConsultar').on('click', function () { 
		var cpfRequerente = $("#cpf").val();
		var idOcorrencia  = $("#endereco").val();
		
		if(validaCampos()) {
			$('#frm').attr('action', 'consultar?cpf='+cpfRequerente+'&idOcorrencia='+idOcorrencia);
			$('#frm').submit();
		}
	});
	
//	--------------------------------------------------------------------------------------------------------

	$('#btnVoltar').click(function(){
		$('#frm').attr('action', 'retornar');
		$('#frm').submit();		
	});

//	--------------------------------------------------------------------------------------------------------
	
	$('#btnSalvar').on('click', function () { 
		var idRequerente = $("#idRequerente").val();
		var idOcorrencia = $("#idOcorrencia").val();
		
		$('#frm').attr('action', 'salvar?idRequerente='+idRequerente+"&idOcorrencia="+idOcorrencia);
		$('#frm').submit();
	});
	
//	--------------------------------------------------------------------------------------------------------
	
	/* FUNÇÕES */
	function validaCampos() {
		if(!validaCampo("cpf", "divCpf", "CPF")) {
			return false;
		}
		
		if(!validaCampo("dataOcorrencia", "divOcorrencia", "Data")) {
			return false;
		}
		
		if(!validaCampo("endereco", "divEndereco", "Endereço")) {
			return false;
		}
	
		return true;
	}
});	
