import QtQuick 2.15
import QtQuick.Window 2.15
import "ui/bottomBar"
import "ui/rightScreen"
import "ui/leftScreen"

Window {
    width: 1320
    height: 760
    visible: true
    title: qsTr("TESLA GUI")


RightScreen {
    id: rightScreen
}

LeftScrren {
    id: leftScreen
}

BottomBar{
    id: bottomBar
}


}
