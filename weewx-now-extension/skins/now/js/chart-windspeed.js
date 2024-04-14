function chartWindspeed(dataset) {

    if (!document.chartWindspeed) {
        document.chartWindspeed = new Chart(document.getElementById('chart_windspeed'), {
            type: "line",
            options: {
                responsive: true,
                scales: {
                    x: {
                        stacked: true,
                        ticks: {
                            display: true
                        }
                    },
                    y: {
                        beginAtZero: true,
                        min: 0,
                        suggestedMax: 30,
                        ticks: {
                            callback: function(value, index, ticks) {
                                return  value.toFixed(2) + ' ' + dataset.windSpeed.unitlabel;
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
            },
        });
    }    
    
    document.chartWindspeed.data = {
        labels: dataset.windSpeed.data.map(kv => new Date(kv[0] * 1000).toLocaleString([],{timeStyle:'short'})),
        datasets: [
            { backgroundColor: "rgba(29,95,170,1)", fill:true, label: dataset.windSpeed.label, data: dataset.windSpeed.data.map(kv => kv[1]) },
            { backgroundColor: "rgba(197,47,73,0.8)", fill:true, label: dataset.windGust.label, data: dataset.windGust.data.map(kv => kv[1]) }
        ]
    };
    document.chartWindspeed.update();
}