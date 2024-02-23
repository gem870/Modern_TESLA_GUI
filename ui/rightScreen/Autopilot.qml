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

                Text {
                    id: tex
                    text: qsTr("Cruise Follow Distance")
                    anchors {
                        left: parent.left
                        top: parent.top
                        topMargin: 40
                    }
                    font.pixelSize: 18
                }

                Rectangle {
                    id: increaseDistance
                    height: 50
                    width: parent.width / 2 - 5
                    anchors {
                        top: tex.bottom
                        topMargin: 10
                        left: parent.left
                    }
                    radius: 10
                    color: "#cedede"

                    Text {
                        text: qsTr(" - ")
                        anchors {
                            left: parent.left
                            verticalCenter: parent.verticalCenter
                        }
                        font.bold: true
                        font.pixelSize: 25
                        leftPadding: parent.width / 5

                        MouseArea{
                            id: vlm_N
                            anchors.fill: parent
                            onClicked: m_counter.zoomMap--
                        }
                    }

                    Text {
                        text: m_counter.zoomMap
                        anchors.centerIn: parent
                        font.pixelSize: 25
                    }

                    Text {
                        text: qsTr(" + ")
                        anchors {
                            right: parent.right
                            verticalCenter: parent.verticalCenter
                        }
                        font.bold: true
                        font.pixelSize: 25
                        rightPadding: parent.width / 5

                        MouseArea{
                            id: vlm_P
                            anchors.fill: parent
                            onClicked: m_counter.zoomMap++
                        }
                    }
                }


                Switch {
                    id: steer
                    checked: true
                    font.pixelSize: 18
                    text: "Autosteer (Beta)"
                    anchors {
                        top: increaseDistance.bottom
                        topMargin: 30
                    }
                }

                Text {
                    id: tex2
                    text: qsTr("Autosteer Activation")
                    font.pixelSize: 15
                    anchors {
                        top: steer.bottom
                        topMargin: 20
                    }

                }

                Image {
                    source: "qrc:/ui/asset/forward.png"
                    height: 20
                    width: 20
                    anchors {
                        left: tex2.right
                        bottom: tex2.bottom
                        leftMargin: 10
                    }
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
                        top: tex2.bottom
                        topMargin: 10
                    }


                    Rectangle {
                        id: steer_B1
                        height: parent.height
                        width: parent.width / 2 - 1
                        color: "lightgray"

                        radius: 2
                        anchors {
                            leftMargin: parent.width * 86
                        }
                        MouseArea {
                            id: safButton1
                            anchors.fill: parent
                            onClicked: {
                                steer_B1.color = "gray"
                                steer_B2.color = "lightgray"
                            }
                        }

                        Text {
                            text: qsTr("Single Click")
                            anchors.centerIn: parent
                        }
                    }

                    Rectangle {
                        id: steer_B2
                        height: parent.height
                        width: parent.width / 2 -1
                        color: "gray"
                        radius: 2
                        anchors {
                            right: parent.right
                        }

                        MouseArea {
                            id: safButton2
                            anchors.fill: parent
                            onClicked: {
                                steer_B1.color = "lightgray"
                                steer_B2.color = "gray"
                            }
                        }

                        Text {
                            text: qsTr("Double Click")
                            anchors.centerIn: parent
                        }
                    }


                }

                Switch {
                    id: autopilot
                    checked: true
                    font.pixelSize: 18
                    text: "Navigate on Autopilot (Beta)"
                    anchors {
                        top: groupBox1.bottom
                        topMargin: 30
                    }
                }

                Rectangle {
                    id: customizeNav
                    height: 50
                    width: parent.width / 1.8
                    color: "#cedede"
                    anchors {
                        top: autopilot.bottom
                        topMargin: 20
                    }
                    radius: 5

                    Text {
                        text: qsTr("Customize Navigation on Autopilot")
                        anchors.centerIn: parent
                        font.pixelSize: 16
                    }
                }

                Switch {
                    id: trafficLight
                    checked: true
                    font.pixelSize: 18
                    text: "Traffic Light and Stop Sign control (Beta)"
                    anchors {
                        top: customizeNav.bottom
                        topMargin: 20
                    }
                }

                Switch{
                    id: greenTraffic
                    text: "Green Traffic Light Chime"
                    anchors {
                        top: trafficLight.bottom
                        topMargin: 20
                    }
                }

                Image {
                    id: t_icon
                    source: "qrc:/ui/asset/forward.png"
                    height: 20
                    width: 20
                    anchors {
                        left: greenTraffic.right
                        bottom: greenTraffic.bottom
                        bottomMargin: 10
                        leftMargin: 10
                    }
                }

                Switch {
                    id: fullSelf
                    checked: true
                    font.pixelSize: 18
                    text: "Full Self-Driving Visualzation Preview"
                    anchors {
                        top: t_icon.bottom
                        topMargin: 20
                    }
                }

                Switch {
                    id: summon
                    font.pixelSize: 18
                    text: "Summon (Beta)"
                    anchors {
                        top: fullSelf.bottom
                        topMargin: 20
                    }
                }

                GroupBox {
                    id: groupBox2
                    height: 80
                    width: parent.width / 1.2
                    background: Rectangle{
                        color: Qt.rgba(0,0,0,0)
                        border.color: "gray"
                        radius: 10
                    }

                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: summon.bottom
                        topMargin: 40
                    }


                    Rectangle {
                        id: sum_B1
                        height: parent.height
                        width: parent.width / 2 - 1
                        color: "lightgray"
                        radius: 2
                        anchors {
                            leftMargin: parent.width * 86
                        }

                        MouseArea {
                            id: safButton3
                            anchors.fill: parent
                            onClicked: {
                                sum_B1.color = "gray"
                                sum_B2.color = "lightgray"
                            }
                        }

                        Text {
                            text: qsTr("Customize Sommon")
                            anchors.centerIn: parent
                        }
                    }

                    Rectangle {
                        id: sum_B2
                        height: parent.height
                        width: parent.width / 2 -1
                        color: "gray"
                        radius: 2
                        anchors {
                            right: parent.right
                        }

                        MouseArea {
                            id: safButton4
                            anchors.fill: parent
                            onClicked: {
                                sum_B1.color = "lightgray"
                                sum_B2.color = "gray"
                            }
                        }

                        Text {
                            text: qsTr("Standby Mode")
                            anchors.centerIn: parent
                        }
                    }


                }

            }
        }
    }
}
