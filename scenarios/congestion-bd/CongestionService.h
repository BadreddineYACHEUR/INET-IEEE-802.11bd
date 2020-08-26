#ifndef CONGESTIONSERVICE_H_
#define CONGESTIONSERVICE_H_

#include "artery/application/ItsG5Service.h"

// forward declaration
namespace traci { class VehicleController; }

class CongestionService : public artery::ItsG5Service
{
    public:
        void trigger() override;

    private:
	omnetpp::simsignal_t speedSignal; // added for tests
    
    protected:

        void initialize() override;
        traci::VehicleController* mVehicleController = nullptr;
};

#endif /* CONGESTIONSERVICE_H_ */
