import QtQuick 2.15

Rectangle {
    anchors.fill: parent
    anchors.leftMargin: parent.width * 0.025
    anchors.rightMargin: parent.width * 0.025
    anchors.topMargin: parent.height * 0.025
    anchors.bottomMargin: parent.height * 0.025
    color: "#EEEEEE"

    Rectangle {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        color: "transparent"

        Text {
            anchors.fill: parent
            text: "SUMMARY"
            color: "#676767"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            font.bold:  true

        }

    }
}
