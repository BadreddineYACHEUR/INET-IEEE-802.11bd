#ifndef STREAMINGSERVICE_H_
#define STREAMINGSERVICE_H_

#include "artery/application/ItsG5Service.h"

// forward declaration
namespace traci { class VehicleController; }

class StreamingService : public artery::ItsG5Service
{
    public:
        void trigger() override;

    private:
	omnetpp::simsignal_t speedSignal; // added for tests
	double warningRadius;
    	double warningDuration;
	omnetpp::cMessage* removeSpeedReduction;
	bool accidentDetected = false;
    
    protected:
	void indicate(const vanetza::btp::DataIndication&, omnetpp::cPacket*) override;
	void receiveSignal(omnetpp::cComponent*, omnetpp::simsignal_t, omnetpp::cObject*, omnetpp::cObject*) override;
	void handleMessage(omnetpp::cMessage*) override;
        void initialize() override;
        traci::VehicleController* mVehicleController = nullptr;
};

#endif /* STREAMINGSERVICE_H_ */
