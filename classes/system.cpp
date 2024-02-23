#include "system.h"
#include <QDateTime>

System::System(QObject *parent)
    : QObject{parent}
    , m_carLocked(true)
    , m_outdoorTemp(64)
    , m_userName("Mmesoma")
    , m_zoomMap(12)
    , m_musicVolume(5)
    ,m_buttonControl(0)
    , m_batteryLevel(30)
{
    timer = new QTimer(this);
    timer -> setInterval(500);
    timer -> setSingleShot(true);

    connect(timer, &QTimer::timeout, this, &System::TimeUpdate);
    TimeUpdate();
}

void System::increaseMusicVolume(int &volume)
{
    int increaseVolume = m_musicVolume + volume;
    setMusicVolume(increaseVolume);
}

void System::mapZooming(int &zoom)
{
    int newZooming = m_zoomMap + zoom;
    setZoomMap(newZooming);
}

void System::buttonClicked(int &number)
{
    int buttonClick = m_buttonControl + number;
    setButtonControl(buttonClick);
}

bool System::carLocked() const
{
    return m_carLocked;
}

void System::setCarLocked(bool newCarLocked)
{
    if (m_carLocked == newCarLocked)
        return;
    m_carLocked = newCarLocked;
    emit carLockedChanged();
}

int System::outdoorTemp() const
{
    return m_outdoorTemp;
}

void System::setOutdoorTemp(int newOutdoorTemp)
{
    if (m_outdoorTemp == newOutdoorTemp)
        return;
    m_outdoorTemp = newOutdoorTemp;
    emit outdoorTempChanged();
}

QString System::userName() const
{
    return m_userName;
}

void System::setUserName(const QString &newUserName)
{
    if (m_userName == newUserName)
        return;
    m_userName = newUserName;
    emit userNameChanged();
}

QString System::currentTime() const
{
    return m_currentTime;
}

void System::setCurrentTime(const QString &newCurrentTime)
{
    if (m_currentTime == newCurrentTime)
        return;
    m_currentTime = newCurrentTime;
    emit currentTimeChanged();
}

void System::TimeUpdate()
{
    QDateTime dateTime;
   QString newCurrentTime = dateTime.currentDateTime().toString("dd/MM/yyyy  hh:mm ap");

    setCurrentTime(newCurrentTime);

    timer->start();
}

int System::musicVolume() const
{
    return m_musicVolume;
}

void System::setMusicVolume(int newMusicVolume)
{
    if(newMusicVolume <= 0)
        newMusicVolume = 0;
    if(newMusicVolume >= 10)
        newMusicVolume = 10;

    if (m_musicVolume == newMusicVolume)
        return;
    m_musicVolume = newMusicVolume;
    emit musicVolumeChanged();
}

int System::zoomMap() const
{
    return m_zoomMap;
}

void System::setZoomMap(int newZoomMap)
{
    if(newZoomMap <= 0)
        newZoomMap = 0;
    if(newZoomMap >= 30)
        newZoomMap = 30;

    if (m_zoomMap == newZoomMap)
        return;
    m_zoomMap = newZoomMap;
    emit zoomMapChanged();
}

int System::buttonControl() const
{
    return m_buttonControl;
}

void System::setButtonControl(int newButtonControl)
{
    if(newButtonControl <= 0)
        newButtonControl = 0;
    if(newButtonControl >= 1)
        newButtonControl = 1;

    if (m_buttonControl == newButtonControl)
        return;
    m_buttonControl = newButtonControl;
    emit buttonControlChanged();
}

int System::batteryLevel() const
{
    return m_batteryLevel;
}

void System::setBatteryLevel(int newBatteryLevel)
{
    if(newBatteryLevel <= 4)
        newBatteryLevel = 4;
    if(newBatteryLevel >= 30)
        newBatteryLevel = 30;

    if (m_batteryLevel == newBatteryLevel)
        return;
    m_batteryLevel = newBatteryLevel;
    emit batteryLevelChanged();
}

void System::batteryState(int &number)
{
    int battery = m_batteryLevel + number;
    setBatteryLevel(battery);
}
