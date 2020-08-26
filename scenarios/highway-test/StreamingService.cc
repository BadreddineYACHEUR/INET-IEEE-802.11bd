#include "StreamingService.h"
#include "streaming_msgs/StreamingMessage_m.h"
#include "artery/traci/VehicleController.h"

using namespace omnetpp;
using namespace vanetza;

Define_Module(StreamingService)

void StreamingService::initialize()
{
    ItsG5BaseService::initialize();
    mVehicleController = &getFacilities().get_mutable<traci::VehicleController>();
}

void StreamingService::trigger()
{
    Enter_Method("StreamingService trigger");
    const std::string id = mVehicleController->getVehicleId();
    auto& vehicle_api = mVehicleController->getLiteAPI().vehicle();
    simtime_t trouble_time = SimTime(210);
    if (simTime() <= trouble_time){
        EV << "the simtime is " << simTime() << "Im BROADCASTING A STREAMING VEIW OF THE ACCIDENT IN: "<< vehicle_api.getRoadID(id).c_str() << "\n";
        mVehicleController->setSpeed(0 * units::si::meter_per_second);

        auto packet = new StreamingMessage();
        packet->setEdgeName(vehicle_api.getRoadID(id).c_str());
        packet->setLaneIndex(vehicle_api.getLaneIndex(id));
        packet->setId(id.c_str());
        packet->setByteLength(1000);
        btp::DataRequestB req;

        req.destination_port = host_cast<StreamingService::port_type>(getPortNumber());
        req.gn.transport_type = geonet::TransportType::SHB;
        req.gn.traffic_class.tc_id(static_cast<unsigned>(dcc::Profile::DP1));
        req.gn.communication_profile = geonet::CommunicationProfile::ITS_G5;
        request(req, packet);
	delete packet;
   }

    
}
