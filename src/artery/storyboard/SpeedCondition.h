#ifndef ARTERY_SPEEDCONDITION_H_
#define ARTERY_SPEEDCONDITION_H_

#include "artery/storyboard/Condition.h"
#include <boost/units/quantity.hpp>
#include <boost/units/systems/si/velocity.hpp>
#include <functional>
#include <omnetpp.h>

namespace artery
{

template<typename COMP>
class SpeedCondition : public Condition {
public:
    SpeedCondition(double speed) :
        m_speed(speed * boost::units::si::meter_per_second), m_comp()
    {
    }

    ConditionResult testCondition(const Vehicle& car)
    {
        return m_comp(car.get<VehicleDataProvider>().speed(), m_speed);
    }

private:
    boost::units::quantity<boost::units::si::velocity> m_speed;
    const COMP m_comp;
};

} // namespace artery

#endif /* ARTERY_SPEEDCONDITION_H_ */
