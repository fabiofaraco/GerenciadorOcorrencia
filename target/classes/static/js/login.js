$(document).ready(function () {
    onload = function () {
        if ($("#error").val() !== "") {
            exibirMensagemErro($("#error").val());
        }
    };

    $("#btnLogin").on("click", function (e) {
        e.preventDefault;

        if (validaCampos()) {
            $("#frm").attr("action", "login");
            $("#frm").submit();
        }
    });

    $("#btnAutenticacao").on("click", function ()
    {
        $('#modal-autenticacao').modal('show');
    });

    $(".btn-autentica").on("click", function ()
    {
        $('#modal-autenticacao').modal('toggle');

        ajaxPostSubmit($("#contextPath").val() + "/protocolo/autenticar", {cdAuntenticacao: $("#cdAutenticacao").val()},
                function () {
                    errorDefault();
                },
                function (data) {
                    $(".load-img").fadeOut();
                    //alert(data);

                    $('#modal-autenticado').modal('toggle');
                }
        );
    });

    $(".btn-close-msg").on("click", function () {
        $("#success").fadeOut(1000);
        $("#danger").fadeOut(1000);
    });

    validaCampos = function () {
        if (!criticar({valor: $("#username").val(), mensagem: "Campo Obrigatório: E-mail"})) {
            return false;
        }

        if (!criticar({valor: $("#password").val(), mensagem: "Campo Obrigatório: Senha"})) {
            return false;
        }

        return true;
    };
});