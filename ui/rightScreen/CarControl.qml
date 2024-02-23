import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15



Item {
    id: scrollView
    width: parent.width
    height: parent.height
    focus: true


    Row{
        id: row1
        height: parent.height  * 1/8
        width: parent.width
        anchors {
            top: parent.top
            topMargin: parent.height * 1/12 - 40 + 5
        }

        Rectangle{
            id: btn1
            height: row1.height
            width: row1.width / 5
            border.color: "darkgray"
            color: "gray"


            MouseArea{
                id: mousebtn1
                anchors.fill: parent
                onClicked: {
                    btn1.color = "gray"
                    btn2.color = "lightgray"
                    btn3.color = "lightgray"
                    btn4.color = "lightgray"
                }
            }


            Image {
                id: image1
                height:  btn1.height / 3
                width:  btn1.width / 5
                anchors {
                    left: btn1.left
                    verticalCenter: btn1.verticalCenter
                    leftMargin: btn1.width / 5

                }

                source: "qrc:/ui/rightScreen/asset/lamp-removebg-preview.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                text: qsTr("Off")
                font.pixelSize: btn1.width / 7
                anchors {
                    left: image1.right
                    verticalCenter: image1.verticalCenter
                    leftMargin: 5
                }
            }
        }

        Rectangle{
            id: btn2
            height: row1.height
            width: row1.width / 5 - 40
            border.color: "darkgray"
            color: "lightgray"

            MouseArea{
                id: mousebtn2
                anchors.fill: parent
                onClicked: {
                    btn1.color = "lightgray"
                    btn2.color = "gray"
                    btn3.color = "lightgray"
                    btn4.color = "lightgray"
                }
            }

            Text {
                text: qsTr("Parking")
                font.pixelSize: btn1.width / 7 - 5
                anchors.centerIn: parent
            }
        }

        Rectangle{
            id: btn3
            height: row1.height
            width: row1.width / 5 - 40
            border.color: "darkgray"
            color: "lightgray"


            MouseArea{
                id: mousebtn3
                anchors.fill: parent
                onClicked: {
                    btn1.color = "lightgray"
                    btn2.color = "lightgray"
                    btn3.color = "gray"
                    btn4.color = "lightgray"
                }
            }

            Text {
                text: qsTr("On")
                font.pixelSize: btn1.width / 7 - 5
                anchors.centerIn: parent
            }
        }

        Rectangle{
            id: btn4
            height: row1.height
            width: row1.width / 5 - 40
            border.color: "darkgray"
            color: "lightgray"


            MouseArea{
                id: mousebtn4
                anchors.fill: parent
                onClicked: {
                    btn1.color = "lightgray"
                    btn2.color = "lightgray"
                    btn3.color = "lightgray"
                    btn4.color = "gray"
                }
            }

            Text {
                text: qsTr("Auto")
                font.pixelSize: btn1.width / 7 - 5
                anchors.centerIn: parent
            }
        }

    }

    Rectangle{
        id: headLamp
        height: row1.height
        width: row1.width / 4
        border.color: "darkgray"
        color: "blue"
        radius: 10
        anchors {
            top: row1.top
            right: row1.right
            leftMargin: 100
        }

        Image {
            id: image2
            height: btn1.height / 3 + 10
            width: btn1.width / 4.5 + 15
            anchors.centerIn: headLamp
            source: "qrc:/ui/rightScreen/asset/high-beam.png"
            fillMode: Image.PreserveAspectFit
        }
    }
    //--------------------------------------------------------------------------------------------------
    // wiper section

    Row {
        id: row2
        anchors {
            top: row1.bottom
            topMargin: parent.height * 1/10 -50 +5
            left: row1.left
            right: headLamp.right
        }
        Rectangle{
            id:wiper

            height: row1.height + 40
            width: row1.width / 4
            color: if(mouse1.containsPress){
                       return "gray"
                   } else if(!mouse1.containsPress){
                       return "lightgray"
                   }

            border.color: "darkgray"

            Image {
                id: wiperIcon
                source: "qrc:/ui/rightScreen/asset/side-mirror.png"
                height: wiper.height/2 - 20
                width: wiper.width/2 - 20
                fillMode: Image.PreserveAspectFit
                y: wiper.height / 5.5
                anchors {
                    horizontalCenter: wiper.horizontalCenter
                }
            }

            MouseArea{
                id: mouse1
                anchors.fill: parent
                onClicked: {

                }
            }

            Text {
                text: qsTr("  Fold \nMirrors")
                font.pixelSize: wiper.height / 8 - 2
                anchors {
                    topMargin: wiper.height /10 -10
                    top: wiperIcon.bottom
                    horizontalCenter: wiperIcon.horizontalCenter
                }
            }
        }

        Rectangle{
            id:wiper2

            height: row1.height + 40
            width: row1.width / 4
            color: if(mouse2.containsPress){
                       return "gray"
                   } else if(!mouse1.containsPress){
                       return "lightgray"
                   }
            border.color: "darkgray"

            Image {
                id: wiperIcon2
                source: "qrc:/ui/rightScreen/asset/child.png"
                height: wiper2.height/2 - 20
                width: wiper2.width/2 - 20
                fillMode: Image.PreserveAspectFit
                y: wiper2.height / 5.5
                anchors {
                    horizontalCenter: wiper2.horizontalCenter
                }
            }

            MouseArea{
                id: mouse2
                anchors.fill: parent
                onClicked: {

                }
            }

            Text {
                text: qsTr(" Child\n Lock")
                font.pixelSize: wiper2.height / 8 - 2
                anchors {
                    topMargin: wiper2.height /10 -10
                    top: wiperIcon2.bottom
                    horizontalCenter: wiperIcon2.horizontalCenter
                }
            }
        }


        Rectangle{
            id:wiper3

            height: row1.height + 40
            width: row1.width / 4
            color: if(mouse3.containsPress){
                       return "gray"
                   } else if(!mouse1.containsPress){
                       return "lightgray"
                   }
            border.color: "darkgray"

            Image {
                id: wiperIcon3
                source: "qrc:/ui/rightScreen/asset/window.png"
                height: wiper3.height/2 - 20
                width: wiper3.width/2 - 20
                fillMode: Image.PreserveAspectFit
                y: wiper3.height / 5.5
                anchors {
                    horizontalCenter: wiper3.horizontalCenter
                }
            }

            MouseArea{
                id: mouse3
                anchors.fill: parent
                onClicked: {

                }
            }

            Text {
                text: qsTr("Window\n  Lock")
                font.pixelSize: wiper3.height / 8 - 2
                anchors {
                    topMargin: wiper3.height /10 -10
                    top: wiperIcon3.bottom
                    horizontalCenter: wiperIcon3.horizontalCenter
                }
            }
        }

        Rectangle{
            id:wiper4

            height: row1.height + 40
            width: row1.width / 4
            color: if(mouse4.containsPress){
                       return "gray"
                   } else if(!mouse1.containsPress){
                       return "lightgray"
                   }
            border.color: "darkgray"

            Image {
                id: wiperIcon4
                source: "qrc:/ui/rightScreen/asset/glovebox.png"
                height: wiper4.height/2 - 20
                width: wiper4.width/2 - 20
                fillMode: Image.PreserveAspectFit
                y: wiper4.height / 5.5
                anchors {
                    horizontalCenter: wiper4.horizontalCenter
                }
            }

            MouseArea{
                id: mouse4
                anchors.fill: parent
                onClicked: {

                }
            }

            Text {
                text: qsTr("Glovebox")
                font.pixelSize: wiper4.height / 8 - 2
                anchors {
                    topMargin: wiper4.height /10 -10
                    top: wiperIcon4.bottom
                    horizontalCenter: wiperIcon4.horizontalCenter
                }
            }
        }

    }

    Row{
        id: row3
        anchors {
            top: row2.bottom
            topMargin: parent.height * 1/10 -50 + 5
            left: row1.left
            right: headLamp.right
        }

        Rectangle{
            id: mirror1
            height: row1.height
            width: row1.width / 4
            color: "gray"

            border.color: "darkgray"

            Image {
                id: mirrorIcon
                height:  mirror1.height / 3
                width:  mirror1.width / 5
                anchors {
                    left: mirror1.left
                    verticalCenter: mirror1.verticalCenter
                    leftMargin: mirror1.width / 5

                }

                source: "qrc:/ui/rightScreen/asset/car.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                text: qsTr("Off")
                font.pixelSize: mirror1.height / 7
                anchors {
                    left: mirrorIcon.right
                    verticalCenter: mirrorIcon.verticalCenter
                    leftMargin: 5
                }
            }

            MouseArea{
                id: mouseMirror1
                anchors.fill: parent
                onClicked: {
                    mirror1.color = "gray"
                    mirror2.color = "lightgray"
                    mirror3.color = "lightgray"
                    mirror4.color = "lightgray"
                    mirror5.color = "lightgray"
                }
            }

        }

        Rectangle{
            id: mirror2
            height: row1.height
            width: row1.width / 6
            color: "lightgray"
            border.color: "darkgray"

            Text {
                text: qsTr("|")
                font.pixelSize: mirror1.height / 7
                anchors.centerIn: parent
            }

            MouseArea{
                id: mouseMirror2
                anchors.fill: parent
                onClicked: {
                    mirror1.color = "lightgray"
                    mirror2.color = "gray"
                    mirror3.color = "lightgray"
                    mirror4.color = "lightgray"
                    mirror5.color = "lightgray"
                }
            }

        }
        Rectangle{
            id: mirror3
            height: row1.height
            width: row1.width / 6
            color: "lightgray"
            border.color: "darkgray"

            Text {
                text: qsTr("||")
                font.pixelSize: mirror1.height / 7
                anchors.centerIn: parent
            }

            MouseArea{
                id: mouseMirror3
                anchors.fill: parent
                onClicked: {
                    mirror1.color = "lightgray"
                    mirror2.color = "lightgray"
                    mirror3.color = "gray"
                    mirror4.color = "lightgray"
                    mirror5.color = "lightgray"
                }
            }

        }

        Rectangle{
            id: mirror4
            height: row1.height
            width: row1.width / 6
            color: "lightgray"
            border.color: "darkgray"

            Text {
                text: qsTr("|||")
                font.pixelSize: mirror1.height / 7
                anchors.centerIn: parent
            }

            MouseArea{
                id: mouseMirror4
                anchors.fill: parent
                onClicked: {
                    mirror1.color = "lightgray"
                    mirror2.color = "lightgray"
                    mirror3.color = "lightgray"
                    mirror4.color = "gray"
                    mirror5.color = "lightgray"
                }
            }

        }

        Rectangle{
            id: mirror5
            height: row1.height
            width: row1.width / 4
            color: "lightgray"
            border.color: "darkgray"

            Text {
                text: qsTr("Auto")
                font.pixelSize: mirror1.height / 7
                anchors.centerIn: parent
            }

            MouseArea{
                id: mouseMirror5
                anchors.fill: parent
                onClicked: {
                    mirror1.color = "lightgray"
                    mirror2.color = "lightgray"
                    mirror3.color = "lightgray"
                    mirror4.color = "lightgray"
                    mirror5.color = "gray"
                }
            }

        }

    }

    Row{
        id: row4
        anchors {
            top: row3.bottom
            topMargin: parent.height * 1/10 -50 + 5
            left: row1.left
            right: headLamp.right
        }

        Rectangle {
            id: controller
            height: row1.height
            width: row1.width / 2
            color: if(mouseController.containsPress){
                       return "gray"
                   } else if(!mouseController.containsPress){
                       return "lightgray"
                   }
            border.color: "darkgray"
            border.width: 2

            MouseArea{
                id: mouseController
                anchors.fill: parent
                onClicked: {

                }
            }

            Image {
                id: mirrorControl
                height:  controller.height / 3
                width:  controller.width / 5
                anchors {
                    left: controller.left
                    verticalCenter: controller.verticalCenter
                    leftMargin: controller.width / 5

                }

                source: "qrc:/ui/rightScreen/asset/side-mirror.png"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: mirrorControl2
                height:  controller.height / 3
                width:  controller.width / 5
                anchors {
                    left: mirrorControl.right
                    verticalCenter: mirrorControl.verticalCenter
                }

                source: "qrc:/ui/rightScreen/asset/up-and-down-arrow-icon-9-removebg-preview.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                text: qsTr("Mirrors")
                font.pixelSize: controller.height / 7
                anchors {
                    left: mirrorControl2.right
                    verticalCenter: mirrorControl2.verticalCenter
                    leftMargin: 5
                }
            }

        }


        Rectangle {
            id: controller2
            height: row1.height
            width: row1.width / 2
            color: mouseController2.containsPress ? "gray" : "lightgray"
            border.color: "darkgray"
            border.width: 2

            MouseArea{
                id: mouseController2
                anchors.fill: parent
                onClicked: {

                }
            }

            Image {
                id: mirrorControl3
                height:  controller.height / 3
                width:  controller.width / 5
                anchors {
                    left: controller2.left
                    verticalCenter: controller2.verticalCenter
                    leftMargin: controller2.width / 5

                }

                source: "qrc:/ui/rightScreen/asset/camera (1).png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                text: qsTr("Recording")
                font.pixelSize: controller.height / 7
                anchors {
                    left: mirrorControl3.right
                    verticalCenter: mirrorControl3.verticalCenter
                    leftMargin: 5
                }
            }

        }
    }

    Row{
        id: row5
        anchors {
            top: row4.bottom
            topMargin: parent.height * 1/10 -50 + 5
            left: row1.left
            right: headLamp.right
        }

        Rectangle {
            id: controllerA
            height: row1.height
            width: row1.width / 2
            color: if(mouseControllerA.containsPress){
                       return "gray"
                   } else if(!mouseControllerA.containsPress){
                       return "lightgray"
                   }
            border.color: "darkgray"
            border.width: 2

            MouseArea{
                id: mouseControllerA
                anchors.fill: parent
                onClicked: {

                }
            }

            Image {
                id: mirrorControlA
                height:  controllerA.height / 3
                width:  controllerA.width / 5
                anchors {
                    left: controllerA.left
                    verticalCenter: controllerA.verticalCenter
                    leftMargin: controllerA.width / 5

                }

                source: "qrc:/ui/rightScreen/asset/steering-wheel.png"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: mirrorControlB
                height:  controllerA.height / 3
                width:  controllerA.width / 5
                anchors {
                    left: mirrorControlA.right
                    verticalCenter: mirrorControlA.verticalCenter
                }

                source: "qrc:/ui/rightScreen/asset/up-and-down-arrow-icon-9-removebg-preview.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                text: qsTr("Steering")
                font.pixelSize: controller.height / 7
                anchors {
                    left: mirrorControlB.right
                    verticalCenter: mirrorControlB.verticalCenter
                    leftMargin: 5
                }
            }

        }


        Rectangle {
            id: controllerA1
            height: row1.height
            width: row1.width / 2
            color: mouseControllerA1.containsPress ? "gray" : "lightgray"
            border.color: "darkgray"
            border.width: 2

            MouseArea{
                id: mouseControllerA1
                anchors.fill: parent
                onClicked: {

                }
            }

            Image {
                id: mirrorControlA1
                height:  controllerA1.height / 3
                width:  controllerA1.width / 5
                anchors {
                    left: controllerA1.left
                    verticalCenter: controllerA1.verticalCenter
                    leftMargin: controllerA1.width / 5

                }

                source: "qrc:/ui/rightScreen/asset/record.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                text: qsTr("Sentry")
                font.pixelSize: controller.height / 7
                anchors {
                    left: mirrorControlA1.right
                    verticalCenter: mirrorControlA1.verticalCenter
                    leftMargin: 5
                }
            }


        }
    }

    Row{
        id: row6
        anchors {
            top: row5.bottom
            topMargin: parent.height * 1/10 -50 + 5
            left: row1.left
            right: headLamp.right
        }

        Rectangle{
            id: brightness
            height: row1.height
            width: row1.width / 1.5
            color:  "lightgray"
            radius: 10

            Image {
                id: brightnessIcon
                height:  brightness.height / 3
                width:  brightness.width / 5
                fillMode: Image.PreserveAspectFit
                source: "qrc:/ui/rightScreen/asset/brightness.png"
                anchors {
                    left: brightness.left
                    verticalCenter: brightness.verticalCenter
                    leftMargin: brightness.width / 12 - 20
                }
            }

            Slider {
                id: progressBar

                width: parent.width /1.5
                from: 0
                to: mediaPlayer.duration
                value: 5
                anchors {
                    left: brightnessIcon.right
                    verticalCenter: brightnessIcon.verticalCenter
                }


            }

        }

        Rectangle{
            id: autoBrightness
            height: row1.height
            width: row1.width / 4
            border.color: "darkgray"
            color: "blue"
            radius: 10
            anchors {
                right: row6.right
            }

            Text {
                text: qsTr("Auto")
                color: "white"
                anchors.centerIn: parent
            }
        }

    }
}








