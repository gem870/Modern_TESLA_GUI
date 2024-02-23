import QtQuick 2.15
import QtQuick.Window 2.15



    Item {
        anchors.fill: parent

        Text {
            id: temp_tex
            text: qsTr("Fan")
            font.pixelSize: 20
            color: "lightgray"
            anchors {
                horizontalCenter: parent.horizontalCenter
                topMargin: 2
                bottom: parent.bottom
            }
        }

        Rectangle {

            width: 150
            anchors {
                left: parent.left
                top: parent.top
                topMargin: 25
                bottom: parent.bottom
                leftMargin: 30
                bottomMargin: 25
            }
            border.color: "lightgray"
            radius: 10
            color: tempMouse1.containsPress ? "lightgray" : Qt.rgba(0,0,0,0)

            Image {
                source: "file:///C:/Users/LENOVO THINKPAD T470/Downloads/fan (2).png"

                height: 50
                width: 50
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    leftMargin: 10
                }
            }

            Text {
                text: qsTr(20 + " " + "hPa")
                rightPadding: 10
                color: "#2cfa02"
                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
            }

            Text {
                text: qsTr("Driver")
                rightPadding: 10
                bottomPadding: 5
                color: "lightgray"
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                }
            }

            MouseArea {
                id: tempMouse1
                anchors.fill: parent
                onClicked: {
                    temp1_D.visible = true
                    temp2_D.visible = false
                }
            }

            Rectangle {
                id: temp1_D
                height: 20
                width: 20
                color: "red"
                visible: false
                 radius: parent.width / parent.width + 20
                border.color: "white"
                border.width: 2
                y: 5
                anchors {
                    right: parent.right
                    rightMargin: 5
                }
            }
        }


        Rectangle {

            width: 150
            anchors {
                right: parent.right
                top: parent.top
                topMargin: 25
                bottom: parent.bottom
                rightMargin: 30
                bottomMargin: 25
            }
            border.color: "lightgray"
            radius: 10
            color: tempMouse2.containsPress ? "lightgray" : Qt.rgba(0,0,0,0)

            Image {
                source: "file:///C:/Users/LENOVO THINKPAD T470/Downloads/fan (2).png"

                height: 50
                width: 50
                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    rightMargin: 10
                }
            }

            Text {
                text: qsTr(20 + " " + "hPa")
                leftPadding: 10
                color: "#2cfa02"
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                }
            }

            Text {
                text: qsTr("Passenger")
                rightPadding: 10
                bottomPadding: 5
                color: "lightgray"
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                }
            }

            MouseArea {
                id: tempMouse2
                anchors.fill: parent
                onClicked: {
                    temp1_D.visible = false
                    temp2_D.visible = true

                }
            }

            Rectangle {
                id: temp2_D
                height: 20
                width: 20
                color: "red"
                border.width: 2
                visible: false
                radius: parent.width / parent.width + 20
                border.color: "white"
                y: 5
                anchors {
                    left: parent.left
                    leftMargin: 5
                }
            }
        }



    }


