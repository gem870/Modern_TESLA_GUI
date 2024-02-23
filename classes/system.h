#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>
#include <QTimer>

class System : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool carLocked READ carLocked WRITE setCarLocked NOTIFY carLockedChanged)
    Q_PROPERTY(int outdoorTemp READ outdoorTemp WRITE setOutdoorTemp NOTIFY outdoorTempChanged)
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged)
    Q_PROPERTY(int musicVolume READ musicVolume WRITE setMusicVolume NOTIFY musicVolumeChanged)
    Q_PROPERTY(int zoomMap READ zoomMap WRITE setZoomMap NOTIFY zoomMapChanged)
    Q_PROPERTY(int buttonControl READ buttonControl WRITE setButtonControl NOTIFY buttonControlChanged)
    Q_PROPERTY(int batteryLevel READ batteryLevel WRITE setBatteryLevel NOTIFY batteryLevelChanged)

public:
    explicit System(QObject *parent = nullptr);

    Q_INVOKABLE void increaseMusicVolume(int &volume);
    Q_INVOKABLE void mapZooming(int &zoom);
    Q_INVOKABLE void buttonClicked(int &number);
    Q_INVOKABLE void batteryState(int &number);

    bool carLocked() const;
    int outdoorTemp() const;
    QString userName() const;
    QString currentTime() const;
    int musicVolume() const;
    int zoomMap() const;

    int buttonControl() const;
    void setButtonControl(int newButtonControl);

    int batteryLevel() const;


public slots:

    void setZoomMap(int newZoomMap);
    void setMusicVolume(int newMusicVolume);
    void setCarLocked(bool newCarLocked);
    void setOutdoorTemp(int newOutdoorTemp);
    void setUserName(const QString &newUserName);
    void setCurrentTime(const QString &newCurrentTime);
    void TimeUpdate();
    void setBatteryLevel(int newBatteryLevel);

signals:

    void carLockedChanged();
    void outdoorTempChanged();
    void userNameChanged();

    void currentTimeChanged();

    void musicVolumeChanged();

    void zoomMapChanged();

    void buttonControlChanged();

    void batteryLevelChanged();

private:
    bool m_carLocked;
    int m_outdoorTemp;
    QString m_userName;
    QString m_currentTime;
    QTimer *timer;
    int m_musicVolume;
    int m_zoomMap;
    int m_buttonControl;
    int m_batteryLevel;
};



#endif // SYSTEM_H
