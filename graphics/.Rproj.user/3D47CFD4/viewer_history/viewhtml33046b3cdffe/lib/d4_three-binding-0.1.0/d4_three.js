HTMLWidgets.widget({

  name: 'd4_three',
  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        // TODO: code to render the widget, e.g.
  //      el.innerText = x.message;
       // el.innerText= " test";


  var sampleSVG = d3.select("#" + el.id).append("svg")

  sampleSVG.append("rect")
                      .style("fill", "orange")
                      .style("opacity", 0.2)
                      .attr("x", 0)
                      .attr("y", 0)
                      .attr("width", 400)
                      .attr("height", 80);

  sampleSVG.append("rect")
                      .style("fill", "yellow")
                      .style("opacity", 0.1)
                      .attr("x", 0)
                      .attr("y", 80)
                      .attr("width", 215)
                      .attr("height", 240);

  sampleSVG.append("rect")
                      .style("fill", "green")
                      .style("opacity", 0.1)
                      .attr("x", 215)
                      .attr("y", 80)
                      .attr("width", 185)
                      .attr("height", 240);

    var diagonal = d3.svg.diagonal()
                         .source({x:20, y:200})
                         .target({x:100, y:250});

    var diagonal2 = d3.svg.diagonal()
                         .source({x:20, y:200})
                         .target({x:100, y:150});

    var diagonal3 = d3.svg.diagonal()
                         .source({x:100, y:150})
                         .target({x:200, y:100});

    var diagonal4 = d3.svg.diagonal()
                         .source({x:100, y:150})
                         .target({x:200, y:180});

    var diagonal5 = d3.svg.diagonal()
                         .source({x:100, y:250})
                         .target({x:200, y:300});

    var diagonal6 = d3.svg.diagonal()
                         .source({x:100, y:250})
                         .target({x:200, y:220});

    sampleSVG.append("path")
                        .attr("d", diagonal)
                        .attr("stroke", x.col1)
                        .attr("stroke-width", 1)
                        .attr("fill", "none");

    sampleSVG.append("path")
                        .attr("d", diagonal2)
                        .attr("stroke", x.col2)
                        .attr("stroke-width", 1)
                        .attr("fill", "none");

    sampleSVG.append("path")
                        .attr("d", diagonal3)
                        .attr("stroke", x.col3)
                        .attr("stroke-width", 1)
                        .attr("fill", "none");

    sampleSVG.append("path")
                        .attr("d", diagonal4)
                        .attr("stroke", x.col4)
                        .attr("stroke-width", 1)
                        .attr("fill", "none");

    sampleSVG.append("path")
                        .attr("d", diagonal5)
                        .attr("stroke", x.col5)
                        .attr("stroke-width", 1)
                        .attr("fill", "none");

    sampleSVG.append("path")
                        .attr("d", diagonal6)
                        .attr("stroke", x.col6)
                        .attr("stroke-width", 1)
                        .attr("fill", "none");

   sampleSVG.append("circle")
                        .style("stroke", "gray")
                        .style("fill", "black")
                        .attr("r", 10)
                        .attr("cx", 20)
                        .attr("cy", 200)
                        .on("mouseover", function() {
                            d3.select("#tx2").text(x.text1).style('opacity', 1);
                            d3.select(this).style("fill","grey").style("stroke","black");
                        })
                        .on("mouseout", function() {
                            d3.select("#tx2").style('opacity', 1);
                            d3.select(this).style("fill","black").style("stroke","");
                        });



   sampleSVG.append("circle")
                        .style("stroke", "gray")
                        .style("fill", "black")
                        .attr("r", 8)
                        .attr("cx", 100)
                        .attr("cy", 150)
                        .on("mouseover", function() {
                            d3.select("#tx2").text(x.text2).style('opacity', 1);
                            d3.select(this).style("fill","grey");
                        })
                        .on("mouseout", function() {
                            d3.select("#tx2").style('opacity', 1);
                            d3.select(this).style("fill","black");
                        })
                        .on("click", function() {
                            d3.selectAll("#bubblePlot").style("opacity",1).style("display","block");
                            d3.selectAll(".node").style("opacity",1).style("display","block");
                        });

   sampleSVG.append("circle")
                        .style("stroke", "gray")
                        .style("fill", "black")
                        .attr("r", 8)
                        .attr("cx", 100)
                        .attr("cy", 250)
                        .on("mouseover", function() {
                            d3.select("#tx2").text(x.text3).style('opacity', 1);
                            d3.select(this).style("fill","grey");
                        })
                        .on("mouseout", function() {
                            d3.select("#tx2").style('opacity', 1);
                            d3.select(this).style("fill","black");
                        })
                        .on("click", function() {
                            d3.selectAll("#bubblePlot").style("opacity",1).style("display","block");
                            d3.selectAll(".node").style("opacity",1).style("display","block");
                        });

   sampleSVG.append("circle")
                        .style("stroke", "gray")
                        .style("fill", "black")
                        .attr("r", 8)
                        .attr("cx", 200)
                        .attr("cy", 100)
                        .on("mouseover", function() {
                            d3.select("#tx2").text(x.text4).style('opacity', 1);
                            d3.select(this).style("fill","grey");
                        })
                        .on("mouseout", function() {
                            d3.select("#tx2").style('opacity', 1);
                            d3.select(this).style("fill","black");
                        })
                        .on("click", function() {
                            d3.selectAll("#bubblePlot").style("opacity",1).style("display","block");
                            d3.selectAll(".node").style("opacity",1).style("display","block");
                        });

   sampleSVG.append("circle")
                        .style("stroke", "gray")
                        .style("fill", "black")
                        .attr("r", 8)
                        .attr("cx", 200)
                        .attr("cy", 180)
                        .on("mouseover", function() {
                            d3.select("#tx2").text(x.text5).style('opacity', 1);
                            d3.select(this).style("fill","grey");
                        })
                        .on("mouseout", function() {
                            d3.select("#tx2").style('opacity', 1);
                            d3.select(this).style("fill","black");
                        })
                        .on("click", function() {
                            d3.selectAll("#bubblePlot").style("opacity",1).style("display","block");
                            d3.selectAll(".node").style("opacity",1).style("display","block");
                        });

   sampleSVG.append("circle")
                        .style("stroke", "gray")
                        .style("fill", "black")
                        .attr("r", 8)
                        .attr("cx", 200)
                        .attr("cy", 220)
                        .on("mouseover", function() {
                            d3.select("#tx2").text(x.text6).style('opacity', 1);
                            d3.select(this).style("fill","grey");
                        })
                        .on("mouseout", function() {
                            d3.select("#tx2").style('opacity', 1);
                            d3.select(this).style("fill","black");
                        })
                        .on("click", function() {
                            d3.selectAll("#bubblePlot").style("opacity",1).style("display","block");
                            d3.selectAll(".node").style("opacity",1).style("display","block");
                        });

   sampleSVG.append("circle")
                        .style("stroke", "gray")
                        .style("fill", "black")
                        .attr("r", 8)
                        .attr("cx", 200)
                        .attr("cy", 300)
                        .on("mouseover", function() {
                            d3.select("#tx2").text(x.text7).style('opacity', 1);
                            d3.select(this).style("fill","grey");
                        })
                        .on("mouseout", function() {
                            d3.select("#tx2").style('opacity', 1);
                            d3.select(this).style("fill","black");
                        })
                        .on("click", function() {
                            d3.selectAll("#bubblePlot").style("opacity",1).style("display","block");
                            d3.selectAll(".node").style("opacity",1).style("display","block");
                        });



  sampleSVG.append("text")
                     .attr("id","tx2")
                     .attr("x", 275)
                     .attr("y", 100)
                     .attr("font-family", "sans-serif")
                     .attr("font-size", "18px")
                     .attr("fill", "black")
                     .style('opacity', 1);

  sampleSVG.append("text")
                     .attr("id","description")
                     .attr("x", 250)
                     .attr("y", 200)
                     .text("lore ipsum dolore")
                     .attr("font-family", "sans-serif")
                     .attr("font-size", "11px")
                     .attr("fill", "black")
                     .style('opacity', 1);

  sampleSVG.append("text")
                     .attr("id","header1")
                     .attr("x", 10)
                     .attr("y", 20)
                     .text("Dataset:")
                     .attr("font-family", "sans-serif")
                     .attr("font-size", "11px")
                     .attr("fill", "black")
                     .style('opacity', 1);

  sampleSVG.append("text")
                     .attr("id","datasetName")
                     .attr("x", 60)
                     .attr("y", 20)
                     .text("tetasdasd")
                     .attr("font-family", "sans-serif")
                     .attr("font-size", "11px")
                     .attr("fill", "black")
                     .style('opacity', 1);

  sampleSVG.append("text")
                     .attr("id","colNames")
                     .attr("x", 10)
                     .attr("y", 50)
                     .text(x.cNames)
                     .attr("font-family", "sans-serif")
                     .attr("font-size", "11px")
                     .attr("fill", "black")
                     .style('opacity', 1);


var d1 = {
     "name": "interpolate",
     "children": [
      {"name": "ArrayInterpolator", "size": 1983},
      {"name": "ColorInterpolator", "size": 2047},
      {"name": "DateInterpolator", "size": 1375},
      {"name": "Interpolator", "size": 8746},
      {"name": "MatrixInterpolator", "size": 2202},
      {"name": "NumberInterpolator", "size": 1382},
      {"name": "ObjectInterpolator", "size": 1629},
      {"name": "PointInterpolator", "size": 1675},
      {"name": "RectangleInterpolator", "size": 2042}
     ],
};

var d = {
   "name": "query",
   "children": [
    {"name": "AggregateExpression", "size": 1616},
    {"name": "And", "size": 1027},
    {"name": "Arithmetic", "size": 3891},
    {"name": "Average", "size": 891},
    {"name": "BinaryExpression", "size": 2893},
    {"name": "Comparison", "size": 5103},
    {"name": "CompositeExpression", "size": 3677},
    {"name": "Count", "size": 781},
    {"name": "DateUtil", "size": 4141},
    {"name": "Distinct", "size": 933},
    {"name": "Expression", "size": 5130},
    {"name": "ExpressionIterator", "size": 3617},
    {"name": "Fn", "size": 3240},
    {"name": "If", "size": 2732},
    {"name": "IsA", "size": 2039},
    {"name": "Literal", "size": 1214},
    {"name": "Match", "size": 3748},
    {"name": "Maximum", "size": 843},
   ]
};

var diameter = 350,
    format = d3.format(",d"),
    color = d3.scale.category20c();

var bubble = d3.layout.pack()
    .sort(null)
    .size([350, 300])
    .padding(1.5);

var svg = sampleSVG
    .attr("class", "bubble");


svg.append("rect")
   .attr("id","bubblePlot")
   .attr("width", "100%")
   .attr("height", "100%")
   .attr("fill", "white")
   .style("opacity", 0)
   .style("display","none");

svg.append("rect")
   .attr("id","bubblePlot")
   .style("opacity", 0)
   .style("display","none")
   .attr("width", 80)
   .attr("height", 40)
   .attr("fill", "red")
   .on("mouseover", function() {
      d3.selectAll("#bubblePlot").style("opacity",0).style("display","none");
    });

svg.append("text")
   .attr("id","bubblePlot")
   .attr("x", 20)
   .attr("y", 26)
   .style("opacity", 0)
   .text("back");

d3.json(d, function(error, root) {
  var node = svg.selectAll(".node")
      .attr("id","bubblePlot")
      .data(bubble.nodes(classes(d))
      .filter(function(d) { return !d.children; }))
      .enter().append("g")
      .attr("class", "node")
      .style("opacity", 0)
      .style("display","none")
      .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });

  node.append("title")
      .attr("id","bubblePlot")
      .text(function(d) { return d.className + ": " + format(d.value); });

  node.append("circle")
      .attr("id","bubblePlot")
      .attr("r", function(d) { return d.r; })
      .style("fill", function(d) { return color(d.packageName); });

  node.append("text")
      .attr("id","bubblePlot")
      .attr("font-size", "8px")
      .attr("dy", ".2em")
      .style("text-anchor", "middle")
      .text(function(d) { return d.className.substring(0, d.r / 3); });
});

function classes(root) {
  var classes = [];

  function recurse(name, node) {
    if (node.children) node.children.forEach(function(child) { recurse(node.name, child); });
    else classes.push({packageName: name, className: node.name, value: node.size});
  }

  recurse(null, root);
  return {children: classes};
}

d3.select(self.frameElement).style("height", diameter + "px");
d3.selectAll("g").style("opacity", 0);
      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
