import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts


Column {
    id: sign_menu
    height: menu_left.height * 0.3
    width: menu_left.width

    Rectangle {
        id: line_sign1
        width: menu_left.width * 0.95
        height: 2
        anchors.top: logo.bottom
        anchors.horizontalCenter: sign_menu.horizontalCenter
        border {
            color: "white"
            width: 5
        }
    }
    Rectangle {
        id: line_sign2
        width: menu_left.width * 0.5
        height: 2
        anchors.top: line_sign1.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: sign_menu.horizontalCenter
        border {
            color: "white"
            width: 5
        }
    }
    Button {
        id: signin_btn
        height: menu_left.height * 0.1
        width: menu_left.width
        anchors {
            top: line_sign2.bottom
        }
        background: Rectangle {
         color: "transparent"
        }
       contentItem:  Text {
            text: "Sign in"
            color: "#ADD8E6"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pointSize: 15
        }
       onClicked: {
            menu_left1.visible = false
            menu_left2.visible = true
       }
    }
    Button {
        id: signup_btn
        height: menu_left.height * 0.1
        width: menu_left.width
        anchors {
            top: signin_btn.bottom
        }
        background: Rectangle {
         color: "transparent"
        }
       contentItem:  Text {
            text: "Sign up"
            color: "#ADD8E6"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pointSize: 15
        }

    }
    Button {
        id: setting
        height: menu_left.height * 0.1
        width: menu_left.width
        anchors {
            top: signup_btn.bottom
        }
        background: Rectangle {
         color: "transparent"
        }
       contentItem:  Text {
            text: "Setting"
            color: "#ADD8E6"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pointSize: 15
        }
    }

}

