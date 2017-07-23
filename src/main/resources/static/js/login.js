$(document).ready(function () {
    onload = function () {
        if ($("#error").val() !== "") {
            exibirMensagemErro($("#error").val());
        }
        
        $(".load-img").fadeOut();
    };

//  ----------------------------------------------------------------------------

    $("#btnLogin").on("click", function (e) 
    {
        e.preventDefault;

        if (validaCampos()) {
            $(".load-img").fadeIn();
            $("#frm").attr("action", "login");
            $("#frm").submit();
        }
    });

//  ----------------------------------------------------------------------------

    $("#btnAutenticacao").on("click", function ()
    {
        $("#cdAutenticacao").val("");
        $("#msgErroAutenticacao").html("");
        $('#modal-autenticacao').modal('show');
    });

//  ----------------------------------------------------------------------------

    $("#btnGerarCertidao").on("click", function ()
    {
        $("#cdAutenticacaoCertidao").val("");
        $("#relatorioCertidao").html("");
        $('#modal-autenticacao-certidao').modal('show');
    });

//  ----------------------------------------------------------------------------

    $("#btnEsqueceuSenha").on("click", function ()
    {
        $("#emailRedefinicao").val("");
        $("#msgErroRedefinir").html("");
        $('#modal-redefinir-senha').modal('show');
    });

//  ----------------------------------------------------------------------------

    $(".btn-autentica").on("click", function ()
    {
        $("#msgErroAutenticacao").html("");
        
        if ($.trim($("#cdAutenticacao").val()) !== "") {
            ajaxPostSubmit($("#contextPath").val() + "/protocolo/autenticar", {cdAuntenticacao: $("#cdAutenticacao").val()},
                    function () {
                        errorDefault();
                    },
                    function (data) {
                        $(".load-img").fadeOut();
                        
                        if (data !== null && data !== "") {
                            $("#cdAutenticacao").val("");
                            $('#modal-autenticacao').modal('toggle');
                            
                            var resposta = JSON.parse(data);
                            
                            $("#lblDataOcorrencia").html(formataData(resposta.obj.ocorrencia.dataOcorrencia));
                            $("#lblHoraOcorrencia").html(resposta.obj.ocorrencia.horaOcorrencia);
                            $("#lblNomeRequerente").html(resposta.obj.requerente.nome);
                            $("#lblCpfRequerente").html(resposta.obj.requerente.cpf);

                            $("#lblEventoOcorrencia").html(resposta.obj.ocorrencia.id);
                            $("#lblNaturezaOcorrencia").html(resposta.obj.ocorrencia.naturezaEvento.descricao);
                            $("#lblResponsavelOcorrencia").html(resposta.obj.ocorrencia.responsavel);

                            $("#lblEnderecoOcorrencia").html(resposta.obj.ocorrencia.endereco.logradouro
                                    + ", " + resposta.obj.ocorrencia.endereco.complemento);
                            $("#lblBairroOcorrencia").html(resposta.obj.ocorrencia.endereco.bairro);
                            $("#lblCidadeOcorrencia").html(resposta.obj.ocorrencia.endereco.cidade.nome);
                            $("#lblEstadoOcorrencia").html(resposta.obj.ocorrencia.endereco.cidade.estado.sigla);

                            $('#modal-autenticado').modal('toggle');
                        } else {
                            $("#msgErroAutenticacao").append(
                                    '<br/><p class="text-danger">'
                                    + 'O número de autenticação digitado não foi encontrado'
                                    + '</p>');
                        }
                    }
            );
        } else {
            $("#msgErroAutenticacao").append(
                    '<br/><p class="text-danger">'
                    + 'Campo Obrigatório: Código de Autenticação'
                    + '</p>');
        }
    });

//  ----------------------------------------------------------------------------

    $(".btn-close-msg").on("click", function () 
    {
        $("#success").fadeOut(1000);
        $("#danger").fadeOut(1000);
    });

//  ----------------------------------------------------------------------------

    validaCampos = function () 
    {
        if (!criticar({valor: $("#username").val(), mensagem: "Campo Obrigatório: E-mail"})) {
            return false;
        }

        if (!criticar({valor: $("#password").val(), mensagem: "Campo Obrigatório: Senha"})) {
            return false;
        }

        return true;
    };

//  ----------------------------------------------------------------------------

    $(".btn-gerar").on("click", function (e) 
    {
        e.preventDefault();

        $("#relatorioCertidao").html("");

        if ($.trim($("#cdAutenticacaoCertidao").val()) !== "") {
            ajaxPostSubmit("/certidao/validarAutenticacao",
                    {
                        nrAutenticacao: $("#cdAutenticacaoCertidao").val()
                    },
                    function () {
                        errorDefault();
                    },
                    function (data) {
                        $("#relatorioCertidao").html("");

                        if (data !== "") {
                            $("#relatorioCertidao").append(
                                    '<br/><p class="text-danger">'
                                    + 'Código de autenticação digitado não encontrado'
                                    + '</p>');
                        } else {

                            $("#relatorioCertidao").append(
                                    '<br/><p class="bg-default">'
                                    + '<a download="certidao" href="/certidao/certidaoOcorrencia?nrAutenticacao='
                                    + $("#cdAutenticacaoCertidao").val() + '">  Clique aqui para realizar o download da certidão</a>'
                                    + '</p>');
                        }

                        $(".load-img").fadeOut();
                    });
        } else {
            $("#relatorioCertidao").append(
                    '<br/><p class="text-danger">'
                    + 'Campo Obrigatório: Código de Autenticação'
                    + '</p>');
        }
    });
    
//  ----------------------------------------------------------------------------

    $(".btn-redefinir").on("click", function (e) 
    {
        e.preventDefault();

        $("#msgErroRedefinir").html("");

        if ($.trim($("#emailRedefinicao").val()) !== "") {
            ajaxPostSubmit("/redefinirSenha",
                    {
                        email: $("#emailRedefinicao").val()
                    },
                    function () {
                        errorDefault();
                    },
                    function (data) {
                        $("#msgErroRedefinir").html("");

                        if (data === "1") {
                            $("#msgErroRedefinir").append(
                                    '<br/><p class="text-danger">'
                                    + 'Endereço de e-mail não encontrado'
                                    + '</p>');
                        } else if (data === "2") {

                            $("#msgErroRedefinir").append(
                                    '<br/><p class="text-danger">'
                                    + 'Ocorreu um erro inesperado ao enviar o e-mail.'
                                    + '</p>');
                        } else {
                            $("#msgErroRedefinir").append(
                                    '<br/><p class="text-success">'
                                    + 'Sua senha foi redefinida. Um e-mail com a nova senha foi enviado.'
                                    + '</p>');
                        }

                        $(".load-img").fadeOut();
                    });
        } else {
            $("#msgErroRedefinir").append(
                    '<br/><p class="text-danger">'
                    + 'Campo Obrigatório: E-mail'
                    + '</p>');
        }
    });
});