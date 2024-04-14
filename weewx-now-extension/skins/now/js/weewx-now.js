async function loadJsonObj(fspath) {
    return (await fetch(fspath)).json();
}

function setChartHours(hours) {
    var dataset = document.chartData['last' + hours + 'hours'];
    chartWindspeed(dataset);
    chartWinddir(dataset);
    chartTempPressure(dataset);
    chartRain(dataset);
}
