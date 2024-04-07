import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts


Column {
    id: work_menu
    height: menu_left.height * 0.3
    width: menu_left.width

    Rectangle {
        id: line_work1
        width: menu_left.width * 0.95
        height: 2
        anchors.top: logo.bottom
        anchors.horizontalCenter: work_menu.horizontalCenter
        border {
            color: "white"
            width: 5
        }
    }
    Text {
        id: staff_text
        text: qsTr("Staff")
        anchors.top: line_work1.bottom
        color: "#7e93fc"
        font.bold: true
        font.pointSize: 18
    }
    Button {
        id: order_btn
        height: menu_left.height * 0.07
        width: menu_left.width
        anchors {
            top: staff_text.bottom
        }
        background: Rectangle {
         color: "transparent"
        }
       contentItem:  Text {
            text: "Order"
            color: "#ADD8E6"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pointSize: 15
        }
    }
    Button {
        id: robots_btn
        height: menu_left.height * 0.07
        width: menu_left.width
        anchors {
            top: order_btn.bottom
        }
        background: Rectangle {
         color: "transparent"
        }
       contentItem:  Text {
            text: "Robot"
            color: "#ADD8E6"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pointSize: 15
        }

    }
    Button {
        id: tracking_btn
        height: menu_left.height * 0.07
        width: menu_left.width
        anchors {
            top: robots_btn.bottom
        }
        background: Rectangle {
         color: "transparent"
        }
       contentItem:  Text {
            text: "Tracking"
            color: "#ADD8E6"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pointSize: 15
        }
    }
    Rectangle {
        id: line_work2
        width: menu_left.width * 0.95
        height: 2
        anchors.top: tracking_btn.bottom
        anchors.horizontalCenter: work_menu.horizontalCenter
        border {
            color: "white"
            width: 5
        }
    }

    Text {
        id: admin_text
        text: qsTr("Admin")
        anchors.top: line_work2.bottom
        color: "#7e93fc"
        font.bold: true
        font.pointSize: 18
    }
    Button {
        id: connect_btn
        height: menu_left.height * 0.07
        width: menu_left.width
        state: "off"
        anchors {
            top: admin_text.bottom
        }
        background: Rectangle {
         color: "transparent"
        }
       contentItem:  Text {
            text: "Connect"
            color: "#ADD8E6"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pointSize: 15
        }

       onClicked: {
               if (connect_btn.state === "off") {
                   connect_btn.state = "on";
                   connect_tab.visible = true;
               } else {
                   connect_btn.state = "off";
                   connect_tab.visible = false;
               }
           }


    }
    Button {
        id: product_btn
        height: menu_left.height * 0.07
        width: menu_left.width
        anchors {
            top: connect_btn.bottom
        }
        background: Rectangle {
         color: "transparent"
        }
       contentItem:  Text {
            text: "Products"
            color: "#ADD8E6"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pointSize: 15
        }
    }

    Rectangle {
        id: line_work3
        width: menu_left.width * 0.95
        height: 2
        anchors.top: product_btn.bottom
        anchors.horizontalCenter: work_menu.horizontalCenter
        border {
            color: "white"
            width: 5
        }
    }
    Button {
        id: settings_btn
        height: menu_left.height * 0.07
        width: menu_left.width
        anchors {
            top: line_work3.bottom
        }
        background: Rectangle {
         color: "transparent"
        }
       contentItem:  Text {
            text: "Settings"
            color: "#ADD8E6"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pointSize: 15
        }
    }

    Button {
        id: logout_btn
        height: menu_left.height * 0.07
        width: menu_left.width
        anchors {
            top: settings_btn.bottom
        }
        background: Rectangle {
         color: "transparent"
        }
       contentItem:  Text {
            text: "Log Out"
            color: "#ADD8E6"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pointSize: 15
        }
       onClicked: {
            menu_left1.visible = true
            menu_left2.visible = false
       }
    }
}

