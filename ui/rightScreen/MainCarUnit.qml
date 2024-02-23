import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Rectangle {
    width: parent.width
    height: parent.height

    property string bgdColor: "#e3e6e4"
    property string bgdColor2: "#d9dbda"
    color: bgdColor


    Rectangle {
        id: carControlOption
        width:  parent.width * 1/4 + 50
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
         color: bgdColor2

        ListModel {
            id: listOfControlOptions

            ListElement{ name: "Control"; icon: "qrc:/ui/rightScreen/asset/touch-control.png"; link: "CarControl.qml"}
            ListElement{ name: "Pedals & Stearing"; icon: "qrc:/ui/rightScreen/asset/car-wash.png"; link: ""}
            ListElement{ name: "Autopilot"; icon: "qrc:/ui/rightScreen/asset/steering-wheel.png"; link: "Autopilot.qml"}
            ListElement{ name: "Locks"; icon: "qrc:/ui/rightScreen/asset/lock.png"; link: "Lock.qml"}
            ListElement{ name: "Lights"; icon: "qrc:/ui/rightScreen/asset/sun.png"; link: ""}
            ListElement{ name: "Display"; icon: "qrc:/ui/rightScreen/asset/display-frame.png"; link: ""}
            ListElement{ name: "Trip"; icon: "qrc:/ui/rightScreen/asset/traveler-with-a-suitcase.png"; link: ""}
            ListElement{ name: "Navigation"; icon: "qrc:/ui/rightScreen/asset/compass.png"; link: "Navigate.qml"}
            ListElement{ name: "Safety"; icon: "qrc:/ui/rightScreen/asset/protection.png"; link: "Safety.qml"}
            ListElement{ name: "Service"; icon: "qrc:/ui/rightScreen/asset/repair-tool.png"; link: ""}
            ListElement{ name: "Software"; icon: "qrc:/ui/rightScreen/asset/download.png"; link: "Software.qml"}
            ListElement{ name: "upgrades"; icon: "qrc:/ui/rightScreen/asset/forward.png"; link: ""}
        }


        Component {
            id: controlOptionComponent

            Rectangle {
                height: parent.height/12
                anchors {
                    left: parent.left
                    right: parent.right
                    leftMargin: parent.width / 25
                    rightMargin: parent.width / 25
                }
                radius: 10
                color: listMouse.pressed? "#c9c5c5":Qt.rgba(0,0,0,0)
                MouseArea{
                    id: listMouse
                    anchors.fill: parent
                    onClicked: {
                        mainLoader.source = model.link
                    }
                }

                Image {
                    id: listIcons
                    source: model.icon
                    height: parent.width / 15 + 3
                    width: parent.height / 2 - 5
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                        leftMargin: parent.width / 40
                    }
                }

                Text {
                    text: model.name
                    font.pixelSize: parent.width / 15
                    anchors {
                        left: listIcons.right
                        verticalCenter: listIcons.verticalCenter
                        leftMargin: 10
                    }
                }


            }
        }

        Column {
            id: listViewOfCarSettings

            anchors.fill: parent
            anchors {
                topMargin: 10
                bottomMargin: 30
            }
            spacing: 2

            Repeater{
                model: listOfControlOptions
                delegate: controlOptionComponent
            }

        }
    }

    Rectangle{
        id: topBar

        height: parent.height /25 + 5
        color: bgdColor2
        anchors {
            top: parent.top
            left: carControlOption.right
            right: parent.right

        }

        Image {
            id: iconUser
            source: "qrc:/ui/asset/user-removebg-preview.png"

            height: parent.height / 2
            width: parent.width / 20 - 10
            anchors{
                bottom: parent.bottom
                left: parent.left
                bottomMargin: parent.height / 6
                leftMargin: 5
            }
        }

        Text {
            id: texMe
            text: m_connect.userName
            font.pixelSize: 16
            anchors {
                left: iconUser.right
                verticalCenter: iconUser.verticalCenter
                leftMargin: parent.width / 20 -20
            }
        }


        Image {
            id: networkIcon
            source: "qrc:/ui/rightScreen/asset/signal.png"

            height: parent.height / 2
            width: parent.width / 20 - 10
            anchors{
                bottom: parent.bottom
                right: parent.right
                bottomMargin: parent.height / 6
               rightMargin: 40
            }
        }

        Image {
            id: bluthootIcon
            source: "qrc:/ui/rightScreen/asset/bluetooth.png"

            height: parent.height / 2
            width: parent.width / 20 - 10
            anchors{
                bottom: parent.bottom
                right: networkIcon.left
                bottomMargin: parent.height / 6
               rightMargin: 30
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{
                    bluethootDisplay.visible = true
                }
            }
        }

        Image {
            id: notificationIcon
            source: "qrc:/ui/rightScreen/asset/bell.png"

            height: parent.height / 2
            width: parent.width / 20 - 10
            anchors{
                bottom: parent.bottom
                right: bluthootIcon.left
                bottomMargin: parent.height / 6
               rightMargin: 30
            }

            MouseArea{
                anchors.fill: parent
                onClicked: bluethootDisplay.visible = true
            }
        }

    }

    //----------------------------------------------------------

    function handleButtonClicked(buttonId) {
        console.log("Button Clicked:", buttonId);
        // Add your logic here to handle the button click
        console.log("i will make it");
    }




    //-----------------------------------------------------------



  Loader{
      id: mainLoader
      clip: true
      anchors {
          top: topBar.bottom
          right: parent.right
          left: carControlOption.right
          bottom: parent.bottom
          leftMargin: 5
      }
     source: "CarControl.qml"

     onLoaded: {
         // Start animation when the item is loaded
         opacityAnimation.start();
     }
  }




  Bluetooth {
      id: bluethootDisplay
  }
}
