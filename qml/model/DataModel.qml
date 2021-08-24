import QtQuick 2.0
import Felgo 3.0

Item {

  id: item

  readonly property var sectionOrder: ["games", "apps", "contact", "more"]

  readonly property var sectionNames: ({
                                        games: "Games",
                                         apps: "Apps & Libraries",
                                         contact: "Contact",
                                         more: "More",
                                       })

  readonly property var mainListModel: [
    {
      section: "apps",
      text: "Slippipedia",
      year: 2021,
      detailText: "Your flexible replay manager. Get insights and knowledge about your SSBM game quickly and easily.",
      image: "slippipedia.png",
      linkUrl: "",
      icon: "",

      detailImages: {
        count: 8,
        folder: "slippipedia"
      },

      detailItems: [
        {
          icon: IconType.github,
          url: "https://github.com/cbartsch/Slippipedia",
          description: "Source code on GitHub"
        },
        {
          icon: IconType.download,
          url: "https://github.com/cbartsch/Slippipedia/releases",
          description: "Download latest release"
        },
      ]
    },
    {
      section: "apps",
      text: "BeatLib",
      year: 2020,
      detailText: "C++/Qt/QML library for audio decoding and signal processing. Apply any effects, filters and analyze audio data in real time.",
      image: "",
      linkUrl: "",
      icon: IconType.music,

      detailImages: {
        count: 0,
        folder: "beatlib"
      },

      detailItems: [
        {
          icon: IconType.github,
          url: "https://github.com/cbartsch/BeatLib",
          description: "Source code on GitHub"
        },
        {
          icon: IconType.info,
          url: "https://cbartsch.github.io/beatlib/doc/index.html",
          description: "Documentation"
        },
      ]
    },

    {
      section: "games",
      text: "Twistomaze",
      year: 2020,
      detailText: "The isometric puzzle platformer with a twist.",
      image: "twistomaze.png",
      linkUrl: "",

      detailImages: {
        count: 4,
        folder: "twistomaze"
      },

      detailItems: [
        {
          icon: IconType.apple,
          url: "https://apps.apple.com/us/app/twistomaze/id1500792067",
          description: "Download from App Store"
        },
        {
          icon: IconType.google,
          url: "https://play.google.com/store/apps/details?id=at.impossibru.IsoPlatformer",
          description: "Download from Google Play"
        },
        {
          icon: IconType.desktop,
          url: "https://www.kongregate.com/games/ImpossibruGames/twistomaze",
          description: "Play on desktop (Kongregate)"
        },
      ]
    },
    {
      section: "games",
      text: "The Incredible Platformer",
      year: 2018,
      detailText: "Jump & run meets physics puzzles: Place items to guide your player to the exit.",
      image: "tip.png",
      linkUrl: "",

      detailImages: {
        count: 3,
        folder: "tip"
      },

      detailItems: [
        {
          icon: IconType.apple,
          url: "https://apps.apple.com/us/app/the-incredible-platformer/id1347057729",
          description: "Download from App Store"
        },
        {
          icon: IconType.google,
          url: "https://play.google.com/store/apps/details?id=at.impossibru.TIP",
          description: "Download from Google Play"
        },
        {
          icon: IconType.desktop,
          url: "https://www.kongregate.com/games/ImpossibruGames/the-incredible-platformer",
          description: "Play on desktop (Kongregate)"
        },
        {
          icon: IconType.github,
          url: "https://github.com/cbartsch/TheIncrediblePlatformer",
          description: "Source code on GitHub"
        },
      ]
    },
    {
      section: "games",
      text: "Electron",
      year: 2015,
      detailText: "Jump from atom to atom and don't get lost in space.",
      image: "electron.png",
      linkUrl: "",

      detailImages: {
        count: 4,
        folder: "electron"
      },

      detailItems: [
        {
          icon: IconType.apple,
          url: "https://apps.apple.com/us/app/electron/id1347663193",
          description: "Download from App Store"
        },
        {
          icon: IconType.google,
          url: "https://play.google.com/store/apps/details?id=at.impossibru.electron",
          description: "Download from Google Play"
        },
      ]
    },
    {
      section: "games",
      text: "Blockoban",
      year: 2013,
      detailText: "A tricky and mind-bending 2.5D puzzler.",
      image: "blockoban.png",
      linkUrl: "",

      detailImages: {
        count: 4,
        folder: "blockoban"
      },

      detailItems: [
        {
          icon: IconType.apple,
          url: "https://apps.apple.com/app/id1450537998",
          description: "Download from App Store"
        },
        {
          icon: IconType.google,
          url: "https://play.google.com/store/apps/details?id=at.impossibru.blockoban",
          description: "Download from Google Play"
        },
      ]
    },
    {
      section: "games",
      text: "Boolitaire",
      year: 2012,
      detailText: "A strategic card game based on Boolean logic.",
      image: "boolitaire.png",
      linkUrl: "",

      detailImages: {
        count: 5,
        folder: "boolitaire"
      },

      detailItems: [
        {
          icon: IconType.google,
          url: "https://play.google.com/store/apps/details?id=at.impossibru.boolitaire",
          description: "Download from Google Play"
        },
      ]
    },

    {
      section: "contact",
      text: "GitHub",
      detailText: "",
      icon: IconType.github,
      linkUrl: "https://github.com/cbartsch"
    },

    {
      section: "more",
      text: "Portfolio Web App " + system.appVersionName,
      detailText: "",
      icon: IconType.code,
      linkUrl: "https://github.com/cbartsch/PortfolioWebApp"
    },
    {
      section: "more",
      text: "Made with Felgo SDK",
      detailText: qsTr("Felgo for WebAssembly version: %1 based on Qt %2").arg(system.felgoVersion).arg(system.qtVersion),
      image: "felgo-logo.png",
      linkUrl: "https://felgo.com"
    }
  ]
}
