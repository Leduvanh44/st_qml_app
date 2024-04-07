import QtQuick 2.13
import QtQuick.Controls
import QtQuick.Layouts
import MqttClient

Rectangle {
    id: connect_rect
    color: "white"
    radius: 20
    height: center_fix.height*0.5
    width: center_fix.width*0.5
    Text {
        id: publisher
        text: qsTr("Connect MQTT broker:")
        anchors.top: connect_rect.top
        anchors.left: connect_rect.left
        anchors.leftMargin: 30
        color: "#7e93fc"
        font.bold: true
        font.italic: true
        font.pointSize: 20
    }
    property int tempSubscription: 0



    MqttClient {
        id: client
        hostname: hostnameField.text
        port: portField.text
    }

    ListModel {
        id: messageModel
    }

    function addMessage(payload)  {
        messageModel.insert(0, {"payload" : payload})

        if (messageModel.count >= 100)
            messageModel.remove(99)
    }

    Label {
        text: "Hostname:"
        enabled: client.state === MqttClient.Disconnected
        anchors.top: connect_rect.top
        anchors.topMargin: connect_rect.height*0.15
        anchors.left: connect_rect.left
        anchors.leftMargin: connect_rect.width*0.1
        color: "#7e93fc"
        font.bold: true
        font.pointSize: 13
    }

    TextField {
        id: hostnameField
        text: "test.mosquitto.org"
        width: connect_rect.width*0.4
        placeholderText: "<Enter host running MQTT broker>"
        enabled: client.state === MqttClient.Disconnected
        anchors.top: connect_rect.top
        anchors.topMargin: connect_rect.height*0.15
        anchors.left: connect_rect.left
        anchors.leftMargin: connect_rect.width*0.3
        font.bold: true
        font.pointSize: 13
    }

    Label {
        text: "Port:"
        enabled: client.state === MqttClient.Disconnected
        anchors.top: connect_rect.top
        anchors.topMargin: connect_rect.height*0.3
        anchors.left: connect_rect.left
        anchors.leftMargin: connect_rect.width*0.1
        color: "#7e93fc"
        font.bold: true
        font.italic: true
        font.pointSize: 13
    }

    TextField {
        id: portField
        text: "1883"
        width: connect_rect.width*0.4
        placeholderText: "<Port>"
        inputMethodHints: Qt.ImhDigitsOnly
        enabled: client.state === MqttClient.Disconnected
        anchors.top: connect_rect.top
        anchors.topMargin: connect_rect.height*0.3
        anchors.left: connect_rect.left
        anchors.leftMargin: connect_rect.width*0.3
        font.bold: true
        font.pointSize: 13
    }

    Button {
        id: connectButton
        contentItem:  Text {
                    text: client.state === MqttClient.Connected ? "Disconnect" : "Connect"
                    color: "white"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.pointSize: 13
         }
        height: connect_rect.height * 0.07
        width: connect_rect.width * 0.05
        anchors {
                    top: hostnameField.top
                    bottom: portField.bottom
                    bottomMargin: 50
                    left: hostnameField.right
                    leftMargin: 25
                    right: connect_rect.right
                    rightMargin: 25

                }
        background: Rectangle {
         color: "#7e93fc"
        }
        onClicked: {
            if (client.state === MqttClient.Connected) {
                client.disconnectFromHost()
                messageModel.clear()
                tempSubscription.destroy()
                tempSubscription = 0
            } else
                client.connectToHost()
        }
    }

    // Row {
    //     enabled: client.state === MqttClient.Connected
    //     Layout.columnSpan: 2
    //     Layout.fillWidth: true

        Label {
            text: "Topic:"
            anchors.top: connect_rect.top
            anchors.topMargin: connect_rect.height*0.45
            anchors.left: connect_rect.left
            anchors.leftMargin: connect_rect.width*0.1
            color: "#7e93fc"
            font.bold: true
            font.italic: true
            font.pointSize: 13
        }

        TextField {
            id: subField
            width: connect_rect.width*0.4
            text: "topic/gps"
            placeholderText: "<Topic>"
            inputMethodHints: Qt.ImhDigitsOnly
            anchors.top: connect_rect.top
            anchors.topMargin: connect_rect.height*0.45
            anchors.left: connect_rect.left
            anchors.leftMargin: connect_rect.width*0.3
            font.bold: true
            font.pointSize: 13
            enabled: tempSubscription === 0
        }

        Button {
            id: subButton
            contentItem:  Text {
                        text: "Subcribe"
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.bold: true
                        font.pointSize: 13
             }
            visible: tempSubscription === 0
            height: connect_rect.height * 0.07
            width: connect_rect.width * 0.05
            anchors {
                top: hostnameField.top
                topMargin: 50
                bottom: portField.bottom

                left: hostnameField.right
                leftMargin: 25
                right: connect_rect.right
                rightMargin: 25
            }
            background: Rectangle {
                     color: "#7e93fc"
             }

            onClicked: {
                if (subField.text.length === 0) {
                    console.log("No topic specified to subscribe to.")
                    return
                }
                tempSubscription = client.subscribe(subField.text)
                tempSubscription.messageReceived.connect(addMessage)
            }
        }


    // ListView {
    //     id: messageView
    //     model: messageModel
    //     height: 300
    //     width: 200
    //     Layout.columnSpan: 2
    //     Layout.fillHeight: true
    //     Layout.fillWidth: true
    //     clip: true
    //     delegate: Rectangle {
    //         width: messageView.width
    //         height: 30
    //         color: index % 2 ? "#DDDDDD" : "#888888"
    //         radius: 5
    //         Text {
    //             text: payload
    //             anchors.centerIn: parent
    //         }
    //     }
    // }

    Label {
        function stateToString(value) {
            if (value === 0)
                return "Disconnected"
            else if (value === 1)
                return "Connecting"
            else if (value === 2)
                return "Connected"
            else
                return "Unknown"
        }
        anchors.bottom: connect_rect.bottom
        anchors.left: connect_rect.left
        anchors.leftMargin: connect_rect.width*0.1
        color: "#7e93fc"
        font.bold: true
        font.italic: true
        font.pointSize: 13
        text: "Status:" + stateToString(client.state) + "(" + client.state + ")"
        enabled: client.state === MqttClient.Connected
    }

}



