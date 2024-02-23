import QtQuick 2.15
import QtQuick.Controls 2.15

ScrollView {
    width: parent.width
    height: parent.height

    Column {
        id: list
        anchors.fill: parent

        Item {
            width: parent.width
            height: 300

            Image {
                source: "qrc:/ui/rightScreen/asset/tesla1-removebg-preview (1).png"
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }

        }

        Item {
            width: parent.width
            height: 860

            Text {
                id: texModel
                text: qsTr("MODEL 3")
                font.pixelSize: parent.width / 16
                font {
                    family: "Garamond" // Set the font family
                }
            }

            Text {
                id: texModel2
                text: qsTr("Flux")
                font.pixelSize: parent.width / 16 - 10
                font {
                    family: "Garamond" // Set the font family
                }
                color: "blue"

                anchors {
                    right: parent.right
                    rightMargin: 20
                    bottom: texModel.bottom
                }
            }

            Text {
                id: texModel3
                text: qsTr("LONG RANGE\nDUAL MOTOR")
                font.pixelSize: parent.width / 16 - 10
                color: "#6b706c"
                anchors {
                    top: texModel.bottom
                    topMargin: 10
                }

                font {
                    family: "Courier New" // Set the font family
                }
            }

            Text {
                id: texModel4
                text: qsTr("28,497 mi")
                font.pixelSize: parent.width / 16 - 20
                anchors {
                    top: texModel3.bottom
                    topMargin: 10
                }

            }

            Text {
                id: texModel5
                text: qsTr("VIN 68736488348 Tesla")
                font.pixelSize: parent.width / 16 - 20
                anchors {
                    top: texModel4.bottom
                    topMargin: 10
                }

            }

            Text {
                id: texModel6
                text: qsTr("Autopilot Computer. Full self-driving computer")
                font.pixelSize: parent.width / 16 - 20
                anchors {
                    top: texModel5.bottom
                    topMargin: 10
                }

            }

            Text {
                id: texModel7
                text: qsTr("Additional vehicle information")
                font.pixelSize: parent.width / 16 - 21
                color: "blue"
                anchors {
                    top: texModel6.bottom
                    topMargin: 10
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        console.log("Additional Information")
                    }
                }

            }

            Text {
                id: texModel8
                text: qsTr("Full Self Driving Capabilty")
                font.pixelSize: parent.width / 16 - 20
                anchors {
                    top: texModel7.bottom
                    topMargin: 20
                }

            }

            Image {
                source: "qrc:/ui/rightScreen/asset/forward.png"
                height: 20
                width: 20
                anchors {
                    right: parent.right
                    bottom: texModel8.bottom
                    rightMargin: parent.width / 1.66654
                }
            }

            Text {
                id: texModel9
                text: qsTr("Included package")
                font.pixelSize: parent.width / 16 - 21
                color: "#6b706c"
                anchors {
                    top: texModel8.bottom
                    topMargin: 10
                }

            }

            Text {
                id: texModel10
                text: qsTr("premium Connectivity")
                font.pixelSize: parent.width / 16 - 20
                anchors {
                    top: texModel9.bottom
                    topMargin: 20
                }

            }

            Image {
                source: "qrc:/ui/rightScreen/asset/forward.png"
                height: 20
                width: 20
                anchors {
                    right: parent.right
                    bottom: texModel10.bottom
                    rightMargin: parent.width / 1.45544 -10
                }
            }

            Text {
                id: texModel11
                text: qsTr("Included package")
                font.pixelSize: parent.width / 16 - 21
                color: "#6b706c"
                anchors {
                    top: texModel10.bottom
                    topMargin: 10
                }

            }

            Rectangle {
                id: borderline1
                width: parent.width
                height: 1
                color: "#606160"
                anchors {
                    top: texModel11.bottom
                    topMargin: 30

                }
            }

            Text {
                id: texModel12
                text: qsTr("Software")
                font.pixelSize: parent.width / 16 - 20
               // color: "#6b706c"
                anchors {
                    top: borderline1.bottom
                    topMargin: 30
                }

            }

            Text {
                id: texModel13
                text: qsTr("FSD Beta 10.12.2(2022.12.3.20cfe1aeaefb6d)")
                font.pixelSize: parent.width / 16 - 21
                anchors {
                    top: texModel12.bottom
                    topMargin: 10
                }

            }

            Text {
                id: texModel14
                text: qsTr("Navigation Data")
                font.pixelSize: parent.width / 16 - 21
                anchors {
                    top: texModel13.bottom
                    topMargin: 10
                }

            }

            Text {
                id: texModel15
                text: qsTr("NA-2021.44-13555")
                font.pixelSize: parent.width / 16 - 21
                anchors {
                    top: texModel14.bottom
                    topMargin: 10
                }

            }

            Text {
                id: texModel16
                text: qsTr("Your car software is up to date as jul 3 15:17")
                font.pixelSize: parent.width / 16 - 20
                color: "#6b706c"
                anchors {
                    top: texModel15.bottom
                    topMargin: 10
                }

            }

            Text {
                id: texModel17
                text: qsTr("Software Update Preference")
                font.pixelSize: parent.width / 16 - 20
                anchors {
                    top: texModel16.bottom
                    topMargin: 120
                    horizontalCenter: parent.horizontalCenter
                }

            }

            Image {
                source: "qrc:/ui/rightScreen/asset/forward.png"
                height: 20
                width: 20
                anchors {
                    right: parent.right
                    bottom: texModel17.bottom
                    rightMargin: parent.width / 3.5 -10
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
                    top: texModel17.bottom
                    topMargin: 10
                    horizontalCenter: parent.horizontalCenter
                }


                Rectangle {
                    id: stan_B
                    height: parent.height
                    width: parent.width / 2 - 1
                    color: "gray"

                    radius: 2
                    anchors {
                        leftMargin: parent.width * 86
                    }
                    MouseArea {
                        id: safButton1
                        anchors.fill: parent
                        onClicked: {
                            stan_B.color = "gray"
                            advan_B.color = "lightgray"
                        }
                    }

                    Text {
                        text: qsTr("Standard")
                        anchors.centerIn: parent
                    }
                }

                Rectangle {
                    id: advan_B
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
                            stan_B.color = "lightgray"
                            advan_B.color = "gray"
                        }
                    }

                    Text {
                        text: qsTr("Advanced")
                        anchors.centerIn: parent
                    }
                }


            }


        }




    }

}
