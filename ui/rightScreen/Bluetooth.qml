import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item{
    id: bluetoothDisplay

    visible: false
    height: parent.height / 1.8
    width: parent.width / 1.7
    anchors.centerIn: mainLoader



    Rectangle{
        id: mainBlue_T

        anchors.fill: bluetoothDisplay
        color: "#dedede"
        border.color: "gray"
        radius: 5
        Image {
            id: cansle
            source: "qrc:/ui/rightScreen/asset/clear.png"
            height: 15
            width: 15
            anchors{
                left: parent.left
                leftMargin: 10
                bottom: texBlue.bottom
            }

            MouseArea{
                anchors.fill: parent
                onClicked: bluetoothDisplay.visible = false
            }
        }

        Text {
            id: texBlue
            text: qsTr("Bluetooth Settings")
            font.pixelSize: parent.width / 20 -5
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                topMargin: 10
            }
        }

        Image {
            source: "qrc:/ui/rightScreen/asset/bluetooth.png"
            height: 15
            width: 15
            anchors{
                right: parent.right
                rightMargin: 10
                bottom: texBlue.bottom
            }
        }

        Rectangle{
            id: topLine
            color: "lightgray"
            height: 2
            width: parent.width
            anchors {
                top: texBlue.bottom
                topMargin: 10
            }
        }

        //-----------------------------------------------------------------------------------

        Item{
            id: deviceSearch

            width: parent.width * 1/2.5
            anchors {
                topMargin: 10
                top: topLine.bottom
                bottom: parent.bottom
                left: parent.left
            }

            Rectangle {
                id: searchBox
                height: parent.height * 1/5 - 10
                width: parent.width
                color: "#f5f2f2"
                radius: 5
                anchors {
                    top: parent.top
                    left: parent.left
                    leftMargin: 5
                }

                Text {
                    id: tess1
                    text: qsTr("Add New Device")
                    font.pixelSize: parent.width /13
                    topPadding: 15
                    leftPadding: 5
                    rightPadding: searchBox.height / 2
                }

                Text {
                    id: tss2
                    text: qsTr("+")
                    font.pixelSize: parent.width /10 + 5
                    topPadding: 15
                    anchors {
                        left: tess1.right
                        verticalCenter: tess1.verticalCenter
                    }
                }


                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log("searching for device.")
                }
            }


        }

        Item {
            id: switchSection
            width: parent.width /1.7 + 6
            anchors {
                right: parent.right
                top: deviceSearch.top
                bottom: parent.bottom
            }

            Switch {
                id: bluetoothSwitch
                text: "   Bluetooth"
                checked: false

                onCheckedChanged: {
                    // Handle Bluetooth toggle
                    if (bluetoothSwitch.checked) {
                        console.log("Bluetooth is turned ON")
                        // Code to turn Bluetooth ON
                    } else {
                        console.log("Bluetooth is turned OFF")
                        // Code to turn Bluetooth OFF
                    }
                }
            }

            Switch {
                id: sync
                text: "   Sync Contacts"
                checked: false

                onCheckedChanged: {
                    // Handle Bluetooth toggle
                    if (bluetoothSwitch.checked) {
                        console.log("Synchronizing contacts")
                        // Code to turn Bluetooth ON
                    } else {
                        console.log("Disconnect contact")
                        // Code to turn Bluetooth OFF
                    }
                }
                anchors {
                    top: bluetoothSwitch.bottom
                    topMargin: 15
                }
            }

            Switch {
                id: newMessage
                text: "   Sync Messages"
                checked: false

                onCheckedChanged: {
                    // Handle Bluetooth toggle
                    if (bluetoothSwitch.checked) {
                        console.log("retrieving messages")
                        // Code to turn Bluetooth ON
                    } else {
                        console.log("disconnected")
                        // Code to turn Bluetooth OFF
                    }
                }

                anchors {
                    top: sync.bottom
                    topMargin: 15
                }
            }

            Switch {
                id: device
                text: "   Priority Device"
                checked: false

                onCheckedChanged: {
                    // Handle Bluetooth toggle
                    if (bluetoothSwitch.checked) {
                        console.log("Your device connected")
                        // Code to turn Bluetooth ON
                    } else {
                        console.log("Device disconnected")
                        // Code to turn Bluetooth OFF
                    }
                }
                anchors {
                    top: newMessage.bottom
                    topMargin: 15
                }
            }

            Row{
                height: switchSection.height /10
                anchors {
                    bottom: switchSection.bottom
                    left: switchSection.left
                    right: switchSection.right
                    bottomMargin: 10
                }
                spacing: 5

                Button{
                    text: "Forget"
                    height: parent.height
                    background: Rectangle {
                        radius: 5
                        color: mouseA.containsMouse ? "lightblue" : "#f5f2f2"
                    }
                    width: parent.width /2 -5

                    MouseArea{
                        id: mouseA
                        anchors.fill: parent
                        onClicked: console.log("Forgeting device")
                    }
                }

                Button{
                    text: "Disconnect"
                    height: parent.height
                    background: Rectangle {
                        radius: 5
                        color: mouseB.containsMouse ? "lightblue" : "#f5f2f2"
                    }
                    width: parent.width /2 -5

                    MouseArea{
                        id: mouseB
                        anchors.fill: parent
                        onClicked: console.log("Disconnecting device")
                    }
                }
            }

        }

    }

}
