#ifndef STREAMINGSERVICE_H_
#define STREAMINGSERVICE_H_

#include "artery/application/ItsG5Service.h"

// forward declaration
namespace traci { class VehicleController; }

class StreamingService : public artery::ItsG5Service
{
    public:
        void trigger() override;
    protected:

        void initialize() override;
        traci::VehicleController* mVehicleController = nullptr;
};

#endif /* STREAMINGSERVICE_H_ */
