import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    anchors.fill: parent

    ScrollView{
        id: scrovw1
        anchors.fill: parent

        Column{
            id: lockSection
            width: parent.width
            height: parent.height

            Item{
                id: lockSettings
                width: parent.width
                height: 900

                Rectangle {
                    id: windowLock
                    height: 60
                    width: parent.width / 2 - 5
                    anchors {
                        top: parent.top
                        topMargin: 20
                        left: parent.left
                    }
                    radius: 10
                    color: if(widMous.containsPress)
                               return "gray"
                           else
                               if(!widMous.containsPress)
                                   return "lightgray"
                    border.color: "gray"

                    MouseArea {
                        id: widMous
                        anchors.fill: parent
                    }

                    Image {
                        source: "qrc:/ui/rightScreen/asset/window.png"
                        height: 30
                        width: 30
                        anchors {
                            left: parent.left
                            verticalCenter: parent.verticalCenter
                            leftMargin: parent.width / 5
                        }
                    }

                    Text {
                        text: qsTr("Window Lock")
                        anchors {
                            right: parent.right
                            verticalCenter: parent.verticalCenter
                        }
                        font.pixelSize: 18
                        rightPadding: parent.width / 5
                    }
                }


                Rectangle {
                    id: childLock
                    height: 60
                    width: parent.width / 2 - 5
                    anchors {
                        top: parent.top
                        topMargin: 20
                        right: parent.right
                        rightMargin: 5
                    }
                    radius: 10
                    color: if(widMous2.containsPress)
                               return "gray"
                           else
                               if(!widMous2.containsPress)
                                   return "lightgray"
                    border.color: "gray"

                    Image {
                        source: "qrc:/ui/rightScreen/asset/child.png"
                        height: 30
                        width: 30
                        anchors {
                            left: parent.left
                            verticalCenter: parent.verticalCenter
                            leftMargin: parent.width / 5
                        }
                    }

                    MouseArea {
                        id: widMous2
                        anchors.fill: parent
                    }

                    Text {
                        text: qsTr("Child Lock")
                        anchors {
                            right: parent.right
                            verticalCenter: parent.verticalCenter
                        }
                        font.pixelSize: 18
                        rightPadding: parent.width / 5
                    }
                }



                Switch {
                    id: walkSwitch
                    text: "Walk-Away Door Look"
                    checked: true
                    anchors {
                        top: windowLock.bottom
                        left: parent.left
                        topMargin: 20
                    }
                }

                Rectangle {
                    id:lockD1
                    height: 100
                    color: Qt.rgba(0,0,0,0)
                    width: parent.width
                    anchors {
                        left: parent.left
                        top: walkSwitch.bottom
                        leftMargin: 60
                    }

                    Text {
                        id: lckTex1
                        text: qsTr("Automatically look doors and trunks when\nleaving with a phone or key fob")
                        color: "gray"
                        leftPadding: 10
                    }

                    CheckBox{
                        text: "Exclude Home"
                        anchors {
                            top: lckTex1.bottom
                            topMargin: 20
                        }
                    }
                }

                Switch{
                    id: walkSwitch2
                    text: "Auto-Present Handles"
                    checked: true
                    anchors {
                        top: lockD1.bottom
                        topMargin: 10
                    }
                }

                Switch {
                    id: walkSwitch3
                    text: "Driver Door Unlock Mode"
                    anchors {
                        top: walkSwitch2.bottom
                        topMargin: 20
                    }
                }

                Text {
                    id: lckTex2
                    text: qsTr("Only unlock the driver when shifting to\npark")
                    color: "gray"
                    anchors {
                        top: walkSwitch3.bottom
                        left: parent.left
                        leftMargin: 70
                    }
                }

                Switch {
                    id: walkSwitch4
                    text: "Unlock on park"
                    checked: true
                    anchors {
                        top: lckTex2.bottom
                        topMargin: 20
                    }
                }

                Rectangle {
                    id: line1
                    height: 1
                    color: "gray"
                    width: parent.width
                    anchors {
                        top: walkSwitch4.bottom
                        topMargin: 30
                    }
                }

                Switch {
                    id: walkSwitch5
                    text: "Lock Confirmation Sound"
                    checked: true
                    anchors {
                        top: line1.bottom
                        topMargin: 30
                    }
                }

                Switch {
                    id: walkSwitch6
                    text: "Close Windows on lock"
                    checked: true
                    anchors {
                        top: walkSwitch5.bottom
                        topMargin: 20
                    }
                }

                Text {
                    id: lckTex3
                    text: qsTr("Car Left Open Notifications")
                    font.pixelSize: 15
                    anchors {
                        top: walkSwitch6.bottom
                        topMargin: 20
                    }

                }

                Image {
                    source: "qrc:/ui/rightScreen/asset/forward.png"
                    height: 20
                    width: 20
                    anchors {
                        left: lckTex3.right
                        bottom: lckTex3.bottom
                        leftMargin: 10
                    }
                }

                GroupBox {
                    id: box
                    height: 80
                    width: parent.width / 1.5
                    background: Rectangle{
                        color: Qt.rgba(0,0,0,0)
                        border.color: "gray"
                        radius: 10
                    }

                    anchors {
                        left: parent.left
                        top: lckTex3.bottom
                        topMargin: 20
                    }


                    Rectangle {
                        id: lock_B1
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
                                lock_B1.color = "gray"
                                lock_B2.color = "lightgray"
                                lock_B3.color = "lightgray"
                            }
                        }

                        Text {
                            text: qsTr("Off")
                            anchors.centerIn: parent
                        }
                    }

                    Rectangle {
                        id: lock_B2
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
                                lock_B1.color = "lightgray"
                                lock_B2.color = "gray"
                                lock_B3.color = "lightgray"
                            }
                        }

                        Text {
                            text: qsTr("Doors")
                            anchors.centerIn: parent
                        }
                    }

                    Rectangle {
                        id: lock_B3
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
                                lock_B1.color = "lightgray"
                                lock_B2.color = "lightgray"
                                lock_B3.color = "gray"
                            }
                        }

                        Text {
                            text: qsTr("  Door &\nWindows")
                            anchors.centerIn: parent
                        }
                    }


                }

                CheckBox{
                    id: checkMe
                    text: "Exclude Home"
                    anchors {
                        top: box.bottom
                        topMargin: 20
                    }
                }

                Text {
                    id: lckTex4
                    text: qsTr("You will not be notified if your car is left open")
                    color: "gray"
                    anchors {
                        top: checkMe.bottom
                        left: parent.left
                        topMargin: 20
                    }
                }





            }
        }



    }
}
