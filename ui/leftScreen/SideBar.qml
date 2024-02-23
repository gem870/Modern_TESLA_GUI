import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: sideBar
    height: parent.height - 10
    width: parent.width /10
    anchors {
        left: parent.left
        top: parent.top
        topMargin: 20
        bottomMargin: 20
    }
    signal buttonClicked(int carImage)

    Item {
        id: sideBarScreen
        width: parent.width
        height: parent.height

        Behavior on x {
            NumberAnimation {
                duration: 1000
            }
        }

        MouseArea {
            id: dragArea
            anchors.fill: parent
            drag.target: parent
            drag.axis: Drag.XAxis
            drag.minimumX: -parent.width // Adjust the minimum value
            drag.maximumX: 0  // Adjust the maximum value

            onReleased: {
                if (dragArea.drag.active) {
                    if (sideBarScreen.x > -parent.width / 1) {
                        sideBarScreen.x = 0;
                    } else {
                        sideBarScreen.x = -parent.width / 1;
                    }
                }
            }
        }



        Connections {
            target: leftScreen

            onButtonClicked: {
                if(image === 6) {
                    if (sideBarScreen.x === 0) {
                        sideBarScreen.x = -sideBarScreen.width;
                    } else {
                        sideBarScreen.x = 0;
                    }
                }
            }
        }




        Image {
            id: sideBarIcon1
            source: "qrc:/ui/leftScreen/asset/park-removebg-preview.png"
            height: parent.height / 10 - 35
            width: parent.width/1.353
            anchors {
                right: parent.right
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    buttonClicked(1)
                }
            }
        }

        Image {
            id: sideBarIcon2
            source: "qrc:/ui/leftScreen/asset/headlamp-removebg-preview.png"
            height: parent.height / 10 - 35
            width: parent.width/1.353
            anchors {
                right: parent.right
                top: sideBarIcon1.bottom
                topMargin: 5
            }
        }

        Image {
            id: sideBarIcon3
            source: "qrc:/ui/leftScreen/asset/headlamp-removebg-preview (1).png"
            height: parent.height / 10 - 40
            width: parent.width/1.353
            anchors {
                right: parent.right
                top: sideBarIcon2.bottom
                topMargin: 5
            }



            MouseArea {
                anchors.fill: parent
                onClicked: {
                    buttonClicked(2)
                }
            }
        }

        Image {
            id: sideBarIcon4
            source: "qrc:/ui/leftScreen/asset/parkinglight.png"
            height: parent.height / 10 - 40
            width: parent.width/1.353
            anchors {
                right: parent.right
                top: sideBarIcon3.bottom
                topMargin: 5
            }
        }

        Image {
            id: sideBarIcon5
            source: "qrc:/ui/leftScreen/asset/frontlamp.png"
            height: parent.height / 10 - 40
            width: parent.width/1.353
            anchors {
                right: parent.right
                top: sideBarIcon4.bottom
                topMargin: 5
            }
        }

        Image {
            id: sideBarIcon6
            source: "qrc:/ui/leftScreen/asset/front2.png"
            height: parent.height / 10 - 45
            width: parent.width/1.353
            anchors {
                right: parent.right
                top: sideBarIcon5.bottom
                topMargin: 10
            }
        }

        Image {
            id: sideBarIcon7
            source: "qrc:/ui/leftScreen/asset/part.png"
            height: parent.height / 10 - 35
            width: parent.width/1.1
            anchors {
                right: parent.right
                top: sideBarIcon6.bottom
                topMargin: 10
            }
        }

        Image {
            id: sideBarIcon8
            source: "qrc:/ui/leftScreen/asset/Brake.png"
            height: parent.height / 10 - 40
            width: parent.width/1.4
            anchors {
                right: parent.right
                top: sideBarIcon7.bottom
                topMargin: 70
            }
        }

        Image {
            id: sideBarIcon9
            source: "qrc:/ui/leftScreen/asset/abs-removebg-preview.png"
            height: parent.height / 10 - 40
            width: parent.width/1.6
            anchors {
                right: parent.right
                top: sideBarIcon8.bottom
                topMargin: 10
            }
        }

        Image {
            id: sideBarIcon10
            source: "qrc:/ui/leftScreen/asset/tire-removebg-preview.png"
            height: parent.height / 10 - 40
            width: parent.width/1.6
            anchors {
                right: parent.right
                top: sideBarIcon9.bottom
                topMargin: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    buttonClicked(3)
                }
            }
        }

        Image {
            id: sideBarIcon11
            source: "qrc:/ui/leftScreen/asset/sitBelt1-removebg-preview.png"
            height: parent.height / 10 - 40
            width: parent.width/1.2
            anchors {
                right: parent.right
                top: sideBarIcon10.bottom
                topMargin: 15
            }
        }

        Image {
            id: sideBarIcon12
            source: "qrc:/ui/leftScreen/asset/airbag.png"
            height: parent.height / 10 - 40
            width: parent.width/1.2
            anchors {
                right: parent.right
                top: sideBarIcon11.bottom
                topMargin: 15
            }
        }






        //    Button {
        //        Image {
        //            id: name
        //            source: "qrc:/ui/asset/updownIcon.png"
        //            anchors.fill: parent
        //        }
        //        anchors {
        //            right: parent.right
        //            top: parent.top
        //            topMargin: 20
        //            rightMargin: 20
        //        }
        //        width: parent.width/35
        //        height: parent.height/30


        //        onClicked: {
        //            if (sideBarScreen.x === parent.height / 1.1) {
        //                sideBarScreen.x = parent.height - sideBarScreen.height;
        //            } else {
        //                sideBarScreen.x = parent.height / 1.1;
        //            }
        //        }
        //    }
    }
}

