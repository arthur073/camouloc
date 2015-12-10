/*//////////////////////////////////////////////////////////
////////////////// Extra Functions /////////////////////////
//////////////////////////////////////////////////////////*/

/*Returns an event handler for fading a given chord group*/
function fade(opacity) {
  return function(d, i) {
    svg.selectAll("path.chord")
        .filter(function(d) { return d.source.index != i && d.target.index != i; })
		.transition()
        .style("stroke-opacity", opacity)
        .style("fill-opacity", opacity);
  };
};/*fade*/

/*Returns an array of tick angles and labels, given a group*/
function groupTicks(d) {
  var k = (d.endAngle - d.startAngle) / d.value;
  return d3.range(0, d.value, 1).map(function(v, i) {
    return {
      angle: v * k + d.startAngle,
      label: i % 5 ? null : v + "%"
    };
  });
};/*groupTicks*/

/*Taken from https://groups.google.com/forum/#!msg/d3-js/WC_7Xi6VV50/j1HK0vIWI-EJ
//Calls a function only after the total transition ends*/
function endall(transition, callback) { 
    var n = 0; 
    transition 
        .each(function() { ++n; }) 
        .each("end", function() { if (!--n) callback.apply(this, arguments); }); 
};/*endall*/ 

/*Taken from http://bl.ocks.org/mbostock/7555321
//Wraps SVG text*/
function wrap(text, width) {
    var text = d3.select(this[0][0]),
        words = text.text().split(/\s+/).reverse(),
        word,
        line = [],
        lineNumber = 0,
        lineHeight = 1.4, 
        y = text.attr("y"),
		x = text.attr("x"),
        dy = parseFloat(text.attr("dy")),
        tspan = text.text(null).append("tspan").attr("x", x).attr("y", y).attr("dy", dy + "em");
		
    while (word = words.pop()) {
      line.push(word);
      tspan.text(line.join(" "));
      if (tspan.node().getComputedTextLength() > width) {
        line.pop();
        tspan.text(line.join(" "));
        line = [word];
        tspan = text.append("tspan").attr("x", x).attr("y", y).attr("dy", ++lineNumber * lineHeight + dy + "em").text(word);
      };
    };  
};

/*Transition the top circle text*/
function changeTopText (newText, loc, delayDisappear, delayAppear, finalText, xloc, w) {

	/*If finalText is not provided, it is not the last text of the Draw step*/
	if(typeof(finalText)==='undefined') finalText = false;
	
	if(typeof(xloc)==='undefined') xloc = 0;
	if(typeof(w)==='undefined') w = 350;
	
	middleTextTop	
		/*Current text disappear*/
		.transition().delay(700 * delayDisappear).duration(700)
		.attr('opacity', 0)	
		/*New text appear*/
		.call(endall,  function() {
			middleTextTop.text(newText)
			.attr("y", -24*loc + "px")
			.attr("x", xloc + "px")
			.call(wrap, w);	
		})
		.transition().delay(700 * delayAppear).duration(700)
		.attr('opacity', 1)
		.call(endall,  function() {
			if (finalText == true) {
				d3.select("#clicker")
					.text(buttonTexts[counter-2])
					.style("pointer-events", "auto")
					.transition().duration(400)
					.style("border-color", "#363636")
					.style("color", "#363636");
				};
		});
};/*changeTopText */

/*Transition the bottom circle text*/
function changeBottomText (newText, loc, delayDisappear, delayAppear) {
	middleTextBottom
		/*Current text disappear*/
		.transition().delay(700 * delayDisappear).duration(700)
		.attr('opacity', 0)
		/*New text appear*/
		.call(endall,  function() {
			middleTextBottom.text(newText)
			.attr("y", 24*loc + "px")
			.call(wrap, 350);	
		})
		.transition().delay(700 * delayAppear).duration(700)
		.attr('opacity', 1);
;}/*changeTopText*/

/*Stop clicker from working*/
function stopClicker() {
	d3.select("#clicker")
		.style("pointer-events", "none")
		.transition().duration(400)
		.style("border-color", "#D3D3D3")
		.style("color", "#D3D3D3");
};/*stopClicker*/

/*Run the progress bar during an animation*/
function runProgressBar(time) {	
	
	/*Make the progress div visible*/
	d3.selectAll("#progress")
		.style("visibility", "visible");
	
	/*Linearly increase the width of the bar
	//After it is done, hide div again*/
	d3.selectAll(".prgsFront")
		.transition().duration(time).ease("linear")
		.attr("width", prgsWidth)
		.call(endall,  function() {
			d3.selectAll("#progress")
				.style("visibility", "hidden");
		});
	
	/*Reset to zero width*/
	d3.selectAll(".prgsFront")
		.attr("width", 0);
		
};/*runProgressBar*/	

	
/*//////////////////////////////////////////////////////////
/////////////// Initiate Chord Diagram /////////////////////
//////////////////////////////////////////////////////////*/

var margin = {top: 60, right: 10, bottom: 60, left: 10},
	width = 600 - margin.left - margin.right,
    height = 400 - margin.top - margin.bottom,
    innerRadius = Math.min(width, height) * .39,
    outerRadius = innerRadius * 1.04;

/*Initiate the SVG*/
var svg = d3.select("#chart").append("svg:svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
	.append("svg:g")
    .attr("transform", "translate(" + (margin.left + width / 2) + "," + (margin.top + height / 2) + ")");

	
var chord = d3.layout.chord()
    .padding(.04)
    .sortSubgroups(d3.descending) /*sort the chords inside an arc from high to low*/
    .sortChords(d3.descending) /*which chord should be shown on top when chords cross. Now the biggest chord is at the bottom*/
	.matrix(matrix);
	

/*//////////////////////////////////////////////////////////
////////////////// Draw outer Arcs /////////////////////////
//////////////////////////////////////////////////////////*/

var arc = d3.svg.arc()
    .innerRadius(innerRadius)
    .outerRadius(outerRadius);
	
var g = svg.selectAll("g.group")
	.data(chord.groups)
	.enter().append("svg:g")
	.attr("class", function(d) {return "group " + NameProvider[d.index];});
	
g.append("svg:path")
	  .attr("class", "arc")
	  .style("stroke", function(d) { return fill(d.index); })
	  .style("fill", function(d) { return fill(d.index); })
	  .attr("d", arc)
	  .style("opacity", 0)
	  .transition().duration(1000)
	  .style("opacity", 0.4);

/*//////////////////////////////////////////////////////////
////////////////// Initiate Ticks //////////////////////////
//////////////////////////////////////////////////////////*/

var ticks = svg.selectAll("g.group").append("svg:g")
	.attr("class", function(d) {return "ticks " + NameProvider[d.index];})
	.selectAll("g.ticks")
	.attr("class", "ticks")
    .data(groupTicks)
	.enter().append("svg:g")
    .attr("transform", function(d) {
      return "rotate(" + (d.angle * 180 / Math.PI - 90) + ")"
          + "translate(" + outerRadius+40 + ",0)";
    });

/*Append the tick around the arcs*/
ticks.append("svg:line")
	.attr("x1", 1)
	.attr("y1", 0)
	.attr("x2", 5)
	.attr("y2", 0)
	.attr("class", "ticks")
	.style("stroke", "#FFF");
	
/*Add the labels for the %'s*/
ticks.append("svg:text")
	.attr("x", 8)
	.attr("dy", ".35em")
	.attr("class", "tickLabels")
	.attr("transform", function(d) { return d.angle > Math.PI ? "rotate(180)translate(-16)" : null; })
	.style("text-anchor", function(d) { return d.angle > Math.PI ? "end" : null; })
	.text(function(d) { return d.label; })
	.attr('opacity', 0);
	
/*//////////////////////////////////////////////////////////
////////////////// Initiate Names //////////////////////////
//////////////////////////////////////////////////////////*/

g.append("svg:text")
  .each(function(d) { d.angle = (d.startAngle + d.endAngle) / 2; })
  .attr("dy", ".35em")
  .attr("class", "titles")
  .attr("text-anchor", function(d) { return d.angle > Math.PI ? "end" : null; })
  .attr("transform", function(d) {
		return "rotate(" + (d.angle * 180 / Math.PI - 90) + ")"
		+ "translate(" + (innerRadius + 55) + ")"
		+ (d.angle > Math.PI ? "rotate(180)" : "");
  })
  .attr('opacity', 0)
  .text(function(d,i) { return NameProvider[i]; });  

/*//////////////////////////////////////////////////////////
//////////////// Initiate inner chords /////////////////////
//////////////////////////////////////////////////////////*/

var chords = svg.selectAll("path.chord")
	.data(chord.chords)
	.enter().append("svg:path")
	.attr("class", "chord")
	.style("stroke", function(d) { return d3.rgb(fill(d.source.index)).darker(); })
	.style("fill", function(d) { return fill(d.source.index); })
	.attr("d", d3.svg.chord().radius(innerRadius))
	.attr('opacity', 0);

/*//////////////////////////////////////////////////////////	
///////////// Initiate Progress Bar ////////////////////////
//////////////////////////////////////////////////////////*/
/*Initiate variables for bar*/
var progressColor = ["#D1D1D1","#949494"],
	progressClass = ["prgsBehind","prgsFront"],
	prgsWidth = 0.4*650,
	prgsHeight = 3;
/*Create SVG to visualize bar in*/
var progressBar = d3.select("#progress").append("svg")
	.attr("width", prgsWidth)
	.attr("height", 3*prgsHeight);
/*Create two bars of which one has a width of zero*/
progressBar.selectAll("rect")
	.data([prgsWidth, 0])
	.enter()
	.append("rect")
	.attr("class", function(d,i) {return progressClass[i];})
	.attr("x", 0)
	.attr("y", 0)
	.attr("width", function (d) {return d;})
	.attr("height", prgsHeight)
	.attr("fill", function(d,i) {return progressColor[i];});

/*//////////////////////////////////////////////////////////	
/////////// Initiate the Center Texts //////////////////////
//////////////////////////////////////////////////////////*/
/*Create wrapper for center text*/
var textCenter = svg.append("g")
					.attr("class", "explanationWrapper");

/*Starting text middle top*/
var middleTextTop = textCenter.append("text")
	.attr("class", "explanation")
	.attr("text-anchor", "middle")
	.attr("x", 0 + "px")
	.attr("y", -24*10/2 + "px")
	.attr("dy", "1em")
	.attr("opacity", 1)
	.text("Loading...")
	.call(wrap, 350);

/*Starting text middle bottom*/
var middleTextBottom = textCenter.append("text")
	.attr("class", "explanation")
	.attr("text-anchor", "middle")
	.attr("x", 0 + "px")
	.attr("y", 24*3/2 + "px")
	.attr("dy", "1em")
	.attr('opacity', 1)
	.text("")
	.call(wrap, 350);
	
/*///////////////////////////////////////////////////////////
//Draw the original Chord diagram
///////////////////////////////////////////////////////////*/
/*Go to the final bit*/
function finalChord() {
	
	/*Remove button*/
	d3.select("#clicker")
		.style("visibility", "hidden");
	d3.select("#skip")
		.style("visibility", "hidden");
	d3.select("#progress")
		.style("visibility", "hidden");
	
	/*Remove texts*/
	changeTopText(newText = "",
		loc = 0, delayDisappear = 0, delayAppear = 1);
	changeBottomText(newText = "",
		loc = 0, delayDisappear = 0, delayAppear = 1);			

	/*Create arcs or show them, depending on the point in the visual*/
	g.append("svg:path")
	  .style("stroke", function(d) { return fill(d.index); })
	  .style("fill", function(d) { return fill(d.index); })
	  .attr("d", arc)
	  .style("opacity", 0)
	  .transition().duration(1000)
	  .style("opacity", 1);
		 
	/*Make mouse over and out possible*/
	d3.selectAll(".group")
		.on("mouseover", fade(.02))
		.on("mouseout", fade(.80));
		
	/*Show all chords*/
	chords.transition().duration(1000)
		.style("opacity", 0.8);

	/*Show all the text*/
	d3.selectAll("g.group").selectAll("line")
		.transition().duration(100)
		.style("stroke","#000");
	/*Same for the %'s*/
	svg.selectAll("g.group")
		.transition().duration(100)
		.selectAll(".tickLabels").style("opacity",1);
	/*And the Names of each Arc*/	
	svg.selectAll("g.group")
		.transition().duration(100)
		.selectAll(".titles").style("opacity",1);		

};/*finalChord*/