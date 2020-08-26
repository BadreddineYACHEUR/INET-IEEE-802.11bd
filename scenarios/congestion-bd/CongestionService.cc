#include "CongestionService.h"
#include "artery/traci/VehicleController.h"
#include "congestion_msgs/AvoidCongestionMessage_m.h"


using namespace omnetpp;
using namespace vanetza;

Define_Module(CongestionService)


	

void CongestionService::initialize()
{
    ItsG5BaseService::initialize();
    mVehicleController = &getFacilities().get_mutable<traci::VehicleController>();
    speedSignal = registerSignal("speed");
}

void CongestionService::trigger()
{
    Enter_Method("CongestionService trigger");

    const std::string id = mVehicleController->getVehicleId();
    auto& vehicle_api = mVehicleController->getLiteAPI().vehicle();
    simtime_t trouble_time = SimTime(210);
    simtime_t end_trouble_time = SimTime(300);
    simtime_t tmp = SimTime(200);
    emit(speedSignal, mVehicleController->getSpeed().value());
    if ((simTime() <= trouble_time) && (simTime() > tmp)){
        EV << "the simtime is " << simTime() << "and the green vehicle is going to stop on edge : "<< vehicle_api.getRoadID(id).c_str() << "\n";
        mVehicleController->setSpeed(0.1 * units::si::meter_per_second);

        auto packet = new AvoidCongestionMessage();
        packet->setEdgeName(vehicle_api.getRoadID(id).c_str());
        packet->setLaneIndex(vehicle_api.getLaneIndex(id));
        packet->setId(id.c_str());
        packet->setByteLength(par("byteLength"));
        btp::DataRequestB req;
	
        req.destination_port = host_cast<CongestionService::port_type>(getPortNumber());
        req.gn.transport_type = geonet::TransportType::SHB;
        req.gn.traffic_class.tc_id(static_cast<unsigned>(dcc::Profile::DP1));
        req.gn.communication_profile = geonet::CommunicationProfile::ITS_G5;
        request(req, packet);

    } else if(simTime() >= end_trouble_time){
        EV << "the simtime is " << simTime() << "and the green vehicle is going to run again : "<< vehicle_api.getRoadID(id).c_str() << "\n";
        mVehicleController->setSpeed(15 * units::si::meter_per_second);

        auto packet = new AvoidCongestionMessage();
        packet->setEdgeName(vehicle_api.getRoadID(id).c_str());
        packet->setLaneIndex(vehicle_api.getLaneIndex(id));
        packet->setId(id.c_str());
        packet->setAvoid(false);
        packet->setByteLength(par("byteLength"));
        btp::DataRequestB req;

        req.destination_port = host_cast<CongestionService::port_type>(getPortNumber());
        req.gn.transport_type = geonet::TransportType::SHB;
        req.gn.traffic_class.tc_id(static_cast<unsigned>(dcc::Profile::DP1));
        req.gn.communication_profile = geonet::CommunicationProfile::ITS_G5;
        request(req, packet);

    }
}
