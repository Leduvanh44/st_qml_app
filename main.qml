import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import MqttClient
import QtPositioning


Window {
    id: root
    width: 800
    height: 600
    visible: true
    title: qsTr("My App")

    Image {
        id: background
        width: root.width
        height: root.height
        source: "background_myapp.jpg"
    }
//header
    Rectangle {
        id: header
        width: root.width
        height: root.height * 0.1
        color: Qt.rgba(0, 0, 200, 0.1)
        Text {
           id: app_name
           text: qsTr("  My App")
           anchors {
            left: header.left
            verticalCenter: header.verticalCenter
            horizontalCenter: header.horizontalCenter
           }
           color: "white"
           font.family: "Arial"
           font.pointSize: 24
        }
        Row {
           id: menu_top
           anchors.right: header.right
           width: header.width / 3
           height: header.height
           spacing: 0
            Button {
                text: "Home"
                height: menu_top.height
                width: menu_top.width/3
                background: Rectangle {
                    color: "transparent"
                    border.color: "transparent"
                }
                onClicked: {
                    logo.visible = false
                }
            }
            Button {
                text: "About Us"
                height: menu_top.height
                width: menu_top.width/3
                background: Rectangle {
                    color: "transparent"
                    border.color: "transparent"
                }
            }
            Button {
                id: admin
                text: "Admin"
                height: menu_top.height
                width: menu_top.width/3
                background: Rectangle {
                    color: "transparent"
                    border.color: "transparent"
                }
            }

        }
    }

    Rectangle {
        id: menu_left
        width: root.width*0.2
        anchors {
            top: header.bottom
            left: background.left
            bottom: background.bottom
        }
        color: "darkblue"
        Row {
            id: logo
            visible: true
            anchors {
                horizontalCenter: menu_left.horizontalCenter
                top: menu_left.top
                topMargin: 10
            }
            width: menu_left.width * 0.9
            height: menu_left.width * 0.9 / 2
            spacing: 9

            Rectangle {
                    id: bk_logo
                    width: menu_left.width * 0.85 / 2
                    height: menu_left.width *  0.85 / 2
                    radius: 10
                    color: "#e0ecff"
                    Image {
                        source: "bk.PNG"
                        width: menu_left.width * 0.7 / 2
                        height: menu_left.width *  0.7 / 2
                        anchors {
                            verticalCenter: bk_logo.verticalCenter
                            horizontalCenter: bk_logo.horizontalCenter
                        }
                    }
                }

                Rectangle {
                     id: viam_logo
                    width: menu_left.width * 0.85 / 2
                    height: menu_left.width *  0.85 / 2
                    radius: 10
                    color: "#e0ecff"
                    Image {
                        source: "viam.PNG"
                        width: menu_left.width * 0.7 / 2
                        height: menu_left.width *  0.7 / 2
                        anchors {
                            verticalCenter: viam_logo.verticalCenter
                            horizontalCenter: viam_logo.horizontalCenter
                        }
                        }
                }
          }
        Loader {
            id: menu_left1
            visible: false
            source: "sign_menu.qml"
            anchors {
               top: logo.bottom
               topMargin: 25
            }
        }
        Loader {
            id: menu_left2
            visible: true
            source: "work_menu.qml"
            anchors {
               top: logo.bottom
            }
        }

        Text {
            id: my_text
            text: qsTr("@By Leduvanh")
            anchors.bottom: menu_left.bottom
            color: "#7e93fc"
            font.bold: true
            font.italic: true
            font.pointSize: 12
        }
        Rectangle {
            id: line_menu_end
            width: menu_left.width * 0.95
            height: 2
            anchors.bottom: my_text.top
            anchors.horizontalCenter: menu_left.horizontalCenter
            border {
                color: "white"
                width: 5
            }
        }
    }
    //Center
    Rectangle {
        id: center_fake
        anchors {

            top: header.bottom

            left: menu_left.right

            right: background.right

            bottom: background.bottom

        }
        height: root.height * 0.9
        width: root.width * 0.8
        color: "transparent"
        Rectangle {
            id: center_fix
            anchors {
                top: center_fake.top
                left: center_fake.left
                right: center_fake.right
                bottom: center_fake.bottom
                topMargin: 10
                leftMargin: 10
                rightMargin: 10
                bottomMargin: 10
            }
            height: center_fake.height - 10*2
            width: center_fake.width - 10*2
            color: "#f0fbfc"
            radius: 20
        }
        Loader {
            id: connect_tab
            visible: false
            source: "connect_tab.qml"
            anchors {
               top: center_fix.top
               topMargin: 50
               left: center_fix.left
               leftMargin: 50
            }
            anchors.horizontalCenter: center_fake.horizontalCenter
            anchors.verticalCenter: center_fake.verticalCenter

        }
    }


}


