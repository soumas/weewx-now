function chartRain(dataset) {

    if (!document.chartRain) {
        document.chartRain = new Chart(document.getElementById('chart_rain'), {
            type: 'bar',
            options: {
                scales: {
                    x: {
                        ticks: {
                            display: true
                        }
                    },
                    y: {
                        suggestedMin: 0,
                        suggestedMax: 5,
                        type: 'linear',
                        position: 'left',
                        ticks: {
                            callback: function (value, index, ticks) {
                                return value.toFixed(2) + ' ' + dataset.rainRate.unitlabel;
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

    document.chartRain.data = {
        labels: dataset.rainRate.data.map(kv => new Date(kv[0] * 1000).toLocaleString([], { timeStyle: 'short' })),
        datasets: [
            { fill: true, borderColor: 'rgba(29,95,170,1)', backgroundColor: 'rgba(29,95,170,1)', label: dataset.rainRate.label, data: dataset.rainRate.data.map(kv => kv[1]) }
        ]
    };
    document.chartRain.update();
}