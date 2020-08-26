---
layout: page
title: Step 3. Showing the playground
tutorial: Visualization
---

## Goals
Even though it's possible to express the position of network nodes, the movement of mobile nodes,
the geometry of physical objects using geographic locations, internally INET uses a Cartesian
coordinate system called the playground. Such coordinates may appear in the runtime GUI or the
simulation log or even in the debugger. To help you deal with that, we show the playground 
along with its coordinate axes.

## The model
The size of the playground is 800x800 meters and is set via display string. 
In 2D visualization, the playground is visualized as a grey square. In 3D visualization 
the playground color is *light green*, but it is opaque by default so we can not see it. 
By decrease `playgroundOpacity` we make the playground visible. In addition, we change 
`playgroundColor` to *black* because it fits better with the map.

The playground is placed on the map according to the coordinate system module. 
The origin's position is set in the previous step. By default, the axes are not 
visible because default axis length is 0m. We can display them by setting their 
length to a positive number. In this step, axis length is set to 100m.

This step is configured as follows:
<pre class="snippet" src="../omnetpp.ini" from="\[Config Visualization03\]" until="#---"></pre>

## Results
<img class="screen" src="step3_result_playground.png"  onclick="imageFullSizeZoom(this);" style="cursor:zoom-in">

<!--
3d img
axes, playground
-->

Sources: <a srcfile="visualization/omnetpp.ini" />, <a srcfile="visualization/VisualizationB.ned" />
