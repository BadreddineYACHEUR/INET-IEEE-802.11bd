#ifndef AVOIDSERVICE_H_
#define AVOIDSERVICE_H_

#include "artery/application/ItsG5Service.h"

// forward declaration
namespace traci { class VehicleController; }

class AvoidService : public artery::ItsG5Service
{
    public:
        void indicate() override;
    protected:

        void initialize() override;
        traci::VehicleController* mVehicleController = nullptr;
};

#endif /* AVOIDSERVICE_H_ */
