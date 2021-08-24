import QtQuick 2.12
import QtQuick.Controls 2.12
import Felgo 3.0

Item {
  id: detailItem

  readonly property bool hovered: detailMouseArea.containsMouse ||
                                  [spinner.btnPrevImg, spinner.btnNextImg].some(btn => btn.hovered) ||
                                  repeater.model.some((obj, index) => {
                                                        var item = repeater.itemAt(index)
                                                        return item && item.hovered || false
                                                      })

  property bool showItem: false

  property var itemModel: ({})

  visible: height > 0
  clip: true

  width: parent.width
  height: showItem ? content.height : 0

  Behavior on height { UiAnimation { } }

  MouseArea {
    id: detailMouseArea
    anchors.fill: parent
    hoverEnabled: true
  }

  Column {
    id: content
    width: parent.width

    ImageSpinner {
      id: spinner

      height: dp(320)
      width: parent.width
      visible: listView.count > 0

      model: itemModel.detailImages
             ? Array.apply(null, new Array(itemModel.detailImages.count)).map(
                 (n, index) => (
                   {
                     imageUrl : qsTr("https://cbartsch.github.io/portfolio/screenshots/%1/%2.png")
                     .arg(itemModel.detailImages.folder)
                     .arg(index + 1)
                   }))
             : []
    }

    Row {
      height: dp(48) + dp(Theme.contentPadding)
      anchors.left: parent.left
      anchors.leftMargin: dp(64)
      spacing: dp(Theme.contentPadding) / 2

      Repeater {
        id: repeater
        model: itemModel.detailItems || []

        AppToolButton {
          height: dp(48)
          width: height
          anchors.verticalCenter: parent.verticalCenter
          iconType: modelData.icon
          toolTipText: modelData.description || modelData.url || ""

          onClicked: nativeUtils.openUrl(modelData.url)
        }
      }
    }
  }
}
