////////////////////////////////////////////////////////////
//////////////////////// Set-up ////////////////////////////
////////////////////////////////////////////////////////////
var screenWidth = $("#chart").parent().parent().width(),
	mobileScreen = (screenWidth > 400 ? false : true);	

var margin = {left: -70, top: -50, right: 10, bottom: -70},
	width = (screenWidth) - margin.left - margin.right,
	height = (respondents == 0 ? 0 : 400) - margin.top - margin.bottom;
			
var svg = d3.select("#chart").append("svg")
			.attr("width", (width + margin.left + margin.right))
			.attr("height", (height + margin.top + margin.bottom));
			
var wrapper = svg.append("g").attr("class", "chordWrapper")
			.attr("transform", "translate(" + (width / 2 + margin.left) + "," + (height / 2 + margin.top) + ")");;
			
var outerRadius = Math.min(width, height) / 2  - (mobileScreen ? 80 : 100),
	innerRadius = outerRadius * 0.90,
	pullOutSize = 0,
	opacityDefault = 0.7, //default opacity of chords
	opacityLow = 0.02; //hover opacity of those chords not hovered over

//Custom sort function of the chords to keep them in the original order
function customSort(a,b) {
	return 1;
};

//Custom sort function of the chords to keep them in the original order
var chord = customChordLayout() //d3.layout.chord()//Custom sort function of the chords to keep them in the original order
	.padding(.02)
	.sortChords(d3.descending) //which chord should be shown on top when chords cross. Now the biggest chord is at the bottom
	.matrix(matrix);
	
var arc = d3.svg.arc()
	.innerRadius(innerRadius)
	.outerRadius(outerRadius);

var path = stretchedChord()
	.radius(innerRadius);

////////////////////////////////////////////////////////////
//////////////////// Draw outer Arcs ///////////////////////
////////////////////////////////////////////////////////////

var g = wrapper.selectAll("g.group")
	.data(chord.groups)
	.enter().append("g")
	.attr("class", "group")
	.on("mouseover", fade(opacityLow))
	.on("mouseout", fade(opacityDefault));

g.append("path")
	.style("stroke", function(d,i) { return (Names[i] === "" ? "none" : Colors[i]); })
	.style("fill", function(d,i) { return (Names[i] === "" ? "none" : Colors[i]); })
	.style("pointer-events", function(d,i) { return (Names[i] === "" ? "none" : "auto"); })
	.attr("d", arc)
	.attr("id", function(d, i) { return "group" + i; });



////////////////////////////////////////////////////////////
////////////////////// Append Names ////////////////////////
////////////////////////////////////////////////////////////

var groupText = g.append("text")
	.attr("dy", ".35em")
	.attr("class", "titles")
	.attr("transform", "scale(0.95,0.95) rotate(1)")  
	
	
groupText.append("textPath")
	.attr("xlink:href", function(d, i) { return "#group" + i; })
	.text(function(d, i) { return Names[i] })
	.style('fill', 'white');
	

////////////////////////////////////////////////////////////
//////////////////// Draw inner chords /////////////////////
////////////////////////////////////////////////////////////
 
var chords = wrapper.selectAll("path.chord")
	.data(chord.chords)
	.enter().append("path")
	.attr("class", "chord")
	.style("stroke", "none")
	.style("fill", "#C4C4C4")
	.style("opacity", function(d) { return (Names[d.source.index] === "" ? 0 : opacityDefault); }) //Make the dummy strokes have a zero opacity (invisible)
	.style("pointer-events", function(d,i) { return (Names[d.source.index] === "" ? "none" : "auto"); }) //Remove pointer events from dummy strokes
	.attr("d", path)
	.on("mouseover", fadeOnChord)
	.on("mouseout", fade(opacityDefault));	

////////////////////////////////////////////////////////////
///////////////////////// Tooltip //////////////////////////
////////////////////////////////////////////////////////////

//Arcs
g.append("title")	
	.text(function(d, i) {return Names[i] + " spent a total of " + Math.round(d.value) + " €";});
	
//Chords
chords.append("title")
	.text(function(d) {
		return Names[d.source.index] + " \u2192 " + Names[d.target.index] + " (" + Math.round(d.source.value) + "€) "; 
	});
	
////////////////////////////////////////////////////////////
////////////////// Extra Functions /////////////////////////
////////////////////////////////////////////////////////////


// Returns an event handler for fading a given chord group
function fade(opacity) {
  return function(d, i) {
	wrapper.selectAll("path.chord")
		.filter(function(d) { return d.source.index != i && d.target.index != i && Names[d.source.index] != ""; })
		.transition()
		.style("opacity", opacity);
  };
}//fade

// Fade function when hovering over chord
function fadeOnChord(d) {
	var chosen = d;
	wrapper.selectAll("path.chord")
		.transition()
		.style("opacity", function(d) {
			if (d.source.index == chosen.source.index && d.target.index == chosen.target.index) {
				return opacityDefault;
			} else { 
				return opacityLow; 
			}//else
		});
}//fadeOnChord

if (respondents != 0) {
	$("#nochart").hide();
}