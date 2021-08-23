import QtQuick 2.0
import Felgo 3.0

Item {

  id: item

  readonly property var mainListModel: [
    {
      section: "Apps",
      text: "Slippipedia",
      year: 2021,
      detailText: "Your flexible replay manager. Get insights and knowledge about your SSBM game quickly and easily.",
      image: "slippipedia.png",
      linkUrl: "",
      icon: ""
    },

    {
      section: "Games",
      text: "Twistomaze",
      year: 2020,
      detailText: "The isometric puzzle platformer with a twist.",
      image: "twistomaze.png",
      linkUrl: ""
    },
    {
      section: "Games",
      text: "The Incredible Platformer",
      year: 2018,
      detailText: "Jump & run meets physics puzzles: Place items to guide your player to the exit.",
      image: "tip.png",
      linkUrl: ""
    },
    {
      section: "Games",
      text: "Electron",
      year: 2015,
      detailText: "Jump from atom to atom and don't get lost in space.",
      image: "electron.png",
      linkUrl: ""
    },
    {
      section: "Games",
      text: "Blockoban",
      year: 2013,
      detailText: "A tricky and mind-bending 2.5D puzzler.",
      image: "blockoban.png",
      linkUrl: ""
    },
    {
      section: "Games",
      text: "Boolitaire",
      year: 2012,
      detailText: "A strategic card game based on Boolean logic.",
      image: "boolitaire.png",
      linkUrl: ""
    },

    {
      section: "Contact",
      text: "GitHub",
      detailText: "",
      icon: IconType.github,
      linkUrl: "https://github.com/cbartsch"
    },

    {
      section: "More",
      text: "Portfolio Web App " + system.appVersionName,
      detailText: "",
      icon: IconType.code,
      linkUrl: "https://github.com/cbartsch/PortfolioWebApp"
    },
    {
      section: "More",
      text: "Made with Felgo SDK",
      detailText: qsTr("Felgo for WebAssembly version: %1 based on Qt %2").arg(system.felgoVersion).arg(system.qtVersion),
      image: "felgo-logo.png",
      linkUrl: "https://felgo.com"
    }
  ]
}
