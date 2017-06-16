$(document).ready(function () {
    $("#conteudo").on("click", ".cadUsuario #btnSalvar", function () {
        if (validaCampos()) {
            ajaxPostSubmit("/usuario/salvar", $("form").serialize(),
                    function () {
                        beforeSendDefult();
                    },
                    function () {
                        errorDefault();
                    },
                    function (data) {
                        successDefault("/usuario/filtrar", data, {
                            nomeFiltro: $("#nome").val(),
                            cpfFiltro: $("#cpf").val()
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

    $("#conteudo").on("focusout", ".cadUsuario #cpf", function (e) {
        e.preventDefault();
        
        ajaxPost("/usuario/validaCpf", {cpf: $("#cpf").val(), id: $("#id").val()}, function (data) {
            if (data !== "") {
                $("#cpf").val("");
                exibirMensagemErro(data);
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

        if (!criticar({valor: $("#cpf").val(), mensagem: "Campo Obrigatório: CPF"}))
        {
            return false;
        }

        if (!validarCPF($("#cpf").val()))
        {
            exibirMensagemErro("O CPF digitado não é válido.");
            return false;
        }

        if (!criticar({valor: $("#perfil").val(), mensagem: "Campo Obrigatório: Perfil"}))
        {
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

        if (!criticar({valor: $("#senha").val(), mensagem: "Campo Obrigatório: Senha"}))
        {
            return false;
        }

        if (!criticar({valor: $("#confirmaSenha").val(), mensagem: "Campo Obrigatório: Confirmar Senha"}))
        {
            return false;
        }

        if (!criticarSenha({valor: $("#senha").val(), valorConfirma: $("#confirmaSenha").val()}))
        {
            return false;
        }

        return true;
    };

//  ----------------------------------------------------------------------------

    var criticarSenha = function (options)
    {
        if (options.valor.trim().length < 6 || options.valor.trim().length > 10)
        {
            exibirMensagemErro("A senha deve possuir no mínimo 6 e no máximo 10 digitos.");
            return false;
        }

        if (options.valor.trim() !== options.valorConfirma.trim())
        {
            exibirMensagemErro("As senhas digitadas não conferem.");
            return false;
        }

        return true;
    };
});	