#include "DetectionService.h"
#include "congestion_msgs/AvoidCongestionMessage_m.h"
#include "artery/traci/VehicleController.h"

using namespace omnetpp;
using namespace vanetza;

Define_Module(DetectionService)

void DetectionService::initialize()
{
    ItsG5BaseService::initialize();
    mVehicleController = &getFacilities().get_mutable<traci::VehicleController>();
}


void DetectionService::indicate(const vanetza::btp::DataIndication& ind, omnetpp::cPacket* packet)
{
    Enter_Method("DetectionService indicate");

    auto avoidJam = check_and_cast<const AvoidCongestionMessage*>(packet);

    const std::string id = mVehicleController->getVehicleId();
    auto& vehicle_api = mVehicleController->getLiteAPI().vehicle();
    std::string edge = "0to1";
    std::string edgeD = "1to2";
    std::string edgeA = "1to5";
    std::string type = "car0";
    std::string my_edge = vehicle_api.getRoadID(id).c_str();

    EV << "DettectionService" << " type " << vehicle_api.getTypeID(id) << " edge " << my_edge << " color "<< vehicle_api.getColor(id).g << " \n";


    if(avoidJam->getAvoid()){
        if(type.compare(vehicle_api.getTypeID(id)) == 0){
            if (edge.compare(avoidJam->getEdgeName()) == 0) {
                EV << "here... "<< avoidJam->getEdgeName() << " " << my_edge<< "\n";
                if(edge.compare(my_edge) == 0){
                    if(vehicle_api.getLanePosition(id) < vehicle_api.getLanePosition(avoidJam->getId())){
                        EV << vehicle_api.getLanePosition(id) << " " << vehicle_api.getLanePosition(avoidJam->getId()) << "\n";
                        vehicle_api.changeLane(id, 0, 0.00);
                        EV << "lane changed : " << vehicle_api.getLaneID(id) << "\n";
                    }else{
                        vehicle_api.changeLane(id, 1, 0.00);
                        EV << "lane changed : " << vehicle_api.getLaneID(id) << "\n";
                    }

                }

            }else{
                EV << "not here... "<< avoidJam->getEdgeName() << " " << my_edge<< "\n";

                if ((edge.compare(my_edge) == 0)){
                    vehicle_api.changeTarget(id, "1to5");
                    vehicle_api.setType(id, "car1");
                }else if((edgeD.compare(my_edge) == 0) || (my_edge.find(":1") == 0)){
                    EV << "do nothing\n";
                }else{
                    vehicle_api.setType(id, "car1");
                }
            }

        }

        delete avoidJam;

    }else{

        if(type.compare(vehicle_api.getTypeID(id))){
            if((vehicle_api.getColor(id).r == 255) && (vehicle_api.getColor(id).g == 255)){
                if (edge.compare(my_edge) == 0) {
                    vehicle_api.changeTarget(id, "1to2");
                    vehicle_api.setType(id, "car0");

                }else if((edgeA.compare(my_edge) == 0) || (my_edge.find(":1") == 0)){
                    vehicle_api.changeTarget(id, "0to1");
                    vehicle_api.setType(id, "car0");
                }
                else{
                    vehicle_api.setType(id, "car0");
                }
            }

        }
        delete avoidJam;

    }

}

