---
layout: page
title: Step 8. Showing IP adresses
tutorial: Visualization
---

## Goals
Understanding network traffic often requires identifying nodes based on their 
IP addresses. The IP address is also accessible in the inspector, but it is unsuitable 
for getting a good overview for the network. We can get a better overview 
if the IP address is displayed next to the node or on the links.
In this step, we demonstrate how to display IP address next to the node. 

## The model

### The configurator module
IPv4 addresses are automatically assigned to the hosts by `configurator`. It is also possible 
to assign IP addresses manually, we will use manual configuration in later steps. 
You can examine working of the `configurator` module in the 
<a href="http://inet.omnetpp.org/inet-tutorials//configurator/doc/" target="_blank">IPv4 Network Configurator Tutorial</a>.

### Visualizer
We can look at the IP address of a node in the module inspector. 
The IP address can be accessed as shown in the following picture.
Accessing IP address takes a little time and the other nodes' address can not be seen. 
<img class="screen" src="step8_model_ipaddress_in_inspector.png" onclick="imageFullSizeZoom(this);" style="cursor:zoom-in">

This visualizer displays IPv4 or IPv6 address for each interface of each node, by default. 
We narrow this selection by setting `nodeFilter` to *"pedestrian\*"* and setting 
`interfaceFilter` to *"wlan\*"*. 
This results in only the wlan IP address of the pedestrians being displayed. 
By using `backgroundColor` and `textColor`, we customize the color of the background 
and the text, for better appearance.

By editing the `format` parameter, we can display other informations about the interfaces 
of the nodes. For example, we can show the MAC address of the interfaces, by setting 
`format` to *"%N %\\\\%m"*. Other possible parameter values can be found in the 
NED documentation of `InterfaceTableVisualizer`.

The configuration of the `InterfaceTableVisualizer` for this step is the following:
<pre class="snippet" src="../omnetpp.ini" from="\[Config Visualization08\]" until="# showing mac address"></pre>

## Results
By using `InterfaceTableVisualizer` we get much better overview about the IP address of the nodes. 

<img class="screen" src="step8_result_2d_ipaddress.png" onclick="imageFullSizeZoom(this);" style="cursor:zoom-in">

Sources: <a srcfile="visualization/omnetpp.ini" />, <a srcfile="visualization/VisualizationD.ned" />
