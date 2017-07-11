$(document).ready(function () {

    $('#conteudo').on("click", ".listaOcorrencia #btnIncluirOcorrencia", function (e) {
        e.preventDefault();
        ajaxLoad("/ocorrencia/cadastro");
    });

//  ----------------------------------------------------------------------------

    $("#conteudo").on("click", ".listaOcorrencia .btn-alterar-ocorrencia", function (e) {
        e.preventDefault();

        var id = $(this).attr('data-id-ocorrencia');

        ajaxLoad("/ocorrencia/carregar", {
            id: id,
            naturezaEvento: $("#naturezaEventoFiltro").val(),
            dataOcorrencia: $("#dataOcorrenciaFiltro").val()
        });
    });

//  ----------------------------------------------------------------------------

    $("#conteudo").on("click", ".listaOcorrencia .btn-excluir-ocorrencia", function (e) {
        e.preventDefault();

        var id = $(this).attr('data-id-ocorrencia');

        $("#msgConfirmacao").html("Deseja excluir o evento Nª " + id + "?");
        $('.btn-realiza-exclusao-ocorrencia').attr('data-id-ocorrencia', id);
        $('#modal-excluir-ocorrencia').modal('show');
    });

//  ----------------------------------------------------------------------------

    $("#conteudo").on("click", ".listaOcorrencia .btn-realiza-exclusao-ocorrencia", function (e) {
        e.preventDefault();

        var id = $(this).attr('data-id-ocorrencia');

        $('#modal-excluir-ocorrencia').modal('toggle');
        
        ajaxPostSubmit("/ocorrencia/remover", {id: id},
                function () {
                    var msgErro = "Não foi possível excluir a ocorrência. "
                            + "Verifique se ela já não está associado à um requerente.";

                    errorDefault(msgErro);
                },
                function (data) {

                    successDefaultJson("/ocorrencia/filtrar", data, {
                        id: $("#idFiltro").val() === "" ? 0 : $("#idFiltro").val(),
                        idNaturezaEvento: $("#naturezaEventoFiltro").val(),
                        dataOcorrencia: $("#dataOcorrenciaFiltro").val()
                    });
                }
        );
    });

//  ----------------------------------------------------------------------------

    $("#conteudo").on("click", ".listaOcorrencia #btnFiltroOcorrencia", function ()
    {
        if (validaFiltroOcorrencia())
        {
            ajaxLoad("/ocorrencia/filtrar",
                    {
                        id: $("#idFiltro").val() === "" ? 0 : $("#idFiltro").val(),
                        idNaturezaEvento: $("#naturezaEventoFiltro").val(),
                        dataOcorrencia: $("#dataOcorrenciaFiltro").val()
                    });
        }
    });

//  ----------------------------------------------------------------------------

    var validaFiltroOcorrencia = function ()
    {
        if ($.trim($("#naturezaEventoFiltro").val()) === "0"
                && $.trim($("#dataOcorrenciaFiltro").val()) === ""
                && $.trim($("#idFiltro").val()) === "")
        {
            exibirMensagemErro("Ao menos um dos campos do filtro deve ser preenchido");
            return false;
        }

        if ($.trim($("#dataOcorrenciaFiltro").val()) !== "")
        {
            if (!validaData($("#dataOcorrenciaFiltro").val()))
            {
                exibirMensagemErro("A Data da Ocorrência digitada não é válida.");
                return false;
            }
        }

        return true;
    };

    $("#conteudo").on("click", "#aFiltroOcorrencia", function (e)
    {
        e.preventDefault();

        $("#aFiltroOcorrencia span").toggleClass("glyphicon glyphicon-menu-up");
        $("#aFiltroOcorrencia span").toggleClass("glyphicon glyphicon-menu-down");
    });
});