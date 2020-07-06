import QtQuick 2.0
import Felgo 3.0

Rectangle {
    signal buttonClicked
    property alias source: imgbtn.source

    property alias presssource: imgbtn.source

    property alias releasesource: imgbtn.source

    signal buutonPressed
    signal buttonRealsed
    id: button
    width: 50
    height: 50

    anchors.horizontalCenter: parent.horizontalCenter



    Image {
        id: imgbtn
        //source: ""
        width: 100
        height: 80
        anchors.centerIn: parent
    }
    MouseArea{
        id:mouseArea
        anchors.fill: parent

        onPressed: buutonPressed()
        onReleased: buttonRealsed()
        onClicked: {

            buttonClicked()
        }
    }

}
