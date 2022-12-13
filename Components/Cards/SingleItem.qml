import QtQuick 2.15
import QtQuick.Controls 2.4

/*
* parameters: item_name
*/

Rectangle{
    color: "transparent"
    width: parent.width
    height: 30

    //parent parameter
    property string item_name: "no name"
    property string cost: "0"
    property string currency_sign: "$"

    property double left_ratio_to_whole: 0.8

    Rectangle{
        width: parent.width * left_ratio_to_whole
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.05
        color: "transparent"

        Text{
            id: text_name
            width: parent.width * 0.84
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            color: "#FFFFFF"
            text: item_name         // @@@@@@@@@@@@@@@
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            font.bold: true
        }

        Text {
            id: text_cost
            width: parent.width * 0.16
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: text_name.right
            color: "#FFFFFF"
            text: cost + currency_sign
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 18
            font.bold: true
        }
    }

    Rectangle{
        width: parent.width * (0.9 - left_ratio_to_whole)
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.topMargin: 3
        anchors.bottomMargin: anchors.topMargin
        radius: 1
        color: "#FFFFFF"

        TextInput{
            anchors.fill: parent
            anchors.leftMargin: 2
            anchors.rightMargin: 2
            color: "#000000"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 20
            font.bold: true
            clip: true
        }

    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:640}
}
##^##*/
