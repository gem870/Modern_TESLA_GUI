import QtQuick 2.15
import QtMultimedia 5.4

 Rectangle {
        id : cameraUI

        anchors.fill: parent
        radius: 10


        color: "black"
        state: "PhotoCapture"

        PropertyAnimation {
            id: opacityAnimation
            target: cameraUI
            property: "opacity"
            from: 0
            to: 1
            duration: 500
        }

        Component.onCompleted: opacityAnimation.start()

        Image {            //   cancle icon
            width: 15
            height: 15
            source: "qrc:/ui/rightScreen/asset/x.png"

            anchors {
                top: parent.top
                left: parent.left
                leftMargin: 10
                topMargin: 10
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    stak.visible = false
                    stackViewCamera.source = "Emty.qml"
                }
            }
        }

        states: [
            State {
                name: "PhotoCapture"
                StateChangeScript {
                    script: {
                        camera.captureMode = Camera.CaptureStillImage
                        camera.start()
                    }
                }
            },
            State {
                name: "PhotoPreview"
            },
            State {
                name: "VideoCapture"
                StateChangeScript {
                    script: {
                        camera.captureMode = Camera.CaptureVideo
                        camera.start()
                    }
                }
            },
            State {
                name: "VideoPreview"
                StateChangeScript {
                    script: {
                        camera.stop()
                    }
                }
            }
        ]

        Camera {
            id: camera
            captureMode: Camera.CaptureStillImage

            imageCapture {
                onImageCaptured: {
                    photoPreview.source = preview
                    stillControls.previewAvailable = true
                    cameraUI.state = "PhotoPreview"
                }
            }

            videoRecorder {
                 resolution: "640x480"
                 frameRate: 30
            }
        }


        VideoOutput {
            id: viewfinder
            visible: cameraUI.state == "PhotoCapture" || cameraUI.state == "VideoCapture"
            anchors {
                margins: 5
            }
            height: parent.height
            width: parent.width


            source: camera
            autoOrientation: true
        }

        Item {
            width: parent.width
            height: 30
            anchors {
                top: parent.top
                topMargin: 40
            }

            Image {
                width: 25
                height: 25
                source: imageSource
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    leftMargin: 30
                }



                Timer {
                    interval: 500
                    running: true
                    repeat: true

                    onTriggered: {
                        // Switch between two images
                        imageSource = (imageSource === "qrc:/ui/leftScreen/asset/left-arrow (2).png") ? "qrc:/ui/leftScreen/asset/left-arrow (1).png" : "qrc:/ui/leftScreen/asset/left-arrow (2).png";
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
                    rightMargin: 30
                }



                Timer {
                    interval: 500
                    running: true
                    repeat: true

                    onTriggered: {
                        // Switch between two images
                        imageSource2 = (imageSource2 === "qrc:/ui/leftScreen/asset/right-arrow (2).png") ? "qrc:/ui/leftScreen/asset/right-arrow.png" : "qrc:/ui/leftScreen/asset/right-arrow (2).png";
                    }
                }
            }
        }

        property string imageSource: "qrc:/ui/leftScreen/asset/left-arrow (2).png"
         property string imageSource2: "qrc:/ui/leftScreen/asset/right-arrow (2).png"
    }



