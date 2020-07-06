import QtQuick 2.13
import Felgo 3.0

EntityBase {
    id:antEntity
    entityType: "antEntity"
    property bool booltest: true
    property alias diesource: diesnd.source
    width: 35
    height: 35
    //reset ants' location when they were died
    function diereset(){
        antEntity.x=gameScene.randomx(antEntity.width)
        antEntity.y -= randomy()
        antimg.state=""
        antimg.opacity=1

    }
    //cycle to switch status pictures of ants
    Timer {
        id:t1
        interval: 100; running: true; repeat: true
        onTriggered: {
            booltest = !booltest
        }
    }

    //delay the disappearance of ants when ants were died
    Timer
    {
        id:t2
        interval: 300; running: antimg.state==="die"? true:false; repeat: false
        onTriggered: {
            //set ants
            antimg.opacity=0
            diereset()
        }
    }

    SoundEffect {
        id: diesnd
        //source: ""
    }


    Image {
        anchors.fill: parent
        id: antimg
        //keep cycling pictures of ants
        source: booltest? "../assets/img/ant_1.png":"../assets/img/ant_2.png"
        MouseArea{
            anchors.fill:  parent
            //after clicking the ants, score plus 1, ants'state become "die" and play dead sound
            onClicked: {
                if(gameScene.state==="playing"){
                    gameScene.score++
                    antimg.state="die"
                    diesnd.play()
                }
            }
        }
        //the "die" state of ants
        states: [
            State {
                name: "die"
                PropertyChanges {
                    target: antimg
                    source: "../assets/img/ant_die.png"
                }
            }]
    }

    BoxCollider{
        anchors.centerIn:  antimg
        width: 20
        height: 40
        id:antCollider
        //according to the state of "gameScene", switch the ants' "bodyType"
        bodyType: gameScene.state==="playing"?  Body.Dynamic:Body.Static

        fixture.onContactChanged: {
            var otherEntity = other.getBody().target
            var otherEntityType = otherEntity.entityType

            if(otherEntityType==="borderEntity") {
                diereset()
            }
            if(otherEntityType==="fruitEntity") {

            }
        }
    }

}
