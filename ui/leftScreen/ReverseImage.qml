import QtQuick 2.15

Image {
    source: "qrc:/ui/leftScreen/asset/teslap.png"
    anchors.fill: parent
    fillMode: Image.PreserveAspectFit

    Item {
        width: parent.width
        height: 30
        anchors {
            bottom: parent.bottom
            bottomMargin: 120
        }

        Image {
            width: 25
            height: 25
            source: imageSource
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
                leftMargin: 80
            }



            Timer {
                interval: 500
                running: true
                repeat: true

                onTriggered: {
                    // Switch between two images
                    imageSource = (imageSource === "qrc:/ui/leftScreen/asset/left-arrow.png") ? "qrc:/ui/leftScreen/asset/left-arrow (1).png" : "qrc:/ui/leftScreen/asset/left-arrow.png";
                }
            }
        }

        Image {
            width: 30
            height: 30
            source: imageSource2

            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
                rightMargin: 80
            }



            Timer {
                interval: 500
                running: true
                repeat: true

                onTriggered: {
                    // Switch between two images
                    imageSource2 = (imageSource2 === "qrc:/ui/leftScreen/asset/right-arrow (1).png") ? "qrc:/ui/leftScreen/asset/right-arrow.png" : "qrc:/ui/leftScreen/asset/right-arrow (1).png";
                }
            }
        }

    }



    property string imageSource: "qrc:/ui/leftScreen/asset/left-arrow.png"
     property string imageSource2: "qrc:/ui/leftScreen/asset/right-arrow (1).png"
}
