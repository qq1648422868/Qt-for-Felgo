import QtQuick 2.0
import Felgo 3.0
import "../"


SceneBase {
    id:menuScene
    //this signal is uesd to jump to "the gameScene"
    signal gameScenePressed

    //background image of "menuScene"
    Image {
        id:img
        anchors.fill: menuScene.gameWindowAnchorItem
        source: "../../assets/img/background2.png"
    }


    Column{
        y:125
        anchors.horizontalCenter: menuScene.horizontalCenter
        spacing: 25


        //"Play" button
        MenuButton{
            id:playbtn
            source: "../../assets/img/play.png"

            //Click to jump to the "gameScene"
            onButtonClicked: {
                if(info.visible===false){
                    gameScenePressed()
                    gameScene.state="playing"
                }
            }
            onBuutonPressed: {
                source="../../assets/img/play_press.png"
            }
            onButtonRealsed: {
                source="../../assets/img/play.png"
            }
        }

        //"Setting button"
        MenuButton{
            id:setbtn
            source: "../../assets/img/setting.png"
            onBuutonPressed: {
                source="../../assets/img/setting_press.png"
            }
            onButtonRealsed: {
                source="../../assets/img/setting.png"
            }
            onButtonClicked: {
                //start or pause backgroundmusic
                if(backgroundMusic.play()&&info.visible===false)
                    backgroundMusic.stop()
                else if(backgroundMusic.stop()&&info.visible===false)
                    backgroundMusic.play()
            }

        }

        //about button
        MenuButton{
            id:infobtn
            source: "../../assets/img/high_score.png"

            onBuutonPressed: {
                source="../../assets/img/high_score_press.png"
            }
            onButtonRealsed: {
                source="../../assets/img/high_score.png"
            }
            onButtonClicked: {

                info.visible=!info.visible
            }

        }
    }
    FontLoader{
        id:fontloader
        source: "../../assets/font/font.TTF"
    }
    //about interface
    Rectangle{
        id:info
        color: "black"
        visible: false
        y:50
        width: 300
        height: 200
        radius: 35
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            y:20
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            font.pixelSize: 40
            text: qsTr("About")
            font.family: fontloader.name
        }
        Text {
            y:80
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            font.pixelSize: 40
            text: qsTr("Author: zhudingkang")
            font.family: fontloader.name
        }
        Text {
            y:150
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            font.pixelSize: 40
            text: qsTr("2018051604113")
            font.family: fontloader.name
        }

    }
}
