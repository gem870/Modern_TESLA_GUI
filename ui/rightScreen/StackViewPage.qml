import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: stak
    width: 800
    height: 440
    visible: false
    anchors {
        horizontalCenter: parent.horizontalCenter
        top: parent.top
        topMargin: parent.height / 7
    }

    Loader{
        id: stackViewCamera
        anchors.fill: parent
   }

    Connections {
        target: leftScreen

        onButtonClicked: {
            if(image === 20){
                stak.visible = true
                stackViewCamera.source ="ReviseCamera.qml"
            } else if(image === 30){
                stak.visible = false
                stackViewCamera.source = "Emty.qml"
            } else            if(image === 40){
                stak.visible = false
                stackViewCamera.source = "Emty.qml"
            } else if(image === 51){
                stak.visible = false
                stackViewCamera.source = "Emty.qml"
            }
        }
    }

    Connections {
        target: sideBar

        onButtonClicked: {
            if(carImage === 1){
                stak.visible = true
                stackViewCamera.source ="ReviseCamera.qml"
            } else if(carImage === 2){
                stak.visible = false
                stackViewCamera.source = "Emty.qml"
            }
        }
    }

}
