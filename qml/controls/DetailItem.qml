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

    AppListItem {
      id: detailTextItem
      enabled: false

      text: itemModel.description || ""
      visible: !!itemModel.description
      backgroundColor: Theme.backgroundColor

      textItem: AppText {
        textFormat: Text.RichText

        text: itemModel.description || ""
        font.pixelSize: detailTextItem.textFontSize
        wrapMode: Text.WordWrap
        width: Math.min(implicitWidth, detailTextItem.textItemAvailableWidth)
        maximumLineCount: detailTextItem.textMaximumLineCount
        elide: Text.ElideRight

        onLinkHovered: console.log("hovered link")
        onLinkActivated: console.log("link activated", link), nativeUtils.openUrl(link)
      }
    }

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

    Flow {
      anchors.right: parent.right
      anchors.left: parent.left
      anchors.margins: dp(Theme.contentPadding)
    //  spacing: dp(Theme.contentPadding) / 2

      Repeater {
        id: repeater
        model: itemModel.detailItems || []

        Item {
          width: Math.max(childrenRect.width, height)
          height: dp(72)
          visible: modelData.visible !== false

          RippleMouseArea {
            id: detailItemMouse
            anchors.fill: parent
            onClicked: nativeUtils.openUrl(modelData.url)
            cursorShape: Qt.PointingHandCursor
            hoverEffectEnabled: true
            backgroundColor: pressed
                             ? Theme.listItem.activeBackgroundColor
                             : Theme.listItem.selectedBackgroundColor
            fillColor: backgroundColor
            opacity: 0.5
          }

          Icon {
            height: dp(48)
            width: visible ? height : 0
            size: dp(24)

            visible: !!modelData.icon
            anchors.centerIn: parent
            icon: modelData.icon || ""

            Rectangle {
              anchors.fill: parent
              color: Theme.controlBackgroundColor
              radius: dp(8)
              z: -1

              border.width: dp(1)
              border.color: Theme.textColor
            }
          }

          Item {
            height: parent.height
            width: itemImage.width + dp(2 * (modelData.imagePadding || 0))
            anchors.verticalCenter: parent.verticalCenter
            visible: !!modelData.image

            AppImage {
              id: itemImage
              anchors.centerIn: parent
              height: parent.height - dp(2 * (modelData.imagePadding || 0))
              source: parent.visible ? "../../assets/images/" + modelData.image : ""
              fillMode: Image.PreserveAspectFit
            }
          }

          ToolTip {
            parent: parent
            visible: detailItemMouse.containsMouse
            text: modelData.description || modelData.url || ""
          }
        }
      }
    }
  }
}
