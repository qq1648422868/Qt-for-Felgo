import Felgo 3.0
import QtQuick 2.0
import QtMultimedia 5.0
import "scenes"
GameWindow {
    id: gameWindow
    width: 320
    height: 480

    activeScene: gameScene

    EntityManager{
        id:entityManager
        entityContainer: gameScene
    }


    //backgroundmusic
    BackgroundMusic {

      id: backgroundMusic
      source: "../assets/snd/backgroundmusic.mp3"

      loops: Audio.Infinite
      autoPlay: true
    }


    GameScene{
        id:gameScene
        //jump to "menuScene"
        onMenuScenePressed: {
          gameWindow.state = "menu"
        }
    }

    MenuScene{
        id:menuScene
        //jump to "gameScene"
        onGameScenePressed: {
          gameWindow.state = "game"

        }
    }


    state: "menu"
    states: [
      State {
        name: "menu"
        PropertyChanges {target: menuScene; opacity: 1}
        PropertyChanges {target: gameWindow; activeScene: menuScene}
      },
      State {
        name: "game"
        PropertyChanges {target: gameScene; opacity: 1}
        PropertyChanges {target: gameWindow; activeScene: gameScene}
      }
    ]

}
