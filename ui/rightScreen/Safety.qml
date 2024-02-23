import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    anchors.fill: parent

    ScrollView{
        height: parent.height
        width: parent.width

        Column{
            width: parent.width
            height: parent.height

            Item {
                width: parent.width
                height: 1400

                Text {
                    id: safetytex
                    text: qsTr("Senty Mode")
                    font.pixelSize: parent.width / 50
                    topPadding: 30
                }

                Image {
                    id: safetyimage1
                    source: "qrc:/ui/rightScreen/asset/forward.png"
                    height: 20
                    width: 20
                    anchors {
                        left: safetytex.right
                        bottom: safetytex.bottom
                        leftMargin: 10
                    }
                }

                Item{
                    id: container1
                    height: 180
                    width: parent.width / 2
                    anchors {
                        left: parent.left
                        top: safetytex.bottom
                        topMargin: 20
                    }

                    GroupBox {
                        id: groupBox1
                        height: 80
                        width: parent.width / 1.2
                        background: Rectangle{
                            color: Qt.rgba(0,0,0,0)
                            border.color: "gray"
                            radius: 10
                        }

                        anchors {
                            left: parent.left
                        }


                        Rectangle {
                            id: off_B
                            height: parent.height
                            width: parent.width / 2 - 1
                            color:  "gray"

                            radius: 2
                            anchors {
                                leftMargin: parent.width * 86
                            }
                            MouseArea {
                                id: safButton1
                                anchors.fill: parent
                                onClicked: {
                                    off_B.color = "gray"
                                    on_B.color = "lightgray"
                                }
                            }

                            Text {
                                text: qsTr("Off")
                                anchors.centerIn: parent
                            }
                        }

                        Rectangle {
                            id: on_B
                            height: parent.height
                            width: parent.width / 2 -1
                            color: "lightgray"
                            radius: 2
                            anchors {
                                right: parent.right
                            }

                            MouseArea {
                                id: safButton2
                                anchors.fill: parent
                                onClicked: {
                                    off_B.color = "lightgray"
                                    on_B.color = "gray"
                                }
                            }

                            Text {
                                text: qsTr("On")
                                anchors.centerIn: parent
                            }
                        }


                    }

                    Text {
                        id: safetytex2
                        text: qsTr("Sentry Mode will be enabled\nwhen you leave the car")
                        font.pixelSize: parent.width / 15 - 5
                        color: "#929696"
                        anchors {
                            top: groupBox1.bottom
                            topMargin: 10
                        }
                    }

                }

                Item{
                    id: container2
                    height: 180
                    width: parent.width / 2
                    anchors {
                        right: parent.right
                        top: safetytex.bottom
                        topMargin: 20
                    }

                    CheckBox {
                        id: checkButton1

                        text: "Exclude Home"
                        font.pixelSize: parent.width / 10 - 20
                        checked: if(checkButton1.checked){
                                     console.log("Home checked")
                                     return true

                                 } else {
                                     console.log("Home unchecked")
                                     return false
                                 }
                    }
                    CheckBox {
                        id: checkButton2

                        text: "Exclude Work"
                        font.pixelSize: parent.width / 10 - 20
                        checked: if(checkButton2.checked){
                                     console.log("Work checked")
                                     return true

                                 } else {
                                     console.log("Work unchecked")
                                     return false
                                 }
                        anchors {
                            top: checkButton1.bottom
                            topMargin: 15
                        }
                    }

                    CheckBox {
                        id: checkButton3

                        text: "Exclude Favorites"
                        font.pixelSize: parent.width / 10 - 20
                        checked: if(checkButton3.checked){
                                     console.log("Favorites checked")
                                     return true

                                 } else {
                                     console.log("Favorites unchecked")
                                     return false
                                 }

                        anchors {
                            top: checkButton2.bottom
                            topMargin: 15
                        }
                    }

                }

                Switch{
                    id: switchButton1
                    text: "Camera-Based Detection"
                    anchors {
                        top: container2.bottom
                        topMargin: 15
                    }
                }

                Image {
                    id: safetyimage2
                    source: "qrc:/ui/rightScreen/asset/forward.png"
                    height: 20
                    width: 20
                    anchors {
                        left: switchButton1.right
                        bottom: switchButton1.bottom
                        bottomMargin: 10
                        leftMargin: 10
                    }
                }

                Switch{
                    id: switchButton2
                    text: "Camera-Based Detection"
                    anchors {
                        top: switchButton1.bottom
                        topMargin: 15
                    }
                }

                Image {
                    id: safetyimage3
                    source: "qrc:/ui/rightScreen/asset/forward.png"
                    height: 20
                    width: 20
                    anchors {
                        left: switchButton2.right
                        bottom: switchButton2.bottom
                        bottomMargin: 10
                        leftMargin: 10
                    }
                }

                Switch{
                    id: switchButton3
                    text: "Camera-Based Detection"
                    anchors {
                        top: switchButton2.bottom
                        topMargin: 15
                    }
                }

                Image {
                    id: safetyimage4
                    source: "qrc:/ui/rightScreen/asset/forward.png"
                    height: 20
                    width: 20
                    anchors {
                        left: switchButton3.right
                        bottom: switchButton3.bottom
                        bottomMargin: 10
                        leftMargin: 10
                    }
                }


                Text {
                    id: safetytex3
                    text: qsTr("Dashcam")
                    font.pixelSize: parent.width / 50
                    topPadding: 30
                    anchors {
                        top: switchButton3.bottom
                        topMargin: 15
                    }
                }

                Image {
                    id: safetyimage5
                    source: "qrc:/ui/rightScreen/asset/forward.png"
                    height: 20
                    width: 20
                    anchors {
                        left: safetytex3.right
                        bottom: safetytex3.bottom
                        leftMargin: 10
                    }
                }


                GroupBox {
                    id: groupBox2
                    height: 80
                    width: parent.width / 1.5
                    background: Rectangle{
                        color: Qt.rgba(0,0,0,0)
                        border.color: "gray"
                        radius: 10
                    }

                    anchors {
                        left: parent.left
                        top: safetyimage5.bottom
                        topMargin: 5
                    }


                    Rectangle {
                        id: dashCam_B1
                        height: parent.height
                        width: parent.width / 3 -2
                        color: "lightgray"
                        radius: 2
                        anchors {
                            leftMargin: parent.width * 86
                        }
                        MouseArea {
                            id: safButton3
                            anchors.fill: parent
                            onClicked: {
                                dashCam_B1.color = "gray"
                                dashCam_B2.color = "lightgray"
                                dashCam_B3.color = "lightgray"
                            }
                        }

                        Text {
                            text: qsTr("Off")
                            anchors.centerIn: parent
                        }
                    }

                    Rectangle {
                        id: dashCam_B2
                        height: parent.height
                        width: parent.width / 3
                        color: "lightgray"
                        radius: 2
                        anchors {
                            horizontalCenter: parent.horizontalCenter
                        }

                        MouseArea {
                            id: safButton4
                            anchors.fill: parent
                            onClicked: {
                                dashCam_B1.color = "lightgray"
                                dashCam_B2.color = "gray"
                                dashCam_B3.color = "lightgray"
                            }
                        }

                        Text {
                            text: qsTr("Manual")
                            anchors.centerIn: parent
                        }
                    }

                    Rectangle {
                        id: dashCam_B3
                        height: parent.height
                        width: parent.width / 3 - 1
                        color: "gray"
                        radius: 2
                        anchors {
                            right: parent.right
                        }

                        MouseArea {
                            id: safButton5
                            anchors.fill: parent
                            onClicked: {
                                dashCam_B1.color = "lightgray"
                                dashCam_B2.color = "lightgray"
                                dashCam_B3.color = "gray"
                            }
                        }

                        Text {
                            text: qsTr("Auto")
                            anchors.centerIn: parent
                        }
                    }


                }

                Rectangle {
                    width: parent.width/4
                    height: 80
                    color: "blue"
                    radius: 5
                    anchors {
                        left: groupBox2.right
                        bottom: groupBox2.bottom
                        leftMargin: 10
                        rightMargin: 40
                    }

                    Text {
                        text: qsTr("On Honk")
                        anchors.centerIn: parent
                        font.pixelSize: parent.width / 10
                        color: "white"
                    }
                }

                Rectangle{
                    id: delButton
                    height: 60
                    width: parent.width / 2
                    color: muse1.containsPress? "gray" : "lightgray"
                    radius: 10
                    anchors {
                        left: parent.left
                        top: groupBox2.bottom
                        topMargin: 30
                        rightMargin: 5
                        leftMargin: 2
                    }
                    MouseArea{
                        id: muse1
                        anchors.fill: parent
                    }

                    Text {
                        text: qsTr("Delete Dashcam")
                        anchors.centerIn: parent
                        font.pixelSize: parent.width / 10 - 17
                    }
                }

                Rectangle{
                    id: rectBtn
                    height: 60
                    width: parent.width / 2
                    color: muse2.containsPress? "gray" : "lightgray"
                    radius: 5
                    anchors {
                        left: delButton.right
                        right: parent.right
                        top: groupBox2.bottom
                        topMargin: 30
                        rightMargin: 5
                        leftMargin: 10
                    }

                    MouseArea{
                        id: muse2
                        anchors.fill: parent
                    }

                    Text {
                        text: qsTr("Format USB Drive")
                        anchors.centerIn: parent
                        font.pixelSize: parent.width / 10 - 17
                    }
                }

                GroupBox {
                    id: groupBox3
                    height: 80
                    width: parent.width / 1.5
                    background: Rectangle{
                        color: Qt.rgba(0,0,0,0)
                        border.color: "gray"
                        radius: 10
                    }

                    anchors {
                        left: parent.left
                        top: rectBtn.bottom
                        topMargin: 30
                    }


                    Rectangle {
                        id: ac_B1
                        height: parent.height
                        width: parent.width / 3 -2
                        color: "gray"
                        radius: 2
                        anchors {
                            leftMargin: parent.width * 86
                        }
                        MouseArea {
                            id: safButton6
                            anchors.fill: parent
                            onClicked: {
                                ac_B1.color = "gray"
                                ac_B2.color = "lightgray"
                                ac_B3.color = "lightgray"
                            }
                        }

                        Text {
                            text: qsTr("Off")
                            anchors.centerIn: parent
                        }
                    }

                    Rectangle {
                        id: ac_B2
                        height: parent.height
                        width: parent.width / 3
                        color: "lightgray"

                        radius: 2
                        anchors {
                            horizontalCenter: parent.horizontalCenter
                        }
                        MouseArea {
                            id: safButton7
                            anchors.fill: parent
                            onClicked: {
                                ac_B1.color = "lightgray"
                                ac_B2.color = "gray"
                                ac_B3.color = "lightgray"
                            }
                        }

                        Text {
                            text: qsTr("No A/c")
                            anchors.centerIn: parent
                        }
                    }

                    Rectangle {
                        id: ac_B3
                        height: parent.height
                        width: parent.width / 3 - 1
                        color: "lightgray"
                        radius: 2
                        anchors {
                            right: parent.right
                        }

                        MouseArea {
                            id: safButton8
                            anchors.fill: parent
                            onClicked: {
                                ac_B1.color = "lightgray"
                                ac_B2.color = "lightgray"
                                ac_B3.color = "gray"
                            }
                        }

                        Text {
                            text: qsTr("On")
                            anchors.centerIn: parent
                        }
                    }


                }

                Rectangle {
                    id: rectLine
                    width: parent.width
                    height: 1
                    color: "gray"
                    anchors {
                        top: groupBox3.bottom
                        topMargin: 30
                    }
                }

                Switch{
                    id: switchButton4
                    text: "Security Alarm"
                    checked: true
                    anchors {
                        top: rectLine.bottom
                        topMargin: 30
                    }
                }

                Switch{
                    id: switchButton5
                    text: "park Assist Chimes"
                    checked: false
                    anchors {
                        top: switchButton4.bottom
                        topMargin: 15
                    }
                }

                Switch{
                    id: switchButton6
                    text: "Joe Mode"
                    checked: true
                    anchors {
                        top: switchButton5.bottom
                        topMargin: 15
                    }
                }

                Image {
                    id: safetyimage6
                    source: "qrc:/ui/rightScreen/asset/forward.png"
                    height: 20
                    width: 20
                    anchors {
                        left: switchButton6.right
                        bottom: switchButton6.bottom
                        bottomMargin: 10
                        leftMargin: 10
                    }
                }

                Rectangle {
                    id: rectLine2
                    width: parent.width
                    height: 1
                    color: "gray"
                    anchors {
                        top: switchButton6.bottom
                        topMargin: 30
                    }
                }


                Image {
                    id: carImage
                    source: "qrc:/ui/rightScreen/asset/tesla7.png"
                    height: 160
                    width: 300
                    smooth: true
                    anchors {
                        top: rectLine2.bottom
                        topMargin: 40
                        left: parent.left
                    }

                    Text {
                        text: qsTr("You can also select a gear on the steering\n                         column.")
                        color: "gray"
                        anchors {
                            left: carImage.right
                            verticalCenter: carImage.verticalCenter
                        }
                    }

                    Text {
                        text: qsTr("Foot most be on brake pedal.")
                        color: "gray"
                        anchors {
                            top: carImage.bottom
                            topMargin: 30
                            horizontalCenter: carImage.horizontalCenter
                        }
                    }



                }

            }

        }
    }
}
