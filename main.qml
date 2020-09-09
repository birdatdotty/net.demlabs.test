import QtQuick 2.12
import QtQuick.Window 2.12

import QtQuick.Controls 2.12


Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Row {
        anchors.verticalCenter: parent.verticalCenter
        CustomField{
            mask: "NNN-NNN-NNN";
            placeholder: "введите ключ"
            value: ""
            onFilledOut: console.log("SerialNumberLineEdit::filledOut")
        }
        CustomField{
            mask: "00_00";
            reg: /[0,2,3,4\_\ ]+/
            sep: "_"
            placeholder: "введите 4 цифры"
        }
    }


    Button {
        id: btn
        text: "SIGNAL"
    }

}
