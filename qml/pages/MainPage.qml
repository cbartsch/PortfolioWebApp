import QtQuick 2.0
import Felgo

import "../model"
import "../controls"

AppPage {
  id: mainPage

  property Item activeItem: null

  title: qsTr("Chrisu's Games and Apps")

  AppListView {
    width: parent.width
    height: parent.height


    AppScrollIndicator {
      id: scrollIndicator
    }

    model: SortFilterProxyModel {
      sourceModel: JsonListModel {
        source: dataModel.mainListModel
        keyField: "text"
      }

      sorters: ExpressionSorter {
        expression: {
          var so = dataModel.sectionOrder
          var li = so.indexOf(modelLeft.section)
          var ri = so.indexOf(modelRight.section)
          return li !== ri
              ? li < ri
              : modelLeft.year > modelRight.year
        }
      }
    }

    section.property: "section"
    section.delegate: SimpleSection {
      title: dataModel.sectionNames[section]
      textItem.font.pixelSize: sp(18)
    }

    delegate: Column {
      width: parent ? parent.width : 0

      MainListItem {
        id: mainItem

        onActiveChanged: {
          if(active) {
            if(mainPage.activeItem) {
              mainPage.activeItem.active = false
            }
            mainPage.activeItem = mainItem
          }
          else if(mainPage.activeItem === mainItem) {
            mainPage.activeItem = null
          }
        }

        hasDetails: dataModel.hasDetails(model.section)
      }

      DetailItem {
        id: detailItem

        itemModel: model
        showItem: mainItem.active
      }
    }
  }
}
