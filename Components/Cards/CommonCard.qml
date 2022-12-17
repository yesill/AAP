import QtQuick 2.15
import QtQuick.Controls 2.4


/*
* parameters: category_name
*/

Rectangle{
    id: mainCardContainer
    width: parent.width // a problem here, parent equals null!

    //height: text_category_name.height * 1.2
    height: {
        // 44 denem yanilma yoluyla buldugum bir pixel degeri
        if (text_category_name.height * 1.2 >= 44 * singleItemListView.count){
            text_category_name.height * 1.2
        } else {
            44 * singleItemListView.count
        }
    }
    color: "transparent"

    property string category_name: "TableName"
    property string model_query_category_name

    Rectangle{
        id: blueRectangle
        anchors.fill: parent
        anchors.leftMargin: parent.width * 0.1
        color: "transparent"
        border.width: 3
        border.color:  "#C7F9FA"
    }

    Rectangle{
        id: cardContainer
        anchors.fill: parent
        anchors.topMargin: parent.height * 0.05
        anchors.bottomMargin: parent.height * 0.05
        anchors.rightMargin: parent.width * 0.035
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
                id: text_category_name
                anchors.centerIn: parent
                color: "#FFFFFF"
                text: category_name     // @@@@@@@@
                width: 1
                wrapMode: Text.WrapAnywhere
                font.pixelSize: 22
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                onTextChanged: {
                    model_query_category_name = text_category_name.text
                    _dbModel.getData(model_query_category_name)
                    //how many rows?
                }
            }
        }

        Rectangle{
            id: categoryItemsContainer
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.left: categoryLabelContainer.right
            color: "transparent"

            ListView{
                id: singleItemListView
                spacing: 10
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right

                height: contentHeight

                model: _dbModel

                delegate: SingleItem{
                    model_category_name: model_query_category_name
                    row_number: model.index
                    item_name: model.name
                    cost: model.cost
                }
            }
        }
    }

}
