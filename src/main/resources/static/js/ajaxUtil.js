/* global moment */

$(document).ready(function () {

    var contextPath = $("#contextPath").val();
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

//  ----------------------------------------------------------------------------

    ajaxLoad = function (url, parametros) {
        beforeSendDefult();

        $.ajax({
            type: "POST",
            url: contextPath + url,
            data: parametros,
            dataType: "html",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            error: function () {
                errorDefault();
            },
            success: function (html) {
                $("#conteudo").html(html);
                carregarScriptPagina();
            }
        });

    };
//  ----------------------------------------------------------------------------

    ajaxPostSubmit = function (url, parametros, fnError, fnSuccess) {
        beforeSendDefult();

        setTimeout(function () {
            $.ajax({
                type: "POST",
                url: contextPath + url,
                data: parametros,
                dataType: "html",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                error: fnError,
                success: fnSuccess
            });
        }, 500);
    };

//  ----------------------------------------------------------------------------

    ajaxPost = function (url, parametros, fnSuccess) {
        $.ajax({
            type: "POST",
            url: contextPath + url,
            data: parametros,
            dataType: "html",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            error: function () {
                errorDefault();
            },
            success: fnSuccess
        });
    };

//  ----------------------------------------------------------------------------

    beforeSendDefult = function () {
        $(".load-img").fadeIn();
    };

//  ----------------------------------------------------------------------------

    successDefault = function (url, msg, parametros) {
        $.ajax({
            type: "POST",
            url: contextPath + url,
            data: parametros,
            dataType: "html",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            error: function () {
                errorDefault();
            },
            success: function (html) {
                $("#conteudo").html(html);
                carregarScriptPagina();
                exibirMensagemSucesso(msg);
            }
        });
    };

//  ----------------------------------------------------------------------------

    successDefaultJson = function (url, msg, parametros) {
        var objMsg = JSON.parse(msg);
        var MSG_SUCESSO = 1;

        if (objMsg.id === MSG_SUCESSO) {
            $.ajax({
                type: "POST",
                url: contextPath + url,
                data: parametros,
                dataType: "html",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                error: function () {
                    errorDefault();
                },
                success: function (html) {
                    $("#conteudo").html(html);
                    carregarScriptPagina();
                    exibirMensagemSucesso(objMsg.mensagem);
                }
            });
        } else {
            $(".load-img").fadeOut();
            exibirMensagemErro(objMsg.mensagem);
        }
    };

//  ----------------------------------------------------------------------------

    errorDefault = function (msgErro) {
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

    carregarScriptPagina = function () {
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
            if ($(this).html() !== "") {
                var anoMesDia = $(this).html().split("-");

                $(this).html($.datepicker.formatDate('dd/mm/yy',
                        new Date(anoMesDia[0], anoMesDia[1] - 1, anoMesDia[2])));
            }
        });

        $('input.data').each(function () {
            if ($(this).val() !== "") {
                var anoMesDia = $(this).val().split("-");

                $(this).val($.datepicker.formatDate('dd/mm/yy',
                        new Date(anoMesDia[0], anoMesDia[1] - 1, anoMesDia[2])));
            }
        });

        $('.mascara-data').mask('99/99/9999');
        $('.mascara-hora').mask('99:99');
        $('.mascara-cpf').mask('999.999.999-99');
        $('.mascara-telefone').mask('(00) 0000-0000');
        $('.mascara-celular').mask('(00) 00000-0000');
    };
});