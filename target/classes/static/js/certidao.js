$(document).ready(function () {
    $("#conteudo").on("click", ".certidao #btnGerarCertidao", function () {
        window.open("/certidao/gerarCertidao", "Relatório", "width=800, height=600");
        
    });
});