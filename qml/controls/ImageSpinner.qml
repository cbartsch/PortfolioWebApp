import QtQuick 2.0
import Felgo 3.0

Item {
  id: imageSpinner

  property alias listView: imgList
  readonly property var currentImage: imgList.currentItem ? imgList.currentItem.image : null

  property alias btnPrevImg: btnPrevImg
  property alias btnNextImg: btnNextImg
  property alias model: imgList.model

  signal imageClicked(var model)

  AppListView {
    id: imgList
    anchors.fill: parent

    spacing: dp(48)

    orientation: ListView.Horizontal

    // only allow scrolling to center an item and also always scroll to current index:
    snapMode: ListView.SnapOneItem
    highlightRangeMode: ListView.StrictlyEnforceRange
    highlightMoveDuration: 300
    preferredHighlightBegin: (width - (currentItem ? currentItem.width : 0)) / 2
    preferredHighlightEnd:   preferredHighlightBegin

    delegate: Item {
      readonly property var activeImage: modelData.isGif ? gifImage : image

      width: imgList.width * 0.9
      height: parent.height

      Rectangle {
        anchors.fill: parent
        color: Theme.secondaryBackgroundColor
        visible: activeImage.status !== Image.Ready

        Column {
          anchors.centerIn: parent
          spacing: dp(Theme.contentPadding)

          AppText {
            text: qsTr("Loading image... (%1%)").arg(Math.round(activeImage.progress * 100))
            visible: activeImage.status === Image.Loading
          }

          Icon {
            anchors.horizontalCenter: parent.horizontalCenter
            icon: activeImage.status === Image.Loading
                  ? IconType.refresh
                  : IconType.warning
          }
        }
      }

      AnimatedImage {
        id: gifImage
        width: parent.width
        height: parent.height
        //anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        smooth: true

        visible: modelData.isGif === true
        source: visible ? modelData.imageUrl : ""

        MouseArea {
          anchors.fill: parent
          onClicked: imageSpinner.imageClicked(modelData)
        }
      }

      AppImage {
        id: image
        width: parent.width
        height: parent.height
        //anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        mipmap: true
        smooth: true

        visible: modelData.isGif !== true
        source: visible ? modelData.imageUrl : ""

        MouseArea {
          anchors.fill: parent
          onClicked: imageSpinner.imageClicked(modelData)
        }
      }
    }
  }

  AppToolButton {
    id: btnPrevImg
    width: dp(48)
    height: width
    anchors.verticalCenter: parent.verticalCenter
    anchors.left: parent.left
    iconType: IconType.angleleft
    onClicked: imgList.currentIndex--
    visible: imgList.currentIndex > 0
  }

  AppToolButton {
    id: btnNextImg
    width: dp(48)
    height: width
    anchors.verticalCenter: parent.verticalCenter
    anchors.right: parent.right
    iconType: IconType.angleright
    onClicked: imgList.currentIndex++
    visible: imgList.currentIndex < imgList.count - 1
  }

  Rectangle {
    width: dp(40)
    height: dp(32)
    color: "#80000000"
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.margins: dp(2)
    radius: height / 4

    opacity: imgList.dragging || imgList.flicking ? 1 : 0

    Behavior on opacity { UiAnimation { } }

    AppText {
      id: pageText
      anchors.centerIn: parent

      font.pixelSize: sp(16)
      style: Text.Outline
      styleColor: Theme.backgroundColor

      text: qsTr("%1/%2").arg(imgList.currentIndex + 1).arg(imgList.count)
    }
  }
}
