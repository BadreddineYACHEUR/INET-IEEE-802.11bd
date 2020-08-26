packet AvoidCongestionMessage
{
    string edgeName;
    string id;
    int laneIndex;
    bool avoid = true;
};
