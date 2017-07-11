$(document).ready(function () {

    $("#conteudo").on("focusout", ".cadProtocolo #cpfRequerente", function (e) {

        e.preventDefault();

        if ($("#cpfRequerente").val() !== "") {

            ajaxPost("/protocolo/carregaRequerente",
                    {
                        cpf: $("#cpfRequerente").val()
                    },
                    function (data) {
                        var objRequerente = jQuery.parseJSON(data);

                        if (objRequerente !== null) {
                            $("#idRequerente").val(objRequerente.id);
                            $("#nomeRequerente").val(objRequerente.nome);
                        } else {
                            exibirMensagemErro("CPF do requerente inválido ou não encontrado.");
                            $("#idRequerente").val(0);
                            $("#nomeRequerente").val("");
                        }
                    }
            );
        }
    });

//  ----------------------------------------------------------------------------

    $("#conteudo").on("change", ".cadProtocolo #dataOcorrencia", function (e) {

        e.preventDefault();

        if ($("#dataOcorrencia").val() !== "") {

            if (validaData($("#dataOcorrencia").val()))
            {
                var select = $('#evento');
                select.find('option').remove();
                $('<option>').val("").text("Selecione...").appendTo(select);

                ajaxPost("/protocolo/carregaOcorrencia",
                        {
                            dataOcorrencia: $("#dataOcorrencia").val()
                        },
                        function (data)
                        {
                            if (data !== null) {
                                $.each(JSON.parse(data), function (index, ocorrencia) {
                                    $('<option>').val(ocorrencia.id)
                                            .text(ocorrencia.naturezaEvento.descricao
                                                    + " - " + ocorrencia.endereco.logradouro
                                                    + "," + ocorrencia.endereco.complemento
                                                    + "," + ocorrencia.endereco.bairro)
                                            .appendTo(select);

                                });
                            } else {
                                exibirMensagemErro("Nenhum ocorrência foi encontrada para esta data");
                                $("#nomeRequerente").val("");
                            }
                        }
                );
            } else
            {
                exibirMensagemErro("A Data de Nascimento digitada não é válida.");
                return false;
            }
        }
    });

//  ----------------------------------------------------------------------------

    $("#conteudo").on("click", ".cadProtocolo #btnSalvar", function () {
        if (validaCampos())
        {
            ajaxPostSubmit("/protocolo/salvar",
                    {
                        id: 0,
                        idOcorrencia: $("#evento").val(),
                        idRequerente: $("#idRequerente").val()
                    },
                    function () {
                        errorDefault();
                    },
                    function (data) {
                        successDefaultJson("/protocolo/filtrar", data, {
                            cpfRequerente: $("#cpfRequerente").val(),
                            codigoAutenticacao: ""
                        });
                    }
            );
        }
    });

//  ----------------------------------------------------------------------------

    var validaCampos = function ()
    {
        if (!criticar({valor: $("#cpfRequerente").val(), mensagem: "Campo Obrigatório: CPF do Requerente"}))
        {
            return false;
        }

        if (!criticar({valor: $("#evento").val(), mensagem: "Campo Obrigatório: Evento"}))
        {
            return false;
        }

        return true;
    };
});
