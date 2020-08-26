#include "artery/application/MultiChannelPolicy.h"
#include <algorithm>
#include <iostream>

namespace artery
{

ChannelNumber MultiChannelPolicy::primaryChannel(vanetza::ItsAid aid) const
{
    auto channels = allChannels(aid);
    std::sort(channels.begin(), channels.end(), ChannelRankCompare);
    return !channels.empty() ? channels.front() : -1;
}

} // namespace artery
