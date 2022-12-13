import QtQuick 2.15
import QtQuick.Controls 2.4
import QtQuick.Window 2.15
import "Components" as Components

Window {
    width: 1160
    height: 768
    visible: true
    title: qsTr("AAP v0.1")

    Rectangle{
        id: mainContainer
        anchors.fill: parent

        Rectangle{
            id: leftContainer
            width: parent.width * 0.5
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            color: "#898989"

            Components.BarLeft {
                anchors.fill: parent
            }
        }

        Rectangle{
            id: rightContainer
            width: parent.width * 0.5
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            color: "#EEEEEE"

            Components.BarRight {
                anchors.fill: parent
            }
        }
    }
}
