$(document).ready(function () {

    $("#conteudo").on("click", ".cadRequerente #btnSalvarRequerente", function () {
        if (validaCampos()) {
            
            beforeSendDefult();
            
            ajaxPostSubmit("/requerente/salvar", $("form").serialize(),
                    function () {
                        beforeSendDefult();
                    },
                    function () {
                        errorDefault();
                    },
                    function (data) {
                        successDefault("/requerente/filtrar", data, {
                            nomeFiltro: $("#nome").val(),
                            cpfFiltro: $("#cpfRequerente").val()
                        });
                    }
            );
        }
    });

//  ----------------------------------------------------------------------------

    $("#conteudo").on("click", ".btn-close-msg", function () {
        $("#success").fadeOut(1000);
        $("#danger").fadeOut(1000);
    });

//  ----------------------------------------------------------------------------

    $("#conteudo").on("focusout", ".cadRequerente #cpfRequerente", function (e) {
        e.preventDefault();

        ajaxPost("/requerente/validaCpf", {cpf: $("#cpfRequerente").val(), id: $("#id").val()}, function (data) {
            if (data !== "") {
                $("#cpfRequerente").val("");
                exibirMensagemErro(data);
            }
        });
    });

//  ----------------------------------------------------------------------------

    $('#conteudo').on('change', ".cadRequerente #estadoCpf", function (e) {
        e.preventDefault();

        var idEstado = $('#estadoCpf').val();

        var select = $('#cidade');
        select.find('option').remove();
        $('<option>').val("").text("Selecione...").appendTo(select);

        ajaxPost("/requerente/carregaCidade", {idEstado: idEstado}, function (data) {
            if (data !== "") {
                $.each(JSON.parse(data), function (index, value) {
                    $('<option>').val(value.id).text(value.nome).appendTo(select);
                });
            }
        });
    });

//  ----------------------------------------------------------------------------

    var validaCampos = function ()
    {
        if (!criticar({valor: $("#nome").val(), mensagem: "Campo Obrigatório: Nome"}))
        {
            return false;
        }

        if (!criticar({valor: $("#cpfRequerente").val(), mensagem: "Campo Obrigatório: CPF"}))
        {
            return false;
        }

        if (!validarCPF($("#cpfRequerente").val()))
        {
            exibirMensagemErro("O CPF digitado não é válido.");
            return false;
        }

        if (!criticar({valor: $("#dataNascimento").val(), mensagem: "Campo Obrigatório: Data de Nascimento"}))
        {
            return false;
        }

        if (!validaData($("#dataNascimento").val()))
        {
            exibirMensagemErro("A Data de Nascimento digitada não é válida.");
            return false;
        }

        if (!criticar({valor: $("#email").val(), mensagem: "Campo Obrigatório: E-mail"}))
        {
            return false;
        }

        if (!isEmail($("#email").val()))
        {
            exibirMensagemErro("Endereço de e-mail inválido.");
            return false;
        }

        if (!criticar({valor: $("#logradouro").val(), mensagem: "Campo Obrigatório: Endereço"}))
        {
            return false;
        }

        if (!criticar({valor: $("#complemento").val(), mensagem: "Campo Obrigatório: Complemento"}))
        {
            return false;
        }

        if (!criticar({valor: $("#bairro").val(), mensagem: "Campo Obrigatório: Bairro"}))
        {
            return false;
        }

        if (!criticar({valor: $("#estadoCpf").val(), mensagem: "Campo Obrigatório: Estado"}))
        {
            return false;
        }

        if (!criticar({valor: $("#cidade").val(), mensagem: "Campo Obrigatório: Cidade"}))
        {
            return false;
        }

        if ($.trim($("#residencial").val()) === "" && $.trim($("#celular").val()) === "")
        {
            exibirMensagemErro("É obrigatório preencher o telefone residencial ou o telefone celular");
            return false;
        }

        return true;
    };
});


