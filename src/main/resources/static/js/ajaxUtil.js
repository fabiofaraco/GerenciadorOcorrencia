/* global moment */

$(document).ready(function () {
    var contextPath = $("#contextPath").val();

    ajaxLoad = function (url, parametros)
    {
        $(".load-img").fadeIn();
        $("#conteudo").load(contextPath + url, parametros, carregarScriptPagina);
    };

//  ----------------------------------------------------------------------------

    ajaxPostSubmit = function (url, parametros, fnBeforeSend, fnError, fnSuccess)
    {
        $.ajax({
            type: "POST",
            url: contextPath + url,
            data: parametros,
            dataType: "html",
            beforeSend: fnBeforeSend,
            error: fnError,
            success: fnSuccess
        });
    };

//  ----------------------------------------------------------------------------

    ajaxPost = function (url, parametros, fnSuccess)
    {
        $.ajax({
            type: "POST",
            url: contextPath + url,
            data: parametros,
            dataType: "html",
            error: function ()
            {
                errorDefault();
            },
            success: fnSuccess
        });
    };

//  ----------------------------------------------------------------------------

    beforeSendDefult = function ()
    {
        $(".load-img").fadeIn();
    };

//  ----------------------------------------------------------------------------

    successDefault = function (url, msg, parametros)
    {
        $("#conteudo").load(contextPath + url, parametros, function () {
            carregarScriptPagina();
            exibirMensagemSucesso(msg);
        });
    };

//  ----------------------------------------------------------------------------

    errorDefault = function (msgErro)
    {
        $(".load-img").fadeOut();

        if (msgErro === null || msgErro === undefined || $.trim(msgErro) === "")
        {
            exibirMensagemErro("Ocorreu um erro inesperado. Operação não realizada.");
        } else
        {
            exibirMensagemErro(msgErro);
        }
    };

//  ----------------------------------------------------------------------------

    function carregarScriptPagina()
    {
        $(".load-img").fadeOut();

        $(".data").datepicker({
            dateFormat: 'dd/mm/yy',
            dayNames: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
            dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S', 'D'],
            dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'],
            monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
            monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
            nextText: 'Próximo',
            prevText: 'Anterior',
            changeMonth: true,
            changeYear: true,
            yearRange: "c-100:c+20"
        });

        $('label.lbl-formata-data').each(function () {
            
        });

        $('input.data').each(function ()
        {
            
        });

        $('.mascara-hora').mask('99:99');
        $('.mascara-cpf').mask('999.999.999-99');
        $('.mascara-telefone').mask('(00) 0000-0000');
        $('.mascara-celular').mask('(00) 00000-0000');
    };
});