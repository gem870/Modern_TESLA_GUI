import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: tempControl

    height: 150
    anchors {
        bottom: parent.bottom
        left: parent.left
        right: parent.right
        leftMargin: 5
        rightMargin: 5
    }
    opacity: .8
    Rectangle {
        id: tempControlScreen
        width: parent.width
        radius: 5
        clip: true
        height:parent.height
        color: "#373838"


        Behavior on y {
            NumberAnimation {
                duration: 500
            }
        }

        MouseArea {
            id: dragArea
            anchors.fill: parent
            drag.target: parent
            drag.axis: Drag.YAxis
            drag.minimumY: parent.height - tempControlScreen.height
            drag.maximumY: parent.height

            onReleased: {
                if (dragArea.drag.active) {
                    if (tempControlScreen.y < parent.height / 1.1) {
                        tempControlScreen.y = parent.height - tempControlScreen.height;
                    } else {
                        tempControlScreen.y = parent.height / 1.1;
                    }
                }
            }
        }

        Button{
            id: leftButton
            background: Rectangle {
                color: left.containsPress?  "#686969" : Qt.rgba(0,0,0,0)
                border.color: "#686969"
                radius: 3

                Text {
                    text: qsTr("<")
                    font.bold: true
                    font.pixelSize: 20
                    color: "lightgray"
                    anchors.centerIn: parent
                }

                MouseArea{
                    id: left
                    anchors.fill: parent
                    onClicked: {
                        m_buttonCliked.buttonControl--
                        dshBoardStckV.pop()
                    }
                }
            }

            width: parent.width/ 20
            height: parent.height /1.5
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
        }

        Button{
            id: rightButton
            background: Rectangle {
                color: right.containsPress?  "#686969" : Qt.rgba(0,0,0,0)
                border.color: "#686969"
                radius: 3
                visible: if(m_buttonCliked.buttonControl === 1){
                             return false
                         } else if(m_buttonCliked.buttonControl < 1){
                             return true
                         }

                Text {
                    text: qsTr(">")
                    font.bold: true
                    font.pixelSize: 20
                    color: "lightgray"
                    anchors.centerIn: parent
                }

                MouseArea{
                    id: right
                    anchors.fill: parent
                    onClicked: {
                        m_buttonCliked.buttonControl++
                        if(m_buttonCliked.buttonControl === 1)
                            return dshBoardStckV.push(rectangle2.createObject(dshBoardStckV))

                    }
                }
            }

            width: parent.width/ 20
            height: parent.height /1.5
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
            }
        }
        //m_buttonClik.buttonControl

        Item{
            anchors {
                left: leftButton.right
                right: rightButton.left
                top: parent.top
                bottom: parent.bottom
            }

            StackView{
                id: dshBoardStckV
                anchors.fill: parent
                clip: true

                initialItem: Item {
                        id: dashBoard
                        anchors.fill: parent

                        Text {
                            id: temp_tex
                            text: qsTr("Temparenture")
                            color: "lightgray"
                            font.pixelSize: 20
                            anchors {
                                horizontalCenter: parent.horizontalCenter
                                bottomMargin: 2
                                bottom: parent.bottom
                            }
                        }

                        Rectangle {                            // <<------------  tempComtrol section 1

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
                                source: "qrc:/ui/leftScreen/asset/sitbelt2-removebg-preview.png"

                                height: 50
                                width: 100
                                anchors {
                                    left: parent.left
                                    verticalCenter: parent.verticalCenter
                                    leftMargin: 10
                                }
                            }

                            Text {
                                text: qsTr(m_driverTemp.tempController + " " + "F°")
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
                                onDoubleClicked: {
                                    temp1_D.visible = true
                                    temp2_D.visible = false
                                    buttonClicked(7)

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


                        Rectangle {                           // <<------------  tempComtrol section 2

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
                                source: "qrc:/ui/leftScreen/asset/sitbelt2-removebg-preview.png"

                                height: 50
                                width: 100
                                anchors {
                                    right: parent.right
                                    verticalCenter: parent.verticalCenter
                                    rightMargin: 10
                                }
                            }

                            Text {
                                text: qsTr(m_passengerTemp.tempController + " " + "F°")
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
                                onDoubleClicked: {
                                    temp1_D.visible = false
                                    temp2_D.visible = true
                                    buttonClicked(8)

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




            }
        }

        Component {
            id: rectangle2  //  << ----------------------------      FAN SCETION

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

                    Rectangle {                                   // <<------------  fanComtrol section 1

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
                            source: "qrc:/ui/leftScreen/asset/fan (2).png"

                            height: 50
                            width: 50
                            anchors {
                                left: parent.left
                                verticalCenter: parent.verticalCenter
                                leftMargin: 10
                            }
                        }

                        Text {
                            text: qsTr(m_dirverFanControl.tempController + " " + "hPa")
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
                            onDoubleClicked: {
                                temp1_D.visible = true
                                temp2_D.visible = false
                                buttonClicked(9)
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


                    Rectangle {                // <<---------------       FanControl section 2

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
                            source: "qrc:/ui/leftScreen/asset/fan (2).png"

                            height: 50
                            width: 50
                            anchors {
                                right: parent.right
                                verticalCenter: parent.verticalCenter
                                rightMargin: 10
                            }
                        }

                        Text {
                            text: qsTr(m_passengerFanControl.tempController + " " + "hPa")
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
                            onDoubleClicked: {
                                temp1_D.visible = false
                                temp2_D.visible = true
                                buttonClicked(10)

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



        }







        Button {
            background: Rectangle {
                color: "lightgray"
                radius: 3
            }
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            width: parent.width/ 2
            height: parent.height/15 - 2


            onClicked: {
                if (tempControlScreen.y === parent.height / 1.1) {
                    tempControlScreen.y = parent.height - tempControlScreen.height;
                } else {
                    tempControlScreen.y = parent.height / 1.1;
                }
            }
        }



    }

    signal buttonClicked(int c_num)
}
