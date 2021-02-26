package artery.inet;

import inet.linklayer.ieee80211.Ieee80211Nic;

module VanetNic extends Ieee80211Nic
{
    parameters:
	
        macType = "Ieee80211Mac";
        mgmtType = "Ieee80211MgmtAdhoc";
        opMode = "bd"; // the added operation mode
        bitrate = default(52 Mbps); // can be 6.5, 13, 19.5, 26, 39, 52, 58.5, 65, 78

	**.opMode = opMode;
	mac.modeSet = opMode;
        mac.qosStation = true;
        mac.rx.typename = default("ChannelLoadRx");

        radioType = default("VanetRadio");
        radio.bandName = "5.9 GHz&20 MHz"; // The new 20MHz channel in the 5.9GHz channel
        radio.bandwidth = 20 MHz;
        radio.channelNumber = default(0);
	radio.antenna.numAntennas = 8;
        // carrierFrequency is automatically set by the radio
        radio.receiverType = default("VanetReceiver");

        mac.hcf.rateSelection.dataFrameBitrate = bitrate;
        mac.hcf.rateSelection.mgmtFrameBitrate = bitrate;
        mac.hcf.rateSelection.multicastFrameBitrate = bitrate;

        // EDCA settings for activated OCB mode (see table 8-106 in IEEE 802.11-2012)
        mac.hcf.edcaTxopProcedures[*].txopLimit = 0;

        // AC_BK
        mac.hcf.edca.edcaf[0].aifsn = 9;
        mac.hcf.edca.edcaf[0].cwMin = 15;
        mac.hcf.edca.edcaf[0].cwMax = 1023;

        // AC_BE
        mac.hcf.edca.edcaf[1].aifsn = 6;
        mac.hcf.edca.edcaf[1].cwMin = 15;
        mac.hcf.edca.edcaf[1].cwMax = 1023;

        // AC_VI
        mac.hcf.edca.edcaf[2].aifsn = 3;
        mac.hcf.edca.edcaf[2].cwMin = 7;
        mac.hcf.edca.edcaf[2].cwMax = 15;

        // AC_VO
        mac.hcf.edca.edcaf[3].aifsn = 2;
        mac.hcf.edca.edcaf[3].cwMin = 3;
        mac.hcf.edca.edcaf[3].cwMax = 7;
}
