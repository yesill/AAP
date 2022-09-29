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
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right

            clip: true

            height: parent.height

            model: ListModel{
                ListElement{    category_name: "KITCHEN"        }
                ListElement{    category_name: "PLUMMING"       }
                ListElement{    category_name: "ELECTRIC"       }
                ListElement{    category_name: "HARDWARE"       }
                ListElement{    category_name: "BATHROOM"       }
                ListElement{    category_name: "BASEMENT"       }
                ListElement{    category_name: "HOME ADDITION"  }
                ListElement{    category_name: "DECK"           }
                ListElement{    category_name: "PAINTING"       }
                ListElement{    category_name: "PREPARATION"    }
                ListElement{    category_name: "MECHANICAL"     }
                ListElement{    category_name: "FLOORING"       }
                ListElement{    category_name: "MASINORY"       }
                ListElement{    category_name: "OTHERS"         }
            }

            delegate: Cards.CommonCard{}
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:480;width:640}
}
##^##*/
