#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <classes/system.h>
#include <classes/tempcontroller.h>


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    System m_systemHandler;
    System m_zoomMap;
    System m_musicVolume;
    System m_notifVlm;
    System m_route;
    System m_counter;
    System m_buttonCliked;
    System m_batteryLevel;
    TempController m_dirverFanControl;
    TempController m_passengerFanControl;
    TempController m_driverTemp;
    TempController m_passengerTemp;

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    QQmlContext *context1(engine.rootContext());
    context1 -> setContextProperty("m_connect", &m_systemHandler);

    QQmlContext *context2(engine.rootContext());
    context2 -> setContextProperty("m_zoomMap", &m_zoomMap);

    QQmlContext *context3(engine.rootContext());
    context3 -> setContextProperty("m_musicVolume", &m_musicVolume);

    QQmlContext *context4(engine.rootContext());
    context4 -> setContextProperty("m_driverTemp", &m_driverTemp);

    QQmlContext *context5(engine.rootContext());
    context5 -> setContextProperty("m_passengerTemp", &m_passengerTemp);

    QQmlContext *context6(engine.rootContext());
    context6 -> setContextProperty("m_notifVlm", &m_notifVlm);

    QQmlContext *context7(engine.rootContext());
    context7 -> setContextProperty("m_route", &m_route);

    QQmlContext *context8(engine.rootContext());
    context8 -> setContextProperty("m_counter", &m_counter);

    QQmlContext *context9(engine.rootContext());
    context9 -> setContextProperty("m_buttonCliked", &m_buttonCliked);

    QQmlContext *context10(engine.rootContext());
    context10 -> setContextProperty("m_dirverFanControl", &m_dirverFanControl);

    QQmlContext *context11(engine.rootContext());
    context11 -> setContextProperty("m_passengerFanControl", &m_passengerFanControl);

    QQmlContext *context12(engine.rootContext());
    context12 -> setContextProperty("m_batteryLevel", &m_batteryLevel);

    return app.exec();
}
