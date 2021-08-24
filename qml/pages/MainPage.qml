import QtQuick 2.0
import Felgo 3.0

import "../model"
import "../controls"

ListPage {
  id: mainPage

  property Item activeItem: null

  title: qsTr("Chrisu's Games and Apps")

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

  listView.section.property: "section"
  listView.section.delegate: SimpleSection {
    title: dataModel.sectionNames[section]
    textItem.font.pixelSize: sp(18)
  }

  delegate: Column {
    width: parent.width

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
      detailsHovered: detailItem.hovered
    }

    DetailItem {
      id: detailItem

      itemModel: model
      showItem: mainItem.active
    }
  }
}
