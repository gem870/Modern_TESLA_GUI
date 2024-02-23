import QtQuick 2.15

Rectangle {
    id: standByMode
    width: parent.width * 1/8 - 30
    height: parent.height * 2/2 -20
    color: Qt.rgba(0,0,0,0)
    anchors {
        left: carControlIcon.right
        leftMargin: 50
        verticalCenter: carControlIcon.verticalCenter
    }



    property string fontcolor: "#6d6d6e"
    property string bgd_color: "black"
    property string onclickColor: "#4c4c4d"
    property string buttonColor: "#49495c"

    Rectangle {
        id: leftButton

        color: bgd_color

        height: parent.height /3
        width: parent.width /8
        radius: 5
        anchors {
            verticalCenter: parent.verticalCenter
        }



        Text {
            id: decreamentIcon
            text: "<"
            anchors.centerIn: parent
            font.pixelSize: parent.height + 4
            color: buttonColor
        }
    }

    Item {
        id: displayTemp
       // color: "#1a1a3d"
        height: parent.height-5
        width: parent.width /2.5
      //  radius: 20
        anchors {
            centerIn: parent
            topMargin: 10
            bottomMargin: 10
        }

        PropertyAnimation {
            id: opacityAnimationForStandByMode_T
            target: standByMode_T
            property: "opacity"
            from: 0
            to: 1
            duration: 500
        }

        Component.onCompleted: opacityAnimationForStandByMode_T.start()

        MouseArea {
            id: tepmSwitshDriver
            anchors.fill: parent
            onDoubleClicked: {
                 passengersControlLoader.source = "PassengersTemperature.qml"
                driversControlLoader.source = "Tempereture.qml"
                buttClicked(1)
            }
        }

        Text {
            id: standByMode_T
            text: "Stand\n   by"
            font.pixelSize: 17
            anchors.centerIn: parent
            color: fontcolor
        }

    }

    Rectangle {
        id: rightButton
        color: bgd_color
        height: parent.height /3
        width: parent.width /8
        radius: 5
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
        }



        Text {
            id: increamentIcon
            text: ">"
            anchors.centerIn: parent
            font.pixelSize: parent.height + 5
            color: buttonColor
        }
    }


    signal buttonClicked(int modeSignal)
}
