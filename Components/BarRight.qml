import QtQuick 2.15
import QtQuick.Layouts 1.3

Rectangle {
    id: rectangle_main_container
    anchors.fill: parent
    anchors.leftMargin: parent.width * 0.025
    anchors.rightMargin: parent.width * 0.025
    anchors.topMargin: parent.height * 0.025
    anchors.bottomMargin: parent.height * 0.025
    color: "#EEEEEE"

    Rectangle {
        id: rectangle_title
        height: parent.height * 0.08
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        color: "transparent"

        Text {
            anchors.fill: parent
            text: "SUMMARY"
            color: "#676767"
            //verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            font.bold:  true

        }

    }

    Rectangle {
        id: rectangle_summary
        anchors.top: rectangle_title.bottom
        anchors.bottom: rectangle_retail.top
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.topMargin: parent.height * 0.02
        anchors.bottomMargin: parent.height * 0.02
        color: "transparent"

        border.width: 3
        border.color: "#00FF00"
    }

    Rectangle {
        id: rectangle_retail
        height: parent.height * 0.18
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        color: "transparent"

        ColumnLayout{
            id: colm1
            spacing: parent.height * 0.05
            anchors.fill: parent

            property double total_cost
            property double total_profit
            property double total_price

            function slotF1(){
                total_cost = _dbModel.getTotalCost()
                total_profit = _dbModel.getTotalProfit()
                total_price = _dbModel.getTotalPrice()
            }

            Component.onCompleted: {
                /* item adedi degistirildiginde yeni degerler hesaplanip
                  signal emit ediliyor. signal emit edildiginde slotF1
                  fonksiyonu calisiyor ve qml icindeki degerler guncelleniyor.*/
                _dbModel.numberOfItemsChangedSignal.connect(slotF1)
            }

            TextPrice {
                Layout.alignment: Qt.AlignLeft
                color: "transparent"
                Layout.preferredWidth: parent.width * 0.1
                Layout.preferredHeight: parent.height * 0.1

                label: "Total Cost:"
                price: colm1.total_cost
            }

            TextPrice {
                Layout.alignment: Qt.AlignLeft
                color: "transparent"
                Layout.preferredWidth: parent.width * 0.1
                Layout.preferredHeight: parent.height * 0.1

                label: "Total Profit:"
                price: colm1.total_profit
            }

            TextPrice {
                Layout.alignment: Qt.AlignLeft
                color: "transparent"
                Layout.preferredWidth: parent.width * 0.1
                Layout.preferredHeight: parent.height * 0.1

                label: "Total Price:"
                price: colm1.total_price
            }
        }

    }
}
