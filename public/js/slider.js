var x = d3.scale.linear()
  .domain([sliderConf.minYear, sliderConf.maxYear])
  .range([0, sliderConf.width])
  .clamp(true);

function clampYear(year) {
  return Math.min(sliderConf.maxYear, Math.max(sliderConf.minYear, year));
}

var hashYear =  parseInt(location.hash.substr(1)) || 0;
var startYear = clampYear(hashYear);

var brush = d3.svg.brush()
  .x(x)
  .extent([startYear, startYear])
  .on("brush", brushed)
  .on("brushend", brushEnded);

var svg = d3.select("svg")
  .append("g")
  .attr("transform", "translate("+sliderConf.left+","+sliderConf.top+")");

svg.append("g")
  .attr("class", "x axis")
  .attr("transform", "translate(0,0)")
  .call(d3.svg.axis()
	.scale(x)
	.orient("bottom")
	.ticks(10)
	.tickPadding(4)
	.tickSize(0)
	.tickFormat(function(d) { return d; }));

var slider = svg.append("g")
  .attr("class", "slider")
  .call(brush);

var year = slider.append("text")
  .attr("class","year")
  .attr("transform", "translate(0,-12)");

var handle = slider.append("rect")
  .attr("class", "handle")
  .attr("width", 8).attr("height", 13)
  .attr("rx", 3).attr("ry", 3)
  .attr("transform", "translate(-4,-7)");

slider.call(brush.event);

slider.selectAll(".extent,.resize").remove();
slider.select(".background").attr("height",sliderConf.height).attr("transform", "translate(0,-"+sliderConf.height/2+")");

function brushed() {
  var value = brush.extent()[0];

  if (d3.event.sourceEvent) { // not a programmatic event
    value = x.invert(d3.mouse(this)[0]);
    brush.extent([value, value]);
  }

  var roundvalue = Math.round(value);
  handle.attr("x", x(value));
  year.text(roundvalue);
  sliderConf.callback(roundvalue);
}

function brushEnded() {
  var value = brush.extent()[0];

  if (d3.event.sourceEvent) { // not a programmatic event
    value = x.invert(d3.mouse(this)[0]);
    brush.extent([value, value]);
  }

  location.hash = Math.round(value);
}
