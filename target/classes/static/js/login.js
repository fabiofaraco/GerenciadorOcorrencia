$(document).ready(function() { 
	
	if($('.msg').html() != null && $('.msg').html() != '') {
		alert($('.msg').html());
		exibirAlerta();
	}
	
	$('#btnLogin').click(function(){
		if(validarCampos()) {
		   $('#frm').attr('action', 'logar');
		   $('#frm').submit();
		}
	});	
	
	function validarCampos() {
		
		if($('#email').val() == "") {
			$('.msg').html('Por favor Insira o endereço de email');
			exibirAlerta();
			return false;
		}
		
		if($('#senha').val() == "") {
			$('.msg').html('Por favor Insira a senha');
			exibirAlerta();
			return false;
		}
		
		return true;
	}
	
	function exibirAlerta() {
		$('#warning').css("display", "block");
	}
});