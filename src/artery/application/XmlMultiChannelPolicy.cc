#include "artery/application/XmlMultiChannelPolicy.h"
#include <boost/lexical_cast.hpp>
#include <omnetpp/cexception.h>

namespace artery
{

XmlMultiChannelPolicy::XmlMultiChannelPolicy(const omnetpp::cXMLElement* cfg)
{
    read(cfg);
}

void XmlMultiChannelPolicy::read(const omnetpp::cXMLElement* cfg)
{
    mApplicationMapping.clear();
    mDefaultChannel = -1;
    mDefaultChannelBD = -1;

    if (cfg && strcmp(cfg->getTagName(), "mco") == 0) {
        const char* default_channel_attr = cfg->getAttribute("default");
	const char* default_bd_channel_attr = cfg->getAttribute("default-bd");
        if (default_channel_attr) {
            mDefaultChannel = parseChannelNumber(default_channel_attr);
        }
	if (default_bd_channel_attr) {
            mDefaultChannelBD = parseChannelNumber(default_bd_channel_attr);
        }
        for (const omnetpp::cXMLElement* app : cfg->getChildrenByTagName("application"))
        {
            const char* id_attr = app->getAttribute("id");
            if (!id_attr) {
                throw omnetpp::cRuntimeError("XML MCO configuration contains application tag without id attribute");
            }

            const char* ch_attr = app->getAttribute("channel");
            if (!ch_attr) {
		ch_attr = app->getAttribute("channel-bd");
		if (!ch_attr)
                	throw omnetpp::cRuntimeError("XML MCO configuration contains application tag without channel attribute");
            }

            auto aid = boost::lexical_cast<vanetza::ItsAid>(id_attr);
            auto channel = parseChannelNumber(ch_attr);
            mApplicationMapping[aid].insert(channel);
        }
    } else {
        throw omnetpp::cRuntimeError("XML MCO configuration does not start with mco tag");
    }
}

std::vector<ChannelNumber> 
	XmlMultiChannelPolicy::allChannels(vanetza::ItsAid aid) const
{
    std::vector<ChannelNumber> channels;

    auto found = mApplicationMapping.find(aid);	
    if (found != mApplicationMapping.end()) {
        channels.insert(channels.end(), found->second.begin(), 
						found->second.end());
    } else {
        if (mDefaultChannel != -1) {
            channels.push_back(mDefaultChannel);
        }
		
	if (mDefaultChannelBD != -1) {
	    // SCH0_BD as a default channel for the IEEE 80211bd standard
	    channels.push_back(mDefaultChannelBD); 
        }
    }
	
    return channels;
}

} // namespace artery
