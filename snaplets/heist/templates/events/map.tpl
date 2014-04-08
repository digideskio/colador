<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>Colador</title>
<script src="/static/js/d3.v3.min.js"></script>
<style>
  body { background-image: url('/static/sea.gif') }
  .container { 
      margin: auto;
      width: 1250px;
  }
</style>
</head>
<body>
<div class='container'>
<svg width=1250 height=900>
  <image xlink:href='/static/LAMap-grid.gif' x='0' y='0' width='1200' height='800' transform='translate(20,0)' />
  <image xlink:href='/static/centralamerica-inset.gif' x='0' y='500' width='401' height='323'/>
  <events>
    <a xlink:href='${eventLink}'>
      <image xlink:href='/static/nature2.gif' title='${eventTitle}' x='${eventX}' y='${eventY}' 
	     class='event' data-startYear='${eventStart}' data-endYear='${eventEnd}' width='20' height='20'/>
    </a>
  </events>
</svg>
</div>
<link href="/static/css/slider.css" media="all" rel="stylesheet" type="text/css" />
<script>
  var showEvents = function(year) {
    console.log("show events " + year);
  };

  var sliderConf = {left: 262, width: 800, top: 66, height: 30, minYear: 1491, maxYear: 2020, callback: showEvents};
</script>
<script src="/static/js/slider.js"></script>
</body>
</html>
