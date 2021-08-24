import QtQuick 2.0
import Felgo 3.0

Item {
  property alias listView: imgList
  property alias btnPrevImg: btnPrevImg
  property alias btnNextImg: btnNextImg
  property alias model: imgList.model

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
      width: imgList.width * 0.9
      height: parent.height

      Rectangle {
        anchors.fill: parent
        color: Theme.secondaryBackgroundColor
        visible: screenshot.status !== Image.Ready

        Icon {
          anchors.centerIn: parent
          icon: screenshot.status === Image.Loading
                ? IconType.refresh
                : IconType.warning
        }
      }

      AppImage {
        id: screenshot
        width: parent.width
        height: parent.height
        //anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        mipmap: true
        smooth: true

        source: !detailItem.visible ? "" : modelData.imageUrl
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
}
