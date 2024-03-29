import QtQuick 2.14
import Felgo

AppListItem {
  id: mainItem

  property bool hasDetails: false

  detailText: model.detailText || model.linkUrl || ""

 // mouseArea.hoverEffectEnabled: !hasDetails && !!model.linkUrl
 // mouseArea.hoverEnabled: true

 // active: hasDetails && (mouseArea.containsMouse || detailsActive)

  textItem: Row {
    spacing: dp(Theme.contentPadding) / 3

    AppText {
      text: model.text
    }
    AppText {
      text: qsTr("(%1)").arg(model.year)
      visible: !!model.year
      color: Theme.secondaryTextColor
    }
  }

  leftItem: Item {
    height: parent.height
    width: dp(48)

    Image {
      anchors.fill: parent
      anchors.margins: dp(2)
      source: visible ? "../../assets/images/" + model.image : ""
      fillMode: Image.PreserveAspectFit
      smooth: true
      mipmap: true
      visible: !!model.image
    }

    AppIcon {
      anchors.centerIn: parent
      size: parent.width
      iconType: model.icon || ""
      visible: !!model.icon
      color: Qt.lighter(Theme.tintColor, 2.5)
    }
  }

  rightItem: AppIcon {
    anchors.verticalCenter: parent.verticalCenter
    iconType: model.linkUrl ? IconType.externallink : active ? IconType.minus : IconType.plus
  }

  onSelected: {
    if(hasDetails) {
      mainItem.active = !mainItem.active
    }
    else if(model.linkUrl) {
      nativeUtils.openUrl(model.linkUrl)
    }
  }
}
