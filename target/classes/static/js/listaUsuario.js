$(document).ready(function () {
    $('#conteudo').on("click", ".listaUsuario #btnIncluirUsuario", function (e)
    {
        e.preventDefault();
        ajaxLoad("/usuario/cadastro", null);
    });

//  ----------------------------------------------------------------	

    $("#conteudo").on("click", ".listaUsuario .btn-alterar", function (e)
    {
        e.preventDefault();
        var id = $(this).attr('data-id-usuario');
        ajaxLoad("/usuario/carregar",
                {
                    id: id,
                    nomeFiltro: $("#nomeFiltro").val(),
                    cpfFiltro: $("#cpfFiltro").val()
                });
    });

//  ----------------------------------------------------------------	

    $("#conteudo").on("click", ".listaUsuario .btn-excluir", function (e)
    {
        e.preventDefault();
        var id = $(this).attr('data-id-usuario');
        var nome = $(this).attr("data-nome-usuario");

        $("#msgConfirmacao").html("Deseja excluir o usuário " + nome + "?");
        $('.btn-realiza-exclusao-usuario').attr('data-id-usuario', id);
        $('#modal-excluir-usuario').modal('show');
    });


//  ----------------------------------------------------------------

    $("#conteudo").on("click", ".listaUsuario .btn-realiza-exclusao-usuario", function (e)
    {
        e.preventDefault();

        var id = $(this).attr('data-id-usuario');

        $('#modal-excluir-usuario').modal('toggle');
        beforeSendDefult();

        ajaxPostSubmit("/usuario/remover", {id: id},
                function ()
                {
                    beforeSendDefult();
                },
                function ()
                {
                    errorDefault();
                },
                function (data)
                {
                    successDefault("/usuario/filtrar", data,
                            {
                                nomeFiltro: $("#nomeFiltro").val(),
                                cpfFiltro: $("#cpfFiltro").val()
                            });
                }
        );
    });

//  ----------------------------------------------------------------	

    $("#conteudo").on("click", ".listaUsuario #btnFiltro", function (e)
    {
        e.preventDefault();

        if (validaFiltroUsuario())
        {
            ajaxLoad("/usuario/filtrar",
                    {
                        nomeFiltro: $("#nomeFiltro").val(),
                        cpfFiltro: $("#cpfFiltro").val()
                    });
        }
    });

//  ----------------------------------------------------------------	

    $("#conteudo").on("click", ".listaUsuario #aFiltroUsuario", function (e)
    {
        e.preventDefault();

        $("#aFiltroUsuario span").toggleClass("glyphicon glyphicon-menu-up");
        $("#aFiltroUsuario span").toggleClass("glyphicon glyphicon-menu-down");
    });

//  ----------------------------------------------------------------	

    var validaFiltroUsuario = function ()
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
});