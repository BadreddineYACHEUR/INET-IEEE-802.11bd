---
layout: page
title: MAC Protocols for Wireless Sensor Networks
hidden: true
---

## Goals

There are media access control (MAC) protocols designed specifically for wireless sensor networks. INET has several such protocol implementations, alongside IEEE 802.15.4 models. This showcase consists of two parts. In Part 1, we demonstrate three wireless sensor network MAC protocols with three example simulations of a wireless sensor network. In Part 2, we compare the three protocols using statistics.

INET version: `4.0`<br>
Source files location: <a href="https://github.com/inet-framework/inet-showcases/tree/master/wireless/sensornetwork" target="_blank">`inet/showcases/wireless/sensornetwork`</a>

## Part 1: Demonstrating the MAC protocols

V1

The devices that make up wireless sensor networks (WSNs) are often power constrained, and the networks have high latency and low throughput, as compared to WLANs, for example. There are two main categories of MAC protocols for WSNs: time-division multiple access based (TDMA), such as LMAC, and carrier-sense multiple access (CSMA) based, such as B-MAC and X-MAC.

V2

There are two main categories of MAC protocols for WSNs, according to how the MAC manages when certain nodes can communicate on the channel:

- `Time-division multiple access (TDMA) based`: These protocols assign different time slots to nodes. Nodes can send messages only in their time slot, thus eliminating contention. Examples of these kind of MAC protocols include LMAC, TRAMA, etc.
- `Carrier-sense multiple access (CSMA) based`: These protocols use carrier sensing and backoffs to avoid collisions, similarly to IEEE 802.11. Examples include B-MAC, SMAC, TMAC, X-MAC.

This showcase demonstrates the WSN MAC protocols available in INET: B-MAC, LMAC and X-MAC. The following sections detail these protocols briefly.

### B-MAC

B-MAC (short for Berkeley MAC) is a widely used WSN MAC protocol, it is part of TinyOS. It employs low-power listening (LPL) to minimize power consumption due to idle listening. Nodes have a sleep period, after which they wake up and sense the medium for preambles (clear channel assessment - CCA.) If none is detected, the nodes go back to sleep. If there is a preamle, the nodes stay awake and receive the data packet after the preamle. If a node wants to send a message, it first sends a preamle for at least the sleep period in order for all nodes to detect it.
After the preable, it sends the data packet. There are optional acknowledgements as well. After the data packet (or data packet + ACK) exchange, the nodes go back to sleep. Note that the preamble doesn't contain addressing information. Since the recipient's address is contained in the data packet, all nodes receive the preamble and the data packet in the sender's communication range (not just the intended recipient of the data packet.)

### X-MAC

X-MAC is a development on B-MAC and aims to improve on some of B-MAC's shortcomings. In B-MAC, the entire preamle is transmitted, regardless of whether the destination node awoke at the beginning of the preamle or at the end. Furthermore, with B-MAC, all nodes receive both the preamble and the data packet. X-MAC employs a strobed preamble, i.e. sending the same lenght preamle as B-MAC, but as shorter bursts, with pauses in between. The pauses are long enough that the destination node can send an acknowledgement if it is already awake.
When the sender receives the acknowledgement, it stops sending preambles and sends the data packet. This can save time because potentially, the sender doesn't have to send the whole length preamble. Also, the preamle contains the address of the destination node. Nodes can wake up, receive the preamble, and go back to sleep if the packet is not addressed to them.
These features improve B-MAC's power efficiency by decreasing nodes' time spent in idle listening.

### LMAC

LMAC (short for lightweight MAC) is a TDMA-based MAC protocol. There are data transfer timeframes, which are divided into time slots. The number of time slots in a timeframe is configurable according to the number of nodes in the network. Each node has its own time slot, in which only that particular node can transmit. This saves power, as there are no collisions or retransmissions. A transmission consist of a control message and a data unit. The control message contains the destination of the data, the length of the data unit, and information about which time slots are occupied. All nodes wake up at the beginning of each time slot. If there is no transmission, the time slot is assumed to be empty (not owned by any nodes), and the nodes go back to sleep. If there is a transmission, after receiving the control message, nodes that are not the recipient go back to sleep. The recipient node and the sender node goes back to sleep after receiving/sending the transmission.
Only one message can be sent in each time slot.
In the first five timeframes, the network is set up and no data packets are sent. The network is set up by nodes claiming a time slot. They send a control message in the time slot they want to reserve. If there are no collisions, nodes note that the time slot is claimed. If there are multiple nodes trying to claim the same time slot, and there is a collision, they randomly choose another unclaimed time slot.

### The INET implementations

The three MACs are implemented in INET as the `BMac`, `XMac`, and `LMac` modules.
They have parameters to adapt the MAC protocol to the size of the network and the traffic intensity,
such as slot time, clear channel assessment duration, bitrate, etc.
The parameters have default values, thus the MAC modules can be used without setting any of their parameters. Check the NED files of the MAC modules (`BMac.ned`, `XMac.ned`, and `LMac.ned`) to see all parameters.

The MACs don't have corresponding physical layer models. They can be used with existing generic radio models in INET, such as `UnitDiskRadio` or `ApskRadio`. We're using `ApskRadio` in this showcase, because it is more realistic than `UnitDiskRadio`.

<!-- <pre>
- the scenario
- the configuration
- the configuration and parameters of each mac
- results
- statistics
</pre> -->

### Configuration

The showcase contains three example simulations, which demonstrate the three MACs in a wireless sensor network. The scenario is that there are wireless sensor nodes in a refrigerated warehouse, monitoring the temperature at their location. They periodically transmit temperature data wirelessly to a gateway node, which forwards the data to a server via a wired connection.
To run the example simulations, choose the `BMac`, `LMac` and `XMac` configurations from omnetpp.ini.
Most of the configuration keys in the ini file are shared between the three simulations (they are defined in the `General` configuration), except for the MAC protocol specific settings.
All three simulations will use the same network, `SensorNetworkShowcaseA`, defined in SensorNetworkShowcase.ned:

<img class="screen" src="network.png">

In the network, the wireless sensor nodes are `WirelessHost`s, named `sensor1` up to `sensor4`, and `gateway`. The node named `server` is a `StandardHost`. The network also contains an `Ipv4NetworkConfigurator`, an `IntegratedVisualizer`, and an `ApskScalarRadioMedium` module. The nodes are placed against the backdrop of a warehouse floorplan. The playground size is 60x30 meters. The warehouse is just a background image providing context. Obstacle loss is not modelled, so the background image doesn't affect the simulation in any way.

The wireless interface in the sensor nodes and the gateway is specified in omnetpp.ini to be the generic `WirelessInterface` (instead of the Wifi specific `Ieee80211Interface`, which is the default wlan interface in `WirelessHost`). The radio type is set to `ApskScalarRadio`:

```
**.wlan[*].typename = "WirelessInterface"
**.wlan[*].radioType = "ApskScalarRadio"
```

We are using `ApskScalarRadio` here, because it is a relatively simple, generic radio. It uses amplitude and phase-shift keying modulations (e.g. BPSK, QAM-16 or QAM-64, BPSK by default), without additional features such as forward error correction, interleaving or spreading. We set the bitrate in omnetpp.ini to 19200 bps, to match the default for the MAC bitrates (we'll use the default bitrate in the MACs, which is 19200 bps for all three MAC types.) The `preambleDuration` is set to be very short for better compatibility with the MACs. We also set some other parameters of the radio to arbitrary values:

```
**.radio.carrierFrequency = 2.45GHz
**.radio.bandwidth = 2.8MHz

**.radio.transmitter.bitrate = 19200 bps
**.radio.transmitter.headerLength = 8b
**.radio.transmitter.preambleDuration = 0.0001s
**.radio.transmitter.power = 2.24mW

**.radio.receiver.energyDetection = -90dBm
**.radio.receiver.sensitivity = -100dBm
**.radio.receiver.snirThreshold = -8dB
```

Routes are set up according to a star topology, with the gateway at the center. This is achieved by dumping the full configuration of `Ipv4NetworkConfigurator` (which was generated with the configurator's default settings), and then modifying it. The modified configuration is in the config.xml file. The following image shows the routes:

<img class="screen" src="routes.png" style="max-width: 80%;">

Each sensor node will send an UDP packet with a 10-byte payload ("temperature data") every second to the server,
with a random start time around 1s. The packets will have an 8-byte UDP header and a 20-byte Ipv4 header, so they will be 38 bytes at the MAC level. The packets will be routed via the gateway. Here are the application settings in omnetpp.ini:

```
*.sensor*.numApps = 1
*.sensor*.app[0].typename = "UdpBasicApp"
*.sensor*.app[0].destAddresses = "server"
*.sensor*.app[0].destPort = 1000
*.sensor*.app[0].sendInterval = 1s
*.sensor*.app[0].startTime = exponential(1s)
*.sensor*.app[0].messageLength = 10Byte

*.server.numApps = 1
*.server.app[0].typename = "UdpSink"
*.server.app[0].localPort = 1000
```

The MAC-specific parameters are set in the configurations for the individual MACs.

For B-MAC, the wireless interface's `macType` parameter is set to `BMac`. Also, the `slotDuration` parameter is set to 0.025s (an arbitrary value.) This parameter is essentially the nodes' sleep duration.
Here is the configuration in omnetpp.ini:

```
[Config BMac]
network = SensorNetworkShowcaseA

**.wlan[*].macType = "BMac"
**.wlan[*].mac.slotDuration = 0.025s
```

For X-MAC, the wireless interface's `macType` parameter is set to `XMac`. The MAC's `slotDuration` parameter determines the duration of the nodes' sleep periods. It is set to 0.25s for the sensor nodes, and 0.1s for the gateway. Nodes transmit preambles for the duration of their own sleep periods, unless interrupted by an acknowledgement from the destination node. The design of X-MAC allows to set different sleep intervals for different nodes, as long as the sender node's sleep interval is greater than the receiver's. (?). We set the slot duration of the gateway to a shorter value, because it has to receive and relay data from all sensors, thus it has more traffic. Here is the configuration in omnetpp.ini:

```
[Config XMac]
network = SensorNetworkShowcaseA

**.wlan[*].macType = "XMac"
*.gateway.wlan[*].mac.slotDuration = 0.1s
*.sensor*.wlan[*].mac.slotDuration = 0.25s
```

For LMAC, the wireless interface's `macType` parameter is set to `LMac`. The `numSlots` parameter is set to 8, as it is sufficient (there are only five nodes in the wireless sensor network.)
The `reservedMobileSlots` parameter reserves some of the slots for mobile nodes, these slots are not chosen by any of the nodes during network setup. The parameter's default value is 2, but it is set to 0. The `slotDuration` parameter's default value is 100ms, but we set it to 50ms to decrease the network setup time. The duration of a timeframe will be 400ms (number of slots * slot duration.) The network is set up in the first five frames, i.e. in the first 2 seconds. Here is the configuration in omnetpp.ini:

```
[Config LMac]
network = SensorNetworkShowcaseA

**.wlan[*].macType = "LMac"
**.mac.slotDuration = 50ms
**.mac.numSlots = 8
**.mac.reservedMobileSlots = 0
```

The next sections demonstrate the three simulations.

### B-MAC

The following video shows sensor nodes sending data to the server:

<p>
<video autoplay loop controls onclick="this.paused ? this.play() : this.pause();" src="BMac2.mp4"></video>
</p>
<!--internal video recording, zoom 20.28, animation speed none, playback speed 1.698, normal run, crop 50 50 130 130-->

`BMac` actually sends multiple shorter preambles instead of a long one, so that waking nodes can receive the one that starts after they woke up.
`sensor3` starts sending preambles, while the other nodes are asleep. All of them wake up before the end of the preamble transmission. When the nodes are awake, they receive the preamble, and receive the data packet as well at the physical layer (the mac discards it if it is not for them.) Then the gateway sends it to the server. Note that all nodes receive the preables and the data packet as well.

### X-MAC

In the following video, the sensors send data to the server:

<p>
<video autoplay loop controls onclick="this.paused ? this.play() : this.pause();" src="XMac2.mp4"></video>
</p>
<!--internal video recording, zoom 20.28, animation speed none, playback speed 1.698, normal run, crop 50 50 130 130-->

`sensor3` start sending preambles. `sensor4` wakes up and receives one of the preambles (hence the dotted arrow representing a successful physical layer transmission), and goes back to sleep, as the transmission is addressed to the gateway. Then the gateway wakes up, and sends an acknowledgement after receiving one of the preambles. `sensor3` sends the data packet, and the gateway forwards it to the server.

### LMAC

In following video, sensor nodes send data to the server:

<p>
<video autoplay loop controls onclick="this.paused ? this.play() : this.pause();" src="LMac5.mp4"></video>
</p>
<!--internal video recording, zoom 20.28, animation speed none, playback speed 1.698, normal run, crop 50 50 130 130-->

Each node transmits in its own time slot, there are no collisions. Note that all nodes receive the control message (indicated by the physical link visualizer arrows), but only the destination node receives the data unit.

## Part 2: Optimizing for packet loss and comparing power consumption

In this section, we'll compare the three MAC protocols in terms of a few statistics, such as the number of UDP packets carried by the network, and power consumption. In order to compare the three protocols, we want to find the parameter values for each MAC, which lead to the best performance of the network in a particular scenario. We'll optimize for the number of packets received by the server, i.e. we want to minimize packet loss.

The scenario will be the same as in the `BMac`, `XMac` and `LMac` configurations (each sensor sending data every second to the server), except that it will use a similar, but more generic network layout instead of the warehouse network:

<img class="screen" src="statisticnetwork.png" style="max-width: 60%;">

We'll run three parameter studies, one for each MAC protocol. We want to optimize just one parameter of each MAC, the slot duration. Ideally, one would want to optimize multiple parameters in order to find a more optimal set of parameter values, but it is out of scope for this showcase. The choices for the values of the other parameters are arbitrary.
The simulations will be run for 100s, and each iteration will be run 10 times to get smoother results. We'll choose the best performing parameters according to the number of packets received by the server.

The parameter study configurations for the three MAC protocols will extend the `StatisticBase` config (as well as the `General` configuration):

```
[Config StatisticBase]
network = SensorNetworkShowcaseB
**.vector-recording = false
sim-time-limit = 100s
repeat = 10
```

In this base configuration, we set the simulation time limit, the number of repetitions, and turn vector recording off to speed up the runs.

The results are plotted in the `StatisticBMac.anf`, `StatisticXMac.anf`, and `StatisticLMac.anf` files.
The parameter studies for the individual MACs are detailed in the following sections.

### Optimizing B-MAC

The goal is to optimize `BMac`'s `slotTime` parameter for the number of packets received by the server. The configuration in omnetpp.ini for this is `StatisticBMac`. It contains 1000 runs. Here is the configuration:

```
[Config StatisticBMac]
extends = StatisticBase

**.wlan[*].macType = "BMac"
**.wlan[*].mac.slotDuration = ${slotDuration=0.01..1 step 0.01}s
```

In the study, `slotDuration` will run from 10ms to 1s in 10ms increments (the default of `slotDuration` is 100ms.)
The number of packets received by the server for each `slotDuration` value is shown on the following image (time in seconds):

<img class="screen" src="statisticbmac.png" onclick="imageFullSizeZoom(this);" style="cursor:zoom-in">

The sensors send 100 packets each during the course of the 100s, thus 400 packets total. It is apparent from the results that the network cannot carry all traffic in this scenario. The results also outline a smooth curve. We choose 0.19s as the best performing value for `slotDuration`.

### Optimizing X-MAC

Again, we optimize the `slotTime` parameter for the number of packets received by the server. As in the `XMac` configuration, the `slotTime` for the gateway will be shorter than for the sensors. The configuration in omnetpp.ini for this is `StatisticXMac`. It contains 1000 runs. Here is the configuration:

```
[Config StatisticXMac]
extends = StatisticBase

**.wlan[*].macType = "XMac"
*.gateway.wlan[*].mac.slotDuration = ${gwSlotDuration=0.01..1 step 0.01}s
*.sensor*.wlan[*].mac.slotDuration = ${snSlotDuration=2.5*$gwSlotDuration}s
```

The default of `slotDuration` for `XMac` is 100ms. In the study, the gateway's `slotDuration` will run from 10ms to 1s in 10ms increments, similarly to the parameter study for B-MAC. The `slotDuration` for the sensors will be 2.5 times that of the gateway (an arbitrary value.)
Here are the results (time in seconds):

<img class="screen" src="statisticxmac.png" onclick="imageFullSizeZoom(this);" style="cursor:zoom-in">

According to this, the optimal value for the gateway's `slotDuration` is 0.14s (0.35s for the sensors), so we choose that.

### Optimizing LMAC

We'll optimize the `slotDuration` parameter for the number of packets received by the server. The configuration for this study in omnetpp.ini is `StatisticLMac`. It contains 1000 runs. Here is the configuration:

```
[Config StatisticLMac]
extends = StatisticBase

**.wlan[*].macType = "LMac"
**.mac.slotDuration = ${slotDuration=0.01..1 step 0.01}s
**.mac.numSlots = 8
**.mac.reservedMobileSlots = 0
```

We set `reservedMobileSlots` to 0, and `numSlots` to 8. The `slotDuration` parameter will run from 10ms to 1s in 10ms steps.
The number of received packets are displayed on the following image (time in seconds):

<img class="screen" src="statisticlmac3.png" onclick="imageFullSizeZoom(this);" style="cursor:zoom-in">

It is apparent from the results that the network can carry almost all the traffic in this scenario (as opposed to the `XMac` and `LMac` results.) The best performing value for `slotDuration` is 50ms.
Note that the lowest `slotDuration` values up until 120ms yield approximatelly the same results (around 400 packets), with the 50ms value performing marginally better. Choosing the higher `slotDuration` value would result in about the same performance but lower power consumption, but we are optimizing for the number of packets here.

### Measuring power consumption

We will run the three simulations with the chosen parameters again, this time measuring power consumption as well.

There is a simulation for each MAC measuring the power consumption. These are `PowerBMac`, `PowerXMac`, and `PowerLMac` in omnetpp.ini. All of them extend the `PowerBase` configuration (which itself is an extension of `StatisticBase`):

```
[Config PowerBase]
extends = StatisticBase

*.*.wlan[*].radio.energyConsumerType = "SensorStateBasedEpEnergyConsumer"
*.*.energyStorageType = "IdealEpEnergyStorage"
```

The power configs will use the same network as the statistic configs, `SensorNetworkShowcaseB` defined in SensorNetworkShowcase.ned. The simulations will be run for 100s. Vector recording is turned off, because we are not interested in how energy levels change over time, we only require the last value of the `residualEnergyCapacity` statistic. To get more relevant results, we run the power simulations 10 times.

V1

We want to record energy consumption in the radios of the wireless nodes. The nodes need an energy storage model which will record the energy consumption, and an energy consumer model, which will provide how much energy is consumed. The energy storage module is set to be `IdealEpEnergyStorage`, which is an energy/power-based storage model (the two available types of storage models are the simpler energy/power-based, and the more realistic charge/current-based, denoted by `Ep` and `Cc` in the type name.) `IdealEpEnergyStorage` provides infinite energy, cannot be fully charged or depleted, and it is useful if we only want to model and measure power consumption, but not energy capacity, charging, etc. We are interested in the `residualEnergyCapacity` statistic of the energy storage module.
(Note that the `residualEnergyCapacity` statistic will have negative values, because energy generation is assumed to be positive, while energy consumption to be negative.)

The energy consumer module in the radios is set to be `SensorStateBasedEpEnergyConsumer`. State based energy consumer models associate energy consumption values to the different radio modes and transmitter/receiver states. Energy consumption is dependent on these values and on how much time the radio spends in each mode/state. Note that the energy consumption values are parameters of the consumer module, they don't come from the radio. `SensorStateBasedEpEnergyConsumer` is an extension of `StateBasedEnergyConsumer` with default consumption values typical for low power wireless sensor nodes. (Note that the consumption values should be set to more accurate ones if needed.)

<!-- TODO rewrite or delete
v1
We leave the consumption parameters on default, but for increased accuracy, they should be adjusted to the exact values in a simulation.
v2
Note that these default values are typical, but might not be accurate enough. If higher accuracy of the power consumption is required, the values should be set according to the simulated radio transceiver model and the power consumption associated with the actual transmission power, for example.
v3
These values are typical...but if you want more accuracy, you need to set them to more accurate ones
v4
Note that the consumption values can be set to more accurate ones if needed. -->

V2

We want to record the power consumption of the radios in the wireless nodes.
We configure the energy consumer module in the radios to be `SensorStateBasedEpEnergyConsumer`.
This module assigns a constant power consumption value to each radio mode and transmitter/receiver state. Note that the values for each state are parameters of the energy consumer module, and don't come from other modules (such as the radio), so they need to be set correctly in order to obtain accurate power consumption results. `SensorStateBasedEpEnergyConsumer` has default power consumption values typical for wireless sensor nodes, thus we leave module's parameters on default.
We configure the energy storage model in the gateway and the sensors to be `IdealEpEnergyStorage`.
This module keeps track of the node's energy consumption. It stores an infinite amount of energy, and cannot get fully charged or depleted. It is useful for measuring energy consumption in nodes.

The configurations extending the `PowerBase` configurations in omnetpp.ini will use the best-performing parameter values selected in the previous section:

```
[Config PowerBMac]
extends = PowerBase

**.wlan[*].macType = "BMac"
**.wlan[*].mac.slotDuration = 0.19s

[Config PowerXMac]
extends = PowerBase

**.wlan[*].macType = "XMac"
*.gateway.wlan[*].mac.slotDuration = 0.14s
*.sensor*.wlan[*].mac.slotDuration = 0.35s

[Config PowerLMac]
extends = PowerBase

**.wlan[*].macType = "LMac"
**.mac.slotDuration = 50ms
**.mac.numSlots = 8
**.mac.reservedMobileSlots = 0
```

We will plot the results on bar charts (see `PowerConsumption.anf`). We'll examine the following statistics:

- `Total number of packets received`: All the packets received by the server. The UDP applications in the sensors each send 100 packets during the course of the 100s simulations, for a total of 400 packets.
- `Network total power consumption`: The sum of the power consumption of the four sensors and the gateway (values in Joules.)
- `Power consumption per packet`: Network total power consumption / Total number of packets received, thus power consumption per packet in the entire network (values in Joules.)
- `Packet loss`: Total number of packets received / total number of packets sent, thus how many packets from the 400 sent are lost.

Note that the values for the `residualEnergyCapacity` statistic are negative, so it is inverted in the anf file.
Here are the results:

<img class="screen" src="power.png" onclick="imageFullSizeZoom(this);">

From this, it is apparent that LMac carried the most packets, and `BMac` the least. `BMac` consumed significantly more power than the others. All three carried around 90-100% of the traffic (`BMac` 90%, `XMac` 99.25%, `LMac` 97%), thus BMac has significantly more power consumption per packet. The conclusion in this scenario, with the selected parameter values, `XMac` turned out to be the most energy efficient MAC protocol, although `LMac` carried a bit more traffic.

## Further information

Here are the documents describing the MAC protocols:

- B-MAC: <a href="https://people.eecs.berkeley.edu/~culler/papers/sensys04-bmac.pdf">Versatile Low Power Media Access for Wireless Sensor Networks</a>
- X-MAC: <a href="http://www.cs.cmu.edu/~andersoe/papers/xmac-sensys.pdf">X-MAC: A Short Preamble MAC Protocol for Duty-Cycled Wireless Sensor Networks</a>
- LMAC: <a href="https://ris.utwente.nl/ws/portalfiles/portal/5427399">A Lightweight Medium Access Protocol (LMAC) for Wireless Sensor Networks</a>

