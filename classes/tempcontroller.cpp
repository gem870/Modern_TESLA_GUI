#include "tempcontroller.h"

TempController::TempController(QObject *parent)
    : QObject{parent}
    , m_tempController(20)
{

}

int TempController::tempController() const
{
    return m_tempController;
}

void TempController::tempIncreaseFunction(const int &tempNumber)
{
    int newTemperature = m_tempController + tempNumber;

    setTempController(newTemperature);
}

void TempController::setTempController(int newTempController)
{

    if(newTempController <= 0)
        newTempController = 0;
    if(newTempController >= 60)
        newTempController = 60;

    if (m_tempController == newTempController)
        return;
    m_tempController = newTempController;
    emit tempControllerChanged();
}
