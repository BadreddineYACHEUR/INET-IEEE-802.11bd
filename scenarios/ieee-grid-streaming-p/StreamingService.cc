#include "StreamingService.h"
#include "artery/traci/VehicleController.h"
#include "ieee_streaming_msgs/Streaming_m.h"
#include <artery/application/StoryboardSignal.h>


using namespace omnetpp;
using namespace vanetza;
// register signal to recieve signal from Storyboard
static const simsignal_t storyboardSignal = cComponent::registerSignal("StoryboardSignal");

Define_Module(StreamingService)
	

void StreamingService::initialize()
{
    ItsG5BaseService::initialize();
    mVehicleController = &getFacilities().get_mutable<traci::VehicleController>();
    speedSignal = registerSignal("speed");
    subscribe(storyboardSignal);
    accidentDetected = false;
    removeSpeedReduction = new omnetpp::cMessage("remove speed reduction");
    warningRadius = par("warningRadius");
    warningDuration = par("warningDuration");
}

void StreamingService::receiveSignal(omnetpp::cComponent*, omnetpp::simsignal_t sig, omnetpp::cObject* sigobj, omnetpp::cObject*)
{	
    if (sig == storyboardSignal) {
	using boost::units::si::meter_per_second;
        auto storyobj = dynamic_cast<artery::StoryboardSignal*>(sigobj);
	std::cout << "Signal /////////////////////////////////////" << mVehicleController->getVehicleId() << " " << mVehicleController->getSpeed() / meter_per_second << "  " << simTime() << "  " << !storyobj->getCause().compare("accident detected");
        if (!storyobj->getCause().compare("accident detected")) {
            accidentDetected = true;
	    std::cout << "ACCIDENT DETECTED ----------------------------------"<< "----" << accidentDetected;
        }
    }
}

void StreamingService::trigger()
{
    	Enter_Method("StreamingService trigger");
	EV_INFO << "MESSAGE SENT ----------------------------------------------" << accidentDetected;
	if (accidentDetected){
		emit(speedSignal, mVehicleController->getSpeed().value());
	    	EV_INFO << "MESSAGE SENT +++++++++++++++++++++++++++++++++++++++++++++++";
		auto packet = new StreamingReport("accident warning");
		using boost::units::si::meter;
    		using boost::units::si::meter_per_second;
		packet->setPositionX(mVehicleController->getPosition().x / meter);
		packet->setPositionY(mVehicleController->getPosition().y / meter);
		packet->setSpeed(mVehicleController->getSpeed() / meter_per_second);
		packet->setTime(simTime());
		packet->setByteLength(par("byteLength"));

		btp::DataRequestB req;
		req.destination_port = host_cast<StreamingService::port_type>(getPortNumber());
		req.gn.transport_type = geonet::TransportType::SHB;
		req.gn.traffic_class.tc_id(static_cast<unsigned>(dcc::Profile::DP1));
		req.gn.communication_profile = geonet::CommunicationProfile::ITS_G5;
		request(req, packet);

	}
	
	
}

void StreamingService::indicate(const vanetza::btp::DataIndication& ind, omnetpp::cPacket* packet)
{
    Enter_Method("StreamingService indicate");
    auto streamingMessage = check_and_cast<StreamingReport*>(packet);

    using boost::units::si::meter;
    double dx = streamingMessage->getPositionX() - mVehicleController->getPosition().x / meter;
    double dy = streamingMessage->getPositionY() - mVehicleController->getPosition().y / meter;
    if (dx * dx + dy * dy > warningRadius * warningRadius) {
        return;
    }

    if (removeSpeedReduction->isScheduled()) {
        cancelEvent(removeSpeedReduction);
	EV_INFO << "remove SPEED REDUCTION ----------------------------------------------";
    } else {
        mVehicleController->setSpeedFactor(0.5);
	EV_INFO << "SPEED REDUCTION **************************************";
    }
    scheduleAt(simTime() + warningDuration, removeSpeedReduction);

    delete streamingMessage;
}

void StreamingService::handleMessage(cMessage* msg)
{
    if (msg->isSelfMessage()) {
        mVehicleController->setSpeedFactor(1.0);
    } else {
        throw cRuntimeError("Unrecognized message (%s)%s", msg->getClassName(), msg->getName());
    }
}
