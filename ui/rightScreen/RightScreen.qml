import QtQuick 2.15
import QtLocation 5.15
import QtPositioning 5.15
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0


Rectangle{
    id: rightScreen

    width: parent.width * 2/3 +10
    anchors {
        top: parent.top
        bottom: bottomBar.top
        right: parent.right
    }
    clip: true

    Plugin {
             id: mapPlugin
             name: "osm" // "mapboxgl", "esri", ...
             // specify plugin parameters if necessary
             // PluginParameter {
             //     name:
             //     value:
             // }
         }

         Map {
             anchors.fill: parent
             plugin: mapPlugin
             center: QtPositioning.coordinate(59.91, 10.75) // Oslo
             zoomLevel: m_zoomMap.zoomMap
             activeMapType: Map.SatelliteMap

//             mapType: Map.SatelliteMap
//             copyright: Map.CopyrightAttribute {
//                 name: "© Your Company"
//                 url: "https://www.yourcompany.com"
//             }

             MapQuickItem {
                 anchorPoint.x: image.width
                 anchorPoint.y: image.height
                 sourceItem: Image {
                     id: image
                     source: "qrc:/ui/asset/mapmaker2.png" // Your custom marker image
                 }
             }





         }


    // MapDisplay {
    //  id: mapDisplay
    // }

         //-------------------------------------------------------------------------------

         Image {
             id: lockIcon
             source: (m_connect.carLocked? "qrc:/ui/asset/icons8-lock-96.png" : "qrc:/ui/asset/icons8-unlock-144.png")
             anchors {
                 left: parent.left
                 top: parent.top
                 margins: parent.width / 30 - 20
             }

             width: parent.width / 30 - 5
             fillMode: Image.PreserveAspectFit

             MouseArea {
                 id: mouseX
                 anchors.fill: parent
                 onClicked: {
                     m_connect.setCarLocked(!m_connect.carLocked)
                 }
             }
         }

         Text {
             id: dateTimeDisplay
             text: m_connect.currentTime
             anchors {
                 left: lockIcon.right
                 leftMargin: parent.width / 30 -5
                 bottom: lockIcon.bottom
             }

             font.pixelSize: parent.width / 30 - 14
             font.bold: true
             color: "black"
         }

         Text {
             id: outdoorTemp
             text: (m_connect.outdoorTemp+ "°F")
             anchors {
                 left: dateTimeDisplay.right
                 leftMargin: parent.width / 30 -5
                 bottom: lockIcon.bottom
             }

             font.pixelSize: parent.width / 30 - 14
             font.bold: true
             color: "black"
         }

         Image {
             id: userIcon
             source: "qrc:/ui/asset/user-removebg-preview.png"
             anchors {
                 left: outdoorTemp.right
                 leftMargin: parent.width / 30 -5
                 bottom: lockIcon.bottom
             }
             fillMode: Image.PreserveAspectFit
             height: parent.height / 30 - 5
             width: parent.width/30 - 5
         }

         Text {
             id: userName
             text: m_connect.userName
             anchors {
                 left: userIcon.right
                 bottom: lockIcon.bottom
             }

             font.pixelSize: parent.width / 30 - 14
             font.bold: true
             color: "black"
         }

         Image {
             id: teslaIcon
             source: "qrc:/ui/rightScreen/asset/tesla.png"
             anchors {
                 left: userName.right
                 leftMargin: parent.width / 30 -5
                 bottom: lockIcon.bottom
             }
             fillMode: Image.PreserveAspectFit
             height: parent.height / 30 + 5
             width: parent.width/30 +5
         }

         Image {
             id: netwkIcon
             source: "qrc:/ui/rightScreen/asset/signal.png"
             anchors {
                 right: parent.right
                 rightMargin: parent.width / 30 - 20
                 bottom: lockIcon.bottom
             }
             fillMode: Image.PreserveAspectFit
             height: parent.height / 30 - 3
             width: parent.width/30 - 3

             MouseArea {
                 anchors.fill: parent
                 onClicked: {
                     buttonClicked(15)
                 }
             }
         }

         Image {
             id: homeIcon
             source: "qrc:/ui/rightScreen/asset/home.png"
             anchors {
                 right: netwkIcon.left
                 rightMargin: parent.width / 30 -5
                 bottom: lockIcon.bottom
             }
             fillMode: Image.PreserveAspectFit
             height: parent.height / 30 - 3
             width: parent.width/30 - 3

             MouseArea {
                 anchors.fill: parent
                 onClicked: {
                     buttonClicked(15)
                 }
             }
         }

         NavigationSearchBox{
             id: navigationSearchBox

             Image {
                 id: searchIcon
                 anchors{
                     left: parent.left
                     leftMargin: parent.width / 8
                     verticalCenter: parent.verticalCenter
                 }
                 height: parent.height * .45
                 fillMode: Image.PreserveAspectFit
                 source: "qrc:/ui/asset/icons8-search-30.png"
             }

             Text {
                 id: navPlaceholder
                 text: "Navigate"
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

          MapRouter{
              id: mapRouter
          }

          StackViewPage{
              id: reviseCamera
          }

         MainScreen{
             id: mainScreen
         }






         signal buttonClicked(int nub)
 }







