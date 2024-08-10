function chartTempPressure(dataset) {

    if (!document.chartTempPressure) {
        document.chartTempPressure = new Chart(document.getElementById('chart_temp_pressure'), {
            type: "line",
            options: {
                scales: {
                    x: {
                        ticks: {
                            display: true
                        }
                    },
                    yTemperature: {
                        position: 'left',
                        type: 'linear',
                        display: true,
                        suggestedMin: 0,
                        suggestedMax: 40,
                        ticks: {
                            callback: function (value, index, ticks) {
                                return value.toFixed(2) + ' ' + dataset.outTemp.unitlabel;
                            }
                        }
                    },
                    yPressure: {
                        position: 'right',
                        type: 'linear',
                        display: true,
                        suggestedMin: 980,
                        suggestedMax: 1040,
                        ticks: {
                            callback: function (value, index, ticks) {
                                return value.toFixed(2) + ' ' + dataset.barometer.unitlabel;
                            }
                        }
                    }
                },
                plugins: {
                    legend: {
                        display: true,
                        position: 'bottom'
                    }
                }
            }
        });
    }

    document.chartTempPressure.data = {
        labels: dataset.outTemp.data.map(kv => new Date(kv[0] * 1000).toLocaleString([], { timeStyle: 'short' })),
        datasets: [
            { yAxisID: 'yTemperature', borderColor: 'rgba(197,47,73,0.8)', backgroundColor: 'rgba(197,47,73,0.8)', label: dataset.outTemp.label, data: dataset.outTemp.data.map(kv => kv[1]) },
            { yAxisID: 'yPressure', borderColor: 'rgba(29,95,170,1)', backgroundColor: 'rgba(29,95,170,1)', label: dataset.barometer.label, data: dataset.barometer.data.map(kv => kv[1]) }
        ]
    };
    document.chartTempPressure.update();
}