import QtQuick 2.0
import Felgo 3.0

Item {

  id: item

  readonly property bool isAndroid: Qt.platform.os === "android"
  readonly property bool isIos: Qt.platform.os === "ios"

  readonly property var sectionOrder: ["games", "apps", "more"]

  readonly property var sectionNames: ({
                                         games: "Games",
                                         apps: "Apps & Libraries",
                                         more: "Contact & More",
                                       })

  function hasDetails(section) {
    return ["apps", "games"].indexOf(section) >= 0
  }

  readonly property var mainListModel: [
    {
      section: "apps",
      text: "Slippipedia",
      image: "slippipedia.png",
      year: 2021,
      detailText: "Your flexible replay manager. Get insights and knowledge about your SSBM game quickly and easily.",
      description: "This program can analyze a large number of Slippi replays and display detailed, filterable statistics and info.",
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
      description: "
Contains QML components for decoding and altering audio signals in real time.
Detect beats, frequencies, and apply filters and custom effects to an MP3 during playback.
",
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
      section: "apps",
      text: "Portfolio Web App.",
      description: "Showcase your projects and achievements with a shiny responsive user interface.",
      year: 2021,
      detailText: qsTr("This application's source code. Running version %1.").arg(system.appVersionName),
      icon: IconType.code,

      detailImages: {
        count: 0,
        folder: "beatlib"
      },

      detailItems: [
        {
          icon: IconType.github,
          url: "https://github.com/cbartsch/PortfolioWebApp",
          description: "Source code on GitHub"
        },
      ]
    },

    {
      section: "games",
      text: "Twistomaze",
      year: 2020,
      image: "twistomaze.png",
      detailText: "The isometric puzzle platformer with a twist.",
      description: "The Incredible Isometric Puzzle Platformer with a twist!
<br/><br/>
Place items in the level to safely guide your player from start to finish.
<br/><br/>
The 50 levels come in 3 styles of a unique set of features. The solution makes each level work like a well-oiled machine. Can you finish every last one?",
      linkUrl: "",

      detailImages: {
        count: 4,
        folder: "twistomaze"
      },

      detailItems: [
        {
          image: "app_store.png",
          imagePadding: 12,
          visible: !isAndroid,
          url: "https://apps.apple.com/us/app/twistomaze/id1500792067",
          description: "Download from App Store"
        },
        {
          image: "play_store.png",
          visible: !isIos,
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
      image: "tip.png",
      year: 2018,
      detailText: "Jump & run meets physics puzzles: Place items to guide your player to the exit.",
      description: "A combination of physics machine puzzlers and traditional platformers. Use the provided items to guide your player(s) safely from start to exit.
<br /> <br />
Contains 36 levels.
<br /> <br />
Pixel-art graphics by <a href='https://kenney.nl'>kenney.nl</a>.
Retro sounds & music by <a href='https://soundcloud.com/sebastian-bender-1/8-bit-blast-retro-videogame-sounds-audio-demo'>8 bit blast</a>.",
      linkUrl: "",

      detailImages: {
        count: 3,
        folder: "tip"
      },

      detailItems: [
        {
          image: "app_store.png",
          imagePadding: 12,
          visible: !isAndroid,
          url: "https://apps.apple.com/us/app/the-incredible-platformer/id1347057729",
          description: "Download from App Store"
        },
        {
          image: "play_store.png",
          visible: !isIos,
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
      image: "electron.png",
      year: 2015,
      detailText: "Jump from atom to atom and don't get lost in space.",
      description: "You are a subatomic particle orbiting atoms and your only options are changing orbit and jumping through space to the next atom.
<br />
<ul>
  <li>Time your jumps perfectly to reach the next atom</li>
  <li>Stay charged: Collect positive charges and avoid negatives</li>
</ul>

<ul>
  <li>Reach a highscore and compare yourself to your friends and the rest of the world!
  <li>Play with headphones for the best sound experience.</li>
</ul>
",
      linkUrl: "",

      detailImages: {
        count: 4,
        folder: "electron"
      },

      detailItems: [
        {
          image: "app_store.png",
          imagePadding: 12,
          visible: !isAndroid,
          url: "https://apps.apple.com/us/app/electron/id1347663193",
          description: "Download from App Store"
        },
        {
          image: "play_store.png",
          visible: !isIos,
          url: "https://play.google.com/store/apps/details?id=at.impossibru.electron",
          description: "Download from Google Play"
        },
      ]
    },
    {
      section: "games",
      text: "Blockoban",
      image: "blockoban.png",
      year: 2013,
      detailText: "A tricky and mind-bending 2.5D puzzler.",
      description: "The next level of block mover puzzle game -
A new tricky, innovative and mind-bending puzzle game.
The goal of the game is easy.
Build a path by moving blocks to collect all the gems in the level.
<br/> <br/>
As you progress in the game, you will see switches, destroyable blocks and much more to
make the gameplay even more satisfying.
Make strategic moves and wise decisions to beat all levels.
<br/> <br/>
The game is easy to learn but hard to master.
Try to beat the records in all the levels on the global leaderboard.
<br/> <br/>
Contains 50 levels with great challenges.
You can also build and play your own levels, with the full-featured level-editor.
<br/> <br/>
This game is not related with the other Blockoban game by BonusLevel.org (Jean-Philippe Sarda).
",
      linkUrl: "",

      detailImages: {
        count: 4,
        folder: "blockoban"
      },

      detailItems: [
        {
          image: "app_store.png",
          imagePadding: 12,
          visible: !isAndroid,
          url: "https://apps.apple.com/app/id1450537998",
          description: "Download from App Store"
        },
        {
          image: "play_store.png",
          visible: !isIos,
          url: "https://play.google.com/store/apps/details?id=at.impossibru.blockoban",
          description: "Download from Google Play"
        },
      ]
    },
    {
      section: "games",
      text: "Boolitaire",
      image: "boolitaire.png",
      year: 2012,
      detailText: "A strategic card game based on Boolean logic.",
      description: "
Boolitaire is a strategic card game based on Boolean logic.
The gameplay has some similarities to the classic solitaire.
You can play alone or with a partner.

<ul>
  <li><b>General:</b>
    Boolitaire is a strategic card game based on Boolean logic.
    Starting from a given bit string you have to establish a pyramid of logical gates.
    You achieve this by placing logical gates (represented by cards).
    A logical gate performs a Boolean operation on two inputs and returns a binary number. (1 or 0)
  </li>
  <li><b>Single Player Mode:</b>
    You can play the game on multiple levels.
    On a higher level the start bits are changing fasters, which may disable lower cards.
    In TIME mode you have to be fast and in the STANDARD mode,
    it is important to make well-thought-out moves.
  </li>
  <li><b>Multiplayer mode</b>
    Two players take turns on a device.
    While in SinglePlayer mode the bits of the start chain are changing randomly,
     in multiplayer mode you can change specific bits
    to destroy the pyramid of the opponent with the NOT card.
    The gameplay is turn-based.
  </li>
  <li><b>Tutorial</b>
    The gameplay mechanics are explained in a tutorial.
  </li>
  <li><b>Settings:</b>
    You can add the negating operators (NAND, NOR, XNOR),
    increase the difficulty  and activate the TIME mode.
  </li>
</ul>
",
      linkUrl: "",

      detailImages: {
        count: 5,
        folder: "boolitaire"
      },

      detailItems: [
        {
          image: "play_store.png",
          url: "https://play.google.com/store/apps/details?id=at.impossibru.boolitaire",
          description: "Download from Google Play"
        },
      ]
    },

    {
      section: "more",
      text: "GitHub",
      detailText: "",
      icon: IconType.github,
      linkUrl: "https://github.com/cbartsch"
    },

    {
      section: "more",
      text: "Made with Felgo SDK",
      detailText: qsTr("Felgo for WebAssembly version: %1 based on Qt %2\nhttps://felgo.com").arg(system.felgoVersion).arg(system.qtVersion),
      image: "felgo-logo.png",
      linkUrl: "https://felgo.com"
    }
  ]
}
