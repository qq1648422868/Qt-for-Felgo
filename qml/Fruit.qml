import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id:fruitEntity
    property alias source: fruitimg.source
    entityType: "fruitEntity"
    property alias fruitvisable: fruitimg.visible
    Image {
        id: fruitimg
        anchors.fill:boxtest
    }
    BoxCollider{
        id:boxtest
        width: 50
        height: 50
        visible: false
        bodyType: Body.Static
        collisionTestingOnlyMode: true

        fixture.onContactChanged: {

            var otherEntity = other.getBody().target
            var otherEntityType = otherEntity.entityType

            //collide with ants
            if(otherEntityType==="antEntity")
            {
                //when ants live, fruitsnumbers-1
                if(fruitimg.visible===true){

                    gameScene.fruitnumbers--

                }
                //when ants die, and fruitnumbers is 0, game over!
                if(gameScene.fruitnumbers===0&&fruitimg.visible)
                {
                    gameScene.die()
                    diesnd.play()
                }
                //else set fruit' visibility to false
                else fruitimg.visible=false
            }
        }

    }
    SoundEffect{

        id:diesnd
        source: "../assets/snd/gameover.wav"
    }

}
