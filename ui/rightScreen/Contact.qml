import QtQuick 2.15
import QtQuick.Window 2.15

Item {
    anchors.fill: parent




    Rectangle{
        id: contactList

        height: parent.height
        width: parent.width * 1/3
        color: "#c9c9c7"
        Text {
            id: contTex
            text: qsTr("Contacts")
            font.pixelSize: 25
            anchors {
                left: parent.left
                top: parent.top
                topMargin: 10
            }
        }


        Rectangle{
            id: contactSearchBox

            width: parent.width/1.03
            height: parent.height/18
            color: "#f5f6fc"
            radius: 5
            anchors {
                left: contTex.left
                top: contTex.bottom
                topMargin:10
            }

            Image {
                id: searchIcon
                anchors{
                    left: parent.left
                    leftMargin: parent.width / 8
                    verticalCenter: parent.verticalCenter
                }
                height: parent.height * .45
                fillMode: Image.PreserveAspectFit
                source: "qrc:/ui/rightScreen/asset/icons8-search-30.png"
            }

            Text {
                id: navPlaceholder
                text: "Search"
                visible: navTextInput.text == ""
                color: "#818182"
                font.pixelSize:  parent.width/20
                anchors{
                    verticalCenter: parent.verticalCenter
                    left: searchIcon.right
                    leftMargin: parent.width / 10
                }
            }

            TextInput{
                id: navTextInput

                font.pixelSize: parent.width/20
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                    left: searchIcon.left
                    leftMargin: parent.width / 12
                    rightMargin: 10
                }
                clip: true

            }

        }

        ListModel{
            id: contacts
            ListElement{ image: "qrc:/ui/rightScreen/asset/—Pngtree—user avatar login interface abstract_6796241.png"; name: "Mr. Bob"; contact: 23478994}
            ListElement{ image: "qrc:/ui/rightScreen/asset/—Pngtree—user avatar login interface abstract_6796241.png"; name: "Mr. Randy"; contact: 896543994}
            ListElement{ image: "qrc:/ui/rightScreen/asset/—Pngtree—user avatar login interface abstract_6796241.png"; name: "Mr. Victor"; contact: 89878994}
            ListElement{ image: "qrc:/ui/rightScreen/asset/—Pngtree—user avatar login interface abstract_6796241.png"; name: "Mr. Philip"; contact: 987678994}
            ListElement{ image: "qrc:/ui/rightScreen/asset/—Pngtree—user avatar login interface abstract_6796241.png"; name: "Mr. Samson"; contact: 898780976}
            ListElement{ image: "qrc:/ui/rightScreen/asset/—Pngtree—user avatar login interface abstract_6796241.png"; name: "Mr. Dave"; contact: 23878994}
            ListElement{ image: "qrc:/ui/rightScreen/asset/—Pngtree—user avatar login interface abstract_6796241.png"; name: "Mr. Bob dex"; contact: 41368994}
            ListElement{ image: "qrc:/ui/rightScreen/asset/—Pngtree—user avatar login interface abstract_6796241.png"; name: "Mr. Sandy"; contact: 000789794}
            ListElement{ image: "qrc:/ui/rightScreen/asset/—Pngtree—user avatar login interface abstract_6796241.png"; name: "Mr. Vic"; contact: 02034454765}
            ListElement{ image: "qrc:/ui/rightScreen/asset/—Pngtree—user avatar login interface abstract_6796241.png"; name: "Mr. Bob"; contact: 23478994}
            ListElement{ image: "qrc:/ui/rightScreen/asset/—Pngtree—user avatar login interface abstract_6796241.png"; name: "Mr. Randy"; contact: 896543994}
            ListElement{ image: "qrc:/ui/rightScreen/asset/—Pngtree—user avatar login interface abstract_6796241.png"; name: "Mr. Victor"; contact: 89878994}
            ListElement{ image: "qrc:/ui/rightScreen/asset/—Pngtree—user avatar login interface abstract_6796241.png"; name: "Mr. Philip"; contact: 987678994}
            ListElement{ image: "qrc:/ui/rightScreen/asset/—Pngtree—user avatar login interface abstract_6796241.png"; name: "Mr. Samson"; contact: 898780976}
            ListElement{ image: "qrc:/ui/rightScreen/asset/—Pngtree—user avatar login interface abstract_6796241.png"; name: "Mr. Dave"; contact: 23878994}
            ListElement{ image: "qrc:/ui/rightScreen/asset/—Pngtree—user avatar login interface abstract_6796241.png"; name: "Mr. Bob dex"; contact: 41368994}
            ListElement{ image: "qrc:/ui/rightScreen/asset/—Pngtree—user avatar login interface abstract_6796241.png"; name: "Mr. Sandy"; contact: 780097994}
            ListElement{ image: "qrc:/ui/rightScreen/asset/—Pngtree—user avatar login interface abstract_6796241.png"; name: "Mr. Vic"; contact: 02034454765}
        }

        Component{
            id: contact_D

            Item {
                height: 40
                anchors {
                    left: parent.left
                    right: parent.right
                    leftMargin: 5
                    rightMargin: 5
                    topMargin: 5
                    bottomMargin: 5
                }

                Image {
                    id: contIcon
                    source: model.image
                    height: 30
                    width: 30
                    anchors {
                        verticalCenter: parent.verticalCenter
                        leftMargin: 5
                    }
                }

                Text {
                    id: contName
                    text: model.name
                    font.pixelSize: 15
                    anchors {
                        left: contIcon.right
                        verticalCenter: contIcon.verticalCenter
                        leftMargin: 10
                    }
                }

                Text {
                    id: number
                    text: model.contact
                    font.pixelSize: 12
                    color: "gray"
                    anchors {
                        top: contName.bottom
                        left: contName.left
                    }
                }

                MouseArea {
                    id: contMouse
                    anchors.fill: parent
                    onClicked: {
                        listContact.currentIndex = index
                    }
                }
            }
        }

        ListView {
            id: listContact
            anchors {
                top: contactSearchBox.bottom
                topMargin: 5
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }
            clip: true

            model: contacts
            delegate: contact_D

            highlight: Rectangle {
                color: "lightgray"
                opacity: 1
                anchors {
                    left: parent.left
                    right: parent.right
                }
            }


        }





    }

    Rectangle{
        id: rightside
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            left: contactList.right
        }

        Rectangle {
            id: topIcon
            height: parent.height * 1/3 -20
            color: "#c9c9c7"
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }

            Image {
                id: userImage1
                source: "qrc:/ui/rightScreen/asset/—Pngtree—user avatar login interface abstract_6796241.png"
                height: 120
                width: 120
                anchors{
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top

                }
            }

            Image {
                id: userImage2
                source: "file:///C:/Users/LENOVO THINKPAD T470/Downloads/chat.png"
                height: 25
                width: 25
                anchors {
                    bottom: parent.bottom
                    bottomMargin: 20
                    left: parent.left
                    leftMargin: 80
                }
            }
            Text {
                id: tex1
                text: qsTr("Message")
                anchors {
                    horizontalCenter: userImage2.horizontalCenter
                    top: userImage2.bottom
                }
            }

            Image {
                id: userImage3
                source: "file:///C:/Users/LENOVO THINKPAD T470/Downloads/phone.png"
                height: 25
                width: 25
                anchors {
                    bottom: parent.bottom
                    bottomMargin: 20
                    horizontalCenter: parent.horizontalCenter
                }
            }
            Text {
                id: tex2
                text: qsTr("Call")
                anchors {
                    horizontalCenter: userImage3.horizontalCenter
                    top: userImage3.bottom
                }
            }

            Image {
                id: userImage4
                source: "file:///C:/Users/LENOVO THINKPAD T470/Downloads/calls.png"
                height: 25
                width: 25
                anchors {
                    bottom: parent.bottom
                    bottomMargin: 20
                    right: parent.right
                    rightMargin: 80
                }
            }
            Text {
                id: tex3
                text: qsTr("Call history")
                anchors {
                    horizontalCenter: userImage4.horizontalCenter
                    top: userImage4.bottom
                }
            }

        }

        Rectangle {
            anchors {
                top: topIcon.bottom
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }

            //            function printContact(name, contact){
            //                var mainName = name
            //                var mainContact = contact
            //                console.log(mainName,mainContact)

            //            }

            //            Connections {
            //                onButtonClicked: {
            //                    printContact(name, contact)
            //                }
            //            }

            //            Text {
            //                id: name
            //                text: qsTr("Name: " + listContact.currentIndex.name)
            //                font.pixelSize: 15
            //                anchors {
            //                    top: parent.top
            //                    left: parent.left
            //                    topMargin: 20
            //                    leftMargin: 20
            //                }
            //            }

            //            Text {
            //                id: number
            //                text: qsTr("Number: ")
            //                font.pixelSize: 15
            //                anchors {
            //                    top: name.bottom
            //                    left: parent.left
            //                    topMargin: 10
            //                    leftMargin: 20
            //                }
            //            }

        }

    }
}
