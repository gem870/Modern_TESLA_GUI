import QtQuick 2.15

Item {
id: mapRouter

height: parent.height/3
width: parent.width/15
y: parent.height/5
anchors {
    right:parent.right
}

property string pressed: "#e6ebeb"
property string notPressed: "#f5f6fc"

Rectangle{
    id: rout

    height: parent.height * 2/10 -10
    width: parent.width * 2/3 - 10
    color: routmous.containsPress? pressed : notPressed
    radius: 10
    anchors{
        top: parent.top
        topMargin: 15
    }

    Image {
        id: routingIcon
        height: parent.height/2
        width: parent.width/2
        anchors.centerIn: parent
        source: "qrc:/ui/asset/routeIIcon.png"
    }


    MouseArea{
        id: routmous
        anchors.fill: parent
        onClicked: console.log("Map is routing")
    }
}

Rectangle{
    id: rout1

    height: parent.height * 2/10 -10 -15
    width: parent.width * 2/3 - 10
    color: routmous1.containsPress? pressed : notPressed
    radius: 10
    anchors{
        top: rout.bottom
        topMargin: 15
    }

    Image {
        id: optionIcon
        height: parent.height/2
        width: parent.width/2
        anchors.centerIn: parent
        source: "qrc:/ui/asset/option.png"
    }

    MouseArea{
        id: routmous1
        anchors.fill: parent
        onClicked: console.log("Map is routing")
    }
}

Rectangle{
    id: rout2

    height: parent.height * 2/10 -10
    width: parent.width * 2/3 - 10
    color: routmous2.containsPress? pressed : notPressed
    radius: 10
    anchors{
        top: rout1.bottom
        topMargin: 15
    }

    Image {
        id: zoomIn
        height: parent.height/2
        width: parent.width/2
        anchors.centerIn: parent
        source: "qrc:/ui/asset/zoom-in.png"
    }

    MouseArea{
        id: routmous2
        anchors.fill: parent
        onClicked: m_zoomMap.zoomMap++
    }
}

Rectangle{
    id: rout3

    height: parent.height * 2/10 -10
    width: parent.width * 2/3 - 10
    color: routmous3.containsPress? pressed : notPressed
    radius: 10
    anchors{
        top: rout2.bottom
        topMargin: 15
    }

    Image {
        id: zoomOut
        height: parent.height/2
        width: parent.width/2
        anchors.centerIn: parent
        source: "qrc:/ui/asset/magnifying-glass.png"
    }

    MouseArea{
        id: routmous3
        anchors.fill: parent
        onClicked: m_zoomMap.zoomMap--
    }
}

}
