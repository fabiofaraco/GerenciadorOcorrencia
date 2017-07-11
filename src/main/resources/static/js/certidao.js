$(document).ready(function () {
    $("#conteudo").on("click", ".certidao #btnGerarCertidao", function (e) {
        e.preventDefault();

        if (validaCampos()) {
            ajaxPostSubmit("/certidao/validarAutenticacao",
                    {
                        nrAutenticacao: $("#nrAutenticacao").val()
                    },
                    function () {
                        errorDefault();
                    },
                    function (data) {
                        $("#relatorioCertidao").html("");

                        if (data !== "") {
                            exibirMensagemErro(data);
                        } else {

                            $("#relatorioCertidao").append(
                                    '<object id="objPdf" data="/certidao/certidaoOcorrencia?nrAutenticacao=' + $("#nrAutenticacao").val()
                                    + '" type="application/pdf" width="100%" height="1230">'
                                    + '<p class="bg-success text-justify">Seu navegador não possui um plugin para exibir PDF.'
                                    + '<a href="/certidao/certidaoOcorrencia?nrAutenticacao=' + $("#nrAutenticacao").val() + '"> Clique aqui para realizar o download do arquivo.</a>'
                                    + '</p>'
                                    + '</object>');
                        }

                        $(".load-img").fadeOut();
                    });
        }
    });

    var validaCampos = function () {
        if (!criticar({valor: $("#nrAutenticacao").val(), mensagem: "Campo Obrigatório: Código de Autenticação"}))
        {
            return false;
        }

        return true;
    };
});