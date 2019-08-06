
<html>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<head>
	<title>Server-Sent Events Servlet example</title>
	<style>
		body {
			font-family: sans-serif;
		}
	</style>
</head>
<body>
 
	Data: <span id="foo"></span>
	
	<br><br>
	<button onclick="start()">Start</button> 
 

	
	
	
	
	
	
	
	
	
	
	
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script src="./realTest/dagre-d3.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  
  
   <script>
  $(function() {
    $( "#dialog" ).dialog();
  });

  </script>
<style>

  body {
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serf;
    background: #FFFFFF;
  }


  @-webkit-keyframes flash {
    0%, 50%, 100% {
      opacity: 1;
    }

    25%, 75% {
      opacity: 0.2;
    }
  }

  @keyframes flash {
    0%, 50%, 100% {
      opacity: 1;
    }

    25%, 75% {
      opacity: 0.2;
    }
  }

  .warn {
    -webkit-animation-duration: 5s;
    animation-duration: 5s;
    -webkit-animation-fill-mode: both;
    animation-fill-mode: both;
    -webkit-animation-iteration-count: 1;
    animation-iteration-count: 1;
  }

  .live.map {
    width: 100%;
    height: 100%;
  }

  svg {
    width: 100%;
    height: 100%;
    overflow: hidden;
  }

  .live.map text {
    font-weight: 300;
    font-size: 14px;
  }

  .live.map .node rect {
    stroke-width: 1.5px;
    stroke: #bbb;
    fill: #666;
  }

  .live.map .status {
    height: 100%;
    width: 15px;
    display: block;
    float: left;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    margin-right: 4px;
  }

  .live.map .running .status {
    background-color: #7f7;
  }

  .live.map .running.warn .status {
    background-color: #ffed68;
  }

  .live.map .stopped .status {
    background-color: #f77;
  }

  .live.map .warn .queue {
    color: #f77;
  }

  .warn {
    -webkit-animation-name: flash;
    animation-name: flash;
  }

  .live.map .consumers {
    margin-right: 2px;
  }

  .live.map .consumers,
  .live.map .name {
    margin-top: 4px;
  }

  .live.map .consumers:after {
    content: "x";
  }

  .live.map .queue {
    display: block;
    float: left;
    width: 130px;
    height: 20px;
    font-size: 12px;
    margin-top: 2px;
  }

  .live.map .node g div {
    width: 200px;
    height: 40px;
    color: #fff;
  }

  .live.map .node g div span.consumers {
    display: inline-block;
    width: 20px;
  }

  .live.map .edgeLabel text {
    width: 50px;
    fill: #fff;
  }

  .live.map .edgePath path {
    stroke: #777;
    stroke-width: 1.5px;
    fill: #777;
  }
</style>



<!-- ending -->








<!-- <div id="dialog" class="live map" title="Process Diagram">
  <svg width='270' height='265'><g/></svg>
</div> -->



<!--  starting again -->

 <div class="live map">
  <svg><g/></svg>
</div> 

<script>
var workers ;
  
  setInterval(function(){
	  draw(true);
  },2000);

 function start() {


	var eventSource = new EventSource("HelloProA");
	eventSource.onmessage = function(event) {
		document.getElementById('foo').innerHTML = event.data + '<br><br>';
		//document.getElementById('foo').innerHTML = event.data;
		workers = JSON.parse(event.data);
		draw(true);
	};
} 
  
 
  
  // Set up zoom support
  var svg = d3.select("svg"),
      inner = svg.select("g");
    /* var   zoom = d3.behavior.zoom().on("zoom", function() {
        inner.attr("transform", "translate(" + d3.event.translate + ")" +
                                    "scale(" + d3.event.scale + ")"); 
      }
     );
  svg.call(zoom);
 */
  var render = new dagreD3.render();

  // Left-to-right layout
  var g = new dagreD3.graphlib.Graph();
  g.setGraph({
    nodesep: 50,
    ranksep: 30,
    rankdir: "LR",
    marginx: 20,
    marginy: 20
  });

 
  
  function draw(isUpdate) {
	  
	  
    for (var id in workers) {
      var worker = workers[id];
      //console.log("id ="+id);
      //console.log(worker);
       var className = worker.consumers ? "running" : "stopped";
      if (worker.count > 10000) {
        className += " warn";
      } 
      var html = "<div>";
      html += "<span class=status></span>";
      //html += "<span class=consumers>"+worker.consumers+"</span>";
      html += "<span class=name>"+id+"</span>";
      html += "<span class=queue><span class=counter>"+worker.count+"</span>";
      html += "</div>";
      g.setNode(id, {
        labelType: "html",
        label: html,
        rx: 5,
        ry: 5,
        padding: 0
        ,
        class: className
      });

      if (worker.inputQueue) {
    	  for(i=0;i<worker.inputQueue.length;i++){
      			g.setEdge(worker.inputQueue[i], id, {
         		 label: worker.inputThroughput[i] ,
          		width: 50
        		});
           } 
      }
    }

    inner.call(render, g);

    // Zoom and scale to fit
    /*  var zoomScale = zoom.scale();
    var graphWidth = g.graph().width + 50;
    var graphHeight = g.graph().height + 40;
    var width = parseInt(svg.style("width").replace(/px/, ""));
    var height = parseInt(svg.style("height").replace(/px/, ""));
    zoomScale = Math.min(width / graphWidth, height / graphHeight);
    var translate = [(width/2) - ((graphWidth*zoomScale)/2), (height/2) - ((graphHeight*zoomScale)/2)];
    zoom.translate(translate);
    zoom.scale(zoomScale);
    zoom.event(isUpdate ? svg.transition().duration(1000) : d3.select("svg"));  */
  }
  //setInterval(function(){ 
	  //workers = JSON.parse(document.getElementById('foo').innerText);
	  /* for (var id in workers) {
	      var worker = workers[id];
	      var s1count = workers[id].count;
	      workers[id].count = s1count;
	  } */
	  //draw(true);},1000);
  // Do some mock queue status updates
  /* setInterval(function() {

    //var stoppedWorker1Count = workers["Check Stock Ava~"].count;
    //var stoppedWorker2Count = workers["Check raw mater~"].count;
    /* for (var id in workers) {
      workers[id].count = Math.ceil(Math.random() * 3);
      if (workers[id].inputThroughput) workers[id].inputThroughput = Math.ceil(Math.random() * 250);
    } */
    //workers["Check Stock Ava~"].count = stoppedWorker1Count ;//+ Math.ceil(Math.random() * 100);
    //workers["Check raw mater~"].count = stoppedWorker2Count ;//+ Math.ceil(Math.random() * 100);
   // draw(true);
 // }, 1000);  */

  // Do a mock change of worker configuration
  /* setInterval(function() {
    /* workers["Manufacture_product"] = {
      "consumers": 0,
      "count": 0,
      "inputQueue": "Obtain_raw_materials_from_Supplier_1",
      "inputThroughput": 50
    } */
 // }, 5000); */

  draw();

</script>

<!--  ending again -->	
	
	
	
</body>
</html>