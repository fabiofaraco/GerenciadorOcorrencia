$(document).ready(function () {
    $('#conteudo').on("click", "#btnIncluirRequerente", function (e)
    {
        e.preventDefault();

        ajaxLoad("/requerente/cadastro");
    });

//  ----------------------------------------------------------------------------

    $("#conteudo").on("click", ".btn-alterar-requerente", function (e)
    {
        e.preventDefault();

        var id = $(this).attr('data-id-requerente');

        ajaxLoad("/requerente/carregar", {
            id: id,
            nomeFiltro: $("#nomeFiltro").val(),
            cpfFiltro: $("#cpfFiltro").val()
        });
    });

//  ----------------------------------------------------------------------------

    $("#conteudo").on("click", ".btn-excluir-requerente", function ()
    {
        var id = $(this).attr('data-id-requerente');
        var nome = $(this).attr("data-nome-requerente");

        $("#msgConfirmacao").html("Deseja excluir o requerente " + nome + "?");
        $('.btn-realiza-exclusao-requerente').attr('data-id-requerente', id);
        $('#modal-excluir-requerente').modal('show');
    });


//  ----------------------------------------------------------------------------

    $("#conteudo").on("click", ".btn-realiza-exclusao-requerente", function ()
    {
        var id = $(this).attr('data-id-requerente');

        ajaxPostSubmit("/requerente/remover", {id: id},
                function () {
                    $('#modal-excluir-requerente').modal('toggle');
                    beforeSendDefult();
                },
                function () {
                    var msgErro = "Não foi possível excluir o requerente. "
                            + "Verifique se ele já não está associado à uma ocorrência.";

                    errorDefault(msgErro);
                },
                function (data) {

                    successDefault("/requerente/filtrar", data, {
                        nomeFiltro: $("#nomeFiltro").val(),
                        cpfFiltro: $("#cpfFiltro").val()
                    });
                }
        );
    });

//  ----------------------------------------------------------------------------

    $("#conteudo").on("click", "#btnFiltroRequerente", function ()
    {
        if (validaFiltroRequerente())
        {
            ajaxLoad("/requerente/filtrar",
                    {
                        nomeFiltro: $("#nomeFiltro").val(),
                        cpfFiltro: $("#cpfFiltro").val()
                    });
        }
    });

//  ----------------------------------------------------------------------------

    $("#conteudo").on("click", "#aFiltroRequerente", function (e)
    {
        e.preventDefault();

        $("#aFiltroRequerente span").toggleClass("glyphicon glyphicon-menu-up");
        $("#aFiltroRequerente span").toggleClass("glyphicon glyphicon-menu-down");
    });

//  ----------------------------------------------------------------------------

    var validaFiltroRequerente = function ()
    {
        if ($.trim($("#nomeFiltro").val()) === ""
                && $.trim($("#cpfFiltro").val()) === "")
        {
            exibirMensagemErro("Ao menos um dos campos do filtro deve ser preenchido");
            return false;
        }

        if ($.trim($("#nomeFiltro").val()) !== "")
        {
            if ($.trim($("#nomeFiltro").val()).length < 3)
            {
                exibirMensagemErro("Digite ao menos três letras para realizar a consulta pelo nome.");
                return false;
            }
        }

        if ($.trim($("#cpfFiltro").val()) !== "")
        {
            if (!validarCPF($("#cpfFiltro").val()))
            {
                exibirMensagemErro("O CPF digitado não é válido.");
                return false;
            }
        }

        return true;
    };

//  ----------------------------------------------------------------------------

});