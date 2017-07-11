$(document).ready(function () {
    $("#btnLogin").on("click", function(e) {
        e.preventDefault;
        
        $("#frm").attr("action", "login");
        $("#frm").submit();
    });
});