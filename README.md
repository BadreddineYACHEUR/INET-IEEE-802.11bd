# INET-IEEE-802.11bd
Basic Implementation of the IEEE 802.11bd in the INET 3.x and Artery Frameworks

To be able to use our bd implementation you have to: 
1- Replace the IEEE802.11 folder in INET with ours
2- Replace the Middelware and channel files in Artery with ours
3- Replace the content of the VanetNic.ned file with the content of the VanetNicBD.ned
4- Use the attribute "channel-bd" in the declaration of Artery services to indicate the channel that the service will use in bd mode

An example of the use of the bd standard is demonstrated via the /scenarios/ieee-grid-streaming scenario

Please reference both our papers that demonstrates the performance of the IEEE 802.11bd over the IEEE 802.11p and LTE-V2X mode3 in your future works.
You can find both papers this github repo:
-	Papers/Analysis and Comparison of IEEE 802.11 p and IEEE 802.11 bd.pdf
-	Papers/Implementation and Assessment of IEEE 802.11bd for Improved Road Safety.pdf


