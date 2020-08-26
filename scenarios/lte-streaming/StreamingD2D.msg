packet StreamingReport
{
    double positionX;
    double positionY;
    double speed;
    simtime_t time;
}

packet StreamingQuery
{
    double positionX;
    double positionY;
    double radius;
}

packet StreamingResponse
{
    int warnings;
}
