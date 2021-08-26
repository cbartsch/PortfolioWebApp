#include <QApplication>
#include <FelgoApplication>

#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <QtDebug>
#include <string>

#ifdef Q_OS_WASM
#include <emscripten/val.h>
#endif

//#include <FelgoLiveClient>

int main(int argc, char *argv[])
{

  QApplication app(argc, argv);

  FelgoApplication felgo;
  felgo.setPreservePlatformFonts(true);

  QQmlApplicationEngine engine;
  felgo.initialize(&engine);
  felgo.setLicenseKey(PRODUCT_LICENSE_KEY);

  //felgo.setMainQmlFileName(QStringLiteral("qml/Main.qml"));
  felgo.setMainQmlFileName(QStringLiteral("qrc:/qml/Main.qml"));

  engine.load(QUrl(felgo.mainQmlFileName()));

  QString platform(""), userAgent("");
#ifdef Q_OS_WASM
  auto navigator = emscripten::val::global("navigator");
  platform = QString::fromStdString(navigator["platform"].as<std::string>());
  userAgent = QString::fromStdString(navigator["userAgent"].as<std::string>());

  engine.rootObjects().first()->setProperty("webPlatform", platform);
  engine.rootObjects().first()->setProperty("webUserAgent", userAgent);
#endif

  //FelgoLiveClient client (&engine);

  return app.exec();
}
