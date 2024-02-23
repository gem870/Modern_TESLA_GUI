import QtQuick 2.15

Rectangle {
    id: passengerTemp
    width: parent.width * 1/8 - 30
    height: parent.height * 2/2 -20
    color: Qt.rgba(0,0,0,0)
    anchors {
        right: musicVolume.left
        rightMargin: 50
        verticalCenter: carControlIcon.verticalCenter
        bottomMargin: parent.height/10
    }

    property string fontcolor: "#e0e0e0"
    property string bgd_color: "black"
    property string onclickColor: "#4c4c4d"
    property string buttonColor: "#49495c"

    Item {
        id: leftButton


        height: parent.height /3
        width: parent.width /8
        anchors {
            verticalCenter: parent.verticalCenter
        }

        MouseArea {
            id: mouse1
            anchors.fill: parent
            onClicked: m_passengerTemp.tempController--
        }

        Text {
            id: decreamentIcon
            text: " < "
            anchors.centerIn: parent
            font.pixelSize: parent.height + 5
            color: buttonColor
        }
    }



    Rectangle {
        id: displayTemp
        color: Qt.rgba(0,0,0,0) // "#1a1a3d"
        height: parent.height
        width: parent.width /2.5
        radius: 20
        border.color: "gray"
        anchors {
            centerIn: parent
            topMargin: 10
            bottomMargin: 10
        }

        PropertyAnimation {
            id: opacityAnimationForPassengersTemp_T
            target: passengersTemp_T
            property: "opacity"
            from: 0
            to: 1
            duration: 500
        }

        Component.onCompleted: opacityAnimationForPassengersTemp_T.start()

        MouseArea {
            anchors.fill: parent
            onPressAndHold: {
                passengersControlLoader.source = "StandByMode.qml"
                driversControlLoader.source = "StandByMode.qml"
                buttoClicked(1)
            }
        }

        Text {
            id: passengersTemp_T
            text: m_passengerTemp.tempController
            font.pixelSize: 25
            anchors.centerIn: parent
            color: fontcolor
            font {
                family: "Arial" // Set the font family
            }
        }

    }

    Item {
        id: rightButton
        height: parent.height /3
        width: parent.width /8
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
        }

        MouseArea{
            id: mouse2
            anchors.fill: parent
            onClicked: m_passengerTemp.tempController++
        }

        Text {
            id: increamentIcon
            text: " > "
            anchors.centerIn: parent
            font.pixelSize: parent.height + 5
            color: buttonColor
        }
    }

    signal buttonClicked(int tempSignal)
}
