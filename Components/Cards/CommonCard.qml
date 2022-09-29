import QtQuick 2.15
import QtQuick.Controls 2.4


Rectangle{
    id: mainCardContainer
    width: parent.width
    height: 300
    //height: singleItemListView.height
    color: "transparent"

    // if category_name == "KITCHEN" do this ->
    // if category_name == "PLUMMING" do this ->

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
                anchors.centerIn: parent
                color: "#FFFFFF"
                text: category_name
                width: 1
                wrapMode: Text.WrapAnywhere
                font.pixelSize: 22
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
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

                model: ListModel{
                    ListElement{    item_name: "CABINET"                }
                    ListElement{    item_name: "COUNTERTOP-C"           }
                    ListElement{    item_name: "COUNTERTOP-A"           }
                    ListElement{    item_name: "KITCHEN LABOR"          }
                    ListElement{    item_name: "BASHSPASH TILE"         }
                    ListElement{    item_name: "BASHSPASH TILE LABOR"   }
                    ListElement{    item_name: "SINK"                   }
                    /*ListElement{    item_name: "FAUSET"                 }
                    ListElement{    item_name: "UNDER CABINET LIGHT"    }
                    ListElement{    item_name: "GENERAL PLUMING"        }
                    ListElement{    item_name: "GENERAL ELECTRIC"       }*/
                }

                delegate: SingleItem{}
            }
        }
    }

}
