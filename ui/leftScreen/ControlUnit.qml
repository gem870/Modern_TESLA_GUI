import QtQuick 2.15
import QtQuick.Window 2.15

    Item {

        anchors.fill: parent
        signal buttonClicked(int signalNumber)

        Rectangle{
            id: dashBoard
            width: parent.width /3
            height: parent.height / 7
            color: dasMouse.containsPress ? "lightGray" : Qt.rgba(0,0,0,0)
            border.color: "lightGray"
            radius: 80
            anchors {
                left: parent.left
                leftMargin: 10
                top: parent.top
                topMargin: 20
            }

            MouseArea {
                id: dasMouse
                anchors.fill: parent
                onClicked: {
                    buttonClicked(1)

                }
            }

            Text {
                text: "Dashboard"
                anchors.centerIn: parent
            }
        }

        Rectangle{
            id: park
            width: parent.width /4
            height: parent.height / 7
            color: "lightgray"
            radius: 80
            anchors {
                right: parent.right
                rightMargin: 10
                top: parent.top
                topMargin: 40
            }

            MouseArea {
                id: parkMouse
                anchors.fill: parent
                onClicked: {



                }
            }

            Text {
                text: "Park"
                leftPadding: 10
                anchors {
                    verticalCenter: parent.verticalCenter
                }
            }

            Rectangle {
                id: park_D
                height: 15
                width: 15
                radius: parent.width / parent.width + 20
                border.color: "white"
                color:              if(parkMouse.containsPress)
                                        return "red"
                                     else
                                   if(revMouse.containsPress || drivMouse.containsPress || neutMouse.containsPress)
                                               return "white"

                anchors {
                    right: parent.right
                    rightMargin: 10
                    verticalCenter: parent.verticalCenter
                }
            }
        }

        Rectangle{
            id: drive
            width: parent.width /4
            height: parent.height / 7
            color: "lightGray"
            radius: 80
            anchors {
                right: parent.right
                rightMargin: 10
                top: park.bottom
                topMargin: 5
            }

            MouseArea {
                id: drivMouse
                anchors.fill: parent
                onClicked: {


                }
            }

            Text {
                text: "Drive"
                leftPadding: 10
                anchors {
                    verticalCenter: parent.verticalCenter
                }
            }

            Rectangle {
                id: drive_D
                height: 15
                width: 15
                radius: parent.width / parent.width + 20
                border.color: "white"
                color:                     if(parkMouse.containsPress || neutMouse.containsPress || revMouse.containsPress)
                                               return  "white"
                                            else if(drivMouse.containsPress)
                                               return "red"
                anchors {
                    right: parent.right
                    rightMargin: 10
                     verticalCenter: parent.verticalCenter
                }
            }
        }

        Rectangle{
            id: neutral
            width: parent.width /4
            height: parent.height / 7
            color: "lightGray"
            radius: 80
            anchors {
                right: parent.right
                rightMargin: 10
                top: drive.bottom
                topMargin: 5
            }

            MouseArea {
                id: neutMouse
                anchors.fill: parent
                onClicked: {


                }
            }

            Text {
                text: "Neutral"
                leftPadding: 10
                anchors {
                    verticalCenter: parent.verticalCenter
                }
            }

            Rectangle {
                id: neutral_D
                height: 15
                width: 15
                radius: parent.width / parent.width + 20
                border.color: "white"
                color:                     if(parkMouse.containsPress || drivMouse.containsPress || revMouse.containsPress)
                                               return  "white"
                                             else if(neutMouse.containsPress)
                                               return "red"
                anchors {
                    right: parent.right
                    rightMargin: 10
                     verticalCenter: parent.verticalCenter
                }
            }
        }

        Rectangle{
            id: reverse
            width: parent.width /4
            height: parent.height / 7
            color: "lightGray"
            radius: 80
            anchors {
                right: parent.right
                rightMargin: 10
                top: neutral.bottom
                topMargin: 5
            }

            MouseArea {
                id: revMouse
                anchors.fill: parent
                onClicked: {


                }
            }

            Text {
                text: "Reverse"
                leftPadding: 10
                anchors {
                    verticalCenter: parent.verticalCenter
                }
            }

            Rectangle {
                id: rev_D
                height: 15
                width: 15
                radius: parent.width / parent.width + 20
                border.color: "white"
                color:  if(parkMouse.containsPress || drivMouse.containsPress || neutMouse.containsPress)
                               return "white"
                            else
                            if(revMouse.containsPress)
                                return "red"
                anchors {
                    right: parent.right
                    rightMargin: 10
                     verticalCenter: parent.verticalCenter
                }
            }
        }

        Item{
            anchors {
                top: dashBoard.bottom
                left: parent.left
                bottom: parent.bottom
                right: drive.left
                leftMargin: 30
                rightMargin: 30
            }

            Image {
                id: image1
                source: "file:///C:/Users/LENOVO THINKPAD T470/Downloads/speedometer.png"
                height: 60
                width: 60
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
            }

            Image {
                id: image2
                source: "file:///C:/Users/LENOVO THINKPAD T470/Downloads/speedometer (1).png"
                height: 60
                width: 60
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                }
            }

            Text {
                text: qsTr(20 + " " + "Km")
                color: "red"
                leftPadding: 20
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                    bottomMargin: 5
                }
            }

            Text {
                text: qsTr(20 + " " + "Mile")
                color: "red"
                rightPadding: 20
                anchors {
                    bottom: parent.bottom
                    right: parent.right
                    bottomMargin: 5
                }
            }
        }

    }



