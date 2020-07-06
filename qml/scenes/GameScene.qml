import QtQuick 2.13
import Felgo 3.0

import "../"

SceneBase {
    id:gameScene
    //total score
    property int score: 0
    state: "start"
    //this signal is uesd to jump to "the menuScene"
    signal menuScenePressed
    property int fruitnumbers: 6
    PhysicsWorld{
        id:world
        debugDrawVisible: false
        updatesPerSecondForPhysics: 60
        gravity.y: 0.1
    }

    //background image of "gameScene"
    Rectangle{
        id:rec
        anchors.fill: parent.gameWindowAnchorItem
        Image {
            anchors.fill: parent
            source: "../../assets/img/background.png"
        }
    }

    //bottom border
    Border{
        id:border
        z:1
        x: 0
        y: gameScene.height

    }

    //fruits
    Fruit{
        id:apple
        x:0
        y:gameScene.height-50
        source: "../../assets/img/apple.png"
    }
    Fruit{
        id:watermelon
        x:55
        y:gameScene.height-50
        source: "../../assets/img/watermelon.png"
    }
    Fruit{
        id:polo
        x:110
        y:gameScene.height-50
        source: "../../assets/img/polo.png"
    }
    Fruit{
        id:banana
        x:165
        y:gameScene.height-50
        source: "../../assets/img/banana.png"
    }

    Fruit{
        id:lemo
        x:220
        y:gameScene.height-50
        source: "../../assets/img/lemo.png"
    }

    Fruit{
        id:putao
        x:280
        y:gameScene.height-50
        source: "../../assets/img/putao.png"
    }


    //reset the fruits' visibility and the number of fruitnumbers
    function resetfruit(){
        apple.fruitvisable=true
        watermelon.fruitvisable=true
        polo.fruitvisable=true
        banana.fruitvisable=true
        lemo.fruitvisable=true
        putao.fruitvisable=true
        fruitnumbers=6
    }



    //coins
    Coin{
        id:coin1
        source: "../../assets/img/coin1.png"
        x: utils.generateRandomValueBetween(0, gameScene.width-40)
        y: utils.generateRandomValueBetween(-200, -100)
        plusscore: 1
    }

    Coin{
        id:coin2
        source: "../../assets/img/coin2.png"
        x: utils.generateRandomValueBetween(0, gameScene.width-40)
        y: utils.generateRandomValueBetween(-200, -100)
        plusscore: 2
    }

    //ants
    Ant{
        id:ant
        x:0
        y:-50
        diesource: "../../assets/snd/ant2die.wav"
    }

    Ant7{
        id:ant7
        x:55
        y:0
        diesource: "../../assets/snd/ant1die.wav"
    }

    Ant8{
        id:ant8
        x:110
        y:-50
        diesource: "../../assets/snd/ant3die.wav"
    }
    Ant9{
        id:ant9
        x:165
        y:-50
        diesource: "../../assets/snd/ant4die.wav"
    }

    Ant10{
        id:ant10
        x:225
        y:0
        diesource: "../../assets/snd/ant5die.wav"
    }

    Honey{
        id:honey
        x:275
        y:-50
        diesource: "../../assets/snd/ant3die.wav"
    }

    Hogna{
        id:hogna
        x:220
        y:-50
        diesource: "../../assets/snd/ant2die.wav"
    }

    Ladybird{
        id:ladybird
        x:55
        y:0
        diesource: "../../assets/snd/ant4die.wav"
    }

    //font
    FontLoader{
        id:fontloader
        source: "../../assets/font/font.TTF"
    }

    //menu at the end of the game
    Rectangle{
        visible: gameScene.state === "gameOver"
        y:100
        anchors.horizontalCenter: parent.horizontalCenter
        width: 300
        height: 200
        color: "black"
        radius: 50

        Text {
            y:10
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            id: gameover
            font.family: fontloader.name
            font.pixelSize: 40
            text: qsTr("GAME OVER")
        }
        Text {
            y:70
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            id: currentscore
            font.pixelSize: 35
            font.family: fontloader.name
            text: qsTr("Current Score:")+gameScene.score
        }

        Row{
            y:120
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10

            //"play again" button
            Image {
                id: playagain
                width:100
                height: 80
                source: "../../assets/img/play_again.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        gameScene.score=0
                        reset()
                        gameScene.state = "playing"
                        resetfruit()
                        console.log(fruitnumbers)
                    }
                }
            }



            //exitt button
            Image {
                id: gobackBtn
                source: "../../assets/img/exit.png"

                width: 100
                height: 80
                MouseArea {
                    id: menuButtonMouseArea
                    anchors.fill: parent
                    onClicked: {
                        gameScene.score=0
                        menuScenePressed()
                        reset()
                        resetfruit()
                        gameScene.state = "start"
                    }
                }
            }
        }
    }

    //set GameScene's state to "gameOver"
    function die(){

        gameScene.state="gameOver"
    }

    //reset ants'and coins' "y"
    function reset(){
        ant.y=randomreset()
        honey.y=randomreset()
        hogna.y=randomreset()
        ant7.y=randomreset()
        ant8.y=randomreset()
        ant9.y=randomreset()
        ant10.y=randomreset()
        ladybird.y=randomreset()
        coin1.y=randomreset()
        coin2.y=randomreset()
    }

    //random value
    function randomreset(){
        return (-50-utils.generateRandomValueBetween(0, 150))
    }

    //random "x"
    function randomx(){
        return utils.generateRandomValueBetween(0, gameScene.width-arguments[0])
    }

    //random "y"
    function randomy(){
        return gameScene.height+utils.generateRandomValueBetween(0, 200)
    }

}
