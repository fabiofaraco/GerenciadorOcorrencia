/* global carregarScriptPagina */

$(document).ready(function () {

    onload = function () {
        
        limparMenuAtivo();

        if ($("#aUsuario").attr("data-selected")) {
            $('#liUsuario').addClass('active');
            ajaxLoad("/usuario/lista", null);
        } else if ($("#aRequerente").attr("data-selected")) {
            $('#liRequerente').addClass('active');
            ajaxLoad("/requerente/lista", null);
        } else if ($("#aOcorrencia").attr("data-selected")) {
            $('#liOcorrencia').addClass('active');
            ajaxLoad("/ocorrencia/lista", null);
        } else if ($("#aProtocolo").attr("data-selected")) {
            $('#liProtocolo').addClass('active');
            ajaxLoad("/protocolo/lista", null);
        } else if ($("#aCertidao").attr("data-selected")) {
            $('#aCertidao').addClass('active');
            ajaxLoad("/certidao/", null);
        } else if ($("#aGrafico").attr("data-selected")) {
            $('#liGrafico').addClass('active');
            ajaxLoad("/grafico/filtro", null);
        }
    };


    limparMenuAtivo = function ()
    {
        $('#liUsuario').removeClass('active');
        $('#liRequerente').removeClass('active');
        $('#liOcorrencia').removeClass('active');
        $('#liProtocolo').removeClass('active');
        $('#liCertidao').removeClass('active');
        $('#liGrafico').removeClass('active');
    };

    $("#aUsuario").on("click", function () {

        limparMenuAtivo();
        $('#liUsuario').addClass('active');
        ajaxLoad("/usuario/lista", null);
    });

    $("#aRequerente").on("click", function () {

        limparMenuAtivo();
        $('#liRequerente').addClass('active');
        ajaxLoad("/requerente/lista", null);
    });

    $("#aOcorrencia").on("click", function () {

        limparMenuAtivo();
        $('#liOcorrencia').addClass('active');
        ajaxLoad("/ocorrencia/lista", null);
    });

    $("#aProtocolo").on("click", function () {

        limparMenuAtivo();
        $('#liProtocolo').addClass('active');
        ajaxLoad("/protocolo/lista", null);
    });

    $("#aCertidao").on("click", function () {

        limparMenuAtivo();
        $('#aCertidao').addClass('active');
        ajaxLoad("/certidao/", null);
    });

    $("#aGrafico").on("click", function () {

        limparMenuAtivo();
        $('#liGrafico').addClass('active');
        ajaxLoad("/grafico/filtro", null);
    });

    $("#aLogout").on("click", function (e) {
        e.preventDefault;

        $("#frm").attr("action", "logout");
        $("#frm").submit();
    });

});


