import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: mainScreen
    anchors {
        top: navigationSearchBox.top
        bottom: parent.bottom
        left: parent.left
        right: parent.right
       // topMargin: parent.height / 100 + 5
        rightMargin: 5
        leftMargin: 5
    }

    Connections{
        target: rightScreen
        onButtonClicked: {
            if(nub === 15){
                mainScreen.visible = !mainScreen.visible
                opacityAnimationForMainScreen.start()
            }
        }
    }

    Connections{
        target: audioPlay

        onButtonClicked: {
            if(aud === 2){
            console.log("audio printing.......")
        }
        }
    }


    PropertyAnimation {
        id: opacityAnimationForMainScreen
        target: mainScreen
        property: "opacity"
        from: 0
        to: 1
        duration: 500
    }


Rectangle {
    id: draggableScreen
    width: parent.width
    height: parent.height + 20
    color: "#e1e2e6"
    radius: 5

    y: draggableScreen.height - parent.height

    Behavior on y {
        NumberAnimation {
            duration: 600
        }
    }

    MouseArea {
        id: dragArea
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.YAxis
        drag.minimumY: parent.height - draggableScreen.height
        drag.maximumY: parent.height

        onReleased: {
            if (dragArea.drag.active) {
                if (draggableScreen.y < parent.height / 1.3) {
                    draggableScreen.y = parent.height - draggableScreen.height;
                } else {
                    draggableScreen.y = parent.height / 1.3;
                }
            }
        }
    }

    Item {
        id: screenLoader

        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: parent.bottom
            topMargin: parent.height/18 - 5
            bottomMargin: parent.height * 3/90
        }

        Loader{
            id: mainLoader

            anchors.fill: parent
            source: "AudioPlayer.qml"

        }

        Connections{
            target: bottomBar

            onButtonClicked: {
                if(number === 1){
                    mainLoader.source = "MainCarUnit.qml"
                }
                else         if(number === 3 || number == 2){
                   mainLoader.source = "AudioPlayer.qml"
                }
                else         if(number === 4){
                   mainLoader.source = "Contact.qml"
                }
            }
        }


    }

    Button {

        background: Rectangle {
                    radius: 3
                }
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 1
        }
        width: parent.width/10 +200
        height: parent.height/50 -5


        onClicked: {
            if (draggableScreen.y === parent.height / 1.3) {
                draggableScreen.y = parent.height - draggableScreen.height;
            } else {
                draggableScreen.y = parent.height / 1.3;
            }
        }
    }
}

    Connections{
        target: bottomBar

        onButtonClicked: {
            showControl(number)
        }
    }

    function showControl(number){
        if(number === 2){
            if (draggableScreen.y === parent.height / 1.355) {
                draggableScreen.y = parent.height - draggableScreen.height;
            } else {
                draggableScreen.y = parent.height / 1.355;
            }
        }
    }

}
