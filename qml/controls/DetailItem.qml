import QtQuick 2.12
import QtQuick.Controls 2.12
import Felgo

Item {
  id: detailItem

  property bool showItem: false

  property var itemModel: ({})

  visible: height > 0
  clip: true

  width: parent.width
  height: showItem ? content.height : 0

  Behavior on height { UiAnimation { } }

  Column {
    id: content
    width: parent.width

    AppListItem {
      id: detailTextItem

      text: itemModel.description || ""
      visible: !!itemModel.description
      backgroundColor: Theme.backgroundColor
      mouseArea.enabled: false

      // somehow gets overwritten to the default item with Qt 6.5
      onTextItemChanged: textItem = detailText

      textItem: AppText {
        id: detailText

        text: detailTextItem.text

        font.pixelSize: detailTextItem.textFontSize
        wrapMode: Text.WordWrap
        width: Math.min(implicitWidth, detailTextItem.textItemAvailableWidth)
        maximumLineCount: detailTextItem.textMaximumLineCount
        elide: Text.ElideRight

        textFormat: Text.RichText
        linkColor: Theme.tintLightColor
        onLinkActivated: nativeUtils.openUrl(link)

        MouseArea {
          anchors.fill: parent
          acceptedButtons: Qt.NoButton
          cursorShape: detailText.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
        }
      }
    }

    Item {
      height: dp(320)
      width: parent.width

      ImageSpinner {
        id: spinner

        width: parent.width
        height: parent.height

        Behavior on width { UiAnimation { } }
        Behavior on height { UiAnimation { } }

        visible: listView.count > 0

        model: dataModel.imageModel(itemModel)

        onImageClicked: modal.showFor(spinner, qsTr("%1 (%2 images)").arg(itemModel.text).arg(spinner.listView.count))
      }
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

          AppIcon {
            height: dp(48)
            width: visible ? height : 0
            size: dp(24)

            visible: !!modelData.icon
            anchors.centerIn: parent
            iconType: modelData.icon || ""

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

  AppModal {
    id: modal

    pushBackContent: app.contentItem

    backgroundColor: Theme.backgroundColor

    modalHeight: app.height * 0.9
    fullscreen: false

    property string title: ""

    property Item prevParent: null
    property Item currentItem: null


    NavigationStack {
      anchors.bottom: undefined
      height: modal.modalHeight - dp(Theme.contentPadding) * 1.2

      AppPage {
        title: modal.title

        rightBarItem: IconButtonBarItem {
          iconType: IconType.close
          onClicked: modal.doClose()
        }

        Item {
          id: itemContainer
          anchors.fill: parent
        }
      }
    }

    onClosed: restoreItem()

    function showFor(item, title) {
      if(modal.currentItem) {
        return
      }

      modal.prevParent = item.parent
      modal.currentItem = item
      item.parent = itemContainer

      modal.title = title

      open()
    }

    function doClose() {
     // restoreImg()
      close()
    }

    function restoreItem() {
      if(prevParent && currentItem) {
        currentItem.parent = prevParent
        currentItem = null
        prevParent = null
      }
    }
  }
}
