function chartWinddir(dataset) {

    if (!document.chartWinddir) {
        document.chartWinddir = new Chart(document.getElementById('chart_winddir'), {
            type: 'radar',
            options: {
                responsive: true,
                plugins: {
                    legend: { 
                        display: false
                    },
                },
                scales: {
                    r: {
                        pointLabels: {
                            display: true
                        },
                        ticks: {
                            display: false
                        },
                    }
                },
                elements: {
                    line: {
                        borderWidth: 3
                    }
                }
            }
        });
    }

    var directionLabel = ['N', '', '', '', 'E', '', '', '', 'S', '', '', '', 'W', '', '', ''];
    var directionSums = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    dataset.windDir.data.map(kv => kv[1]).forEach((val) => {
        directionSums[Math.floor(val / (360 / 16))]++;
    });

    document.chartWinddir.data = {
        labels: directionLabel,
        datasets: [{
            borderColor: 'rgba(197,47,73,0.8)',
            backgroundColor: 'rgba(197,47,73,0.8)',
            data: directionSums,
            label: "Windrichtung",
            fill: true
        }]
    };
    document.chartWinddir.update();
}