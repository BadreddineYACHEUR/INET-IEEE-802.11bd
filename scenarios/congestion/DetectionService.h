#ifndef DETECTIONSERVICE_H_
#define DETECTIONSERVICE_H_

#include "artery/application/ItsG5Service.h"

// forward declaration
namespace traci { class VehicleController; }

class DetectionService : public artery::ItsG5Service
{

    protected:
        void indicate(const vanetza::btp::DataIndication&, omnetpp::cPacket*) override;
        void initialize() override;


        traci::VehicleController* mVehicleController = nullptr;
};

#endif /* DETECTIONSERVICE_H_ */
