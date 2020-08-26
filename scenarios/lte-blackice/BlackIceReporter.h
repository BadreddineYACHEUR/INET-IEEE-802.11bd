#ifndef BLACKICEREPORTER_H_COLABPR9
#define BLACKICEREPORTER_H_COLABPR9

#include <inet/transportlayer/contract/udp/UDPSocket.h>
#include <omnetpp/clistener.h>
#include <omnetpp/csimplemodule.h>

// forward declaration
namespace traci { class VehicleController; }

class BlackIceReporter : public omnetpp::cSimpleModule, public omnetpp::cListener
{
protected:
    int numInitStages() const override;
    void initialize(int stage) override;
    void finish() override;
    void receiveSignal(omnetpp::cComponent*, omnetpp::simsignal_t, omnetpp::cObject*, omnetpp::cObject*) override;

private:
    void sendReport();

    inet::UDPSocket socket;
    const traci::VehicleController* vehicleController = nullptr;
    unsigned tractionLosses;
};

#endif /* BLACKICEREPORTER_H_COLABPR9 */

