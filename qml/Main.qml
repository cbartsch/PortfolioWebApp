import Felgo 3.0
import QtQuick 2.14

import "model"

App {

  onInitTheme: {
    Theme.colors.tintColor = "#A0008B"

    // dark theme
    Theme.colors.textColor = "white"
    Theme.colors.secondaryTextColor = "#888"
    Theme.colors.secondaryBackgroundColor = "#222"
    Theme.colors.controlBackgroundColor = "#111"
    Theme.colors.dividerColor = "#222"
    Theme.colors.selectedBackgroundColor = "#888"
    Theme.colors.backgroundColor = "black"

    Theme.colors.inputCursorColor = "white"

    Theme.tabBar.backgroundColor = Theme.backgroundColor

    Theme.listItem.backgroundColor = Theme.controlBackgroundColor

    Theme.navigationTabBar.titleOffColor= "white"
    Theme.navigationTabBar.backgroundColor = Theme.controlBackgroundColor

    Theme.appButton.rippleEffect = true
    Theme.appButton.horizontalMargin = 0
    Theme.appButton.horizontalPadding = dp(2)
  }

  DataModel {
    id: dataModel
  }

  NavigationStack {

    ListPage {
      title: qsTr("Chrisu's Apps and Games")

      model: SortFilterProxyModel {
        sourceModel: JsonListModel {
          source: dataModel.mainListModel
          keyField: "text"
        }

        sorters: ExpressionSorter {
          expression: {
            var sectionOrder = ["Games", "Apps", "Contact", "More"]
            var li = sectionOrder.indexOf(modelLeft.section)
            var ri = sectionOrder.indexOf(modelRight.section)
            return li !== ri
                ? li < ri
                : modelLeft.year > modelRight.year
          }
        }
      }

      listView.section.property: "section"
      listView.section.delegate: SimpleSection {
        title: section
      }

      delegate: AppListItem {
        text: model.text + (model.year ? qsTr(" (%1)").arg(model.year): "")
        detailText: model.detailText || model.linkUrl || ""

        leftItem: Item {
          height: parent.height
          width: dp(48)

          Image {
            anchors.fill: parent
            anchors.margins: dp(2)
            source: visible ? "../assets/images/" + model.image : ""
            fillMode: Image.PreserveAspectFit
            smooth: true
            mipmap: true
            visible: !!model.image
          }

          Icon {
            anchors.centerIn: parent
            size: parent.width
            icon: model.icon || ""
            visible: !!model.icon
            color: Theme.tintLightColor
          }
        }

        rightItem: Icon {
          anchors.verticalCenter: parent.verticalCenter
          icon: IconType.externallink
          visible: !!model.linkUrl
        }

        onSelected: {
          if(model.linkUrl) {
            nativeUtils.openUrl(model.linkUrl)
          }
        }
      }
    }

  }
}
