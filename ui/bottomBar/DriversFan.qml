import QtQuick 2.15

Rectangle {
    id: driverFan
    width: parent.width * 1/8 - 30
    height: parent.height * 2/2 -20
    color: Qt.rgba(0,0,0,0)
    anchors {
        left: carControlIcon.right
        leftMargin: 50
        verticalCenter: carControlIcon.verticalCenter
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
            onClicked: m_dirverFanControl.tempController--
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
        border.color: "gray"
        height: parent.height
        width: parent.width /2.5
        radius: 20
        anchors {
            centerIn: parent
            topMargin: 10
            bottomMargin: 10
        }

        PropertyAnimation {
            id: opacityAnimationForDriversFan_T
            target: driverFan_T
            property: "opacity"
            from: 0
            to: 1
            duration: 500
        }

        Component.onCompleted: opacityAnimationForDriversFan_T.start()

        MouseArea {
            anchors.fill: parent
            onPressAndHold: {
                passengersControlLoader.source = "StandByMode.qml"
                driversControlLoader.source = "StandByMode.qml"
                buttonClicked(1)
            }
        }

        Text {
            id: driverFan_T
            text: m_dirverFanControl.tempController
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
            onClicked: m_dirverFanControl.tempController++
        }

        Text {
            id: increamentIcon
            text: " > "
            anchors.centerIn: parent
            font.pixelSize: parent.height + 5
            color: buttonColor
        }
    }


    signal buttonClicked(int fanSignal)

}
