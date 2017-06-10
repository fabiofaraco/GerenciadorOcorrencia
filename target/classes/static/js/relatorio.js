$(document).ready(function() {
	if($('#showModalCertidao').val() == "true") {
		$('.msg-warning').html("Campo Obrigatório: Protocolo");
		$('#warning').css("display", "block");
		$('#divGerarCertidao').modal('show');
	}
	
	$("#btnGerarCertidao").on("click", function(){
		var idProtocolo = $("#protocolo").val();
		
		if(idProtocolo != "") {
			window.open("relatorio/certidao?idProtocolo="+idProtocolo, "Relatório", "width=800, height=600");
		} else {
			$("#frm").attr("action", "relatorio/certidao?idProtocolo="+0);
			$("#frm").submit();
		}
	})	
});