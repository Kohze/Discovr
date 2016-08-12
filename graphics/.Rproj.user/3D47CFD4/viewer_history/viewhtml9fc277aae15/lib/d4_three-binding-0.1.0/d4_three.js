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
                            d3.select(this).style("fill","grey");
                        })
                        .on("mouseout", function() {
                            d3.select("#tx2").style('opacity', 1);
                            d3.select(this).style("fill","black");
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


var d = {
 "name": "flare",
 "children": [
  {
   "name": "analytics",
   "children": [
    {
     "name": "cluster",
     "children": [
      {"name": "AgglomerativeCluster", "size": 3938},
      {"name": "CommunityStructure", "size": 3812},
      {"name": "HierarchicalCluster", "size": 6714},
      {"name": "MergeEdge", "size": 743}
     ]
    },
    {
     "name": "graph",
     "children": [
      {"name": "BetweennessCentrality", "size": 3534},
      {"name": "LinkDistance", "size": 5731},
      {"name": "MaxFlowMinCut", "size": 7840},
      {"name": "ShortestPaths", "size": 5914},
      {"name": "SpanningTree", "size": 3416}
     ]
    },
    {
     "name": "optimization",
     "children": [
      {"name": "AspectRatioBanker", "size": 7074}
     ]
    }
   ]
  },
  {
   "name": "animate",
   "children": [
    {"name": "Easing", "size": 17010},
    {"name": "FunctionSequence", "size": 5842},
    {
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
     ]
    },
    {"name": "ISchedulable", "size": 1041},
    {"name": "Parallel", "size": 5176},
    {"name": "Pause", "size": 449},
    {"name": "Scheduler", "size": 5593},
    {"name": "Sequence", "size": 5534},
    {"name": "Transition", "size": 9201},
    {"name": "Transitioner", "size": 19975},
    {"name": "TransitionEvent", "size": 1116},
    {"name": "Tween", "size": 6006}
   ]
  },
  {
   "name": "data",
   "children": [
    {
     "name": "converters",
     "children": [
      {"name": "Converters", "size": 721},
      {"name": "DelimitedTextConverter", "size": 4294},
      {"name": "GraphMLConverter", "size": 9800},
      {"name": "IDataConverter", "size": 1314},
      {"name": "JSONConverter", "size": 2220}
     ]
    },
    {"name": "DataField", "size": 1759},
    {"name": "DataSchema", "size": 2165},
    {"name": "DataSet", "size": 586},
    {"name": "DataSource", "size": 3331},
    {"name": "DataTable", "size": 772},
    {"name": "DataUtil", "size": 3322}
   ]
  },
  {
   "name": "display",
   "children": [
    {"name": "DirtySprite", "size": 8833},
    {"name": "LineSprite", "size": 1732},
    {"name": "RectSprite", "size": 3623},
    {"name": "TextSprite", "size": 10066}
   ]
  },
  {
   "name": "flex",
   "children": [
    {"name": "FlareVis", "size": 4116}
   ]
  },
  {
   "name": "physics",
   "children": [
    {"name": "DragForce", "size": 1082},
    {"name": "GravityForce", "size": 1336},
    {"name": "IForce", "size": 319},
    {"name": "NBodyForce", "size": 10498},
    {"name": "Particle", "size": 2822},
    {"name": "Simulation", "size": 9983},
    {"name": "Spring", "size": 2213},
    {"name": "SpringForce", "size": 1681}
   ]
  },
  {
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
    {
     "name": "methods",
     "children": [
      {"name": "add", "size": 593},
      {"name": "and", "size": 330},
      {"name": "average", "size": 287},
      {"name": "count", "size": 277},
      {"name": "distinct", "size": 292},
      {"name": "div", "size": 595},
      {"name": "eq", "size": 594},
      {"name": "fn", "size": 460},
      {"name": "gt", "size": 603},
      {"name": "gte", "size": 625},
      {"name": "iff", "size": 748},
      {"name": "isa", "size": 461},
      {"name": "lt", "size": 597},
      {"name": "lte", "size": 619},
      {"name": "max", "size": 283},
      {"name": "min", "size": 283},
      {"name": "mod", "size": 591},
      {"name": "mul", "size": 603},
      {"name": "neq", "size": 599},
      {"name": "not", "size": 386},
      {"name": "or", "size": 323},
      {"name": "orderby", "size": 307},
      {"name": "range", "size": 772},
      {"name": "select", "size": 296},
      {"name": "stddev", "size": 363},
      {"name": "sub", "size": 600},
      {"name": "sum", "size": 280},
      {"name": "update", "size": 307},
      {"name": "variance", "size": 335},
      {"name": "where", "size": 299},
      {"name": "xor", "size": 354},
      {"name": "_", "size": 264}
     ]
    },
    {"name": "Minimum", "size": 843},
    {"name": "Not", "size": 1554},
    {"name": "Or", "size": 970},
    {"name": "Query", "size": 13896},
    {"name": "Range", "size": 1594},
    {"name": "StringUtil", "size": 4130},
    {"name": "Sum", "size": 791},
    {"name": "Variable", "size": 1124},
    {"name": "Variance", "size": 1876},
    {"name": "Xor", "size": 1101}
   ]
  },
  {
   "name": "scale",
   "children": [
    {"name": "IScaleMap", "size": 2105},
    {"name": "LinearScale", "size": 1316},
    {"name": "LogScale", "size": 3151},
    {"name": "OrdinalScale", "size": 3770},
    {"name": "QuantileScale", "size": 2435},
    {"name": "QuantitativeScale", "size": 4839},
    {"name": "RootScale", "size": 1756},
    {"name": "Scale", "size": 4268},
    {"name": "ScaleType", "size": 1821},
    {"name": "TimeScale", "size": 5833}
   ]
  },
  {
   "name": "vis",
   "children": [
    {
     "name": "axis",
     "children": [
      {"name": "Axes", "size": 1302},
      {"name": "Axis", "size": 24593},
      {"name": "AxisGridLine", "size": 652},
      {"name": "AxisLabel", "size": 636},
      {"name": "CartesianAxes", "size": 6703}
     ]
    },
   ]
  }
 ]
}

 // https://github.com/wbkd/d3-extended
    d3.selection.prototype.moveToFront = function() {
      return this.each(function(){
        this.parentNode.appendChild(this);
      });
    };
    d3.selection.prototype.moveToBack = function() {
        return this.each(function() {
            var firstChild = this.parentNode.firstChild;
            if (firstChild) {
                this.parentNode.insertBefore(this, firstChild);
            }
        });
    };

var diameter = 400,
    format = d3.format(",d"),
    color = d3.scale.category20c();

var bubble = d3.layout.pack()
    .sort(null)
    .size([diameter, diameter])
    .padding(1.5);

var svg = sampleSVG
    .attr("width", diameter)
    .attr("height", diameter)
    .attr("class", "bubble");

d3.json(d, function(error, root) {

  var node = svg.selectAll(".node")
      .attr("id","bubblePlot")
      .data(bubble.nodes(classes(d))
      .filter(function(d) { return !d.children; }))
    .enter().append("g")
      .attr("class", "node")
      .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });

  node.append("title")
      .attr("id","bubblePlot")
      .text(function(d) { return d.className + ": " + format(d.value); });

  node.append("circle")
      .attr("id","bubblePlot")
      .attr("r", function(d) { return d.r; })
      .style("fill", function(d) { return color(d.packageName); })
      .on("mouseover", function() {
                            d3.selectAll("#bubblePlot").moveToBack();
      })
      //.on("mouseover", function(d) {
    //svg.selectAll("#bubblePlot").sort(function (a, b) { // select the parent and sort the path's
  //  if (a.id != d.id) return -1;               // a is not the hovered element, send "a" to the back
  //  else return 1;                             // a is the hovered element, bring "a" to the front
  //});
})

  node.append("text")
      .attr("id","bubblePlot")
      .attr("font-size", "8px")
      .attr("dy", ".2em")
      .style("text-anchor", "middle")
      .text(function(d) { return d.className.substring(0, d.r / 3); });

});

// Returns a flattened hierarchy containing all leaf nodes under the root.
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

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
