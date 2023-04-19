import QtQuick 2.0
import Felgo

Item {
  function init() {
    Theme.colors.tintColor = "#A0008B"

    // dark theme
    Theme.colors.textColor = "white"
    Theme.colors.secondaryTextColor = "#aaa"
    Theme.colors.secondaryBackgroundColor = "#222"
    Theme.colors.controlBackgroundColor = "#111"
    Theme.colors.dividerColor = "#222"
    Theme.colors.selectedBackgroundColor = "#888"
    Theme.colors.backgroundColor = "black"
    Theme.colors.inputCursorColor = "white"

    Theme.tabBar.backgroundColor = Theme.backgroundColor

    Theme.listItem.backgroundColor = Theme.controlBackgroundColor
    Theme.listItem.activeBackgroundColor = Theme.secondaryBackgroundColor

    Theme.navigationTabBar.titleOffColor= "white"
    Theme.navigationTabBar.backgroundColor = Theme.controlBackgroundColor

    Theme.appButton.rippleEffect = true
    Theme.appButton.horizontalMargin = 0
    Theme.appButton.horizontalPadding = dp(2)
  }
}
