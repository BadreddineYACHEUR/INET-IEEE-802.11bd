#ifndef POLICESERVICE_H_
#define POLICESERVICE_H_

#include "artery/application/ItsG5Service.h"
#include "police_msgs/PoliceClearLane_m.h"

// forward declaration
namespace traci { class VehicleController; }

class PoliceService : public artery::ItsG5Service
{
    public:
        void trigger() override;
	long nbSent = 0;
        PoliceClearLane* p = nullptr;

    protected:

        void initialize() override;
        const traci::VehicleController* mVehicleController = nullptr;
};

#endif /* POLICESERVICE_H_ */
