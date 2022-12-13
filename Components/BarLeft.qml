import QtQuick 2.15
import QtQuick.Controls 2.4
import "Cards" as Cards


Rectangle{
    anchors.fill: parent
    anchors.leftMargin: parent.width * 0.025
    anchors.rightMargin: parent.width * 0.025
    anchors.topMargin: parent.height * 0.025
    anchors.bottomMargin: parent.height * 0.025
    color: "#898989"

    Rectangle{
        anchors.fill: parent
        color: "transparent"

        ListView{
            spacing: 20
            height: parent.height
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right

            clip: true

            model: _dbTableNamesModel

            delegate: Cards.CommonCard {
                category_name: model.table_name
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:480;width:640}
}
##^##*/
