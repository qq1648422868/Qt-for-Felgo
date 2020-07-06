import QtQuick 2.0
import Felgo 3.0

/*similar comments are located in "Ant.qml"
*/

EntityBase {

    id:antEntity
    entityType: "antEntity"

    property bool booltest: true
    width: 50
    height: 50
        Timer {
            id:t1
            interval: 100; running: true; repeat: true
            onTriggered: {
                booltest = !booltest
            }
        }
        Timer
        {
            id:t2
            interval: 400; running: antimg.state==="die"? true:false; repeat: false
            onTriggered: {
                antimg.opacity=0
                diereset()
            }
        }
        function diereset(){
            antEntity.x=gameScene.randomx(antEntity.width)
            antEntity.y -= randomy()
            antimg.state=""
            antimg.opacity=1

        }
        property alias diesource: diesnd.source
        SoundEffect {
            id: diesnd
            //source: ""
        }

    Image {
        anchors.fill: parent
        id: antimg

        source: booltest? "../assets/img/honey_1.png":"../assets/img/honey_2.png"
        MouseArea{
            anchors.fill:  parent
            onClicked: {
                if(gameScene.state==="playing"){
                    gameScene.score++
                antimg.state="die"
                diesnd.play()
                }

            }

        }
        states: [
        State {
            name: "die"
            PropertyChanges {
                target: antimg
                source: "../assets/img/honey_die.png"

            }
        }]
}

    BoxCollider{
        anchors.centerIn:  antimg
        width: 20
        height: 40

        bodyType: gameScene.state==="playing"?  Body.Dynamic:Body.Static

        fixture.onContactChanged: {
            var otherEntity = other.getBody().target
            var otherEntityType = otherEntity.entityType

             if(otherEntityType==="borderEntity") {


                diereset()//gameScene.die()

            }

        }
    }

}


