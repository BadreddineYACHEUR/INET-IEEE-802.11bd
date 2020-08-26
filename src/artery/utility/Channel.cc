#include "Channel.h"
#include <boost/lexical_cast.hpp>
#include <omnetpp/cexception.h>
#include <limits>
#include <regex>

namespace artery
{

ChannelNumber parseChannelNumber(const std::string& str)
{
    static const std::regex number_regex("[0-9]+");

    ChannelNumber channel = -1;

    if (std::regex_match(str, number_regex)) {
        channel = boost::lexical_cast<ChannelNumber>(str);
    } else if (str == "CCH" || str == "SCH0") {
        channel = channel::CCH;
    } else if (str == "SCH1") {
        channel = channel::SCH1;
    } else if (str == "SCH2") {
        channel = channel::SCH2;
    } else if (str == "SCH3") {
        channel = channel::SCH3;
    } else if (str == "SCH4") {
        channel = channel::SCH4;
    } else if (str == "SCH5") {
        channel = channel::SCH5;
    } else if (str == "SCH6") {
        channel = channel::SCH6;
    } else if (str == "SCH0_BD") {
        channel = channel::SCH0_BD;
    } else if (str == "SCH1_BD") {
        channel = channel::SCH1_BD;
    }

    return channel;
}

unsigned getChannelRank(ChannelNumber ch)
{
    switch (ch) {
        case channel::CCH:
            return 10;
        case channel::SCH1:
            return 1;
        case channel::SCH2:
            return 2;
        case channel::SCH3:
            return 3;
        case channel::SCH4:
            return 4;
        case channel::SCH5:
            return 5;
        case channel::SCH6:
            return 6;
	case channel::SCH0_BD:
            return 0;
	case channel::SCH1_BD:
            return 1;	
        default:
            return std::numeric_limits<unsigned>::max();
    }
}

} // namespace artery
