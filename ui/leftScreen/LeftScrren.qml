import QtQuick 2.15


Rectangle{
    id: leftScreen

    color: "#f0f0f0"
    anchors {
        left: parent.left
        right: rightScreen.left
        top: parent.top
        bottom: bottomBar.top
    }
    clip: true

    Rectangle {
        id: battery
        height: 17
        width: 35
        color: "gray"
        radius: 3
        anchors {
            right: parent.right
            top: parent.top
            topMargin: 5
            rightMargin: 10
        }

        Rectangle{
            color: if(m_batteryLevel.batteryLevel <= 10){
                       return "red"
                   } else return "#15fc0d"
            radius: 1
            height: 13
            width: m_batteryLevel.batteryLevel
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
                topMargin: 5
                bottomMargin: 2
                leftMargin: 2
            }
        }
    }

    Text {
        id: batteryTex
        text: if(m_batteryLevel.batteryLevel === 4)
                  return (2 + "%")
              else if(m_batteryLevel.batteryLevel === 5)
                  return (4 + "%")
              else if(m_batteryLevel.batteryLevel === 6)
                  return (8 + "%")
              else if(m_batteryLevel.batteryLevel === 7)
                  return (12 + "%")
              else if(m_batteryLevel.batteryLevel === 8)
                  return (16 + "%")
              else if(m_batteryLevel.batteryLevel === 9)
                  return (20 + "%")
              else if(m_batteryLevel.batteryLevel === 10)
                  return (24 + "%")
              else if(m_batteryLevel.batteryLevel === 11)
                  return (28 + "%")
              else if(m_batteryLevel.batteryLevel === 12)
                  return (32 + "%")
              else if(m_batteryLevel.batteryLevel === 13)
                  return (36 + "%")
              else if(m_batteryLevel.batteryLevel === 14)
                  return (40 + "%")
              else if(m_batteryLevel.batteryLevel === 15)
                  return (44 + "%")
              else if(m_batteryLevel.batteryLevel === 16)
                  return (48 + "%")
              else if(m_batteryLevel.batteryLevel === 17)
                  return (52 + "%")
              else if(m_batteryLevel.batteryLevel === 18)
                  return (56 + "%")
              else if(m_batteryLevel.batteryLevel === 19)
                  return (60 + "%")
              else if(m_batteryLevel.batteryLevel === 20)
                  return (62 + "%")
              else if(m_batteryLevel.batteryLevel === 21)
                  return (66 + "%")
              else if(m_batteryLevel.batteryLevel === 22)
                  return (70 + "%")
              else if(m_batteryLevel.batteryLevel === 23)
                  return (74 + "%")
              else if(m_batteryLevel.batteryLevel === 24)
                  return (78 + "%")
              else if(m_batteryLevel.batteryLevel === 25)
                  return (82 + "%")
              else if(m_batteryLevel.batteryLevel === 26)
                  return (86 + "%")
              else if(m_batteryLevel.batteryLevel === 27)
                  return (90 + "%")
              else if(m_batteryLevel.batteryLevel === 28)
                  return (94 + "%")
              else if(m_batteryLevel.batteryLevel === 29)
                  return (98 + "%")
              else if(m_batteryLevel.batteryLevel === 30)
                  return (100 + "%")

        color: "gray"
        anchors {
            right: battery.left
            verticalCenter: battery.verticalCenter
            rightMargin: 5
        }
    }

    Rectangle {
        id: battery2
        height: battery.height / 2
        width: 3
        color: "gray"
        anchors {
            left: battery.right
            verticalCenter: battery.verticalCenter
        }
    }

    Timer {
        id: batteryDisplay
        interval: 500
        running: true
        repeat: true

        onTriggered: {
            if(m_batteryLevel.batteryLevel <= 10){
                battery.visible = !battery.visible
                battery2.visible = !battery2.visible
            } else             if(m_batteryLevel.batteryLevel >= 10){
                battery.visible = true
                battery2.visible = true
            }
        }
    }

    Timer {
        id: batteryTimer
        interval: 3000
        running: false
        repeat: true

        onTriggered: {
                m_batteryLevel.batteryLevel--
        }
    }

    Timer {
        interval: 3000
        running: true
        repeat: true

        onTriggered: {
            if(m_batteryLevel.batteryLevel === 4){
                batteryTimer.stop()
                linkLoader.source = "ParkImage.qml"
                car_P.color = "gray"
                car_D.color = "#c4c4c4"
                car_R.color = "#c4c4c4"
                buttonClicked(30)
            }
        }
    }


    Item {
        id: recLoader
        anchors.fill: parent
        anchors {
            topMargin: 50
            leftMargin: 0
            rightMargin: 0
            bottomMargin: 150
        }

        Loader {
            id: linkLoader
                width: parent.width
                height: parent.height

                source: "ParkImage.qml"
                onLoaded: {
                    opacityAnimation.start();
                }
         }

    }

    Connections {
        target: sideBar

        onButtonClicked: {
            if(carImage === 1){
                linkLoader.source = "ParkImage.qml"
                car_P.color = "gray"
                car_D.color = "#c4c4c4"
                car_R.color = "#c4c4c4"
                iconControl.color = "#f0f0f0"
                dashBoardIcon.source = "qrc:/ui/leftScreen/asset/share.png"
                buttonClicked(40)
                batteryTimer.stop()
            } else             if(carImage === 2){
                linkLoader.source = "NightImage.qml"
                colorAnimation2.start()
                dashBoardIcon.source = "qrc:/ui/leftScreen/asset/share (1).png"
                iconControl.color = "gray"
                car_D.color = "gray"
                car_R.color = "#c4c4c4"
                car_P.color = "#c4c4c4"
                buttonClicked(51)
                batteryTimer.start()
            } else             if(carImage === 3){
                linkLoader.source = "ParkImage.qml"
            }
        }
    }

    ColorAnimation {
        id: colorAnimation2
        target: leftScreen
        property: "color"
        from: "#f0f0f0"
        to: "black"
        duration: 1000
    }



    PropertyAnimation {
        id: opacityAnimation
        target: recLoader
        property: "opacity"
        from: 0
        to: 1
        duration: 2500
    }

    Text {
        id: car_P
        text: qsTr("P")
        color: "gray"
        font.bold: true
        font.pixelSize: 18
        anchors{
            top: parent.top
            left: parent.left
            leftMargin: 40
            topMargin: 2
        }
    }

    Text {
        id: car_R
        text: qsTr("R")
        color: "#c4c4c4"
        font.bold: true
        font.pixelSize: 18
        anchors{
            top: parent.top
            left: car_P.right
            leftMargin: 4
            topMargin: 2
        }
    }

    Text {
        id: car_N
        text: qsTr("N")
        color: "#c4c4c4"
        font.bold: true
        font.pixelSize: 18
        anchors{
            top: parent.top
            left: car_R.right
            leftMargin: 4
            topMargin: 2
        }
    }

    Text {
        id: car_D
        text: qsTr("D")
        color: "#c4c4c4"
        font.bold: true
        font.pixelSize: 18
        anchors{
            top: parent.top
            left: car_N.right
            leftMargin: 4
            topMargin: 2
        }
    }



//-----------------------------------------

    function changeColor(){
         colorAnimation.running = !colorAnimation.running;
    }

    Connections {
        target: sideBar
        onButtonClicked: {
            changeColor()
        }
    }

    ColorAnimation {
        id: colorAnimation
        target: leftScreen
        property: "color"
        from: "white"
        to: "#f0f0f0"
        duration: 1000
    }
//-----------------------------------------------


    Item {
        id: leftControl
        height: 150
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        Rectangle {
            id:  iconControl
            width: 300
            height: 50
            border.color: "#f0f0f0"
            color: Qt.rgba(0,0,0,0)
            radius: 20
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                topMargin: 5
            }

            Image {
                id: cameraIcon
                source: "qrc:/ui/leftScreen/asset/cameraIcon-removebg-preview.png"
                height: 40
                width: 40
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    leftMargin: 12
                }

                MouseArea {
                    id: r_mouse
                    anchors.fill: parent
                    onClicked: {
                        linkLoader.source = "ReverseImage.qml"
                        car_R.color = "gray"
                        car_D.color = "#c4c4c4"
                        car_P.color = "#c4c4c4"
                        changeColor()
                        iconControl.color = "#f0f0f0"
                        dashBoardIcon.source = "qrc:/ui/leftScreen/asset/share.png"
                        buttonClicked(20)
                        batteryTimer.start()
                    }
                }
            }

            Image {
                id:diveIcon
                source: "qrc:/ui/leftScreen/asset/steering-wheel.png"
                height: 30
                width: 30
                anchors.centerIn: parent

                MouseArea {
                    id: d_mouse
                    anchors.fill: parent
                    onClicked: {
                        linkLoader.source = "DriveImage.qml"
                        car_P.color = "#c4c4c4"
                        car_D.color = "gray"
                        car_R.color = "#c4c4c4"
                        changeColor()
                        iconControl.color = "#f0f0f0"
                        dashBoardIcon.source = "qrc:/ui/leftScreen/asset/share.png"
                        buttonClicked(30)
                        batteryTimer.start()
                    }
                }
            }

            Image {
                id: recordIcon
                source: "qrc:/ui/leftScreen/asset/microphone.png"
                height: 30
                width: 30
                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    rightMargin: 15
                }
            }
        }



        Rectangle {
            id: wiper

            width: 80
            height: 30
            radius: 20
            color: rectangleColor
            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                bottomMargin: 45
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rectangleColor = (rectangleColor === "lightgray") ? "lightblue" : "lightgray";
                    wiperTimer.running = !wiperTimer.running
                }
            }

            Image {
                source: wiperImage
                height: 30
                width: 30
                anchors.centerIn: parent
            }

            Timer{
                id: wiperTimer
                interval: 500
                repeat: true
                running: false

                onTriggered: {
                    wiperImage = (wiperImage === "qrc:/ui/leftScreen/asset/car (2).png")? "qrc:/ui/leftScreen/asset/car (1).png" : "qrc:/ui/leftScreen/asset/car (2).png"
                }
            }

        }

        Image {
            id: dashBoardIcon
            source: "qrc:/ui/leftScreen/asset/share.png"
            height: 20
            width: 20
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
                rightMargin: 25
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    buttonClicked(6)
                }
            }

        }


    }




    SideBar{
        id: sideBar

        Connections {
            target: tempControl     // signal to my bottom bar from the sideBar

            onButtonClicked: {
                if(c_num === 7){
                    buttonClicked(60)
                } else                 if(c_num === 8){
                    buttonClicked(70)
                } else                 if(c_num === 9){
                    buttonClicked(80)
                } else                 if(c_num === 10){
                    buttonClicked(90)
                }
            }
        }
    }

   TempControl{
       id: tempControl
   }


    property string wiperImage: "qrc:/ui/leftScreen/asset/car (2).png"
    property string rectangleColor: "lightgray"
    signal buttonClicked(int image)
}
