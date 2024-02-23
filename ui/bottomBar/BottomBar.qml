import QtQuick 2.15
import QtQuick.Layouts 1.15

Rectangle{
    id: bottomBar
    height: parent.height /11
    anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    color: "black"

//    Tempereture {
//        id: tempereture

//        MouseArea{
//            anchors.fill: parent
//            onClicked: {
//                buttonClicked(10)
//            }
//        }
//    }




    Rectangle {                                //     DRIVERS TEMP CONTROL/DISPLAY SECTION          << -------------------
        id: tempereture
        width: parent.width * 1/8 - 30
        height: parent.height * 2/2 -20
        color: Qt.rgba(0,0,0,0)
        anchors {
            left: carControlIcon.right
            leftMargin: 80
            verticalCenter: carControlIcon.verticalCenter
        }

        Loader{
            id: driversControlLoader
            anchors.fill: parent
            source: "StandByMode.qml"
        }
    }

    Connections {
        id: signalControl
        target: leftScreen
        onButtonClicked: {
           if(image === 60){
                driversControlLoader.source = "Tempereture.qml"
           } else                if(image === 70){
               passengersControlLoader.source = "PassengersTemperature.qml"
          } else                if(image === 80){
               driversControlLoader.source = "DriversFan.qml"
          } else                if(image === 90){
               passengersControlLoader.source = "PassengersFan.qml"
          }
        }
    }

    Connections {
        target: passengerFan
        onButtonClicked: {
            if(fanSignal === 1){
                 signalControl.target = noSignal
            }
        }
    }

    Connections {
        target: driverFan
        onButtonClicked: {
            if(fanSignal === 1){
                 signalControl.target = noSignal
            }
        }
    }

    Connections {
        target: standByMode
        onButtonClicked: {
            if(modeSignal === 1){
              //   signalControl.target = leftScreen
            }
        }
    }

    Connections {
        target: passengerTemp
        onButtonClicked: {
            if(tempSignal === 1){
                 signalControl.target = noSignal
            }
        }
    }

    Connections {
        target: tempereture
        onButtonClicked: {
            if(tempSignal === 1){
                 signalControl.target = noSignal
            }
        }
    }





    MusicVolume{
        id: musicVolume
    }



    Image {
        id: carControlIcon
        source: "qrc:/ui/asset/electric-car.png"
        fillMode: Image.PreserveAspectFit
        height: parent.height /1.3
        width: parent.width / 20
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 20
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                buttonClicked(1)
            }
        }
    }



    Row {
        id: rowIcons
        height: parent.height * 2/2 -5
        width: parent.width * 2/30
        spacing: 60
        anchors {
            left: tempereture.right
            leftMargin: parent.width * 2/17
        }
        y: parent.height/8
        topPadding: parent.height / 8



        Image {
            id: screenDropDown
            source: "qrc:/ui/asset/menu.png"
            height: parent.height * 2/2.7 - 10
            width: parent.width * 2/3
            fillMode: Image.PreserveAspectFit

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    buttonClicked(2)
                }
            }
        }

        Image {
            id: musicIcon
            source: "qrc:/ui/asset/musicIcon.png"
            height: parent.height * 2/2.7 - 10
            width: parent.width * 2/3
            fillMode: Image.PreserveAspectFit

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    buttonClicked(3)
                }
            }
        }


        Image {
            id: phoneIcon
            source: "qrc:/ui/asset/AdobeStock_600472466_Preview-removebg-preview.png"
            height: parent.height * 2/2.7 - 10
            width: parent.width * 2/3
            fillMode: Image.PreserveAspectFit

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    buttonClicked(4)
                }
            }
        }

//        Image {
//            id: bluethootIcon
//            source: "qrc:/ui/asset/AdobeStock_578708017_Preview-removebg-preview.png"
//            height: parent.height * 2/2.7 - 10
//            width: parent.width * 2/3
//            fillMode: Image.PreserveAspectFit
//        }

        Image {
            id: camera
            source: "qrc:/ui/asset/camera (2).png"
            height: parent.height * 2/2.7 - 10
            width: parent.width * 2/3
            fillMode: Image.PreserveAspectFit
        }
    }


    Item {
        id: passengerTemp                   //   PASSENGER  TEMP CONTROL/DISPLAY SECTION   << ---------------------------
        width: parent.width * 1/8 - 30
        height: parent.height * 2/2 -20
        anchors {
            right: musicVolume.left
            rightMargin: 80
            verticalCenter: carControlIcon.verticalCenter
            bottomMargin: parent.height/10
        }

        Loader{
            id: passengersControlLoader
            anchors.fill: parent
            source: "StandByMode.qml"
        }

    }


    signal buttonClicked(int number)
}
