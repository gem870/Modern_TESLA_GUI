import QtQuick 2.15
import QtQuick.Controls 2.15
import QtMultimedia 5.15

Item {
    id: audioPlay
    anchors.fill: parent

    property int currentIndex: 0
    property bool isRepeating: false
    property string buttonColor: Qt.rgba(0,0,0,0)
    property string borderColor: "#f0f2f5"
    property string ppBorderColor: "#c4eb7c"
    property string nextBorderColor: "#7cebe0"

    Rectangle{
        id: topPlayer

        color: buttonColor //"#adadad"
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: playList.top
            leftMargin: 5
            rightMargin: 5
        }
        radius: 5
        border.width: 2
        border.color: "#d2d2d4"



        Rectangle {
            id: musicImage

            color: Qt.rgba(0,0,0,0,)
            width: parent.width / 5
            height: parent.height / 1.2
            radius: 10
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
                leftMargin: 10
            }
            border.color: borderColor

            Image {
                id: imageMe
                source: "qrc:/ui/asset/headsets-1971383_1280.jpg"
                anchors {
                    fill: parent
                    topMargin: 2
                    bottomMargin: 2
                }
                fillMode: Image.PreserveAspectFit
            }

        }

        Text {
            id: musicName
            text: "  Audio Player"
            font.pixelSize: 18
            font {
                family: "Arial" // Set the font family
                bold: true
            }
            leftPadding: 10
            topPadding: 20
            anchors {
                left: musicImage.right
                verticalCenter: musicImage.verticalCenter
            }
        }

        Slider {
            id: progressBar

            width: parent.width
            from: 0
            to: mediaPlayer.duration
            value: mediaPlayer.position
            anchors {
                left: musicImage.right
                right: parent.right
                top: parent.top
                topMargin: 15
            }

            handle: Rectangle{}

            onValueChanged: {
                mediaPlayer.seek(progressBar.value);
            }
        }

        Item {
            id: audioControl
            height: 60
            width: progressBar.width / 4.5
            anchors {
                top: progressBar.bottom
                right: repeatButtonIcon.left
                rightMargin: 30
                topMargin: 5
            }

            Image {
                id: previousButtonIcon

                source: "qrc:/ui/asset/pngwing.com (3).png"
                height: backMouse.containsPress ? 25 : 30
                width: backMouse.containsPress ? 25 : 30
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                }

                MouseArea{
                    id: backMouse
                    anchors.fill:parent
                    onClicked: {
                        currentIndex = (currentIndex - 1 + audioModel.count) % audioModel.count;
                        mediaPlayer.source = audioModel.get(currentIndex).source;
                        mediaPlayer.play();
                        musicName.text = audioModel.get(currentIndex).name;
                    }
                }

            }

            Image {
                id: pauseButtonIcon

                source: mediaPlayer.playbackState === MediaPlayer.PlayingState ? "qrc:/ui/asset/pngwing.com (2).png" : "qrc:/ui/asset/pngwing.com (5).png"
                height: 40
                width: 40
                anchors {
                    centerIn: parent
                }

                MouseArea{
                    id: pauseMouse

                    anchors.fill:parent
                    //  text: mediaPlayer.playbackState === MediaPlayer.PlayingState ? "Pause" : "Play"
                    onClicked: {
                        buttonClicked(1)
                        if (mediaPlayer.playbackState === MediaPlayer.PlayingState) {
                            mediaPlayer.pause();
                        } else {
                            mediaPlayer.play();
                            musicName.text = audioModel.get(currentIndex).name;
                        }
                    }
                }

            }

            Connections{
                target: audioPlay

                onButtonClicked: {
                    if(aud === 1){
                        buttonClicked(2)
                    }
                }
            }

            Image {
                id: nextButtonIcon

                source: "qrc:/ui/asset/pngwing.com (4).png"
                height: forwardMouse.containsPress ? 25 : 30
                width: forwardMouse.containsPress ? 25 : 30
                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }

                MouseArea{
                    id: forwardMouse

                    anchors.fill:parent
                    onClicked: {
                        currentIndex = (currentIndex + 1) % audioModel.count;
                        mediaPlayer.source = audioModel.get(currentIndex).source;
                        mediaPlayer.play();
                        musicName.text = audioModel.get(currentIndex).name;
                    }
                }

            }


        }

        Image {
            id: repeatButtonIcon

            source: isRepeating? "qrc:/ui/asset/repeat-1_1.png" : "qrc:/ui/asset/Bootstrap-Bootstrap-Bootstrap-repeat.512.png"
            height: 25
            width: 25
            anchors {
                right: volumeSec.left
                verticalCenter: volumeSec.verticalCenter
                rightMargin: 30
            }


            MouseArea{
                id: repaetMouse
                anchors.fill:parent
                onClicked: {
                    isRepeating = !isRepeating;
                }
            }

        }

        Rectangle {
            id: volumeSec
            height: 30
            width: 140
            radius: 5
            color: Qt.rgba(0,0,0,0)
            border.color: borderColor
            anchors {
                bottom: parent.bottom
                right: parent.right
                rightMargin: 20
                bottomMargin: 10
            }

            Image {
                id: volumeIcon

                source: volumeSlider.value === 0 ? "qrc:/ui/asset/volume0.png" : "qrc:/ui/asset/volume3.png"
                height: 20
                width: 20
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    leftMargin: 5
                }


            }

            Slider {
                id: volumeSlider

                anchors {
                    right: parent.right
                    left: volumeIcon.right
                    verticalCenter: parent.verticalCenter
                    rightMargin: 5
                }

                handle: Rectangle {}
                width: parent.width / 9
                from: 0
                to: 1
                value: mediaPlayer.volume

                onValueChanged: {
                    mediaPlayer.volume = volumeSlider.value;
                }
            }

        }

    }

    Item {
        id: playList
        anchors {
            bottom: parent.bottom
        }

        width: parent.width
        height: parent.height / 1.2

        ListModel {
            id: audioModel
            ListElement { source: "qrc:/music/Tim_Godfrey_-_Shine_Ft_Prinx_Emmanuel_CeeNaija.com_.mp3"; name: "Tim Godfrey"; image: "qrc:/ui/asset/dvd-152917_1280.png" }
            ListElement { source: "qrc:/music/Prinx_Emmanuel_-_Oh_Mon_me_Oh_my_soul_bless_the_eternal_God__CeeNaija.com_.mp3"; name: "Prinx Emmanuel"; image: "qrc:/music/images/prince-Emmanuel2.png" }
            ListElement { source: "qrc:/music/Prinx_Emmanuel_-_Oh_The_Day_CeeNaija.com_.mp3"; name: "Prinx Emmanuel"; image: "qrc:/music/images/prince-Emmanuel4.png" }
            ListElement { source: "qrc:/music/Prinx_Emmanuel_-_Pariwo_CeeNaija.com_.mp3"; name: "Prinx Emmanuel"; image: "qrc:/music/images/prince-Emmanuel7.png" }
            ListElement { source: "qrc:/music/Prinx_Emmanuel_-_Sapacom_CeeNaija.com_.mp3"; name: "Prinx Emmanuel"; image: "qrc:/music/images/prince-Emmanuel7.png" }
            ListElement { source: "qrc:/music/Prinx_Emmanuel_-_Who_Goes_That_Man_CeeNaija.com_.mp3"; name: "Prinx Emmanuel"; image: "qrc:/music/images/prine-Emmanuel5.png" }
            ListElement { source: "qrc:/music/Prinx-Emmanuel-feat-Pastor-Iren-Emmanuel-Bo-ta-joor-(CeeNaija.com).mp3"; name: "Prinx Emmanuel"; image: "qrc:/music/images/prinx-emmanuel1.png" }
            ListElement { source: "qrc:/music/Moses_Bliss_-_Daddy_Wey_Dey_Pamper_Gbedu_Version__CeeNaija.com_.mp3"; name: "Moses Bliss"; image: "qrc:/ui/asset/dvd-152917_1280.png" }
            ListElement { source: "qrc:/music/Tim_Godfrey_-_Shine_Ft_Prinx_Emmanuel_CeeNaija.com_.mp3"; name: "Tim Godfrey"; image: "qrc:/ui/asset/dvd-152917_1280.png" }
            ListElement { source: "qrc:/music/Prinx_Emmanuel_-_Oh_Mon_me_Oh_my_soul_bless_the_eternal_God__CeeNaija.com_.mp3"; name: "Prinx Emmanuel"; image: "qrc:/music/images/prince-Emmanuel2.png" }
            ListElement { source: "qrc:/music/Prinx_Emmanuel_-_Oh_The_Day_CeeNaija.com_.mp3"; name: "Prinx Emmanuel"; image: "qrc:/music/images/prince-Emmanuel4.png" }
            ListElement { source: "qrc:/music/Prinx_Emmanuel_-_Pariwo_CeeNaija.com_.mp3"; name: "Prinx Emmanuel"; image: "qrc:/music/images/prince-Emmanuel7.png" }
            ListElement { source: "qrc:/music/Prinx_Emmanuel_-_Sapacom_CeeNaija.com_.mp3"; name: "Prinx Emmanuel"; image: "qrc:/music/images/prince-Emmanuel7.png" }
            ListElement { source: "qrc:/music/Prinx_Emmanuel_-_Who_Goes_That_Man_CeeNaija.com_.mp3"; name: "Prinx Emmanuel"; image: "qrc:/music/images/prine-Emmanuel5.png" }
            ListElement { source: "qrc:/music/Prinx-Emmanuel-feat-Pastor-Iren-Emmanuel-Bo-ta-joor-(CeeNaija.com).mp3"; name: "Prinx Emmanuel"; image: "qrc:/music/images/prinx-emmanuel1.png" }
            ListElement { source: "qrc:/music/Moses_Bliss_-_Daddy_Wey_Dey_Pamper_Gbedu_Version__CeeNaija.com_.mp3"; name: "Moses Bliss"; image: "qrc:/ui/asset/dvd-152917_1280.png" }
            ListElement { source: "qrc:/music/Tim_Godfrey_-_Shine_Ft_Prinx_Emmanuel_CeeNaija.com_.mp3"; name: "Tim Godfrey"; image: "qrc:/ui/asset/dvd-152917_1280.png" }
            ListElement { source: "qrc:/music/Prinx_Emmanuel_-_Oh_Mon_me_Oh_my_soul_bless_the_eternal_God__CeeNaija.com_.mp3"; name: "Prinx Emmanuel"; image: "qrc:/music/images/prince-Emmanuel2.png" }
            ListElement { source: "qrc:/music/Prinx_Emmanuel_-_Oh_The_Day_CeeNaija.com_.mp3"; name: "Prinx Emmanuel"; image: "qrc:/music/images/prince-Emmanuel4.png" }
            ListElement { source: "qrc:/music/Prinx_Emmanuel_-_Pariwo_CeeNaija.com_.mp3"; name: "Prinx Emmanuel"; image: "qrc:/music/images/prince-Emmanuel7.png" }
            ListElement { source: "qrc:/music/Prinx_Emmanuel_-_Sapacom_CeeNaija.com_.mp3"; name: "Prinx Emmanuel"; image: "qrc:/music/images/prince-Emmanuel7.png" }
            ListElement { source: "qrc:/music/Prinx_Emmanuel_-_Who_Goes_That_Man_CeeNaija.com_.mp3"; name: "Prinx Emmanuel"; image: "qrc:/music/images/prine-Emmanuel5.png" }
            ListElement { source: "qrc:/music/Prinx-Emmanuel-feat-Pastor-Iren-Emmanuel-Bo-ta-joor-(CeeNaija.com).mp3"; name: "Prinx Emmanuel"; image: "qrc:/music/images/prinx-emmanuel1.png" }
            ListElement { source: "qrc:/music/Moses_Bliss_-_Daddy_Wey_Dey_Pamper_Gbedu_Version__CeeNaija.com_.mp3"; name: "Moses Bliss"; image: "qrc:/ui/asset/dvd-152917_1280.png" }

        }

        Component{
            id: listAudio

            Rectangle{
                height: parent.width * 1/5
                width: parent.width * 1/5
                color: "#dbdbdb"
                radius: 10

                Image {
                    id: imageName
                    source: model.image
                    anchors.centerIn: parent
                    height: parent.height / 1.3
                    width: parent.width / 1.3
                }

                MouseArea {
                    id: mouseRec
                    anchors.fill: parent
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            currentIndex = index;
                            mediaPlayer.source = audioModel.get(currentIndex).source;
                            mediaPlayer.play();
                            musicName.text = audioModel.get(currentIndex).name;
                        }
                    }
                }

                Text {
                    id: musicName
                    text: model.name
                    font.pixelSize: parent.width/9
                    color: "#6f7575"
                    anchors {
                        bottom: parent.bottom
                        horizontalCenter: imageName.horizontalCenter
                        topMargin: 15
                    }
                    font {
                        family: "Arial" // Set the font family
                        bold: true
                    }
                }
            }
        }


        GridView{
            id: viewItem

            cellHeight: parent.width / 4.5
            cellWidth: parent.width / 4.5
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                leftMargin: parent.width / 12

            }

            model: audioModel
            delegate: listAudio
            clip: true
        }

        MediaPlayer {
            id: mediaPlayer
            source: audioModel.get(currentIndex).source
            onStatusChanged: {
                if (mediaPlayer.status === MediaPlayer.EndOfMedia) {
                    // Automatically play the next song
                    if (isRepeating) {
                        mediaPlayer.play();
                    } else {
                        currentIndex = (currentIndex + 1) % audioModel.count;
                        mediaPlayer.source = audioModel.get(currentIndex).source;
                        musicName.text = audioModel.get(currentIndex).name;
                        mediaPlayer.play();
                    }
                }
            }
        }


        Component.onCompleted: {
            // Set the initial position to be at the top
            mediaPlayer.source = audioModel.get(currentIndex).source;
        }
    }

    signal buttonClicked(int aud)
}
