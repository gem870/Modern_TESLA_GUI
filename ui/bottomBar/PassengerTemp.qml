import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: false
    width: 640
    height: 480
Rectangle {
    id: tempControl
    color: "blue"
    width: 200
    height: 60
    visible: false
    x: 50
    radius: 30
    anchors {
        bottom: parent.bottom
        bottomMargin: 20
    }
}
}
