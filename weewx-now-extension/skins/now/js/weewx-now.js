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


async function initImages(maxImageCount) {
      
    const imageData = await loadJsonObj('nowImageIndex.json');

    const splide = new Splide('.splide', {
      direction: 'rtl'}).mount();

    imageData.images.sort(compareDate);
    for(i = 0; i < maxImageCount; i++) {
      var tmplHtml = document.getElementById('slide-template').innerHTML;
      tmplHtml = tmplHtml.replace('%img%', 'images/webcam/' + imageData.images[i].data);
      tmplHtml = tmplHtml.replace('%timestamp%', new Date(imageData.images[i].date * 1000).toLocaleString());
      splide.add(tmplHtml);
    }
}

function compareDate(a,b) {
    if ( a.date < b.date ){
      return 1;
    }
    if ( a.date > b.date ){
      return -1;
    }
    return 0;
}
