import QtQuick 2.15
import QtQuick.Controls 2.4

Item {

    Rectangle{
        id: mainCardContainer
        anchors.fill: parent
        color: "transparent"

        Rectangle{
            id: backgroundRect
            anchors.fill: parent
            anchors.leftMargin: parent.width * 0.1
            color: "transparent"
            border.width: 3
            border.color:  "#C7F9FA"
        }

        Rectangle{
            id: cardContainer
            anchors.fill: parent
            anchors.topMargin: parent.height * 0.1
            anchors.bottomMargin: parent.height * 0.1
            anchors.rightMargin: parent.width * 0.1
            anchors.leftMargin: parent.width * 0.05
            color: "#aaaaaa"

            Rectangle{
                id: categoryLabelContainer
                width: mainCardContainer.width * 0.1
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                color: parent.color

                Text{
                    anchors.centerIn: parent
                    color: "#FFFFFF"
                    text: "KITCHEN"
                    width: 1
                    wrapMode: Text.WrapAnywhere
                    font.pixelSize: 22
                    font.bold: true
                }
            }

        }

    }
}
