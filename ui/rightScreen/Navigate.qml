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
                    id: volumeTex
                    text: qsTr("Navigation Volume")
                    anchors {
                        left: parent.left
                        top: parent.top
                        topMargin: 40
                    }
                    font.pixelSize: 18
                    leftPadding: 60
                }

                Rectangle {
                    id: volume
                    height: 50
                    width: parent.width / 2 - 5
                    anchors {
                        top: volumeTex.bottom
                        topMargin: 10
                        left: parent.left
                        leftMargin: 40
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
                            onClicked: {
                            m_notifVlm.musicVolume--
                            }
                        }
                    }

                    Text {
                        text: m_notifVlm.musicVolume
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
                            onClicked: {
                            m_notifVlm.musicVolume++
                            }
                        }
                    }
                }


                Rectangle {
                    id: volumeIcon
                    height: 65
                    width: 100
                    anchors {
                        top: parent.top
                        topMargin: 65
                        right: parent.right
                        rightMargin: 150
                    }
                    radius: 10
                    color: "blue"
                    border.width: 2
                    border.color: if(m_notifVlm.musicVolume >= 8)
                                      return "red"
                                    else return Qt.rgba(0,0,0,0)

                    Image {
                        source: if(m_notifVlm.musicVolume <= 1)
                                    return "qrc:/ui/asset/vlmoooo-removebg-preview.png"
                                else if(m_notifVlm.musicVolume <= 3)
                                    return "qrc:/ui/asset/vlm00-removebg-preview.png"
                                else if(m_notifVlm.musicVolume <= 6)
                                    return "qrc:/ui/asset/vlm2-removebg-preview.png"
                                else if(m_notifVlm.musicVolume <= 10 )
                                    return "qrc:/ui/asset/vlm3-removebg-preview.png"
                        height: 20
                        width: 20
                        anchors.centerIn: parent
                    }
                }

                Rectangle{
                    id: baseline1
                    color: "gray"
                    width: parent.width
                    height: 1
                    anchors {
                        top: volumeIcon.bottom
                        topMargin: 30
                    }

                }

                Switch {
                    id: navSwitch1
                    checked: true
                    font.pixelSize: 18
                    text: "Automatic Navigation"
                    anchors {
                        top: baseline1.bottom
                        topMargin: 30
                    }
                }

                Text {
                    id: navTex1
                    text: qsTr("Automatically navigate to home, work or your\nnext calendar event location when you enter the\ncar.")
                    color: "gray"
                    font.pixelSize: 15
                    anchors {
                        top: navSwitch1.bottom
                        left: parent.left
                        leftMargin: 70
                    }
                }

                Switch {
                    id: navSwitch2
                    checked: true
                    text: "Trip Planner"
                    font.pixelSize: 18
                    anchors {
                        top: navTex1.bottom
                        topMargin: 20
                    }
                }

                Text {
                    id: navTex2
                    text: qsTr("Adds stops at Superchargeers if charging is\nneeded to reach your destination.")
                    color: "gray"
                    font.pixelSize: 15
                    anchors {
                        top: navSwitch2.bottom
                        left: parent.left
                        leftMargin: 70
                    }
                }

                Switch {
                    id: navSwitch3
                    checked: true
                    font.pixelSize: 18
                    text: "Online Routing"
                    anchors {
                        top: navTex2.bottom
                        topMargin: 20
                    }
                }

                Text {
                    id: navTex3
                    text: qsTr("Generate optional routes and takes real-time\ntraffic conditions into account while navigating.")
                    color: "gray"
                    font.pixelSize: 15
                    anchors {
                        top: navSwitch3.bottom
                        left: parent.left
                        leftMargin: 70
                    }
                }

                Text {
                    id: routeTex
                    text: qsTr("Route if it saves more than")
                    color: "gray"
                    anchors {
                        left: parent.left
                        top: navTex3.bottom
                        topMargin: 20
                    }
                    font.pixelSize: 15
                    leftPadding: 70
                }

                Rectangle {
                    id: router
                    height: 50
                    width: parent.width / 2 - 5
                    anchors {
                        top: routeTex.bottom
                        topMargin: 10
                        left: parent.left
                        leftMargin: 70
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
                            anchors.fill: parent
                            onClicked: m_route.zoomMap--
                        }
                    }

                    Text {
                        text: qsTr(m_route.zoomMap +" " + "min")
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
                            anchors.fill: parent
                            onClicked: m_route.zoomMap++
                        }
                    }
                }

                Switch {
                    id: navSwitch4
                    font.pixelSize: 18
                    text: "Avoid Ferries"
                    anchors {
                        top: router.bottom
                        topMargin: 40
                    }
                }

                Switch {
                    id: navSwitch5
                    font.pixelSize: 18
                    text: "Avoid Tolls"
                    anchors {
                        top: navSwitch4.bottom
                        topMargin: 20
                    }
                }

                Switch {
                    id: navSwitch6
                    font.pixelSize: 18
                    text: "Use HOV Lanes"
                    anchors {
                        top: navSwitch5.bottom
                        topMargin: 20
                    }
                }



            }
        }
    }
}
