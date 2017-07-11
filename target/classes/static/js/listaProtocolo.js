$(document).ready(function () {
    $('#conteudo').on("click", ".protocolo #btnIncluir", function (e) {

        e.preventDefault();
        ajaxLoad("/protocolo/cadastro");
    });

//  ----------------------------------------------------------------------------

    $("#conteudo").on("click", ".protocolo #btnFiltro", function ()
    {
        if (validaFiltro())
        {
            ajaxLoad("/protocolo/filtrar",
                    {
                        cpfRequerente: $("#cpfRequerenteFiltro").val(),
                        codigoAutenticacao: $("#cdAutenticacao").val()
                    });
        }
    });


//  ----------------------------------------------------------------------------

    $("#conteudo").on("click", ".protocolo .btn-excluir-protocolo", function ()
    {
        var id = $(this).attr('data-id-protocolo');

        $("#msgConfirmacao").html("Deseja excluir o protocolo selecionado?");
        $('.btn-realiza-exclusao-protocolo').attr('data-id-protocolo', id);
        $('#modal-excluir-protocolo').modal('show');
    });


//  ----------------------------------------------------------------------------

    $("#conteudo").on("click", ".protocolo .btn-realiza-exclusao-protocolo", function ()
    {
        var id = $(this).attr('data-id-protocolo');

        $('#modal-excluir-protocolo').modal('toggle');

        ajaxPostSubmit("/protocolo/remover", {id: id},
                function () {
                    errorDefault();
                },
                function (data) {
                    successDefault("/protocolo/filtrar", data, {
                        cpfRequerente: $("#cpfRequerenteFiltro").val(),
                        codigoAutenticacao: $("#cdAutenticacao").val()
                    });
                }
        );
    });

//  ----------------------------------------------------------------------------

    $("#conteudo").on("click", ".protocolo #aFiltroProtocolo", function (e)
    {
        e.preventDefault();

        $("#aFiltroProtocolo span").toggleClass("glyphicon glyphicon-menu-up");
        $("#aFiltroProtocolo span").toggleClass("glyphicon glyphicon-menu-down");
    });

//  ----------------------------------------------------------------------------

    var validaFiltro = function ()
    {
        if ($.trim($("#cpfRequerenteFiltro").val()) === ""
                && $.trim($("#cdAutenticacao").val()) === "")
        {
            exibirMensagemErro("Ao menos um dos campos do filtro deve ser preenchido");
            return false;
        }

        if ($.trim($("#cpfRequerenteFiltro").val()) !== "")
        {
            if (!validarCPF($("#cpfRequerenteFiltro").val()))
            {
                exibirMensagemErro("O CPF digitado não é válido.");
                return false;
            }
        }

        return true;
    };

});