#include "AvoidService.h"
#include "congestion_msgs/AvoidCongestionMessage_m.h"
#include "artery/traci/VehicleController.h"

using namespace omnetpp;
using namespace vanetza;

Define_Module(AvoidService)

void AvoidService::initialize()
{
    ItsG5BaseService::initialize();
    mVehicleController = &getFacilities().get_mutable<traci::VehicleController>();
}

void AvoidService::indicate(const vanetza::btp::DataIndication& ind, omnetpp::cPacket* packet)
{
    Enter_Method("AvoidService indicate");
    auto avoidCongestionMessage = check_and_cast<const AvoidCongestionMessage*>(packet);

    const std::string id = mVehicleController->getVehicleId();
    auto& vehicle_api = mVehicleController->getLiteAPI().vehicle();
    if (vehicle_api.getRoadID(id) == avoidCongestionMessage->getEdgeName()) {
        if (vehicle_api.getLaneIndex(id) != avoidCongestionMessage->getLaneIndex()) {
            changeRoute();
        }
    }

    delete avoidCongestionMessage;
}

void AvoidService::changeRoute()
{
    mVehicleController->setMaxSpeed(25 * units::si::meter_per_second);
}
