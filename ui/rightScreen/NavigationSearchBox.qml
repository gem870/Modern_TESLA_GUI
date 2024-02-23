import QtQuick 2.15

Rectangle{
    id: navigationSearchBox

    width: parent.width/3 + 10
    height: parent.height/18
    color: "#f5f6fc"
    radius: 5
    anchors {
        left: lockIcon.left
        top: lockIcon.bottom
        topMargin:10
    }

}
