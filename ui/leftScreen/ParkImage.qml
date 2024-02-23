import QtQuick 2.15

Image {
    source: "qrc:/ui/leftScreen/asset/tesla6-removebg-preview (1).png"
    fillMode: Image.PreserveAspectFit
    anchors {
        top: parent.top
        topMargin: 40
        left: parent.left
        leftMargin: 30
        right: parent.right
        bottom: parent.bottom

    }


    Rectangle {
        id: frunk
        height: 100
        width: 1
        color: "gray"
        x: 80
        y: 140
    }

    Text {
        text: qsTr("Frunk\nOpen")
        color: "gray"
        anchors {
            right: frunk.left
            top: frunk.top
        }
    }

    Rectangle {
        id: trunk
        height: 100
        width: 1
        color: "gray"
        x: 320
        y: 80
    }

    Text {
        text: qsTr("Trunk\nOpen")
        color: "gray"
        anchors {
            left: trunk.right
            top: trunk.top
        }
    }

    Image {
        id: lockIcon
        source: (m_connect.carLocked?  "qrc:/ui/leftScreen/asset/padlock.png" : "qrc:/ui/leftScreen/asset/open-padlock-silhouette.png")
        height: 20
        width: 20
        x: 200
        y: 60

        MouseArea {
            anchors.fill: parent
            onClicked: {
                m_connect.setCarLocked(!m_connect.carLocked)
            }
        }
    }



    Rectangle {
        height: 80
        width: 1
        color: "gray"

        anchors {
            top: lockIcon.bottom
            horizontalCenter: lockIcon.horizontalCenter
        }
    }

    Image {
        id: charger
        source: "qrc:/ui/leftScreen/asset/bolt.png"
        height: 30
        width: 30
        x: 330
        y: 170

        MouseArea {
            id: mouseCharger
            anchors.fill: parent
            onClicked: {
                charger.source = "qrc:/ui/leftScreen/asset/bolt (1).png"
                chargerTimer.start()
            }
        }
    }

    Timer {
        id: chargerTimer
        interval: 1000
        running: false
        repeat: true

        onTriggered: {
            charger.visible = !charger.visible
            m_batteryLevel.batteryLevel++
            if(m_batteryLevel.batteryLevel === 30){
                chargerTimer.stop()
                charger.visible = true
                charger.source = "qrc:/ui/leftScreen/asset/bolt.png"
            }
            opacityAnimationForCharger.start()
        }
    }

    PropertyAnimation {
        id: opacityAnimationForCharger
        target: charger
        property: "opacity"
        from: 0
        to: 1
        duration: 1000
    }

   Rectangle {
       id: batteryTex
       height: 35
       width: 150
       color: "black"
       radius: 20
       visible: false

       anchors {
           bottom: parent.bottom
           bottomMargin: 20
           horizontalCenter: parent.horizontalCenter
       }

       Text {
           id: name
           text: if(mouseCharger.containsPress){
                     batteryTex.visible = true
                     opacityAnimationBatteryTex.start()
                     b_viewTimer.start()
                     return "Battery charging!"
                 } else if(m_batteryLevel.batteryLevel === 30) {
                     batteryTex.visible = true
                     opacityAnimationBatteryTex.start()
                     b_viewTimer.start()
                     return "Battery full!"
                 }
           color: "white"
           font.bold: true
           anchors.centerIn: parent
       }
   }

   Timer {
       id: b_viewTimer
       interval: 5000
       running: false
       repeat: false

       onTriggered: {
           batteryTex.visible = false
       }
   }

   PropertyAnimation {
       id: opacityAnimationBatteryTex
       target: batteryTex
       property: "opacity"
       from: 0
       to: 1
       duration: 1000
   }


   property string lockImage: "qrc:/ui/leftScreen/asset/padlock.png"
}
