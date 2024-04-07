import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: header
    width: root.width
    height: 50
    color: Qt.rgba(0, 0, 253, 0.9)
    Text {
       id: app_name
       text: qsTr("  My App")
       anchors {
        left: header.left
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
            width: menu_top.width/2
            background: Rectangle {
                color: "transparent"
                border.color: "transparent"
            }
        }
        Button {
            text: "About Us"
            height: menu_top.height
            width: menu_top.width/2
            background: Rectangle {
                color: "transparent"
                border.color: "transparent"
            }
        }

    }
}
