import QtQuick 2.15
import QtQuick.Layouts 1.3


Rectangle {
    property string label: "NaN"
    property string price: "NaN"
    property string currency_symbol: "$"

    property int text_pixel_size: 20 //width * 0.04

    Layout.fillWidth: true

    Text {
        id: text_cost
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        text: label
        color: "#676767"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: text_pixel_size
        font.bold:  true

    }

    Text {
        id: text_cost_number
        text: price + " " + currency_symbol
        color: "#676767"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: text_pixel_size
        font.bold:  true

        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: parent.height * 0.8

    }
}
