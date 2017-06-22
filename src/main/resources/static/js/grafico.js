$(document).ready(function () {

    var grafico = null;

    var coresPadrao = [
        "#FFF665", "#4169E1", "#8B0000", "#228B22",
        "#D2691E", "#808000", "#8B008B", "#FF1493",
        "#FFD700", "#5F9EA0", "#3CB371", "#8B4513"
    ];

    $("#conteudo").on("click", ".graficos #btnFiltro", function (e) {
        e.preventDefault();

        ajaxPost("/grafico/filtroNaturezaPeriodo",
                {
                    dtInicio: $("#dtInicio").val(),
                    dtFim: $("#dtFim").val(),
                    tipoGrafico: $("#tipoGrafico").val()
                },
                function (data) {

                    if (data !== "") {
                        var obj = JSON.parse(data);
                        var dados = [];
                        var labels = [];
                        var cores = [];

                        for (var i = 0; i < obj.eixos.length; i++) {
                            dados[i] = obj.eixos[i][0];
                            labels[i] = obj.eixos[i][1];
                            cores[i] = coresPadrao[i];
                        }

                        var ctxBarLine = $("#charBarLine");
                        var ctxPie = $("#charPie");

                        if (grafico !== null) {
                            grafico.destroy();
                        }

                        if (obj.tipoGrafico === "bar" || obj.tipoGrafico === "line") {
                            $("#chartBarLine").css("display", "block");
                            $("#chartPie").css("display", "none");
                            grafico = new Chart(ctxBarLine, getConfig(dados, labels, cores, obj));
                        } else {
                            $("#chartBarLine").css("display", "none");
                            $("#chartPie").css("display", "block");
                            grafico = new Chart(ctxPie, getConfig(dados, labels, cores, obj));
                        }
                    }
                });
    });

    var getConfig = function (dados, labels, cores, obj) {
        var config;

        if (obj.tipoGrafico === "bar")
        {
            var color = Chart.helpers.color;
            config = {
                type: obj.tipoGrafico,
                data: {
                    datasets: [{
                            data: dados,
                            backgroundColor: color("rgb(153,0,0)").alpha(0.6).rgbString(),
                            borderColor: "rgb(153,0,0)",
                            label: "Natureza do Evento"
                        }],
                    labels: labels
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: {display: false, position: 'bottom'},
                    title: {display: true, text: obj.title},
                    animation: {animateScale: true, animateRotate: true},
                    scales: {
                        yAxes: [{
                                display: true, ticks: {
                                    beginAtZero: true,
                                    min: 0,
                                    suggestedMax: 10,
                                    stepSize: 1
                                }
                            }
                        ],
                        xAxes: [{ticks: {autoSkip: false, maxRotation: 90, minRotation: 90}}]
                    }
                }
            };
        } else if (obj.tipoGrafico === "line") {
            config = {
                type: obj.tipoGrafico,
                data: {
                    datasets: [{
                            data: dados,
                            backgroundColor: "#8B0000",
                            borderColor: "#8B0000",
                            label: "Natureza do Evento",
                            fill: false
                        }],
                    labels: labels

                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: {display: false, position: 'bottom'},
                    title: {display: true, text: obj.title},
                    tooltips: {mode: 'index', intersect: false},
                    hover: {mode: 'nearest', intersect: true},
                    animation: {animateScale: true, animateRotate: true},
                    scales: {
                        yAxes: [{
                                display: true, ticks: {
                                    beginAtZero: true,
                                    min: 0,
                                    suggestedMax: 10,
                                    stepSize: 1
                                }
                            }
                        ],
                        xAxes: [{ticks: {autoSkip: false, maxRotation: 90, minRotation: 90}}]
                    }
                }
            };
        } else {
            config = {
                type: obj.tipoGrafico,
                data: {
                    datasets: [{data: dados, backgroundColor: cores, label: "Natureza do Evento"}],
                    labels: labels
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: {position: 'bottom'},
                    title: {display: true, text: obj.title},
                    animation: {animateScale: true, animateRotate: true}
                }
            };
        }

        return config;
    };
});