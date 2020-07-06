import QtQuick 2.0
import Felgo 3.0

EntityBase {

    property alias source: antimg.source
    //the value of coins
    property int plusscore
    id:coinEntity
    entityType: "coinEntity"

    SoundEffect {
        id: playSound
        source: "../assets/snd/coin_collected.wav"
    }

    MouseArea{
        anchors.fill: antimg
        //after clicking the coins, the reflection of gold coins
        onClicked: {
            if(gameScene.state==="playing")
            {
                coinEntity.y=utils.generateRandomValueBetween(-800, -400)
                playSound.play()

                gameScene.score+=coinEntity.plusscore


            }
        }
    }

    Image {
        id:antimg
        width: 30
        height: 30
    }


    BoxCollider{
        anchors.fill: antimg
        width: 25
        height: 5
        id:antCollider
        bodyType: gameScene.state==="playing"?  Body.Dynamic:Body.Static

        fixture.onContactChanged: {
            var otherEntity = other.getBody().target
            var otherEntityType = otherEntity.entityType

            //collide with "border"
            if(otherEntityType==="borderEntity") {
                coinEntity.x=gameScene.randomx(coinEntity.width)
                coinEntity.y -= 200+gameScene.randomy()

            }




        }
    }
}
