import QtQuick 2.0
import Felgo 3.0

EntityBase {

    entityType: "borderEntity"

    BoxCollider{
        width: gameScene.width
        height: 60
        bodyType: Body.Static
        collisionTestingOnlyMode: true

        fixture.onContactChanged: {

            var otherEntity = other.getBody().target
            var otherEntityType = otherEntity.entityType

            if(otherEntityType==="antEntity")
            {
            }

        }

    }


}
