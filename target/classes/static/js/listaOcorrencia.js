$(document).ready(function () {
    $('#conteudo').on("click", ".listaOcorrencia #btnIncluirOcorrencia", function (e) {
        e.preventDefault();
        ajaxLoad("/ocorrencia/cadastro");
    });
//	----------------------------------------------------------------

    $('.btn-visualizar-ocorrencia').on("click", function () {
        var id = $(this).attr('data-id-ocorrencia');
        $('#frm').attr('action', 'ocorrencia/carregar?visualiza=true&id=' + id);
        $('#frm').submit();
    });
//	----------------------------------------------------------------

    $("#conteudo").on("click", ".listaOcorrencia .btn-alterar-ocorrencia", function (e) {
        e.preventDefault();
        var id = $(this).attr('data-id-ocorrencia');
        
        ajaxLoad("/ocorrencia/carregar", {
            id: id,
            nomeFiltro: $("#nomeFiltro").val(),
            cpfFiltro: $("#cpfFiltro").val()
        });
    });
//	----------------------------------------------------------------

    $('.btn-excluir-ocorrencia').on("click", function () {
        var id = $(this).attr('data-id-ocorrencia');
        $('.btn-realiza-exclusao-ocorrencia').attr('data-id-ocorrencia', id);
        $('#modal-excluir-ocorrencia').modal('show');
    });
//	----------------------------------------------------------------

    $('.btn-realiza-exclusao-ocorrencia').on("click", function () {
        var id = $(this).attr('data-id-ocorrencia');
        $('#frm').attr('action', 'ocorrencia/remover?id=' + id);
        $('#frm').submit();
    });
}
);