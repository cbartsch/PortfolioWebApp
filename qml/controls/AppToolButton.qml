import QtQuick 2.0
import QtQuick.Controls 2.12
import Felgo

ToolButton {
  id: toolBtn

  property string iconType: ""
  property real size: dp(36)
  property string toolTipText

  flat: true

  RippleMouseArea {
    anchors.fill: parent
    onPressed: mouse => mouse.accepted = false
    hoverEffectEnabled: true
    backgroundColor: Theme.listItem.selectedBackgroundColor
    fillColor: backgroundColor
    opacity: 0.5
    hoverEffectRadius: width / 2
  }

  hoverEnabled: true

  ToolTip.visible: toolTipText && hovered
  ToolTip.text: toolTipText

  contentItem: Item {
    anchors.fill: parent

    AppIcon {
      iconType: toolBtn.iconType
      visible: !!icon
      anchors.centerIn: parent
      color: toolBtn.checked ? Theme.tintColor : Theme.textColor
      size: toolBtn.size

      Behavior on color { UiAnimation { } }
    }

    AppText {
      text: toolBtn.text
      visible: !!text
      anchors.fill: parent
      verticalAlignment: Text.AlignVCenter
      horizontalAlignment: Text.AlignHCenter
      color: toolBtn.checked ? Theme.textColor : Theme.secondaryTextColor
      font.pixelSize: toolBtn.size * 0.6
    }
  }

  background: Rectangle {
    implicitWidth: toolBtn.size
    implicitHeight: toolBtn.size
    radius: width / 2
    color: toolBtn.pressed
           ? Theme.selectedBackgroundColor
           : Theme.controlBackgroundColor
  }
}
