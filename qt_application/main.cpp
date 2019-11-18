#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "juceapplication.h"
#include "playeradapter.h"



int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    JuceApplication::initJuce();
    JuceApplication app(argc, argv);

    qmlRegisterUncreatableType<PlayerAdapter>("Core", 0, 1, "Player", "Can't create from QML");

    PlayerAdapter * playerAdapter = new PlayerAdapter;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("player", playerAdapter);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
