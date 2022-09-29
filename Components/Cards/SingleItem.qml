import QtQuick 2.15
import QtQuick.Controls 2.4

Rectangle{
    color: "transparent"
    width: parent.width
    height: 30

    property double left_ratio_to_whole: 0.7

    Rectangle{
        width: parent.width * left_ratio_to_whole
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.1
        color: "transparent"

        Text{
            anchors.fill: parent
            color: "#FFFFFF"
            text: item_name
            verticalAlignment: Text.AlignVCenter
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
