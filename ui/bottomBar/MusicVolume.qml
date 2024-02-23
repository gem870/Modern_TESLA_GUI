import QtQuick 2.15

Item {
    id: musicVolume
    width: parent.width * 1/8 -55
    height: parent.height * 2/2 -25
    anchors {
        right: parent.right
        rightMargin: 30
        verticalCenter: carControlIcon.verticalCenter
    }

//    Connections{
//        target: m_musicVolume.musicVolume
//        function onmusicVolomeChanged(){
//            console.log("volume")
//        }
//    }

    property string fontcolor: "#6d6d6e"
    property string bgd_color: "black"
    property string onclickColor: "#4c4c4d"
    property string buttonColor: "#49495c"

    Item {
        id: leftButton

        height: parent.height /3
        width: parent.width /8
        anchors {
            verticalCenter: parent.verticalCenter
        }

        MouseArea {
            id: mouse1
            anchors.fill: parent
            onClicked:{
                m_musicVolume.musicVolume--
                vl_num.visible = true
                audioIcon.visible = false
                volumeTimer.stop()
                volumeTimer.start()
            }
        }

        Text {
            id: decreamentIcon
            text: "<"
            anchors.centerIn: parent
            font.pixelSize: parent.height + 5
            color: "gray"
        }
    }

    Rectangle {
        id: displayVolune
        color: Qt.rgba(0,0,0,0)
        height: 45
        width: 45
        radius: 20
        anchors {
            centerIn: parent
            topMargin: 10
            bottomMargin: 10
        }

        Image {
            id: audioIcon
            anchors.fill: parent
            anchors{
                margins: 10
            }

            source: {
                if(m_musicVolume.musicVolume <= 1)
                    return "qrc:/ui/asset/vlmoooo-removebg-preview.png"
                else if(m_musicVolume.musicVolume <= 4)
                    return "qrc:/ui/asset/vlm00-removebg-preview.png"
                else if(m_musicVolume.musicVolume <= 8)
                    return "qrc:/ui/asset/vlm2-removebg-preview.png"
                else if(m_musicVolume.musicVolume <= 10)
                    return "qrc:/ui/asset/vlm3-removebg-preview.png"
            }
        }


    }

    PropertyAnimation {
        id: opacityAnimationForVlmIcon
        target: audioIcon
        property: "opacity"
        from: 0
        to: 1
        duration: 300
    }

    Timer {
        id: volumeTimer
        interval: 2000
        running: true
        repeat: false

        onTriggered: {
            vl_num.visible = false
            audioIcon.visible = true
            opacityAnimationForVlmIcon.start()
        }
    }



    Text {
        id: vl_num
        visible: false
        color: "lightgray"
        text: m_musicVolume.musicVolume
        font.pixelSize: 25
        font.bold: true
        anchors.centerIn: parent
        font {
            family: "Arial" // Set the font family
        }
       // color: fontcolor
    }



    Item {
        id: rightButton
        height: parent.height /3
        width: parent.width /8
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
        }

        MouseArea{
            id: mouse2
            anchors.fill: parent
            onClicked: {
                m_musicVolume.musicVolume++
                vl_num.visible = true
                audioIcon.visible = false
                volumeTimer.stop()
                volumeTimer.start()
            }
        }

        Text {
            id: increamentIcon
            text: ">"
            anchors.centerIn: parent
            font.pixelSize: parent.height + 5
            color: "gray"
        }
    }
}
