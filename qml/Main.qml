import Felgo 3.0
import QtQuick 2.14

import "model"
import "pages"
import "theme"

App {

  onInitTheme: theme.init()

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
}
