import Felgo
import QtQuick 2.14

import "model"
import "pages"
import "theme"

App {
  id: app

  property string webPlatform: "unknown"
  property string webUserAgent: "unknown"

  readonly property bool isAndroid: Qt.platform.os === "android" ||
                                    webPlatform === "Android" ||
                                    webUserAgent.toLowerCase().indexOf("android") >= 0

  readonly property bool isIos: Qt.platform.os === "ios" ||
                                ["iPhone", "iPad", "iPod"].indexOf(webPlatform) >= 0

  readonly property bool isDesktop: system.desktopPlatform
  readonly property bool isWasm: system.isPlatform(System.Wasm)
  readonly property bool isMobile: isAndroid || isIos
  readonly property bool isWasmMobile: isWasm && isMobile

  onInitTheme: theme.init()

  visibility: isDesktop ? Window.Windowed : Window.FullScreen

  uiScale: isWasm ? 1.5 : isMobile ? 0.75 : 1.25

  GoogleAnalytics {
    propertyId: "UA-163972040-1"

    onPluginLoaded: {
      logScreen("Main")
      console.log("GA loaded.")
    }
  }

  AppTheme {
    id: theme
  }

  DataModel {
    id: dataModel
  }

  NavigationStack {

    MainPage { }
  }

//  AppText {
//    width: parent.width
//    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
//    style: Text.Outline
//    styleColor: "black"
//    visible: false

//    text: "dp scale is " + dpScale +
//          ", platform:" + webPlatform + "/" + webUserAgent +
//          ", isAndroid/Ios: " + isAndroid + "/" + isIos + "/" + isWasmMobile
//  }
}
