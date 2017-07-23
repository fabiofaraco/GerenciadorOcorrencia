$(document).ready(function () {
    onload = function () {
        formataLabelData();
    };

    $("#btnLogin").on("click", function (e) {
        e.preventDefault;
        
        $(".load-img").fadeIn();
        $("#frm").attr("action", "voltarLogin");
        $("#frm").submit();
    });
});